#!/bin/bash

virtualenv --system-site-packages .
source ./bin/activate
pip install cython
pip install -U ipython
pip install tabulate
pip install textract
cd word_cloud
python setup.py install
cd ..


deactivate
