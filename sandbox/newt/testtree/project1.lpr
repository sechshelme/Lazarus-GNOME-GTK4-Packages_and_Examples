program project1;

uses
  // stdio,
  fp_newt;

  procedure main;
  var
    form, button, checktree: PnewtComponent;
    grid: TnewtGrid;
  begin
    newtInit;
    newtCls;

    newtDrawRootText(0, 0, 'Some root text');
    newtDrawRootText(-25, -2, 'Root text in the other corner');

    checktree := newtCheckboxTreeMulti(-1, -1, 10, ' ab', NEWT_FLAG_SCROLL);

    newtCheckboxTreeAddItem(checktree, 'Numbers', Pointer(2), 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Really really long thing', Pointer(3), 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'number 5', Pointer(5), NEWT_FLAG_SELECTED, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'number 6', Pointer(6), 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'number 7', Pointer(7), NEWT_FLAG_SELECTED, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'number 8', Pointer(8), 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'number 9', Pointer(9), 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'number 10', Pointer(10), NEWT_FLAG_SELECTED, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'number 11', Pointer(11), 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Donuts', Pointer(12), NEWT_FLAG_SELECTED, NEWT_ARG_APPEND, NEWT_ARG_LAST);

    newtCheckboxTreeAddItem(checktree, 'Bavarian Cream', Pointer(301), NEWT_FLAG_SELECTED, 9, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Honey dipped', Pointer(302), NEWT_FLAG_SELECTED, 9, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Jelly', Pointer(303), NEWT_FLAG_SELECTED, 9, NEWT_ARG_APPEND, NEWT_ARG_LAST);

    newtCheckboxTreeAddItem(checktree, 'Colors', Pointer(1), 0, 0, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Red', Pointer(100), 0, 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'White', Pointer(101), 0, 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Blue', Pointer(102), 0, 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);

    newtCheckboxTreeAddItem(checktree, 'number 4', Pointer(4), 0, 3, NEWT_ARG_LAST);

    newtCheckboxTreeAddItem(checktree, 'Single digit', Pointer(200), 0, 1, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'One', Pointer(201), 0, 1, 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Two', Pointer(202), 0, 1, 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Three', Pointer(203), 0, 1, 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Four', Pointer(204), 0, 1, 0, NEWT_ARG_APPEND, NEWT_ARG_LAST);

    newtCheckboxTreeAddItem(checktree, 'Double digit', Pointer(300), 0, 1, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Ten', Pointer(210), 0, 1, 1, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Eleven', Pointer(211), 0, 1, 1, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Twelve', Pointer(212), 0, 1, 1, NEWT_ARG_APPEND, NEWT_ARG_LAST);
    newtCheckboxTreeAddItem(checktree, 'Thirteen', Pointer(213), 0, 1, 1, NEWT_ARG_APPEND, NEWT_ARG_LAST);

    newtCheckboxTreeSetCurrent(checktree, Pointer(12));

    button := newtButton(-1, -1, 'Exit');

    grid := newtCreateGrid(1, 2);

    newtGridSetField(grid, 0, 0, NEWT_GRID_COMPONENT, checktree, 0, 0, 0, 1, NEWT_ANCHOR_RIGHT, 0);
    newtGridSetField(grid, 0, 1, NEWT_GRID_COMPONENT, button, 0, 0, 0, 0, 0, 0);

    newtGridWrappedWindow(grid, 'Checkbox Tree Test');
    newtGridFree(grid, 1);

    form := newtForm(nil, nil, 0);
    newtFormAddComponents(form, checktree, button, nil);

    newtRunForm(form);

    newtFinished();

    newtFormDestroy(form);
  end;


begin
  //  menu;
  main;
end.
