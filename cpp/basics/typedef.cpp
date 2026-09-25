#include <iostream>
#include <stdio.h>

typedef struct {
  float r;
  float g;
  float b;
} pixel;

std::ostream &operator<<(std::ostream &os, const pixel &p) {
  os << p.r << " " << p.g << " " << p.b;
  return os;
}

int main() {
  pixel p = {0.6, 0.8, 0.3};
  // in c
  printf("pixel is %f,  %f, %f", p.r, p.g, p.b);
  // in cpp
  std::cout << "pixel is " << p << std::endl;
  // std::cout << p.r << " " << p.g << " " << p.b << std::endl;
  return 0;
}