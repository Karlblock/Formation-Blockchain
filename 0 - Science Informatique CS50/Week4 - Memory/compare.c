//  #include <cs50.h>
//   #include <stdio.h>

//   int main(void)
//   {
//       // Get two strings
//       char *s = get_string("s: ");
//       char *t = get_string("t: ");

//       // Compare strings' addresses
//       if (s == t)
//       {
//           printf("Same\n");
//       }
//       else
//       {
//           printf("Different\n");
//       }
//   }

//   #include <cs50.h>
//   #include <stdio.h>

//   int main(void)
//   {
//       // Get two strings
//       char *s = get_string("s: ");
//       char *t = get_string("t: ");

//       // Print strings
//       printf("%s\n", s);
//       printf("%s\n", t);
//   }
 
//   #include <cs50.h>
//   #include <stdio.h>

//   int main(void)
//   {
//       // Get two strings
//       char *s = get_string("s: ");
//       char *t = get_string("t: ");

//       // Print strings' addresses
//       printf("%p\n", s);
//       printf("%p\n", t);
//   }

//   #include <cs50.h>
//   #include <ctype.h>
//   #include <stdio.h>
//   #include <stdlib.h>
//   #include <string.h>

//   int main(void)
//   {
//       // Get a string
//       char *s = get_string("s: ");

//       // Allocate memory for another string
//       char *t = malloc(strlen(s) + 1);

//       // Copy string into memory, including '\0'
//       for (int i = 0; i <= strlen(s); i++)
//       {
//           t[i] = s[i];
//       }

//       // Capitalize copy
//       t[0] = toupper(t[0]);

//       // Print strings
//       printf("s: %s\n", s);
//       printf("t: %s\n", t);
//   }

//   #include <cs50.h>
//   #include <ctype.h>
//   #include <stdio.h>
//   #include <stdlib.h>
//   #include <string.h>

//   int main(void)
//   {
//       // Get a string
//       char *s = get_string("s: ");

//       // Allocate memory for another string
//       char *t = malloc(strlen(s) + 1);

//       // Copy string into memory
//       strcpy(t, s);

//       // Capitalize copy
//       t[0] = toupper(t[0]);

//       // Print strings
//       printf("s: %s\n", s);
//       printf("t: %s\n", t);
//   }


  #include <stdio.h>
  #include <stdlib.h>

  int main(void)
  {
      int *x = malloc(3 * sizeof(int));
      x[1] = 72;
      x[2] = 73;
      x[3] = 33;
  }