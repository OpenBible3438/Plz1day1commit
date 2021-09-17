"""
벌집
"""
N = int(input())

line = 1
number = 1

while True:
    if number < N <= number+(6*line) and N == 1:
        break
    number += 6*line
    line += 1

print(line) 