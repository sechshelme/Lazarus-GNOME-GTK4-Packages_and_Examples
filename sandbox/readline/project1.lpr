program project1;

uses
  tilde,
  rlconf,
  rltypedefs,
  keymaps,
  readline,

  chardefs,
  history,

  fp_readline;

begin
  rl_message('Hello %s'#10, 'World');
  writeln(rl_library_version);


end.
//// gcc -o main main.c -lreadline////#include <stdio.h>//#include <stdlib.h>//#include <string.h>//#include <readline/readline.h>//#include <readline/history.h>////int main() {//    char *input;////    using_history(); // History initialisieren////    printf("History-Länge vor Laden: %d\n", history_length);//    if (read_history("meine_history.txt") != 0) {//        // Fehlermeldung nur beim ersten Lauf ohne Datei ist normal//        fprintf(stderr, "Warnung: Konnte meine_history.txt nicht laden\n");//    }//    printf("History-Länge nach Laden: %d\n", history_length);////    while ((input = readline("Eingabe > ")) != NULL) {//        if (*input) {//            add_history(input); // Eingabe zur History hinzufügen//        }//        if (strcmp(input, "quit") == 0) {//            free(input);//            break;//        }//        free(input);//    }////    if (write_history("meine_history.txt") != 0) {//        fprintf(stderr, "Fehler: Konnte meine_history.txt nicht speichern\n");//    }////    return 0;//}
