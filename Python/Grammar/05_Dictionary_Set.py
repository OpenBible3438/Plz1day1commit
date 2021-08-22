"""
사전 자료형
키(Key)와 값(Value)의 쌍을 데이터로 가지는 자료형
- 리스트나 튜플이 값을 순차적으로 저장하는 것과 대비됨

키와 값의 쌍을 데이터로 가지며 변경 불가능한 자료형을 키로 사용할 수 있음

해시테이블(Hash Table)을 이용하므로 데이터의 조회 및 수정에 있어서 O(1) 시간에 처리
"""
# 선언
data = dict()
# 초기화
# 사전변수[key] = value
data['사과'] = 'Apple'
data['바나나'] = 'Banana'
data['코코넛'] = 'Coconut'

data2 = {
     '하나' : 1
    , '둘' : 2
    , '셋' : 3
}

print(data)
print(data2)

if '사과' in data:
    print("'사과'를 키로 가지는 데이터가 존재합니다.")
else:
    print("'사과'를 키로 가지는 데이터가 존재하지 않습니다.")

# 사전 자료형 관련 함수
# Key 데이터만 담은 리스트
key_list = data.keys()
print(key_list)
# Value 데이터만 담은 리스트
value_list = data.values()
print(value_list)

#리스트 형태로 형변환
print(list(data.keys()))
print(list(data.values()))

# 리스트의 값을 하나씩 출력
for key in key_list:
    print(data[key])

"""
집합 자료형
중복을 허용하지 않고 순서가 없으며 키가 존재하지 않고 값 데이터만 담게 된다.
    - 데이터 존재 유무를 확인할 때 효과적으로 사용
    - 리스트나 튜플처럼 인덱싱으로 값을 얻을 수 없다
    - 데이터 조회 및 수정에 있어서 O(1) 시간에 처리
리스트나 문자열을 이용해서 초기화 
    - set() 함수를 이용
중괄호 안에 각 원소를 (,)콤마를 기준으로 구분하여 삽입함으로 초기화 할 수 있음
"""
# 집합 자료형 초기화 1
data = set([1,1,2,3,4,4,5])
print(data)
# 집합 자료형 초기화 2
data = {1,1,2,3,4,4,5}
print(data)

# 집합 자료형 연산
a = set([1,2,3,4,5])
b = {3,4,5,6,7}
print(a | b) # 합집합
print(a & b) # 교집합
print(a - b) # 차집합

# 집합 자료형 관련 함수
data = set([1,2,3])
# 새로운 원소 추가
data.add(4)
print(data)
# 새로운 원소 여러개 추가
data.update([5,6,7])
print(data)
# 특정 값 원소 삭제
data.remove(6)
print(data)