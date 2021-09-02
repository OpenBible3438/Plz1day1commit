"""
X보다 작은 수
"""
n, x = map(int, input().split())

listA = list(map(int, input().split()))

for i in listA:
	if i < x:
		print(i, end=' ')