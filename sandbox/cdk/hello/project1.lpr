program project1;

uses
  stdio,
  ncurses,
  cdk,
  binding,
  cdk_objs,     // -> binding    ( Viele Makros entfernt, TCDKOBJS geleert )
  cdk_config,
  cdkscreen,
  scroll,       // -> cdk_config, cdkscreen    ( TSScroll geleert )

  cdk_util,



  math;

  procedure main;
  const
    items :array[0..3 ]of PChar = (
        'Option 1',
        'Option 2',
        'Option 3',
        'Beenden'    );
  var
    n_items: SizeInt;
    cursesWin: PWINDOW;
    cdkScreen_: PCDKSCREEN;
    scroll_: PCDKSCROLL;
    choice: LongInt;
    msg:array[0..63]of Char;
    msgarr:array[0..2]of PChar;
  begin
    n_items := Length(items);
    //int choice;

    // ncurses und CDK initialisieren
    cursesWin := initscr();
    cdkScreen_ := initCDKScreen(cursesWin);
    initCDKColor();

    // Scroll-Menü erzeugen
    scroll_ := newCDKScroll(
        cdkScreen_,
        CENTER, CENTER,        // Position
        NONE,                  // Border
        n_items + 4, 40,       // Höhe, Breite
        'Menü:',               // Titel
        items, n_items,        // Einträge und Anzahl
        FALSE,                 // Zahlen anzeigen
        A_REVERSE,             // Attribut für Auswahl
        TRUE,                  // Box
        TRUE                  // Shadow
    );

    // Menü anzeigen und Auswahl abfragen
    choice := activateCDKScroll(scroll_, nil);

    // Ergebnis anzeigen
    if (choice <> -1) then begin
        snprintf(msg, sizeof(msg), 'Du hast ''%s'' gewählt.', items[choice]);
//        char *msgarr[3];
        msgarr[0] := '*******************';
        msgarr[1] := msg;
        msgarr[2] := '*******************';
        popupLabel(cdkScreen_, msgarr, 3);
    end;

    // Aufräumen
    destroyCDKScroll(scroll_);
    destroyCDKScreen(cdkScreen_);
    endCDK();


  end;


begin
  main;
end.
