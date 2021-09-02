"""
더하기 사이클
"""
realN = int(input())
n = realN
cycle = 0

while True:
	if n < 0:
		n =n*2
		cycle += 1
	else:
		num = (n//10) + (n%10)
		newNum = ((n%10)*10) + (num%10)
		n = newNum
		cycle += 1
		
	if(realN == newNum):
		break
print(cycle)