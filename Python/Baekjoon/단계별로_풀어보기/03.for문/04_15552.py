"""
빠른 A+B
"""
# sys.stdin.readline().rstrip()
import sys

t = int(sys.stdin.readline().rstrip())

for i in range(t):
    a, b = map(int, sys.stdin.readline().rstrip().split())
    print(a+b)