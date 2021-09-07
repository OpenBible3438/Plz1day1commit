"""
알파벳 찾기
"""
S = input()

resultList = [ -1 for _ in range(26)]

count = 0
for i in S:
    alphabet = ord(i) - 97
    if resultList[alphabet] != -1:
        count += 1
        continue
    resultList[alphabet] = count
    count += 1

for j in resultList:
    print(j, end=' ')