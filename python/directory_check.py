#!/usr/bin/python3
# file: directory_check.py
# author: sven.kreienbrock@bph.ruhr-uni-bochum.de
# desc: script to list current directories and files in path.
#	additionally if those are hidden or visible &
#	at last calculates their respective sizes.
# vers: 0.02 (dirwalk.py)
# ## chlog
# # 0.01 -> 0.02: added size calculations (os.stat(f).st_size)
#

import os
import os.path as op
# regex
import re
# args
import sys

## check path
try:
	args=sys.argv
	if op.isdir(args[1]):
		homedir=args[1]
	else:
		#fallback
		homedir=os.getcwd()
except IndexError:
	homedir=os.getcwd()

print("Using " + homedir + " as path.")
# counter
fcnt=0
dcnt=0
hfcnt=0
hdcnt=0
rhfcnt=0
vfcnt=0
vdcnt=0

# lists
rhf=[]
rhf_size=[]
hf=[]
hf_size=[]
vf=[]
vf_size=[]

# positive blank test:
x = re.search("b","abc")
SRE_Match = type(x)

# functions
def byte_to_mb(size_x):
    # kB = 2**10
    # MB = 2**20
    # GB = 2**30
    retsize = (size_x/(2**20))
    return retsize

def byte_to_mib(size_x):
    # kiB = 10**3
    # MiB = 10**6
    # GiB = 10**9
    retsize = (size_x/(10**6))
    return retsize

def byte_to_gb(size_x):
    # kB = 2**10
    # MB = 2**20
    # GB = 2**30
    retsize = (size_x/(2**30))
    return retsize

def byte_to_gib(size_x):
    # kiB = 10**3
    # MiB = 10**6
    # GiB = 10**9
    retsize = (size_x/(10**9))
    return retsize

hlist={}
for directory,sfolder,files in os.walk(homedir):
	dcnt = dcnt + 1
	hlist[directory] = files
	# if check returns object:
	recheck1 = re.search("\/\.",directory)
	if isinstance(recheck1,SRE_Match):
		hdcnt = hdcnt + 1
	else:
		vdcnt = vdcnt + 1
	for f in files:
		if op.isfile(op.join(directory,f)):
			fcnt = fcnt + 1

		# really hidden files itself:
		recheck2 = re.search('^\.',f)
		if isinstance(recheck2,SRE_Match):
			if op.isfile(op.join(directory,f)):
				rhfcnt = rhfcnt + 1
				rhf.append(op.join(directory,f))
		
		# files hidden through its path:
		recheck3 = re.search("\/\.",op.join(directory,f))
		if isinstance(recheck3,SRE_Match):
			if op.isfile(op.join(directory,f)):
				hfcnt = hfcnt + 1
				hf.append(op.join(directory,f))
		# no hidden file: so it is visible:
		else:
			if op.isfile(op.join(directory,f)):
				vfcnt = vfcnt + 1
				vf.append(op.join(directory,f))

# get visible size in bytes
for f in vf:
	vf_size.append(os.stat(f).st_size)

for f in hf:
	hf_size.append(os.stat(f).st_size)
    
for f in rhf:
	rhf_size.append(os.stat(f).st_size)

vf_in_gb = byte_to_gb(sum(vf_size))
vf_in_gib = byte_to_gib(sum(vf_size))
hf_in_gb = byte_to_gb(sum(hf_size))
hf_in_gib = byte_to_gib(sum(hf_size))
rhf_in_mb = byte_to_mb(sum(rhf_size))
rhf_in_mib = byte_to_mib(sum(rhf_size))
all_in_gb = byte_to_gb(sum(vf_size + hf_size + rhf_size))
all_in_gib = byte_to_gib(sum(vf_size + hf_size + rhf_size))

## print
print("all directories\t\t: " + str(dcnt))
print("all Files\t\t: " + str(fcnt))
print("hidden dirs\t\t: " + str(hdcnt))
print("hidden files via path\t: " + str(hfcnt))
print("hidden files v.p.\t: %.2f GB" % hf_in_gb)
print("hidden files v.p.\t: %.2f GiB" % hf_in_gib)
print("really hidden files\t: " + str(rhfcnt))
print("really hidden files\t: %.2f MB" % rhf_in_mb)
print("really hidden files\t: %.2f MiB" % rhf_in_mib)
print("visible directories\t: " + str(vdcnt))
print("visible files\t\t: " + str(vfcnt))
print("visible files\t\t: %.2f GB" % vf_in_gb)
print("visible files\t\t: %.2f GiB" % vf_in_gib)
print("complete file sizes\t: %.2f GB" % all_in_gb)
print("complete file sizes\t: %.2f GiB" % all_in_gib)
