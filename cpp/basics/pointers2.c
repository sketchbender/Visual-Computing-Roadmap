#include <stdio.h>
#include <stdlib.h>
int main() {
  // this is NULL pointer basically points to null which is valid
  // in cpp its nullptr and in c its NULL
  // you cannot dereference a null pointer i.e you cant do *ptr
  int *ptr = NULL;
  printf("%p\n", ptr);
  ptr = (int *)malloc(5 * sizeof(int));
  printf("%p\n", ptr);
  free(ptr);
  printf("%p\n", ptr);
  int arr[] = {1, 2, 3, 4, 5};
  // an array is basically a pointer to the first element
  printf("arr: %p\n", arr);
  int *ptr2 = arr;
  printf("ptr2: %p\n", ptr2);
  printf("content of arr: %d\n", *arr);
  printf("content of ptr: %d\n and address: %p\n ", *ptr2, ptr2);
  ptr2++;
  printf("content of ptr: %d\n and address: %p\n ", *ptr2, ptr2);
  ptr2++;
  printf("content of ptr: %d\n and address: %p\n ", *ptr2, ptr2);

  int arr1[] = {1, 2, 3, 4, 5};
  int arr2[] = {6, 7, 8, 9, 10};

  int *p1 = arr1;
  int *p2 = arr2;
  int *mat[] = {p1, p2};
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 5; j++) {
      printf("%d ", *mat[i]++);
    }
    printf("\n");
  }
}