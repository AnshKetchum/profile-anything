import os
from distutils.core import setup, Extension

# name of module
name = "hyperprofiler"

# version of module
version = "0.1"

# specify the name of the extension and source files
# required to compile this
print("External Modules")
ext_modules = Extension(f'_{name}', sources=["src/hyperprofiler.cpp", "src/hyperprofiler_wrap.cxx"],
                        include_dirs=[os.path.abspath('include')]
                        )

print("Setting up ...")
setup(name=name,
      version=version,
      author="Test Docs",
      description="""Simple swig example from docs""",
      ext_modules=[ext_modules],
      py_modules=[name],
      )
