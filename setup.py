from setuptools import setup, find_packages

setup(name='matlabreport',
      version='0.3',
      description='Make and publish MATLAB reports.',
      url='https://github.com/ahoetker/matlabreport',
      author='Andrew Hoetker',
      author_email='ahoetker@me.com',
      install_requires=[
          'Click',
          'pyaml'
      ],
      entry_points='''
        [console_scripts]
        matlabreport=matlabreport.scripts.matlabreport:matlabreport
      ''',
      packages=find_packages(),
      zip_safe=False)
