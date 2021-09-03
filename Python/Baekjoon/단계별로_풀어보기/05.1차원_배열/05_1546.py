"""
평균
"""
n = int(input())

scoreList = list(map(int, input().split()))
m = max(scoreList)
sum = 0

for i in range(n):
    scoreList[i] = scoreList[i]/m*100
    sum += scoreList[i]

print(sum / n)