"""
단어 공부
"""

word = input().upper()

alphabetList = [ 0 for _ in range(26) ]

for i in word:
    alphabetList[ord(i)-65] += 1

maxNumber = max(alphabetList)
if alphabetList.count(maxNumber) > 1:
    print('?')
else:
    for i in range(26):
        if alphabetList[i] == maxNumber:
            print(chr(i+65))