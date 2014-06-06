#!/usr/bin/env python
"""
plot magnetic lattice
"""

import matplotlib.pylab as plt
import numpy as np

f12 = 'AWDall.lat'

data12 = np.loadtxt(f12)

plt.plot(data12[:,0], data12[:,1], 'r-',
		 data12[:,0], data12[:,2], 'b-',
		 linewidth=2)
plt.xlim([110,240])
plt.ylim([1.5,1.53])
plt.legend([r'$a_u$',r'$a_d$'],1)
plt.xlabel(r'$z\,\mathrm{[m]}$',fontsize=18)
plt.ylabel(r'undulator parameter',fontsize=18)
plt.show()
