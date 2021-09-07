"""
문자열 반복
"""
T = int(input())

for i in range(T):
    num, char = input().split()
    P = ''
    for j in char:
        P += j * int(num)
    print(P)