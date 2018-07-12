#!/usr/bin/python3
from tkinter import *
from tkinter import ttk

root = Tk()
fr1=ttk.namedFrame(root)
fr1label=Label(root,text="Hallo Welt",width=20).pack(side='left')
fr1entry=Entry(root,width=20).pack(side='right')

root.mainloop()
