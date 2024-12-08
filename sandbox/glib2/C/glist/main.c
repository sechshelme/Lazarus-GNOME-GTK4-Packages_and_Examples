// gcc main.c -o main `pkg-config --cflags --libs glib-2.0`

#include <glib.h>

int main(int argc, char** argv) {
  GList* list = 0;
  list = g_list_append(list, "Hello world 1 !");
  list = g_list_append(list, "Hello world 2 !");
  list = g_list_append(list, "Hello world 3 !");
  list = g_list_append(list, "Hello world 4 !");
  list = g_list_append(list, "Hello world 5 !");
  g_print("The first item is '%s'\n", g_list_first(list)->data);
  g_print("Der 2. Eintrag ist: %s\n", g_list_nth_data(list, 2));  // io.
  g_list_reverse(list);
  g_print("Der 2. Eintrag ist: %s\n", g_list_nth_data(list, 2)); // -> (null)
  return 0;
}
