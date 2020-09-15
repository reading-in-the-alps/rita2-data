import os
import glob

prefix = 'inventar__'
files = glob.glob('data/editions/*.xml')

for x in files:
    path, fname = os.path.split(x)
    if fname.startswith('inventar'):
        continue
    else:
        newname = os.path.join(path, f"{prefix}{fname}")
        os.rename(x, newname)

