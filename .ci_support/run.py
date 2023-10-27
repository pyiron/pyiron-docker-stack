from datetime import date
import getopt
import requests
import sys

import pandas
from tqdm import tqdm


def check_environments(df):
    _ = [
        write_env(content=requests.get(url).content, name=file) 
        for url, file in tqdm(zip(df.environment_url.values, df.environment.values), total=len(df))
    ]
    return {env: test_environment(file_name=env) for env in tqdm(df.environment.values)}


def combined_df(df_old, df_new):
    tag_lst, environment_url_lst, environment_lst, docker_tag_lst = [], [], [], []
    for row in df_new.iterrows():
        if row[1].environment_url not in df_old.environment_url.values: 
            tag_lst.append(row[1].tag)
            environment_url_lst.append(row[1].environment_url) 
            environment_lst.append(row[1].environment)
            docker_tag_lst.append(row[1].docker_tag)
    return pandas.concat([
        df_old, 
        pandas.DataFrame({
            "tag": tag_lst, 
            "environment_url": environment_url_lst, 
            "environment": environment_lst, 
            "docker_tag": docker_tag_lst, 
            "status": [True] * len(environment_lst)
        })
    ])


def command_line(argv):
    token = None
    try:
        opts, args = getopt.getopt(
            argv[1:], "t:h", ["token=", "help"]
        )
    except getopt.GetoptError:
        print("run.py -t <token>")
        sys.exit()
    for opt, arg in opts:
        if opt in ("-h", "--help"):
            print("run.py -t <token>")
            sys.exit()
        elif opt in ("-t", "--token"):
            token = arg
    return token


def get_dataframe(token):
    response = requests.get(
        f"https://api.github.com/repos/pyiron/docker-stacks/releases",
        headers={"Authorization": "Bearer " + token, "Accept": "application/vnd.github+json", "X-GitHub-Api-Version": "2022-11-28"},
    )

    tag_lst, environment_url_lst = [], []
    for output_item in response.json(): 
        for asset in output_item['assets']:
            tag_lst.append(output_item['html_url'].split("/")[-1])
            environment_url_lst.append(asset['browser_download_url'])

    df = pandas.DataFrame({"tag": tag_lst, "environment_url": environment_url_lst})
    df["environment"] = [url.split("/")[-1] for url in df["environment_url"].values]
    df["docker_tag"] = ["/".join(file_name[:-4].split("_")[:-1]) + ":" + tag for file_name, tag in zip(df["environment"].values, df["tag"].values)]
    return df


def test_environment(file_name):
    env_name = file_name.split(".yml")[0]
    try:
        subprocess.check_output(["conda", "env", "create", "--name", env_name, "--file", file_name])
    except subprocess.CalledProcessError:
        return False
    else:
        return True


def write_env(content, name):
    with open(name, "wb") as f:
         f.write(content)


if __name__ == "__main__":
    output_file_name = "release.csv"
    token = command_line(sys.argv)
    df_new = get_dataframe(token)
    df_old = pandas.read_csv("https://pyiron.org/docker-stacks/" + output_file_name, index_col=0)
    df_old["status"] = df_old["status"].astype("bool")
    df_combo = combined_df(df_old=df_old, df_new=df_new)
    status_dict = check_environments(df=df_combo[df_combo.status.values])
    df_combo["status"] = [
        status_dict[env] if env in status_dict.keys() else df_combo[df_combo.environment==env].status.values[0] 
        for env in df_combo.environment.values
    ]
    df_combo["last_checked"] = [
        date.today() if env in status_dict.keys() else df_combo[df_combo.environment==env].last_checked.values[0] 
        for env in df_combo.environment.values
    ]
    df_combo.to_csv(output_file_name)
