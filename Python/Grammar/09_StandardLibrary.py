"""
표준 라이브러리
"""

### 내장함수 ###
#sum()
result = sum([1,2,3,4,5])
print(result)

# min() max()
min_result = min(1,2,3,4,5) # 최소값
max_result = max(5,6,7,8,9) # 최대값
print(min_result, max_result)

# eval() 수식을 문자열로 받아서 실행하는 함수
result = eval("(3+5)*7")
print(result)

# sorted() 반복 가능한 객체를 정렬하여 반환. 오름차순이 디폴트
result = sorted([9,8,7,6,3])
reverse_result = sorted([9,8,7,6,3], reverse=True) # 내림차순 속성
print(result)
print(reverse_result)

### itertools ###
# 순열
from itertools import permutations
data = ['A', 'B', 'C']
result = list(permutations(data, 3))
print(result)

# 조합
from itertools import combinations
data = ['A', 'B', 'C']
result = list(combinations(data, 2))
print(result)

# 중복 순열
from itertools import product
data = ['A', 'B', 'C']
result = list(product(data, repeat=2))
print(result)

# 중복 조합
from itertools import combinations_with_replacement
data = ['A', 'B', 'C']
result = list(product(data, repeat=2))
print(result)

### Counter ###
# collections 라이브러리의 Counter는 등장 횟수를 세는 기능을 제공
# 리스트와 같은 반복 가능한(iterable) 객체가 주어졌을 때 내부의 원소가 몇 번씩 등잗했는지 알려줌
from collections import Counter
counter = Counter(['red','blue','red','green','blue','blue'])
print(counter['blue']) # blue 등장한 횟수 출력
print(counter['green']) # green 등장한 횟수 출력
print(dict(counter)) # 사전 형태로 변환하여 출력

### math ###
import math 

# 최소 공배수를 구할 때에는 최대 공약수를 구하는 함수를 이용하여 만들 수 있음.
def lcm(a, b):
    return a * b // math.gcd(a,b)

a = 21
b = 14

print(math.gcd(a, b)) # 최대 공약수 계산
print(lcm(a, b)) # 최소 공배수 계산