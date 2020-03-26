from tkinter import filedialog
from tkinter import *

from os import listdir
from os.path import isfile, join

from pathlib import Path

import os, errno

root = Tk()
root.withdraw()
folder_selected = filedialog.askdirectory()

onlyfiles = [f for f in listdir(folder_selected) if isfile(join(folder_selected, f))]

print(onlyfiles)
print(type(onlyfiles))

for x in onlyfiles:
    # print('{}-{}-{}'.format(x[0:4], x[4:6], x[6:8]))
    y = '{}-{}-{}'.format(x[0:4], x[4:6], x[6:8])
    # print(y)
    # print(folder_selected)
    print(folder_selected+"/"+y)
    try:
        os.makedirs(folder_selected+"/"+y)
    except OSError as e:
        if e.errno != errno.EEXIST:
            raise
    # Path("{folder_selected}/{y}").mkdir(parents=True, exist_ok=True)


# new_string = '{}-{}-{}'.format(old_string[:5], old_string[5:7], old_string[7:])