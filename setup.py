import os   
from distutils.core import setup, Extension 

#name of module 
name  = "nmpmodule"
  
#version of module 
version = "0.1"
  
# specify the name of the extension and source files 
# required to compile this 
print("External Modules")
ext_modules = Extension('_nmpmodule',sources=["src/HyperProfiler.cpp"], 
                        include_dirs= [os.path.abspath('include'), '/usr/local/include'],
                        library_dirs = ['/usr/local/lib'],  
                        language="c++",
                        extra_compile_args=["-std=c++14"],
                        ) 

print("Setting up ...")  
setup(name=name, 
      version=version,
      ext_modules=[ext_modules],
      ) 
