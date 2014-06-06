#!/usr/bin/env python2
"""
plot two-dimensional density view
"""

import numpy as np
import matplotlib.pyplot as plt
import scipy.interpolate

x, y, z = 10*np.random.random((3,10))

xi, yi = np.linspace(x.min(), x.max(), 100), np.linspace(y.min(), y.max(), 100)
xi, yi = np.meshgrid(xi, yi)

rbf = scipy.interpolate.Rbf(x,y,z,function='linear')
zi  = rbf(xi, yi)

plt.imshow(zi, vmin=z.min(), vmax=z.max(), origin='lower',
		   extent=[x.min(), x.max(), y.min(), y.max()])
plt.scatter(x,y,c=z)
plt.colorbar()
plt.show()
