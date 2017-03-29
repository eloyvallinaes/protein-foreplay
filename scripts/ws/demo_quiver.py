#!/usr/bin/python

'''
==============
3D quiver plot
==============

Demonstrates plotting directional arrows at points on a 3d meshgrid.
'''

from mpl_toolkits.mplot3d import axes3d
import matplotlib.pyplot as plt
import numpy as np

fig = plt.figure()
ax=fig.add_subplot(111, projection='3d')
x = np.linspace(0,1,3)
y = np.linspace(0,1,3)
z = np.linspace(0,1,3)
u = v = w = np.zeros((3,3,3))
u[0,1,0] = 0.1
ax.quiver(x, y, z, u, v, w)

ax.set_xlim([0,1])
ax.set_ylim([0,1])
ax.set_zlim([0,1])
plt.show()
