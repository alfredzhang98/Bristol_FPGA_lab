import math
import numpy as np
import matplotlib.pyplot as plt

F0 = 440 # signal frequency ( middle c )
Fs = 10e3 # sampling frequency
A = 1 # signal amplitude
r = 1 # damping factor
SAMPLES = int ( Fs / F0 )
# coefficients
a1 = r * math.cos (2* math.pi * F0 / Fs )
a2 = r * r
# initialize ysin
ysin = np.array ([ A* math . sin (2* math.pi * F0 / Fs ) , 0])
for i in range (2 ,2* SAMPLES ):
    ynew = 2* a1 * ysin [i -1] - a2 * ysin [i -2]
    ysin = np.append (ysin, ynew)

plt.step (ysin , 'r-' , where = 'post' , linewidth =0.5)
plt.plot (ysin , 'o-' , linewidth =0.5 , color = 'grey' , alpha =0.3)
plt.xlabel ( " Sample " )
plt.ylabel ( " Amplitude " )
plt.show ()