#!/usr/bin/python

################################################################
# shuen-sqrt.py
################################################################
# 孫子算經 Master Shün's Computational Classic
# Square root algorithm in Volume II Paragraph 19:
#   https://yawnoc.github.io/pages/master-shuen-ii.html#19
#   https://yawnoc.github.io/manuscripts/shuen-ii-19.pdf
# Released into the public domain (CC0):
#   https://creativecommons.org/publicdomain/zero/1.0/
# ABSOLUTELY NO WARRANTY, i.e. "GOD SAVE YOU"
################################################################

import argparse
import math

def digits_to_int(digits_list):
  
  # Horner's method
  total = 0
  for digit in digits_list:
    total = total * 10 + digit
  return total

def shuen_sqrt(x):
  
  # Number of digits of radicand, N
  N = math.floor(math.log10(x)) + 1
  
  # Number of digits of integer part of square root, n
  n = math.ceil(N / 2)
  
  # Lower divisor (下法), L
  L = (10 ** (n - 1)) ** 2
  
  # Dividend (實), d
  d = x
  
  # Upper quotient (上商) digits, a, b, c, etc.
  abc_list = []
  
  # Straight divisors (方廉隅法), p, q, r, etc.
  pqr_list = []
  
  while True:
    
    # Determine largest integer alpha such that
    #   alpha (p + q + r + etc. + alpha L) <= d
    # and append to upper quotient (上商) digits
    alpha = 0
    while True:
      alpha_next = alpha + 1
      if alpha_next * (sum(pqr_list) + alpha_next * L) > d:
        break
      else:
        alpha = alpha_next
    abc_list.append(alpha)
    
    # Determine newest straight divisor (方廉隅法)
    rho = alpha * L
    pqr_list.append(rho)
    
    # Update dividend (實)
    d -= alpha * sum(pqr_list)
    
    # Update newest straight divisor (方廉隅法)
    pqr_list[-1] *= 2
    
    # If not done yet, step to next place; otherwise break
    if L > 1:
      pqr_list = [int(rho/10) for rho in pqr_list]
      L = int(L/100)
    else:
      break
    
  # Upper quotient (上商), U
  U = digits_to_int(abc_list)
  
  # Lower divisor (下法), L
  L = sum(pqr_list)
  
  # Remainder (不盡), R
  R = d
  
  # Square root
  sqrt_shuen = U + R / L
  
  # Actual square root
  sqrt_actual = math.sqrt(x)
  
  # Display results
  print('Straight divisors: ' + str(pqr_list))
  print('Answer saith: ' + str(U) + ' + ' + str(R) + '/' + str(L))
  
  # Errors
  error_abs = sqrt_shuen - sqrt_actual
  error_rel = sqrt_shuen/sqrt_actual - 1
  print('Absolute error: ' + '{0:.2g}'.format(error_abs))
  print('Relative error: ' + '{0:.2g}'.format(error_rel * 100) + ' %')
  
  # Return value
  return sqrt_shuen

def main(args):
  
  x = args.x
  x = int(x)
  shuen_sqrt(x)

if __name__ == '__main__':
  
  parser = argparse.ArgumentParser(description = 'Computes square root')
  parser.add_argument('x', help = 'Radicand (integer to be square rooted)')
  main(parser.parse_args())