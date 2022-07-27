#!/bin/bash -e
pip install .
./linter.sh "9.00" "./src/app"
python -m app.main