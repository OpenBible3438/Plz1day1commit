"""
조건문
파이썬은 코드의 블록(Block:특정한 기능을 수행하기 위한 코드 묶음)을 들여쓰기로 지정.
if ~ elif ~ else
"""
score = 66
if score >= 70:
    print("성정이 70점 이상입니다.")
    if score >= 90:
        print("우수한 성적입니다.")
else:
    print("성적이 70점 미만입니다.")
    print("분발하세요 !")
print("프로그램을 종료합니다.")

"""
비교/논리 연산자 이외의 연산자
in / not in
다수의 데이터를 담는 자료형에 사용 ex)리스트, 튜플, 문자열, 딕셔너리 등등
x in 리스트 => 리스트 안에 x가 들어가 있을 때 True
x not in 문자열 => 문자열 안에 x가 들어가 있지 않을 때 True
"""

"""
아무것도 처리하지 않을 때 pass 키워드를 사용
ex) 디버깅 과정에서 일단 조건문의 형태만 만들어 놓고 조건문을 처리하는 부분은 비우고 싶은 경우
"""
score = 85
if score >= 80:
    pass # 이 부분은 무시하고 넘어가게 됨.
else:
    print("성적이 80점 미만입니다.")
print("프로그램을 종료합니다.")

# 조건부 표현식
result = "Success" if score >= 80 else "Fail"
print(result) # 조건문의 결과에 따라 변수 result에 들어가는 값이 달라짐.

"""
while
"""
# 1부터 9까지 모든 정수의 합
i = 1
result = 0
while i <= 9:
    result += i
    i += 1
print(result)

# 1부터 9까지 홀수의 합
i = 1
result = 0
while i <= 9:
    if i % 2 == 1:
        result += i
    i += 1
print(result)

"""
for
in : 여러개의 데이터를 담은 자료형에 대해 첫 번째 인덱스부터 차례대로 참조
for 변수 in 리스트:
    실행 코드

range() : 연속적인 값을 차례대로 순회할 때 사용. range(시작 값, 끝 값 +1)
          하나의 인자만 넣을 경우 시작 값은 자동으로 0
"""
array = [5,6,7,3,1]
for i in array:
    print(i)

result = 0
for i in range(1, 10): # i는 1부터 9까지의 수를 읽음
    result += i
print(result)

result = 0
for i in range(10): 
    print(i, end=", ") # i는 0부터 9까지의 수를 가지는 걸 확인

# 학생들의 합격 여부 판단 예제
score = [90, 85, 77, 65, 97]
for i in range(5):
    if score[i] >= 80:
        print(i+1,"번 학생은 합격입니다.")
    else:
        print(i+1,"번 학생은 불합격입니다.")

# 학생들의 합격 여부 판단 예제2 - 특정 번호의 학생 제외하기
score = [90, 85, 77, 65, 97]
cheating_student_list = {2,4}
for i in range(5):
    if i+1 in cheating_student_list:
        continue
    if score[i] >= 80:
        print(i+1,"번 학생은 합격입니다.")

# 중첩 반복문 - 구구단
for i in range(2, 10):
    for j in range(1, 10):
        print(i,"*",j,"=",i*j)
    print()