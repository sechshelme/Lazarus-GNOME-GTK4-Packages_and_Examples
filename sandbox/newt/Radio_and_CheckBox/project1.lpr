program project1;

uses
  fp_newt;

const
  rbLabels: array of pchar = ('rot', 'grün', 'blau', 'gelb', 'rosa','mint','orange');


  procedure main;
  var
    cols, rows, win_x, win_y: longint;
    cb1, cb2, okBtn, cancelBtn, form, pressed: PnewtComponent;
    state_cb1, state_cb2: char;
    rb1_selected: integer;

    tempRB: PnewtComponent;
    i: integer;
  const
    win_width = 40;
    win_height = 12;

    rb: array of PnewtComponent = nil;
  begin
    SetLength(rb, Length(rbLabels));

    newtInit;
    newtCls;

    // Terminalgröße abfragen
    newtGetScreenSize(@cols, @rows);

    // Fensterposition berechnen (zentriert)
    win_x := (cols - win_width) div 2;
    win_y := (rows - win_height) div 2;

    // Fensterrahmen mit Titel setzen
    newtOpenWindow(win_x, win_y, win_width, win_height, 'Mein Dialog');

    form := newtForm(nil, nil, 0);


    // Widgets: Koordinaten relativ zum Fenster!
    cb1 := newtCheckbox(20, 2, 'Option 1', ' ', @state_cb1, nil);
    cb2 := newtCheckbox(20, 3, 'Option 2', '*', @state_cb2, nil);

    tempRB := nil;
    for i := 0 to Length(rb) - 1 do begin
      rb[i] := newtRadiobutton(4, 3 + i, rbLabels[i], 0, tempRB);
      tempRB := rb[i];
      newtFormAddComponents(form, tempRB, nil);
    end;

    okBtn := newtButton(2, 8, 'OK');
    cancelBtn := newtButton(12, 8, 'Abbrechen');

    newtFormAddComponents(form, cb1, cb2, okBtn, cancelBtn, nil);

    pressed := newtRunForm(form);

    rb1_selected := -1;
    for i := 0 to Length(rb) - 1 do begin
      if rb[i]= newtRadioGetCurrent(rb[0])   then begin
        rb1_selected := i;
        Break;
      end;
    end;

    newtFinished;

    WriteLn('RadioButton Selected: ', rb1_selected);

    writeln('Checkbox 1: ', state_cb1 = ' ');
    writeln('Checkbox 2: ', state_cb2 = ' ');


    if pressed = okBtn then begin
      writeln('Button gedrückt: OK');
    end else begin
      writeln('Button gedrückt: Abbrechen');
    end;
  end;

begin
  main;
end.
