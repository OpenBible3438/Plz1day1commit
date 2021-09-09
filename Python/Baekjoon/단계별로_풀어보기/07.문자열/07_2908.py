"""
상수
"""
A, B = input().split()

A = list(A)
A.reverse()
B = list(B)
B.reverse()

strA=''
strB=''
for i in range(3):
	strA += A[i]
	strB += B[i]

if int(strA) > int(strB):
	print(strA)
else:
	print(strB)

"""
join 사용
"""
A, B = input().split()

A = list(A)
B = list(B)

A.reverse()
B.reverse()

if int(''.join(A)) > int(''.join(B)):
	print(''.join(A))
else:
	print(''.join(B))