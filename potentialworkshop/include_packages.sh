#!/bin/bash
# install pyiron_contrib with atomicrex wrapper
git clone https://github.com/pyiron/pyiron_contrib.git
cd pyiron_contrib
git checkout "atomicrex"
pip install . 
cd ..
rm -rf pyiron_contrib

# install pyiron_gpl with pyace wrapper
git clone https://github.com/pyiron/pyiron_gpl.git
cd pyiron_gpl 
git checkout "feature/pacemaker-interface"
pip install . 
cd ..
rm -rf pyiron_gpl
