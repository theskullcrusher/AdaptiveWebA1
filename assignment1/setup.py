from setuptools import setup, find_packages

try:
    with open('requirements.txt') as f:
        requires = f.read().splitlines()
except IOError:
    with open('assignment1.egg-info/requires.txt') as f:
        requires = f.read().splitlines()
        
with open('VERSION') as f:
    version = f.read().strip()

print requires
print type(requires)
    
setup(
      # If name is changed be sure to update the open file path above.
      name = "assignment1",
      version = version,
      packages = find_packages(),
      package_dir = {'assignment1':'assignment1'},
      author = 'TFA',
      author_email = 'ssshah22@asu.edu',
      description = 'Db plus website for adaptiveweb',
      license = "PSF",
      include_package_data = True,
      ) 
