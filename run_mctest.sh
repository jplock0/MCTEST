#!/bin/sh

# Define the location of the virtual environment
VENV_PATH="/opt/mctest_venv/"

# Use the Python from the virtual environment
$VENV_PATH/bin/python3 /path/to/your/project/manage.py runserver &

