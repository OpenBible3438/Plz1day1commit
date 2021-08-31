"""
함수(Function)란 특정한 작업을 하나의 단위로 묶어 놓은 것을 의미
프로그램은 똑같은 코드가 반복적으로 사용되어야 할 때가 많기에 함수를 사용하여 불필요한 작업을 줄여줌
- 내장함수 : 파이썬이 기본적으로 제공하는 함수 ex) input, print ...
- 사용자 정의 함수 : 개발자가 직접 정의하여 사용할 수 있는 함수
- 매개변수(파라미터) : 함수 내부에서 사용할 변수. 변수를 직접 지정해서 사용할 수 있음
- 반환 값 : 함수에서 처리 된 결과를 반환

def 함수명(매개변수):
    실행할 소스코드
    return 반환값
"""
# 더하기 함수
def add(a,b):
    return a+b

print(add(5,7)) 

# 더하기 함수 2
def add(a,b):
    print('함수의 결과 : ', a+b)
    # return값이 존재하지 않아도 됨
add(1,2)

# 파라미터 변수 직접 지정
add(b=1, a=9) # 함수를 정의할 때의 변수 순서를 지키지 않아도 됨

# 함수 바깥에 선선된 변수를 참조하려면 global 키워드를 사용해야함.
a = 0
def func():
    global a
    a += 1
for i in range(10):
    func()
print(a)

# 함수는 여러 개의 반환값을 가질 수 있음
def operator(a,b):
    add_var = a + b
    subtract_var = a - b
    multiply_var = a * b
    divide_var = a / b
    return add_var, subtract_var, multiply_var, divide_var # 패킹

a, b, c, d = operator(7,3) # 언패킹. 함수는 4개의 반환값을 가지는데, 차례대로 변수에 담게 됨
print(a,b,c,d)

"""
람다 표현식
이름없는 함수.
특정한 기능을 수행하는 함수를 한 줄에 작성할 수 있어서 함수를 간단하게 만듦.
lambda 인자 : 표현식
"""
def add(a,b):
    return a + b
# 일반적인 add() 메소드 사용
print(add(1,2))
# 람다 표현식으로 구현한 add()
print((lambda a, b: a+b)(4, 5)) # print 함수 안의 내용이 add() 기능을 함.

# 튜플 형태의 데이터를 가진 리스트
# 이름, 점수
# 학생을 점수순으로 오름차순 정렬하기
array = [('홍길동', 50), ('이순신', 32), ('아무개',74)]

def my_key(x):
    return x[1]
# my_key()는 두번째 원소 값을 반환한다. sorted는 key 속성을 기준으로 정렬한다
print(sorted(array, key=my_key)) 
print(sorted(array, key=lambda x:x[1]))

# 여러 개의 리스트에 적용
list1 = [1,2,3,4,5]
list2 = [6,7,8,9,10]

# map()은 원소 각각 함수를 적용시킬 때 사용함.
result = map(lambda a,b:a+b, list1, list2) # => 각 리스트의 같은 자리 원소끼리 더함
print(list(result))