"""
Plot a sin graph in the task manager
"""

from multiprocessing import *
from time import *
import math

def task(n, plot):
    t = 0
    while True:
        t = (t + 1) % len(plot)
        tmp = time()
        sleep(plot[t])
        while (time()-tmp < 1):
            pass

if __name__ == "__main__":
    n = 120
    p = map(lambda x: math.sin(2 * math.pi * x / n) * 0.20+ 0.5, range(n))
    tsk = map(lambda x,y: Process(target=task, args=(x, y)), range(4), (p,) * 4)
    map(lambda x: (x).start(), tsk)

