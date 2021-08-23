"""
표준 입력 방법
input() : 한 줄의 문자열을 입력 받는 함수
map() : 리스트의 모든 원소에 각각 특정한 함수를 적용할 때 사용
ex) 공백을 기준으로 구분된 데이터를 입력 받을 때
    list(map(int, input().split()))
ex) 공백을 기준으로 구분된 데이터의 개수가 많지 않을 때
    a, b, c = map(int, input().split())
"""
n = int(input())
data = list(map(int, input().split()))
data.sort(reverse=True)
print(data)

'''
사용자로부터 입력을 빠르게 받아야 하는 경우
sys.stdin.readline() 사용하는데,
입력 후 엔터가 줄 바꿈 기호로 입력되므로 rstrip() 함께 사용
'''
import sys
data = sys.stdin.readline().rstrip()

"""
표준 출력 방법
print() : input()처럼 내장함수. 
, 콤마를 이용하여 띄어쓰기로 구분하여 출력할 수 있음
기본적으로 출력 이후에 줄 바꿈을 수행하고, 이는 end 속성을 사용하여 변형 가능
"""
a = 1
b = 2
print(a,b)
print(7, end=" ")
print(8, end=" ")
print(" a의 값은 "+str(a)+"입니다.")

"""
f-string
문자열 앞에 접두사 'f'를 붙여 사용.
중괄호 안에 변수명을 넣어 간단하게 문자열과 정수를 함께 사용할 수 있음
"""
print(f"a의 값은 {a}입니다.")