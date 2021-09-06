"""
셀프넘버
"""
def d(n):
    num = n
    while True:
        if (n == 0):
            break
        num += n % 10
        n = n // 10
    return num

selfNumberList = [False for _ in range(10001)]

for i in range(1, 10001):
    notSelfNumber = d(i)
    if notSelfNumber <= 10000:
        selfNumberList[notSelfNumber] = True

for i in range(1, 10001):
    if not selfNumberList[i]:
        print(i)