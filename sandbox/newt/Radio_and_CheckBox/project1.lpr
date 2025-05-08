program project1;

uses
  // stdio,
  fp_newt;

function CreateRadioGroup:PnewtComponent;
var
  r1, r2, r3: PnewtComponent;
begin
  r1 := newtRadiobutton(20, 10, 'rot', 0, nil);
  r2 := newtRadiobutton(20, 11, 'grün', 1, r1);
  r3 := newtRadiobutton(20, 12, 'blau', 0, r2);

  Result := newtForm(nil, nil,  0);
  newtFormAddComponents(Result, r1, r2, r3, nil);
  end;

  procedure main;
  var
    form, buttonOk, radioGroup, buttonQuit: PnewtComponent;
    grid: TnewtGrid;
  begin
    newtInit;
    newtCls;

    newtDrawRootText(0, 0, 'Some root text');
    newtDrawRootText(-25, -2, 'Root text in the other corner');


    buttonOk := newtButton(-1, -1, 'Ok');
    buttonQuit := newtButton(-1, -1, 'Quit');

    grid := newtCreateGrid(1, 3);

    radioGroup:=CreateRadioGroup;

    newtGridSetField(grid, 0, 0, NEWT_GRID_COMPONENT, radioGroup, 0, 0, 0, 1, NEWT_ANCHOR_RIGHT, 0);
    newtGridSetField(grid, 0, 1, NEWT_GRID_COMPONENT, buttonOk, 0, 0, 0, 0, 0, 0);
    newtGridSetField(grid, 0, 2, NEWT_GRID_COMPONENT, buttonQuit, 0, 0, 0, 0, 0, 0);

    newtGridWrappedWindow(grid, 'Checkbox Tree Test');
    newtGridFree(grid, 1);

    form := newtForm(nil, nil, 0);
    newtFormAddComponents(form, radioGroup, buttonOk, buttonQuit, nil);

    newtRunForm(form);

    newtFinished();

    newtFormDestroy(form);
  end;


begin
  //  menu;
  main;
end.
