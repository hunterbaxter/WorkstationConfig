#!/usr/bin/python3

import os
import sys
import time

from tqdm import trange

work_time = int(sys.argv[1])
rest_time = int(sys.argv[2])
count = int(sys.argv[3])

for i in trange(count, desc="Pomodoro"):
    os.system(f'espeak -ven+f3 -k5 -s150 "Round {i+1}!"')
    os.system(f'espeak -ven+f3 -k5 -s150 "Work for {work_time} minutes"')
    for j in trange(work_time, desc="Work"):
        time.sleep(60)
    os.system(f'espeak -ven+f3 -k5 -s150 "Rest for {rest_time} minutes"')
    for j in trange(rest_time, desc="Rest"):
        time.sleep(60)
    if i != count - 1:
        os.system(f'espeak -ven+f3 -k5 -s150 "Rest is over. Get back to work."')
    else:
        os.system(f'espeak -ven+f3 -k5 -s150 "Pomodoro Complete"')
