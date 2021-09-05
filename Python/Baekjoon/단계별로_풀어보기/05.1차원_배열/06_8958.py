"""
OX퀴즈
"""
test_case = int(input())

for i in range(test_case):
    oxList = list(input())
    score = 0
    total_score = 0
    for i in oxList:
        if i == 'O':
            score += 1
            total_score += score
        else:
            score = 0
    print(total_score)