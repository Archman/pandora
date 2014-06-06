#!/usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt

import myfig

# Make a quick sin plot
x = np.linspace(-10, 10, 100)
y = np.sin(x)
plt.plot(x, y)
plt.xlabel("Time")
plt.ylabel("Amplitude")


# Save it in png and svg formats
myfig.save("./signal", ext="png", close=False, verbose=True, vdpi=300)
