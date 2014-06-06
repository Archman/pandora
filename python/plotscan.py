#!/usr/bin/env python2
import numpy as np
import matplotlib.pyplot as plt
#import scipy.interpolate

f1 = './lpdatas'
data1 =  np.loadtxt(f1)

dimxy = [101,101]
x = np.reshape(data1[:,0],dimxy)
y = np.reshape(data1[:,1],dimxy)
z = np.reshape(data1[:,3],dimxy)

CF = plt.contourf(x,y,z/1e8,100)
plt.colorbar(CF, format = "%.1f", shrink=0.9, 
		     orientation='vertical')
plt.text(66,-11, r'$\times 10^8$',fontsize=14)
plt.xlabel("QF [T/m]", fontsize=14, fontname="Times New Roman")
plt.ylabel("QD [T/m]", fontsize=14, fontname="Times New Roman")
plt.show()
"""
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
"""
