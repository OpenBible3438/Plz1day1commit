"""
최댓값
"""
# result 1
listA = list()
for i in range(9):
    listA.append(int(input()))

print(max(listA))
print(listA.index(max(listA))+1)

# result 2
listA = [int(input()) for _ in range(9)]
print(max(listA))
print(listA.index(max(listA))+1)

# print(max(listA), listA.index(max(listA))+1)