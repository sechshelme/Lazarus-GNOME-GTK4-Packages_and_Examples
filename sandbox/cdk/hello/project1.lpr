program project1;

uses
  stdio,
  ncurses,
  cdk,
  binding,
  cdk_objs,     // -> binding    ( Viele Makros entfernt, TCDKOBJS geleert )
  cdk_config,
  cdkscreen,
  scroll,       // -> cdk_config, cdkscreen                           ( Viele Makros entfernt, TSScroll geleert )
  cdk_util,     // -> cdk_config, cdkscreen

  entry,        // -> cdkscreen, cdk_objs                             ( Viele Makros entfernt )
  fselect,      // -> cdk_config, cdkscreen, binding, scroll, entry   ( Viele Makros entfernt )



  math;

  procedure main;
  const
    items :array[0..3 ]of PChar = (
        'Option 1',
        'Option 2',
        'Option 3',
        'Beenden'    );
  var
    cursesWin: PWINDOW;
    cdkScreen_: PCDKSCREEN;
    scroll_: PCDKSCROLL;
    choice: LongInt;
    msg:array[0..63]of Char;
    msgarr:array[0..2]of PChar;
  begin

    // ncurses und CDK initialisieren
    cursesWin := initscr();
    cdkScreen_ := initCDKScreen(cursesWin);
    initCDKColor();

    // Scroll-Menü erzeugen
    scroll_ := newCDKScroll(
        cdkScreen_,
        CENTER, CENTER,        // Position
        NONE,                  // Border
        Length(items) + 4, 40, // Höhe, Breite
        'Menü:',               // Titel
        items, Length(items),  // Einträge und Anzahl
        False,                 // Zahlen anzeigen
        A_REVERSE,             // Attribut für Auswahl
        True,                  // Box
        True                   // Shadow
    );

    // Menü anzeigen und Auswahl abfragen
    choice := activateCDKScroll(scroll_, nil);

    // Ergebnis anzeigen
    if (choice <> -1) then begin
        snprintf(msg, sizeof(msg), 'Du hast ''%s'' gewählt.', items[choice]);
        msgarr[0] := '*******************';
        msgarr[1] := msg;
        msgarr[2] := '*******************';
        popupLabel(cdkScreen_, msgarr, Length(msgarr));
    end;

    // Aufräumen
    destroyCDKScroll(scroll_);
    destroyCDKScreen(cdkScreen_);
    endCDK();


  end;

type
  Tr=record
    obj:Pointer;
  end;
  Pr=^Tr;

var
  r:  Tr;

  procedure Test(o:Pr);
  begin
    WriteLn('struct: ',PtrUInt(o));
    WriteLn('obj: ',PtrUInt(@o^.obj));

  end;

begin
  //WriteLn('struct: ',PtrUInt(@r));
  //WriteLn('obj: ',PtrUInt(@r.obj));
  //Test(@r);
  //ReadLn;

  main;
end.
