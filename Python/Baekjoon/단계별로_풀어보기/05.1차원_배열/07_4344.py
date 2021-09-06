"""
평균은 넘겠지
"""
C = int(input())

for i in range(C):
    scoreList = list(map(int, input().split()))
    scoreAvg = sum(scoreList[1:]) / scoreList[0]
    student = 0

    for j in scoreList[1:]:
        if j > scoreAvg:
            student += 1
    studentAvg = student/scoreList[0] * 100
    print(format(studentAvg, '.3f')+'%')