import os
import sys
import time

from tqdm import tqdm, trange

work_time = int(sys.argv[1])
rest_time = int(sys.argv[2])
i = int(sys.argv[3])

for i in trange(i, desc="Pomodoro"):
    os.system(f'espeak -ven+f3 -k5 -s150 "Round {i+1}!"')
    os.system(f'espeak -ven+f3 -k5 -s150 "Work for {work_time} minutes"')
    for j in trange(work_time, desc="Work"):
        time.sleep(60)
    os.system(f'espeak -ven+f3 -k5 -s150 "Rest for {work_time} minutes"')
    for j in trange(rest_time, desc="Rest"):
        time.sleep(60)
