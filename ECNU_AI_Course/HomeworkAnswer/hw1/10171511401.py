import numpy as np
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


# Function and the gradient
def peak(x, y):
    return 3*pow(1-x, 2)*np.exp(-pow(x, 2)-pow(y+1, 2)) - \
           10*(x/5-pow(x, 3)-pow(y, 5))*np.exp(-pow(x, 2)-pow(y, 2)) - \
           1/3*np.exp(-pow(x+1, 2)-pow(y, 2))

def grad_x(x, y):
    return -6*x*(1 - x)**2*np.exp(-x**2 - (y + 1)**2) - \
           2*x*(10*x**3 - 2*x + 10*y**5)*np.exp(-x**2 - y**2) - \
           1/3*(-2*x - 2)*np.exp(-y**2 - (x + 1)**2) + \
           (6*x - 6)*np.exp(-x**2 - (y + 1)**2) + \
           (30*x**2 - 2)*np.exp(-x**2 - y**2)

def grad_y(x, y):
    return 50*y**4*np.exp(-x**2 - y**2) - \
           2*y*(10*x**3 - 2*x + 10*y**5)*np.exp(-x**2 - y**2) + \
           2/3*y*np.exp(-y**2 - (x + 1)**2) + \
           3*(1 - x)**2*(-2*y - 2)*np.exp(-x**2 - (y + 1)**2)


# Gradient Descent
GD_settings = {
    'alpha': 0.01,
    'epoch': 100,
}

def GD(lr, epoch, x, y, verbose=False):
    trajectory_x = [x]
    trajectory_y = [y]
    trajectory_peak = [peak(x, y)]

    for iter_num in range(epoch):
        if verbose:
            print(f"Iteration{iter_num}:  Location:{[x, y]}  Function_value:{peak(x, y)}")

        x = x - lr*grad_x(x, y)
        y = y - lr*grad_y(x, y)

        trajectory_x.append(x)
        trajectory_y.append(y)
        trajectory_peak.append(peak(x, y))

    return trajectory_x, trajectory_y


# Plot the peak function
fig = plt.figure()
ax = Axes3D(fig)
x_axis = np.arange(-4, 4, 0.1)
y_axis = np.arange(-4, 4, 0.1)
X, Y = np.meshgrid(x_axis, y_axis)
Z = peak(X, Y)
plt.xlabel('x')
plt.ylabel('y')
ax.plot_surface(X, Y, Z, rstride=1, cstride=1, cmap='rainbow')
plt.show()


# Plot contour and the trajectory
pos_x_1, pos_y_1 = GD(GD_settings['alpha'], GD_settings['epoch'], -0.2, -0.5)
pos_x_2, pos_y_2 = GD(GD_settings['alpha'], GD_settings['epoch'], -0.2, -0.2)
pos_x_3, pos_y_3 = GD(GD_settings['alpha'], GD_settings['epoch'], -0.5, -0.5)

plt.contourf(X, Y, Z)
plt.scatter(pos_x_1, pos_y_1, color='red')
plt.show()

plt.contourf(X, Y, Z)
plt.scatter(pos_x_2, pos_y_2, color='red')
plt.show()

plt.contourf(X, Y, Z)
plt.scatter(pos_x_3, pos_y_3, color='red')
plt.show()
