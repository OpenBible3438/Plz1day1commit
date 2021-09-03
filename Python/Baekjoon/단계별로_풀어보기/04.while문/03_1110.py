"""
더하기 사이클
"""

realN = int(input())
n = realN
cycle = 0

while True:
	num = (n//10) + (n%10)
	n = ((n%10)*10) + (num%10)
	cycle += 1
		
	if(realN == n):
		break
print(cycle)