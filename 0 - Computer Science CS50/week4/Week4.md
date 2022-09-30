
# Semaine 4

[Video Lecture 4](https://www.youtube.com/watch?v=4oqjcKenCH8)



## Table of Content

- [Notes 4 english](https://cs50.harvard.edu/extension/2022/fall/notes/4/)

### Bienvenue
### Memoire
### Hexadecimal
### Addresses
### Les pointers
### les Strings
### Pointer Arithmetic
### Comparing Strings
### Copying
### Valgrind
### Garbage Values
### Pointer Fun with Binky
### Swap
### Overflow
### scanf
### Files
### Summing Up



##### Addresses, pointers :


![alt-test](https://cs50.harvard.edu/x/2022/notes/4/addresses.png)


``` c
#include <stdio.h>


int main(void)
{
    int i = 50;
    printf("%i\n", i);


    // address

    int t = 50;
    printf("%p\n", &t);

    //pointer
    
    int n = 50;
    int *p = &n;
    printf("%p\n", p);
}
```



```py

$ make address 
$ ./address 
50
0x7ffccad4d988
0x7ffccad4d984
$ 

```