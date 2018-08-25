import pytest
import os
import pkg_resources
import yaml
from matlabreport.makereport import Outline, makeReport, auto_outline

# define the resources directory
resources = pkg_resources.resource_filename("tests", "resources")


def test_makereport():
    # define the outline markup file
    outline_file = os.path.join(resources, "dummy_outline.yml")
    # Create the file to write report.m to
    report = os.path.join(resources, "tempreport.m")
    os.chdir(resources)

    # Test report generation with no functions included
    makeReport(outline_file, report, funcs=False)
    with open(report, "r") as f1:
        with open(os.path.join(resources, "dummyreport_nofuncs.m"), "r") as f2:
            assert f1.read() == f2.read()
    os.remove(report)

    # Test report generation WITH functions
    makeReport(outline_file, report, funcs=True)
    with open(report, "r") as f1:
        with open(os.path.join(resources, "dummyreport_funcs.m"), "r") as f2:
            assert f1.read() == f2.read()
    os.remove(report)


def test_auto_outline():
    generated_outline = os.path.join(resources, "generated_outline.yml")
    os.chdir(resources)
    auto_outline(generated_outline)
    try:
        with open(generated_outline, "r") as f1:
            with open(os.path.join(resources, "dummy_outline.yml"), "r") as f2:
                assert yaml.dump(yaml.load(f1)) == yaml.dump(yaml.load(f2))
    finally:
        os.remove(generated_outline)
