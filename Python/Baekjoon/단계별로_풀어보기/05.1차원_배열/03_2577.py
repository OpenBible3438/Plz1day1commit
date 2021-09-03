"""
숫자의 개수
"""

# result 1
A = int(input())
B = int(input())
C = int(input())

result = str(A * B * C)
resultList = [0] * 10

for i in result:
    resultList[int(i)] += 1

for i in resultList:
    print(i)

# result 2
A = int(input())
B = int(input())
C = int(input())

result = str(A * B * C)

for i in range(10):
    print(result.count(str(i)))