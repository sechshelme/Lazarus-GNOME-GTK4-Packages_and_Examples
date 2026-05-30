program project1;

uses
  fp_nfd;

  procedure main;
  var
    res: Tnfdresult_t;
    outPaths: Pnfdpathset_t;
    numPaths: Tnfdpathsetsize_t;
    path: Pnfdu8char_t;
    i: integer;
    filterItem: array[0..1] of Tnfdfilteritem_t = (
      (name: 'Source Code'; spec: 'c,cpp,cc'),
      (name: 'Headers'; spec: 'h,hpp'));
  begin
    NFD_Init;

    filterItem[0].name := 'Source Code';
    res := NFD_OpenDialogMultipleU8(@outPaths, @filterItem, Length(filterItem), nil);

    if res = NFD_OKAY then begin
      WriteLn('Success!');
      NFD_PathSet_GetCount(outPaths, @numPaths);

      for i := 0 to numPaths - 1 do begin
        NFD_PathSet_GetPathU8(outPaths, i, @path);
        WriteLn('Path ', i, ': ', i, path);
        NFD_PathSet_FreePathU8(path);
      end;

      NFD_PathSet_Free(outPaths);
    end else begin
      if res = NFD_CANCEL then begin
        WriteLn('User pressed cancel.');
      end else begin
        WriteLn('error: ', NFD_GetError);
      end;
    end;
    NFD_Quit;
  end;

begin
  main;
end.
