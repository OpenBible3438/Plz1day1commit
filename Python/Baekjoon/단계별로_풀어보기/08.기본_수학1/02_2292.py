"""
벌집
test
"""
N = int(input())

line = 1
number = 1

while True:
    if (N==1) or (N <= number):
        break
    line += 1
    number += 6 * (line-1)
print(line)