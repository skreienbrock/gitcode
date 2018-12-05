from os import walk as w
import sys
import os.path as op

### STATIC VARS
myPFolder='/home'

### get folder ###
try:
    args=sys.argv
    if op.isdir(args[1]):
        maindir=args[1]
    else:
        # fallback
        maindir=myPFolder
except IndexError:
        maindir=myPFolder

endings=[]
fCnt = 0

print("main folder is " + maindir)
for directory,sfolder,files in w(maindir):
    # DEBUG print directories
    # print('\033[1;31m' + directory + '\033[0m')

    # DEBUG print subdirectories
    #for s in sfolder:
        # print('\033[1;32m' + s + '\033[0m')

    # but interesting are the files:
    for f in files:
        fCnt = fCnt + 1
        # dot in files ?
        if '.' in f:
            fIndex=(len(f.split('.')))
            endings.append(f.split('.')[fIndex-1].lower())

# generate set with endings
endset=set(endings)

# generate directory with occurences > 50 files
suffixOccurence={}
for suffix in endset:
    # how many suffixes do you like to count (your 2 pdfs?)
    if endings.count(suffix) >= 10:
        suffixOccurence[suffix]=endings.count(suffix)

print("In %d files, %d files had suffixes.\nThe following suffixes occured:\n" % (fCnt,len(endings)))

## sorting dictionary in reverse (reverse=True) order
import operator
sorted_sO = sorted(suffixOccurence.items(), key=operator.itemgetter(1),reverse=True)

## Ausgabe von 'Suffix' 'Anzahl_von_Suffix'
for s in sorted_sO:
    if len(s[0]) > 15:
        print("%s\t%d" % (s[0],s[1]))
    elif len(s[0]) > 7:
        print("%s\t\t%d" % (s[0],s[1]))
    else:
        print("%s\t\t\t%d" % (s[0],s[1]))
