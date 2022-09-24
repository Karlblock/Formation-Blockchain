# Semaine 3

[Video Lecture 3](https://www.youtube.com/watch?v=4oqjcKenCH8)


## Table of Content

- [Semaine 3](https://cs50.harvard.edu/x/2022/notes/3/)

---

### Searching

https://cs50.harvard.edu/x/2022/notes/3/#searching


 ##### Structure : 

 ^2

``` c
#include <cs50.h>
#include <stdio.h>
#include <string.h>

typedef struct
{
    string name;
    string number;
}
person;

int main(void)
{
    person people[2];

    people[0].name = "Carter";
    people[0].number = "+1-617-495-1000";

    people[1].name = "David";
    people[1].number = "+1-949-468-2750";

    string name = get_string("Name : ");

    for (int i = 0; i < 2; i++)
    {
        if (strcmp(people[i].name, name ) == 0)
        {
            printf("Found %s\n", people[i].number);
            return 0;
        }
    }
    printf("Not found\n");
    return 1;
}
```

---

### Linear search, binary search

https://cs50.harvard.edu/x/2022/notes/3/#linear-search-binary-search

---

### Searching with code

https://cs50.harvard.edu/x/2022/notes/3/#searching-with-code

---




