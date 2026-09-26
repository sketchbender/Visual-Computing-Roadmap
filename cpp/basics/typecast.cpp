#include <iostream>
#include <stdio.h>

int main() {
  // c style typecasting
  float f = 3.14;
  printf("float is %f", f);
  int i = (int)f;
  printf("type casted float to int is %d \n", i);
  // cpp style typecasting
  int j = static_cast<int>(f);
  std::cout << "type casted float to int is " << j << std::endl;
  char c = static_cast<char>(f);
  std::cout << "type casted float to char is " << c << std::endl;
  int verify = static_cast<int>(c);
  std::cout << "type casted char to int is " << verify << std::endl;
}