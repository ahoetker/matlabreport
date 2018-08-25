# makereport.py - build mfile report from yaml outline

import yaml
import os


class Outline(yaml.YAMLObject):
    yaml_tag = u"!Outline"

    def __init__(self, header, problems, functions):
        self.header = header
        self.problems = problems
        self.functions = functions


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
        with open(txtfile, "r") as f:
            for line in f:
                header += line
        header += "\n\n"

    problems = ""
    for mfile in outline.problems:
        try:
            with open(mfile, "r") as f:
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
                with open(func, "r") as f:
                    comment = "%% {}\n%\n".format(func)
                    for line in f:
                        comment += "%   " + str(line)
                functions += comment + "\n\n"
        except TypeError:
            print("No functions specified in {}".format(yaml_file))

    report = header + problems + functions

    with open(output_file, "w") as f:
        f.write(report)

    print("Report saved as m-file")


def auto_outline(generated_outline):
    """
    Create the outline.yml file needed to make a report.

    :param generated_outline: the outline.yml file to be created
    :return:
    """
    mfiles = [f for f in os.listdir() if os.path.splitext(f)[1] == ".m"]
    header = ["header.m"]
    problems = sorted([f for f in mfiles if "problem" in f])
    all_functions = list(filter(lambda f: f not in set(problems), mfiles))

    # grab all the MATLAB code so we can look for functions being called
    bulk_text = ""
    for file in problems:
        with open(file, "r") as f:
            bulk_text += f.read()

    # look for functions being used
    referenced_functions = []
    for file in all_functions:
        function_name = os.path.splitext(file)[0]
        for word in bulk_text.split():
            if function_name + "(" in word:
                referenced_functions.append(file)
    referenced_functions = sorted(list(set(referenced_functions)))

    # create the Outline object and dump to yaml file
    outline = Outline(header=header, problems=problems, functions=referenced_functions)
    with open(generated_outline, "w") as outfile:
        yaml.dump(outline, outfile, default_flow_style=False)

    return None
