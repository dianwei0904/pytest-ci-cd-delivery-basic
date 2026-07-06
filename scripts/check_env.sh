#!/bin/bash

set -e

echo "Checking Python environment..."
python --version
which python

echo "Checking pip..."
python -m pip --version

echo "Checking pytest..."
python -m pytest --version

echo "Environment check completed."