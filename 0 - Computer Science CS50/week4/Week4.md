
# Semaine 4

[Video Lecture 4](https://www.youtube.com/watch?v=4oqjcKenCH8)


## Table of Content

- [Notes 4](https://cs50.harvard.edu/x/2022/notes/3/)

---

 ##### Addresses, pointers :


 Hexa location :

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

>> 

```py

$ make address 
$ ./address 
50
0x7ffccad4d988
0x7ffccad4d984
$ 

```