"""
벌집
"""
N = int(input())

line = 1
number = 1

while True:
    if (N==1) or (number < N < number+(6*line)):
        break
    line += 1
    number += (6*line)

print(line)