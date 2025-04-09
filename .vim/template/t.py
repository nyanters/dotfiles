#!/usr/bin/env python3
# -*- coding: utf-8 -*-
__doc__ = """{f}
Usage:
  {f}
  {f} (-h | --help)

Options:
  -h --help  Show this screen.
""".format(f=__file__)

from docopt import docopt
import os
import sys

def main():
  init()
  sys.exit()


def init():
  os.chdir(os.path.dirname(os.path.abspath(__file__)))
  return


if __name__ == "__main__":
  args = docopt(__doc__)
  main()
