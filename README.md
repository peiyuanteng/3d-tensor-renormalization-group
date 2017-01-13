# 3-d-tensor-renormalization-group

This depository use tensor rank decomposition to calculate the magnetization for a nonzero magnetic field of a certain 3d ising model using a generalized tensor renormalization group.

Classical Ising model on a 3d tensor network is considered. This package implements a infinate lattice iteration method to calculate the free energy and the magnitization.

These codes provide the support for paper https://arxiv.org/abs/1605.00062

The codes are written in Matlab with depends on the Matlab tensor toolbox developed by Kolda etc. A link of this pacakge can be found at http://www.sandia.gov/~tgkolda/TensorToolbox/index-2.6.html

Usage:mag(0.01); (0.01 is the numerical differencial increment).

This will calculate the magnetization as a function of the temperature at certain magnetic field h. h is set at 0.5(which can be modified in the file, h>0.5 recommended since this code blow up around the critical points.).
