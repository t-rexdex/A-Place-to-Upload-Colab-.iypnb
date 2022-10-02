import numpy as np
# First Section of HW1
M = np.array([[1, 10, 6],
                 [2,3,5],
              [15,9,4]])
N = np.array([[1,2],
             [6,9],
             [3,7]])

A = M[:,2]
B = N[1,:]

matmulti = np.matmul(M, N) # Multiply M by N
M_sq = M^2 # Square M
N_sqrt = np.sqrt(N) # Calculate the square root for N
Mx5 = M
# multiply M matrix by five using a for loop and then a built in
# for i in M:
#     for y in i:
#         Mx5[i,y] = y*5

M5= M*5
# End of First Section of HW1

S = np.array([[5,3,8], [2,1,7], [6,4,8]])
G = np.sum(S,0)
F = np.mean(S,1)

# Part 4 KNN SECTION

testx = np.array([30, 80])

X = np.array([67,63,78,51,80,90,96,83,72,50])
trainX = np.transpose(X)
Y = np.array([30,79,82,48,65,61,15,22,67,60])
trainY = np.transpose(Y)

grade = np.array([0, 1, 1, 0, 1, 1, 0, 0, 1, 0])

dist = []
placeholder = []

for i in trainX.shape[0]:
    dist =
