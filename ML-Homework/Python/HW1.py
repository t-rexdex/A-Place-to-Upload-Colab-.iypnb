import numpy as np
# First Section of HW1
M = np.array([[1, 10, 6],
                 [2,3,5],
              [15,9,4]])
N = np.array([1,2],
             [6,9],
             [3,7]])

A = M[:,2]
B = N[1,:]

matmulti = np.matmul(M, N) # Multiply M by N
M_sq = M^2 # Square M
N_sqrt = np.sqrt(N) # Calculate the square root for N

# multiply M matrix by five using a for loop and then a built in
for i,j in M.iteritems():
        Mx5 = M[i,j]*5

M5= M*5
# End of First Section of HW1

