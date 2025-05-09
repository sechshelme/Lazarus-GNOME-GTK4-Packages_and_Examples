program project1;

uses
  // stdio,
  fp_newt;

var
  buttonOk, buttonQuit, buttonHelp: PnewtComponent;

  function CreateRadioGroup: PnewtComponent;
  var
    r1, r2, r3, r4: PnewtComponent;
  begin
    r1 := newtRadiobutton(20, 10, 'rot', 0, nil);
    r2 := newtRadiobutton(20, 12, 'grün', 1, r1);
    r3 := newtRadiobutton(20, 14, 'blau', 0, r2);
    r4 := newtRadiobutton(20, 16, 'gelb', 0, r3);

    Result := newtForm(nil, nil, 0);
    newtFormAddComponents(Result, r1, r2, r3, r4, nil);
  end;

  function CreateCheckGroup: PnewtComponent;
  var
    r1, r2, r3, r4: PnewtComponent;
  begin
    r1 := newtCheckbox(20, 10, 'rot', ' ', nil, nil);
    r2 := newtCheckbox(20, 11, 'grün', ' ', nil, nil);
    r3 := newtCheckbox(20, 12, 'blau', ' ', nil, nil);
    r4 := newtCheckbox(20, 13, 'gelb', ' ', nil, nil);

    Result := newtForm(nil, nil, 0);
    newtFormAddComponents(Result, r1, r2, r3, r4, nil);
  end;

  function CreateButtonBox: PnewtComponent;
  begin
    buttonOk := newtButton(1, 1, 'Ok');
    buttonQuit := newtButton(10, 1, 'Quit');
    buttonHelp := newtButton(20, 1, 'Help');

    Result := newtForm(nil, nil, 0);
    newtFormAddComponents(Result, buttonOk, buttonQuit, buttonHelp, nil);
  end;


  procedure main;
  var
    form, radioGroup, buttonBox, checkGroup: PnewtComponent;
    grid: TnewtGrid;
    es: TnewtExitStruct;
    w,h, l, t: Longint;
  begin
    newtInit;
    newtCls;

    newtDrawRootText(0, 0, 'Some root text');
    newtDrawRootText(-25, -2, 'Root text in the other corner');

    grid := newtCreateGrid(2, 2);

    radioGroup := CreateRadioGroup;
    checkGroup := CreateCheckGroup;
    buttonBox := CreateButtonBox;

    newtGridSetField(grid, 0, 0, NEWT_GRID_COMPONENT, radioGroup, 0, 0, 0, 1, 0, 0);
    newtGridSetField(grid, 1, 0, NEWT_GRID_COMPONENT, checkGroup, 0, 0, 0, 1, 0, 0);
    newtGridSetField(grid, 1, 1, NEWT_GRID_COMPONENT, buttonBox, 0, 0, 0, 0, 0, 0);

    newtGridWrappedWindow(grid, 'Checkbox Tree Test');
//    newtGridFree(grid, 1);

    form := newtForm(nil, nil, 0);
    newtFormAddComponents(form, radioGroup, checkGroup, buttonBox, nil);

    repeat
           newtFormRun(form,@es);

              newtRefresh();

//           WriteLn(' Box ',PtrUInt(buttonBox),' Ok ',PtrUInt(buttonOk),' quit ',PtrUInt(buttonQuit),' help ',PtrUInt(buttonHelp),' co ',PtrUInt(es.u.co),'  ');

newtComponentGetSize(es.u.co, @w,@h);
newtComponentGetPosition(es.u.co, @l,@t);
//           WriteLn(' Left:  ',l,' Top:  ',t,' heigth:  ',h, '   width: ', w, '  ');

           newtFormAddComponents(form,es.u.co , nil);
    until es.u.co=buttonQuit;

    //    newtRunForm(form);
    newtFinished();

    newtFormDestroy(form);
  end;


begin
  //  menu;
  main;
end.
