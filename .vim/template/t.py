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
import logging
import os
import sys


def main():
  init()
  sys.exit()


def init():
  os.chdir(os.path.dirname(os.path.abspath(__file__)))
  return


def logger_settings():
  fn = os.path.splitext(os.path.basename(sys.argv[0]))[0]
  handler = logging.StreamHandler()
  logging.basicConfig(
    level = logging.DEBUG,
    format = '%(message)s',
    datefmt = '[%Y-%m-%d]',
    handlers = [
      logging.FileHandler(filename=fn+'.log'),
    ]
  )
  logger = logging.getLogger(__name__)
  return logger


if __name__ == "__main__":
  args = docopt(__doc__)
  main()
