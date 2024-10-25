# Author: Your Name / your_email
# Date: 2024-09-01
# Assignment Name: hw05

import numpy as np

def p1(data, powers):
    """
    Implement the Richardson extrapolation. 

    Assume the expansion of 
    f(h) = f(0) + c_1 h^{alpha_1} + c_2 h^{alpha_2} + ... + c_n h^{alpha_n} - ...

    @param data: a list of values [f(2^(-1)), f(2^(-2)), ..., f(2^(-n))]
    @param powers: a list of powers [alpha_1, alpha_2, ..., alpha_{n-1}]

    @return: the extrapolated value of f(0) using Richardson extrapolation

    """
    ret = 0
    # write your code here.
    return ret


def p2(beta):
    """
    Compute the value of the series 
        sum_{k=0}^(infty) ((-1)^k /(2k + 1)^{beta})

    @param beta: a real value for the parameter beta on (0, 1]

    @return: the value of the series.
    """
    ret = 0
    # write your code here.
    return ret


def p3(shifts):
    """
    Compute the coefficients of the finite difference scheme for f'(x)
    using the formula
    
    f'(x) approx (1/h) (c_0 f(x_0) + c_1 f(x_1) + ... + c_n f(x_n)) + O(h^n)

    @param: shifts: a list of real values (a_0, a_1, ..., a_n), the nodes are x_i = x + a_i h
    
    @return: coefs: a numpy array of coefficients (c_0, c_1, ..., c_n)

    """
    coefs = np.zeros(len(shifts))
    # write your code here.
    return coefs


def p4(shifts, l):
    """
    For 6630 only. 
    
    Compute the coefficients of the finite difference scheme for f^{(l)}(x)
    using the formula

    f^{(l)}(x) approx (1/h^l) (c_0 f(x_0) + c_1 f(x_1) + ... + c_n f(x_n)) + O(h^{n + 1 - l})

    @param: shifts: a list of real values (a_0, a_1, ..., a_n), the nodes are x_i = x + a_i h
    @param: l: an integer n >= l >= 1, the order of the derivative

    @return: coefs: a numpy array of coefficients (c_0, c_1, ..., c_n)

    """
    coefs = np.zeros(len(shifts))
    # write your code here.
    return coefs
