#!/usr/bin/python

"""
----------------------------------------------------------------
sqrt.py
----------------------------------------------------------------

孫子算經 Sun Tzŭ's Computational Classic
Square root algorithm in Volume II Paragraph 19:
  <https://yawnoc.github.io/sun-tzu/ii/19>

Licensed under "MIT No Attribution" (MIT-0),
see <https://spdx.org/licenses/MIT-0>.

"""


import argparse
import math


def digits_to_int(digits_list):
  """
  Convert a list of digits to an integer.
  Uses Horner's method.
  """
  
  total = 0
  for digit in digits_list:
    total = total * 10 + digit
  
  return total


def sun_tzu_sqrt(x, print_details=False):
  """
  Compute Sun Tzŭ square root.
  """
  
  # Number of digits of radicand, N
  N = math.floor(math.log10(x)) + 1
  
  # Number of digits of integer part of square root, n
  n = math.ceil(N / 2)
  
  # Lower divisor (下法), L
  L = (10 ** (n - 1)) ** 2
  
  # Dividend (實), d
  d = x
  
  # Upper quotient (上商) digits, a_1, a_2, ..., a_n
  a_list = []
  
  # Straight divisors (方廉隅法), s_1, s_2, ..., s_n
  s_list = []
  
  for i in range(1, 1 + n):
    
    # Determine newest digit of the upper quotient (上商)
    # the largest integer a_i such that
    #   a_i [(s_1 + ... + s_{i-1}) + a_i L] <= d
    a_i = 0
    while True:
      a_i_next = a_i + 1
      if a_i_next * (sum(s_list) + a_i_next * L) > d:
        break
      else:
        a_i = a_i_next
    a_list.append(a_i)
    
    # Determine newest straight divisor (方廉隅法)
    s_i = a_i * L
    s_list.append(s_i)
    
    # Update dividend (實)
    d -= a_i * sum(s_list)
    
    # Update newest straight divisor (方廉隅法)
    s_list[-1] *= 2
    
    # Retreat
    if i < n:
      s_list = [s // 10 for s in s_list]
      L = L // 100
    
  # Upper quotient (上商), U
  U = digits_to_int(a_list)
  
  # Lower divisor (下法), L
  L = sum(s_list)
  
  # Remainder (不盡), R
  R = d
  
  # Square root
  sqrt_sun_tzu = U + R / L
  
  # Actual square root
  sqrt_actual = math.sqrt(x)
  
  # Print results and errors
  if print_details:
    
    print(f'Straight divisors: {s_list}')
    print(f'Answer saith: {U} + {R}/{L}')
    
    error_abs = sqrt_sun_tzu - sqrt_actual
    error_rel = sqrt_sun_tzu/sqrt_actual - 1
    print(f'Absolute error: {error_abs:.2g}')
    print(f'Relative error: {error_rel * 100:.2g} %')
  
  return sqrt_sun_tzu


def main(args):
  
  x = args.x
  sun_tzu_sqrt(x, True)


if __name__ == '__main__':
  
  parser = argparse.ArgumentParser(description='Computes Sun Tzŭ square root')
  parser.add_argument(
    'x',
    help='Radicand (integer to be square rooted)',
    type=int
  )
  main(parser.parse_args())
