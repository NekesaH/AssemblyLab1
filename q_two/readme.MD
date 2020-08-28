##### Problem
- Convert the C program into assembly language. 
- Limit your user to only enter a positive integer less than 100.


```C
#include<stdio.h>

    int main() {
        int m = 2; int c = 5;
        int x, y;

        printf(“Enter the value of x (0-100) \n”);
        scanf(“%d”,&x);

        y = m*x+c;

        printf(“\n Using m = %d and c = %d \n When x = %d, of y = %d”,
        m, c, x, y);
        return 0;
}
```
