#include <iostream>
#include <vector>
#include <string>

#define ARR_SIZE 5
#define MAX_SIZE 100

using namespace std;

string type[2] = {"먹고 갈래요(For Here)","가지고갈래요(To Go)"};
string menu[4] = {"추천메뉴","비프","치킨","사이드"};
string beef[ARR_SIZE] = {"1955버거","베이컨 토마토 디럭스","빅맥","불고기 버거","더블 쿼터 파운더치즈"};
string chicken[ARR_SIZE] = { "맥스파이시 상하이 버거","슈니언 버거","맥치킨 모짜렐라","슈비버거","슈슈버거" };
string side_menu[ARR_SIZE] = { "후렌치 후라이", "스낵랩","애플파이","콜라", "스프라이트" };
string add_order[ARR_SIZE] = { "양파","피클","양배추","베이컨","추가소스" };

char AddOrder='y';
char OrderType[1];
char OrderCat[1];
char OrderMain[1];
string RandMenu[ARR_SIZE];
char ChickenRandMenu[ARR_SIZE] = { 0,0,0,0,0 };
int temp;
char side_ch;
string Order_list[ARR_SIZE];
vector <string>OrderResult;

void Side_Menu();

void First_Display() {
   cout << "========Mc Donalds=========" << endl;
   cout << "1.먹고 갈래요(For Here)" << endl << "2.가지고갈래요(To Go)" << endl;
   cin >> OrderType[0];
   temp = atoi(OrderType);
   Order_list[0] = type[temp - 1];

   cout << "1.추천메뉴 2.비프 3.치킨 4.사이드" << endl;
   cin >> OrderCat[0];
   temp = atoi(OrderCat);
   Order_list[1] = menu[temp - 1];
   cout << endl << "메뉴리스트" << endl;
}

void Rand_Menu() {
   char ch_rand_num = 5;
   char ch;
   for (int n = 0; n < ch_rand_num; n++) {
      char rand_num = rand() % ARR_SIZE;
      
      if (rand_num % 2 == 0) {
         ch = rand_num;
         cout << n + 1 << ". " << beef[rand_num] << endl;
      }
      else {
         cout << n + 1 << ". " << chicken[rand_num] << endl;
      }

   }
   cin >> OrderMain[0];
   temp = atoi(OrderMain);
   Order_list[2] = beef[temp - 1];
}

void Beef_Menu() {
   for (int n = 0; n < ARR_SIZE; n++) {
      cout << n + 1 << ". " << beef[n] << ' ';
   }
   cin >> OrderMain[0];
   temp = atoi(OrderMain);
   Order_list[2] = beef[temp - 1];
   cout << "사이드 메뉴 추가하시겠습니까?(Y/N)";
   cin >> side_ch;
   if (side_ch == 'y') {
      Side_Menu();
   }
   else {
      for (int n = 3; n < ARR_SIZE; n++) {
         Order_list[n] = "주문사항 없음";
      }
   }
}

void Chicken_Menu() {
   for (int n = 0; n < ARR_SIZE; n++) {
      cout << n + 1 << ". " << chicken[n] << ' ';
   }
   cin >> OrderMain[0];
   temp = atoi(OrderMain);
   Order_list[2] = chicken[temp - 1];
   cout << "사이드 메뉴 추가하시겠습니까?(Y/N)";
   cin >> side_ch;
   if (side_ch == 'y') {
      Side_Menu();
   }
   else {
      for (int n = 3; n < ARR_SIZE; n++) {
         Order_list[n] = "주문사항 없음";
      }
   }
}

void Side_Menu() {
   for (int n = 0; n < ARR_SIZE; n++) {
      cout << n + 1 << ". " << side_menu[n] << ' ';
   }
   cin >> OrderMain[0];
   temp = atoi(OrderMain);
   Order_list[2] = "선택안함";
   Order_list[3] = side_menu[temp - 1];
   Order_list[4] = "추가주문 없음";
}

void print(vector<string>& a) { //vector<int>&a = data
   for (string b : a) {
      cout << b << ' ';
   }
   cout << endl;

}

void ResultRecip(string* order) {
   cout << "========주문하신 내역입니다========\n";
   for (int n = 0; n < ARR_SIZE; n++) {
      cout << order[n]<<endl;
   }
   cout << "추가 주문 하시겠습니까?(Y/N)";
   cin >> AddOrder;
   if (AddOrder == 'y') {
      for (int n = 0; n < ARR_SIZE; n++) {
         OrderResult.push_back(order[n]);
         order[n] = '0';
      }
      OrderType[0] = 0;
      OrderCat[0] = 0;
      temp = 1;
      print(OrderResult);
	  cout << "=====추가주문=====";
	  cout << OrderType[0];
	  cout << OrderCat[0];
	  cout << "=====추가주문=====";
   }


}

int main() {

   srand(time(0)); 
   while (AddOrder == 'y') {
      First_Display();

      if (temp == 1)
      {
         Rand_Menu();
      }

      else if (temp == 2) {
         Beef_Menu();
      }

      else if (temp == 3) {
         Chicken_Menu();
      }

      else if (temp == 4) {
         Side_Menu();
      }

      else {
         cout << "오타입니다";
      }

      ResultRecip(Order_list);

   }
}