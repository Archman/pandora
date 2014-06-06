#!/usr/bin/env python
"""
plot gain curve
"""

import matplotlib.pylab as plt
import numpy as np

f12 = '../rad0.asc'
f22 = '../rad.asc'
f32 = '../radOPTAWD.asc'

data12 = np.loadtxt(f12)
data22 = np.loadtxt(f22)
data32 = np.loadtxt(f32)

plt.plot(data12[:,0], data12[:,3]/1e9, 'r-',
		 data22[:,0], data22[:,3]/1e9, 'b-',
		 data32[:,0], data32[:,3]/1e9, 'm-',
		 linewidth=2)
plt.xlim([0,240])
#plt.ylim([1.5,1.53])
plt.legend([r'No taper',r'Taper',r'Taper(AWD)'],2)
plt.xlabel(r'$z\,\mathrm{[m]}$',fontsize=18)
plt.ylabel(r'$\mathrm{FEL\,power\,(GW)}$',fontsize=18)
plt.show()
