

// gcc main.c -o main -lssh

#include <stdio.h>
#include <termios.h>
#include <unistd.h>
#include <string.h>

#define MAX_PASSWD_LEN 100

void get_password(char *password, size_t max_len) {
    struct termios oldt, newt;
    printf("Bitte Passwort eingeben: ");
    fflush(stdout);

    // Terminal-Einstellungen speichern und Echo deaktivieren
    tcgetattr(STDIN_FILENO, &oldt);
    newt = oldt;
    newt.c_lflag &= ~ECHO;
    tcsetattr(STDIN_FILENO, TCSANOW, &newt);

    // Passwort einlesen
    fgets(password, max_len, stdin);

    // Echo wieder aktivieren
    tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
    printf("\n");

    // Zeilenumbruch am Ende entfernen
    size_t len = strlen(password);
    if (len > 0 && password[len - 1] == '\n') {
        password[len - 1] = '\0';
    }
}

int main() {
    char password[MAX_PASSWD_LEN];

    get_password(password, sizeof(password));

    // Passwort prüfen (hier als Beispiel: "geheim")
    if (strcmp(password, "geheim") == 0) {
        printf("Zugriff erlaubt!\n");
    } else {
        printf("Falsches Passwort!\n");
    }

    return 0;
}

