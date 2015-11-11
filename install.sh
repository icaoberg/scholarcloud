#!/bin/bash

virtualenv --system-site-packages .
source ./bin/activate
pip install cython
cd word_cloud
python setup.py install
cd ..

deactivate
