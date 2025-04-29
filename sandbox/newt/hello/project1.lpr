program project1;

uses
  stdio,
  newt;

  // https://github.com/netkiller/example/blob/master/C/newt/example.c


  procedure Dialog;
  var
    res: longint;
  begin
    newtInit;
    newtCls;

    res := newtWinChoice('Frage', 'Ja', 'Nein', 'Möchten Sie fortfahren?');

    newtFinished;

    case res of
      1: begin
        printf('Sie haben ''Ja'' gewählt.'#10);
      end;
      2: begin
        printf('Sie haben ''Nein'' gewählt.'#10);
      end;
    end;

  end;

  procedure menu;
  var
    menuContents: array of pchar = ('One', 'Two', 'Three', 'Four', 'Five', nil);
    //  int textWidth;
    entries: array[0..9] of pchar;
    rc, textWidth: longint;
    autoEntries: array[0..4] of TNewtWinEntry;
    i: integer;
    //autoEntries: array[0..4] of TNewtWinEntry = (
    //  (Text: 'An entry';      Value: @entries[0]; Flags: 0),
    //  (Text: 'Another entry'; Value: @entries[1]; Flags: 0),
    //  (Text: 'Third entry';   Value: @entries[2]; Flags: 0),
    //  (Text: 'Fourth entry';  Value: @entries[3]; Flags: 0),
    //  (Text: nil;             Value: nil;         Flags: 0)
  begin
    autoEntries[0].Text := 'An entry';
    autoEntries[1].Text := 'Another entry';
    autoEntries[2].Text := 'Third entry';
    autoEntries[3].Text := 'Fourth entry';
    autoEntries[4].Text := nil;

    for i := 0 to 4 do begin
      autoEntries[i].Value := @entries[i];
      autoEntries[i].flags := 0;
    end;

    //  memset(entries, 0, sizeof(entries));
    //  FillChar(entries, sizeof(entries),$00);

    newtWinMessage('Simple', 'OK', 'This is a simple message window');
    newtWinChoice('Simple', 'OK', 'Cancel', 'This is a simple choice window');

    rc := newtWinMenu('Test Menu',
      'This is a sample invovation of the ' +
      'newtWinMenu() call.It may or may not have a scrollbar,' +
      'depending on the need for one.', 50, 10, 10, 5,
      PPChar(menuContents), @textWidth, 'OK', 'Cancel', nil);

    rc := newtWinEntries('Text newtWinEntries()',
      'This is a sample invovation of ' +
      'newtWinEntries() call. It lets you get a lot of input ' +
      'quite easily.', 50, 5, 5, 20, @autoEntries, 'Ok',
      'Cancel', nil);
  end;

  procedure Entry;
  var
    res: longint;
    Entries: array of TnewtWinEntry = nil;
    buffer: array of pchar = nil;
    i: integer;
  const
    EntryCount = 8;
  begin
    SetLength(Entries, EntryCount + 1);
    SetLength(buffer, EntryCount + 1);
    for i := 0 to EntryCount - 1 do begin
    //  buffer[i] := Getmem(20);
      FillChar(buffer[i], 20, 0);

      Entries[i].Text := 'Titel';
      Entries[i].Value := @buffer[i];
      Entries[i].flags := 0;
    end;

    Entries[EntryCount].Text := nil;

    res := newtWinEntries('Entries', 'Entries', 50, 5, 5, 20, PnewtWinEntry(Entries), 'Ok', 'Cancel', 'Help', 'Ok', 'Cancel', 'Help', 'Ok', 'Cancel', 'Help', nil);

    for i := 0 to EntryCount - 1 do begin
//      WriteLn(Entries[i].Value^);
      WriteLn(buffer[i]);
//      Freemem(buffer[i]);
    end;

    ReadLn;
  end;

procedure Form;
var
  b1, b2, f: PnewtComponent;
begin
  newtOpenWindow(10, 5, 40, 6, 'Button Sample');

  b1 := newtButton(10, 1, 'Ok');
  b2 := newtButton(22, 1, 'Cancel');
  f := newtForm(Nil, Nil, 0);
  newtFormAddComponents(f, b1, b2, Nil);

  newtRunForm(f);

  newtFormDestroy(f);
  end;


  procedure main;
  begin
    newtInit;
    newtCls;

    Form;
    Entry;

    newtDrawRootText(0, 0, 'Some root text');
    newtDrawRootText(-25, -2, 'Root text in the other corner');

    newtPushHelpLine('Hello World');
    newtRefresh;
    //  sleep(1);

    newtPushHelpLine('A help line');
    newtRefresh();
    //  sleep(1);

    menu();

    newtPopHelpLine;
    newtRefresh;
    //  sleep(1);

    newtFinished;
  end;


begin
  //  menu;
  main;
end.
