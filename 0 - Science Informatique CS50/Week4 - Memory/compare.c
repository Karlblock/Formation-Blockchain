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
 
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Get two strings
      char *s = get_string("s: ");
      char *t = get_string("t: ");

      // Print strings' addresses
      printf("%p\n", s);
      printf("%p\n", t);
  }
