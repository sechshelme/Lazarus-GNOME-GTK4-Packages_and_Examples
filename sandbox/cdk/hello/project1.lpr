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

  dialog,
  button,
  itemlist,



  Math;

  procedure BtnClick(button: PSButton); cdecl;
  begin

  end;

  procedure Menu(scr: PCDKSCREEN);
  // https://github.com/lnkgyv/cdk_examples/blob/master/menu.c
  const
    types: array of pchar = ('CD', 'DVD', 'Floppy', 'ZIP', 'Blu-Ray');
  var
    itemlist_: PCDKITEMLIST;
    v: longint;
  begin
    itemlist_ := newCDKItemlist(scr,
      CENTER, CENTER,
      'blu', 'Media: ',
      PPChar(types), Length(types),
      0,
      True, False);

    v := activateCDKItemlist(itemlist_, nil);
  end;

  procedure main;
  const
    items: array[0..3] of pchar = (
      'Option 1',
      'Option 2',
      'Option 3',
      'Beenden');
  var
    cursesWin: PWINDOW;
    cdkScreen_: PCDKSCREEN;
    scroll_: PCDKSCROLL;
    choice, selection: longint;
    msg: array[0..63] of char;
    msgarr: array[0..2] of pchar;

    DialogTitel: array of pchar = ('Bitte', 'wählen eine', 'Operation');
    buttonLabel: array of pchar = ('Ok', 'Cancel', 'Help');
    button1, button2: PCDKBUTTON;
    dialog_: PCDKDIALOG;
    tf: TCDKFUNCS;
  begin

    // ncurses und CDK initialisieren
    cursesWin := initscr();
    cdkScreen_ := initCDKScreen(cursesWin);
    initCDKColor();

    Menu(cdkScreen_);

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

    dialog_ := newCDKDialog(cdkscreen_,
      CENTER, CENTER,
      PPChar(DialogTitel), Length(DialogTitel),
      PPChar(buttonLabel), Length(buttonLabel),
      A_REVERSE, True, True, False);

    selection := activateCDKDialog(dialog_
      ,
      nil
      );
    case selection of
      0: begin
        mvprintw(Lines - 2, 0, 'OK wurde gewählt.');
      end;
      1: begin
        mvprintw(Lines - 2, 0, 'Cancel wurde gewählt.');
      end;
      2: begin
        mvprintw(Lines - 2, 0, 'Help wurde gewählt.');
      end;
      else begin
        mvprintw(Lines - 2, 0, 'Unbekannte Operation');
      end;
    end;
    refresh;
    destroyCDKObject(PCDKOBJS(dialog_));


    button1 := newCDKButton(
      cdkScreen_,
      20, 10,              // Position (x, y)
      'Ok',
      @BtnClick, True, False);

    // Zeige den Button und warte auf Auswahl
    button2 := newCDKButton(
      cdkScreen_,
      30, 10,              // Position (x, y)
      'Cancel',
      @BtnClick, True, False);

    // Zeige den Button und warte auf Auswahl
    selection := activateCDKButton(button1, nil);
    selection := activateCDKButton(button2, nil);



    destroyCDKScreen(cdkScreen_);
    endCDK();

  end;

type
  Tr = record
    obj: Pointer;
  end;
  Pr = ^Tr;

var
  r: Tr;

  procedure Test(o: Pr);
  begin
    WriteLn('struct: ', PtrUInt(o));
    WriteLn('obj: ', PtrUInt(@o^.obj));

  end;

begin
  //WriteLn('struct: ',PtrUInt(@r));
  //WriteLn('obj: ',PtrUInt(@r.obj));
  //Test(@r);
  //ReadLn;

  main;
end.
