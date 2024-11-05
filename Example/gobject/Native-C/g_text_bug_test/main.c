// gcc main.c -o main `pkg-config --cflags --libs glib-2.0`

#include <glib-object.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  printf("%li\n", G_TYPE_ENUM);
  printf("%i\n", G_TYPE_RESERVED_BSE_LAST);
  if (G_TYPE_ENUM == G_TYPE_RESERVED_BSE_LAST) {
    printf("TRUE\n");
  }
}

