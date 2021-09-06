"""
한수
"""
def is_hansu(n):
    result = False
    if n < 100:
        result = True
    else:
        n = str(n)
        d = int(n[1]) - int(n[0])
        for i in range(0, len(n)):
            if i+1 == len(n): break
            if int(n[i+1]) - int(n[i]) == d:
                result = True
            else:
                result = False
                break
    return result

N = int(input())

count = 0
for i in range(1, N+1):
    if is_hansu(i):
        count += 1
print(count)