// gcc main.c -o main -lcdk -lncurses

#include <cdk/cdk.h>
#include <stdio.h>
#include <signal.h>
#include <sys/ioctl.h>
#include <unistd.h>

// https://www.perplexity.ai/search/wen-ich-beim-linux-kernel-make-PuLHDhVhS6aXEz.IpP2Rwg

void handle_winch(int sig) {
    struct winsize ws;
    ioctl(STDIN_FILENO, TIOCGWINSZ, &ws);
    printf("Neue Terminalgröße: %d Zeilen, %d Spalten\n", ws.ws_row, ws.ws_col);
}


int main() {

 signal(SIGWINCH, handle_winch);


    CDKSCREEN *cdkScreen;
    CDKSCROLL *scroll;
    WINDOW *cursesWin;
    char *items[] = {
        "Option 1",
        "Option 2",
        "Option 3",
        "Beenden"
    };
    int n_items = sizeof(items) / sizeof(items[0]);
    int choice;

    // ncurses und CDK initialisieren
    cursesWin = initscr();
    cdkScreen = initCDKScreen(cursesWin);
    initCDKColor();

    // Scroll-Menü erzeugen
    scroll = newCDKScroll(
        cdkScreen,
        CENTER, CENTER,        // Position
        NONE,                  // Border
        n_items + 4, 40,       // Höhe, Breite
        "Menü:",               // Titel
        items, n_items,        // Einträge und Anzahl
        FALSE,                 // Zahlen anzeigen
        A_REVERSE,             // Attribut für Auswahl
        TRUE,                  // Box
        TRUE                  // Shadow
    );

    // Menü anzeigen und Auswahl abfragen
    choice = activateCDKScroll(scroll, 0);

    // Ergebnis anzeigen
    if (choice != -1) {
        char msg[64];
        snprintf(msg, sizeof(msg), "Du hast '%s' gewählt.", items[choice]);
        char *msgarr[3];
        msgarr[0] = "*******************";
        msgarr[1] = msg;
        msgarr[2] = "*******************";
        popupLabel(cdkScreen, msgarr, 3);
    }

    // Aufräumen
    //printf("struct %ld\n", scroll);
    //printf("obj    %ld\n", &scroll->obj);
    //return 0;



   CDKBUTTON *     button1 = newCDKButton(
      cdkScreen,
      20, 10,              // Position (x, y)
      "Ok",
      0, TRUE, FALSE);

      setCDKButtonBoxAttribute(button1, A_BLINK);

      setCDKButtonBackgroundColor(button1, "red");
      activateCDKButton(button1, 0);


    destroyCDKScroll(scroll);
    destroyCDKScreen(cdkScreen);
    endCDK();


    return 0;
}

