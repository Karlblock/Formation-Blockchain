
# Semaine 4

[Video Lecture 4](https://www.youtube.com/watch?v=4oqjcKenCH8)



## Table of Content

- [Notes 4 english](https://cs50.harvard.edu/extension/2022/fall/notes/4/)

### Bienvenue
### Memoire


    *   You can imagine a crime drama where an image is enhanced, enhanced, and enhanced, is not entirely real-life accurate. Indeed, if you keep zooming into an image, you will see pixels.

![alt-test](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide012.png)


### Hexadecimal
### Addresses


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





