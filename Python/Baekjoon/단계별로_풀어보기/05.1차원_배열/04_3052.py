"""
나머지
"""
import sys

divList = list()

for i in range(10):
    divList.append(int(sys.stdin.readline().rstrip()) % 42)

print(len(set(divList)))