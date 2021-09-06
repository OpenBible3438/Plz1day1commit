"""
셀프넘버
"""
def selfNumber(n):
    notSelfNumber = n
    while (n == 0):
        notSelfNumber += n % 10
        n = n // 10
    return notSelfNumber

selfNumber_list = list()
for i in range(1, 10001):
    notSelfNumber = selfNumber(i)
    if notSelfNumber < 10001:
        selfNumber_list.append(True)

for i in range(selfNumber_list):
    if not selfNumber_list[i]:
        print(i)
