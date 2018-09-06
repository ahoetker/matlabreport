# matlabreport
[![Build Status](https://travis-ci.org/ahoetker/matlabreport.svg?branch=master)](https://travis-ci.org/ahoetker/matlabreport)
Python package to automate the creation and publication of MATLAB reports.

## Usage

`matlabreport [OPTIONS] OUTLINE REPORT_M `

where `OUTLINE` is a JSON outline file, and `REPORT_M`
is the name of the m-file to be created.

Use `matlabreport --help` to see additional options.

## Optional Configuration

The `openreport.py` module checks for the following environment variables:

| Filetype | Variable |
| -------- | -------- |
| PDF      | PDFVIEWER |
| TEX      | EDITOR   |
| XML      | EDITOR   |

If a variable is not defined, `webbrowser` is used to open the report for
viewing. It is also used to view HTML reports.


## Installation

This package can be installed with `pip install matlabreport`, or by cloning
this repository and running `python setup.py install`.

## Requirements

This package requires [Click](http://click.pocoo.org/5/) and
[pyaml](https://pypi.python.org/pypi/pyaml), both of which will be installed
during `pip` installation.

The [MATLAB Python Engine](https://www.mathworks.com/help/matlab/matlab-engine-for-python.html)
is also required. To install, follow the [instructions](https://www.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html)
from MathWorks.
