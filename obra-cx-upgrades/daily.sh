#!/bin/bash

source ~/python27/bin/activate
export PIP_EXTRA_INDEX_URL=https://cambiainfosecartifacts.s3.amazonaws.com/pypi/

pip install --upgrade git+https://github.com/brandond/obra-upgrade-calculator

pushd ~/repos/brandond.github.io/ &> /dev/null

git pull
obra-upgrade-calculator --type cyclocross --format html --strict > obra-cx-upgrades/index.html
obra-upgrade-calculator --type cyclocross --format csv  --strict --no-scrape > obra-cx-upgrades/upgrades.csv
git commit obra-cx-upgrades/index.html obra-cx-upgrades/upgrades.csv -m 'Daily results auto-update'
git push

popd &> /dev/null
