"""
리스트 자료형
여러 개의 데이터를 연속적으로 담아 처리하기 위해 사용하는 자료형
C, JAVA에서 배열과 비슷한 기능을 하며 연결 리스트와 유사한 기능을 지원

* 초기화
[] 대괄호 안에 원소를 쉼표로 구분하여 넣는다.
비어있는 리스트를 선언할 땐 list() 혹은 []
리스트의 원소에 접근할 때는 인덱스 값을 괄호에 넣는다.
"""

# 빈 리스트 선언
a = list()
print(a)

# 크기가 N이고, 모든 값이 0인 1차원 리스트 초기화
n = 10
a = [0] * n
print(a)

# 원소를 넣어 초기화
a = [1,2,3,4,5,6,7,8,9]
print(a)

"""
인덱싱 & 슬라이싱
"""
# 원소의 index값에 접근 => 인덱싱(indexing)
# 원소의 8번째 원소 출력
print(a[7])
# 뒤에서 1번째 원소 출력
print(a[-1])
# 4번째 원소값 변경
a[3] = 33
print(a)

# 연속적인 위치를 갖는 원소 참조 => 슬라이싱(Slicing)
# 4번째 원소만 출력
print(a[3])
# 두 번째 원소부터 네 번째 원소까지
print(a[1:4])

"""
리스트 컴프리헨션(Comprehension)
대괄호 안에 조건문과 반복문을 적용하여 리스트 초기화하는 방법
"""
# 0부터 9까지의 수를 포함하는 리스트
array = [i for i in range(10)] # range(10) => 0~9 까지의 수를 i가 갖게 해줌
print(array)

# 0부터 20까지의 수 중에서 홀수만 포함하는 리스트
array = [i for i in range(20) if i % 2 == 1]
print(array)

# 1부터 9까지의 수들의 제곱을 담은 리스트
array = [i*i for i in range(1,10)]
print(array)

# 2차원 리스트 초기화
# N * M 크기의 2차원 리스트 초기화
n = 3
m = 4
array = [ [0] * m for _ in range(n) ] # 반복을 수행하지만 반복을 위한 변수값을 무시할 때 _언더바 사용
print(array)

"""
자주 사용하는 리스트 관련 함수
append() - 변수명.append() : 리스트에 원소를 하나 삽입
sort() - 변수명.sort() : 오름차순 정렬. sort(reverse=True)로 사용하면 내림차순 정렬
reverse() - 변수명.reverse() : 리스트의 원소의 순서를 모두 뒤집기
insert() - insert(삽입할 위치 인덱스, 삽입할 값) : 특정 인덱스 위치에 원소를 삽입
count() - 변수명.count(특정값) : 리스트에서 특정한 값을 가지는 데이터의 개수를 셈
remove() - 변수명.remove(특정값) : 특정한 값을 갖는 원소를 제거.
"""
a = [1, 2, 4]
print("기본 리스트: ", a)

# 리스트 원소 삽입
a.append(9)
print("리스트 원소 삽입: ", a)

# 오름차순 정렬
a.sort()
print("오름차순 정렬", a)
# 내림차순 정렬
a.sort(reverse=True)
print("내림차순 정렬", a)

# 리스트 원소 뒤집기
a.reverse()
print("원소 뒤집기", a)

# 특정 인덱스에 데이터 추가
a.insert(1, 3)
print("1번째 인덱스 자리에 원소 3 추가", a)
a.insert(5, 1)
print("0번째 인덱스 자리에 원소 1 추가", a)

# 특정 데이터 값의 개수 세기
print("값이 1인 데이터의 개수 : ", str(a.count(1))+"개")

# 특정 값 삭제
a.remove(1)
print("값이 1인 데이터 삭제", a) # 같은 값의 데이터가 있는 경우 하나만 삭제