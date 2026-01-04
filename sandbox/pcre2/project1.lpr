program project1;

uses
  fp_pcre2;

const
  pattern: pchar = '3';
  subject: pchar = 'Das Ereigniss war am 03. Januar 2023!';

  function UTF8ToUTF16(c: pchar): TPCRE2_SPTR16;
  var
    l: SizeInt;
    i: integer;
  begin
    l := Length(c);
    Getmem(Result, l * 2);
    FillChar(Result[0], l * 2, 0);
    for i := 0 to l - 1 do begin
      Result[i] := byte(c[i]);
    end;
  end;

  function UTF8ToUTF32(c: pchar): TPCRE2_SPTR32;
  var
    l: SizeInt;
    i: integer;
  begin
    l := Length(c);
    Getmem(Result, l * 4);
    FillChar(Result[0], l * 4, 0);
    for i := 0 to l - 1 do begin
      Result[i] := byte(c[i]);
    end;
  end;

  procedure main;
  var
    re: Ppcre2_code;
    match_data: Ppcre2_match_data;
    errornumber, rc: longint;
    erroroffset: TPCRE2_SIZE;
    ovector: PPCRE2_SIZE;
    pattern8, subject8: TPCRE2_SPTR8;
  begin
    pattern8 := TPCRE2_SPTR8(pattern);
    subject8 := TPCRE2_SPTR8(subject);

    re := pcre2_compile_8(pattern8, PCRE2_ZERO_TERMINATED, 0, @errornumber, @erroroffset, nil);
    match_data := pcre2_match_data_create_from_pattern_8(re, nil);

    rc := pcre2_match_8(re, subject8, PCRE2_ZERO_TERMINATED, 0, 0, match_data, nil);

    if rc < 0 then begin
      WriteLn('Die Zahl 3 wurde nicht gefunden.');
    end else begin
      ovector := pcre2_get_ovector_pointer_8(match_data);
      WriteLn('Treffer gefunden!');
      WriteLn('Die "3" steht an Position: ', ovector[0]);
    end;
    WriteLn();

    pcre2_match_data_free_8(match_data);
    pcre2_code_free_8(re);
  end;

  procedure main16;
  var
    re: Ppcre2_code;
    match_data: Ppcre2_match_data;
    errornumber, rc: longint;
    erroroffset: TPCRE2_SIZE;
    ovector: PPCRE2_SIZE;
    pattern16, subject16: TPCRE2_SPTR16;
  begin
    pattern16 := UTF8ToUTF16(pattern);
    subject16 := UTF8ToUTF16(subject);

    re := pcre2_compile_16(pattern16, PCRE2_ZERO_TERMINATED, 0, @errornumber, @erroroffset, nil);
    match_data := pcre2_match_data_create_from_pattern_16(re, nil);

    rc := pcre2_match_16(re, subject16, PCRE2_ZERO_TERMINATED, 0, 0, match_data, nil);

    if rc < 0 then begin
      WriteLn('Die Zahl 3 wurde nicht gefunden.');
    end else begin
      ovector := pcre2_get_ovector_pointer_16(match_data);
      WriteLn('Treffer gefunden!');
      WriteLn('Die "3" steht an Position: ', ovector[0]);
    end;
    WriteLn();

    pcre2_match_data_free_16(match_data);
    pcre2_code_free_16(re);

    Freemem(pattern16);
    Freemem(subject16);
  end;

  procedure main32;
  var
    re: Ppcre2_code;
    match_data: Ppcre2_match_data;
    errornumber, rc: longint;
    erroroffset: TPCRE2_SIZE;
    ovector: PPCRE2_SIZE;
    pattern32, subject32: TPCRE2_SPTR32;
  begin
    pattern32 := UTF8ToUTF32(pattern);
    subject32 := UTF8ToUTF32(subject);

    re := pcre2_compile_32(pattern32, PCRE2_ZERO_TERMINATED, 0, @errornumber, @erroroffset, nil);
    match_data := pcre2_match_data_create_from_pattern_32(re, nil);

    rc := pcre2_match_32(re, subject32, PCRE2_ZERO_TERMINATED, 0, 0, match_data, nil);

    if rc < 0 then begin
      WriteLn('Die Zahl 3 wurde nicht gefunden.');
    end else begin
      ovector := pcre2_get_ovector_pointer_32(match_data);
      WriteLn('Treffer gefunden!');
      WriteLn('Die "3" steht an Position: ', ovector[0]);
    end;
    WriteLn();

    pcre2_match_data_free_32(match_data);
    pcre2_code_free_32(re);

    Freemem(pattern32);
    Freemem(subject32);
  end;

begin
  main;
  main16;
  main32;
end.
