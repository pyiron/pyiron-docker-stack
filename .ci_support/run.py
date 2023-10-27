import getopt
import requests
import sys

import pandas 


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


if __name__ == "__main__":
    token = command_line(sys.argv)
    df = get_dataframe(token)
    df.to_csv("release.csv")
