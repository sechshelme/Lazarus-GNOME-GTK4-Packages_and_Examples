program project1;

uses
  fp_bs_size;

  procedure main;
  var
    size1, res, size2: TBSSize;
    err: PBSError = nil;
    readable_str: pchar;
  begin
    size1 := bs_size_new_from_str('2.5 TiB', @err);
    if err <> nil then begin
      WriteLn('Fehler bei size1: ', err^.msg);
      bs_clear_error(@err);
      Exit;
    end;

    size2 := bs_size_new_from_str('500 GiB', @err);
    if err <> nil then begin
      WriteLn('Fehler bei size2: ', err^.msg);
      bs_clear_error(@err);
      bs_size_free(size1);
      Exit;
    end;

    res := bs_size_add(size1, size2);
    readable_str := bs_size_human_readable(res, BS_BUNIT_B, 2, False);
    WriteLn('Ergebnis der Addition: ', readable_str);

    bs_size_free(size1);
    bs_size_free(size2);
    bs_size_free(res);
  end;

begin
  main;
end.
