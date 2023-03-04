import sympy as sym
import math

# define symbolic variables
a, b, c, d, e, f, g, h, i = sym.symbols('a b c d e f g h i')
L1, L2, L3, L4, theta1, alpha2, alpha3, alpha4 = sym.symbols('L1 L2 L3 L4 theta1 alpha2 alpha3 alpha4')

# define two matrices
T1 = sym.Matrix([[sym.cos(theta1), -sym.sin(theta1), 0, 0],
                [sym.sin(theta1), sym.cos(theta1), 0, 0],
                [0, 0, 1, 0],
                [0, 0, 0, 1]])
T2 = sym.Matrix([[1, 0, 0, 0],
                [0, sym.cos(alpha2), -sym.sin(alpha2), -sym.sin(alpha2)*L1],
                [0, sym.sin(alpha2), sym.cos(alpha2), sym.cos(alpha2)*L1],
                [0, 0, 0, 1]])

T3 = sym.Matrix([[1, 0, 0, 0],
                [0, sym.cos(alpha3), -sym.sin(alpha3), -sym.sin(alpha3)*L2],
                [0, sym.sin(alpha3), sym.cos(alpha3), sym.cos(alpha3)*L2],
                [0, 0, 0, 1]])

T4 = sym.Matrix([[1, 0, 0, 0],
                [0, sym.cos(alpha4), -sym.sin(alpha4), -sym.sin(alpha4)*L3],
                [0, sym.sin(alpha4), sym.cos(alpha4), sym.cos(alpha3)*L3],
                [0, 0, 0, 1]])

T5 = sym.Matrix([[1, 0, 0, 0],
                [0, 1, 0,  0],
                [0, 0, 1, L4],
                [0, 0, 0,  1]])


# perform matrix multiplication symbolically
T02 = T1 * T2
T03 = T02* T3
T04 = T03 * T4
T05 = T04 * T5


# print the result
print("T02 ",T02)
print("T03 ",T03)
print("T04 ",T04)
print("T05 ",T05)
