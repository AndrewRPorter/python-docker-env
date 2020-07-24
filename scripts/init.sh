#!/bin/bash

# get pre-commit script setup on machine
if [ -f .git/hooks/pre-commit ]; then
    rm .git/hooks/pre-commit;
fi

cp scripts/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

# create virtual enviornments
virtualenv .env
source .env/bin/activate
pip install -r requirements.txt
deactivate