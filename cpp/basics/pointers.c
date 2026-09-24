#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    int x = 10;
    int *ptr = &x;
    printf("Value of x: %d\n", *ptr);
    printf("Address of x: %p\n", (void*)ptr);
    int **ptr2 = &ptr;
    int ***ptr3 = &ptr2;
    printf("Value of x through ptr2: %d\n", **ptr2);
    printf("Address of ptr: %p\n", (void*)ptr2);
    printf("Value of x through ptr3: %d\n", ***ptr3);
    printf("Address of ptr2: %p\n", ptr3);
    printf("Address of ptr3: %p\n", &ptr3);
}
