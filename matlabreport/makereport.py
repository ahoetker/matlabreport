# makereport.py - build mfile report from yaml outline

import yaml

class Outline(yaml.YAMLObject):
    yaml_tag = u'!Outline'
    def __init__(self, header, problems, functions, publish):
        self.header = header
        self.problems = problems
        self.functions = functions
        self.publish = publish


def makeReport(yaml_file, output_file, funcs):
    """
    Create MATLAB report as a single m-file.

    :param yaml_file: YAML outline file for report.
    :param output_file: m-file destination for finished report.
    :param funcs: flag, include referenced functions from outline.
    :return: None
    """
    with open(yaml_file) as y:
        outline = yaml.load(y)

    header = ""
    for txtfile in outline.header:
        with open(txtfile, 'r') as f:
            for line in f:
                header += line
        header += "\n\n"

    problems = ""
    for mfile in outline.problems:
        try:
            with open(mfile, 'r') as f:
                for line in f:
                    problems += line
        except FileNotFoundError:
            problems += "%% {} MISSING".format(mfile)
        problems += "\n\n"

    functions = ""
    if funcs is True:
        try:
            functions += "%% Referenced Functions \n"
            for func in outline.functions:
                with open(func, 'r') as f:
                    comment = "%% {}\n%\n".format(func)
                    for line in f:
                        comment += ( "%   " + str(line))
                functions += comment + "\n\n"
        except TypeError:
            print("No functions specified in {}".format(yaml_file))

    report = header + problems + functions

    with open(output_file, 'w') as f:
        f.write(report)

    print("Report saved as m-file")
