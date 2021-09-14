"""
다이얼
"""
def returnSec(char):
	charNum = ord(char)
	if 65<=charNum<=67:
		return 3
	elif 68<=charNum<=70:
		return 4
	elif 71<=charNum<=73:
		return 5
	elif 74<=charNum<=76:
		return 6
	elif 77<=charNum<=79:
		return 7
	elif 80<=charNum<=83:
		return 8
	elif 84<=charNum<=86:
		return 9
	elif 87<=charNum<=90:
		return 10

word = input()

resultSec = 0
for i in word:
	resultSec += returnSec(i)

print(resultSec)
