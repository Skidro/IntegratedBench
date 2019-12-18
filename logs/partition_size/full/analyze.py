#!/usr/bin/env python

import os, sys, re
from plotter import *

def parse (filename):
    pmc = {}
    lines = []
    regex = r'^\s+([\d,]+)\s+(r[\d]+).*$'

    with open (filename, 'r') as fdi:
        lines = fdi.readlines ()

    for l in lines:
        m = re.match (regex, l)

        if m:
            pmc [m.group (2)] = float (m.group (1).replace (',', ''))

    missRate = round ((pmc ['r17'] * 100 / pmc ['r16']), 3)

    return missRate

def stratify_data (data):
    xvals = sorted (data.keys ())
    yvals = [data [x] for x in xvals]

    return xvals, yvals

def plot_data (data):
    pl = Plotter ()
    fig, ax = plt.subplots (figsize = (7, 5))
    xvals, yvals = stratify_data (data)
    ay = pl.barplot (yvals, ax)

    ay.set_ylim (0, 50)
    ay.set_xlim (0.5, len (data) + 1)
    ay.set_ylabel ("LLC Miss-Rate (%)", fontsize = 'large', fontweight = 'bold')
    ay.set_xlabel ("Working Set Size (KBytes)", fontsize = 'large',
            fontweight = 'bold')
    plt.xticks ([x + 0.25 for x in range (1, len (data) + 1)],
            xvals, fontsize = 'large', fontweight = 'bold', rotation = 45)
    plt.savefig ('full.pdf', bbox_inches = 'tight')

    return

def main ():
    missRate = {}
    files = [f for f in os.listdir (os.getcwd ()) if 'perf' in f]

    for f in files:
        workingSet = int (re.match (r'w([\d]+)kb.perf', f).group (1))
        missRate [workingSet] = parse (f)
    plot_data (missRate)

    return

if __name__ == '__main__':
    main ()
