#!/usr/bin/env python

from distutils.core import setup, Extension

setup (name = "nkf",
       version="1.0",
       description="Python Interface to NKF",
       author="Matsumoto Tadashi",
       author_email="ma2@city.plala.jp",
       ext_modules = [
               Extension("nkf", ["NKF_python.c"],
                         extra_link_args = ['-s'])])
