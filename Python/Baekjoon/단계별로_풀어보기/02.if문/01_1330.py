"""
두 수 비교하기
"""
a, b = list(map(int, input().split()))
if a > b:
    print('>')
elif a < b:
    print('<')
else:
    print('==')
