program project1;

uses
  fp_pcre2;

procedure main;
var
  re: Ppcre2_code;
  pattern: TPCRE2_SPTR8 = '3';
  subject: TPCRE2_SPTR8 = 'Das Ereigniss war am 03. Januar 2023!';
  match_data: Ppcre2_match_data;
  errornumber, rc: longint;
  erroroffset: TPCRE2_SIZE;
  ovector: PPCRE2_SIZE;
begin

  re := pcre2_compile_8(pattern, PCRE2_ZERO_TERMINATED, 0, @errornumber, @erroroffset, nil);
  match_data := pcre2_match_data_create_from_pattern_8(re, nil);

  rc := pcre2_match_8(re, subject, PCRE2_ZERO_TERMINATED, 0, 0, match_data, nil);

  if rc < 0 then begin
    WriteLn('Die Zahl 3 wurde nicht gefunden.');
  end else begin
    ovector := pcre2_get_ovector_pointer_8(match_data);
    WriteLn('Treffer gefunden!');
    WriteLn('Die "3" steht an Position: ', ovector[0]);
    WriteLn('Der gefundene Textabschnitt ist: ', subject[ovector[0]]);
  end;

  pcre2_match_data_free_8(match_data);
  pcre2_code_free_8(re);

end;

procedure main16;
var
  re: Ppcre2_code;
  pattern: TPCRE2_SPTR16 = '3';
  subject: TPCRE2_SPTR16 = 'Das Ereigniss war am 03. Januar 2023!';
  match_data: Ppcre2_match_data;
  errornumber, rc: longint;
  erroroffset: TPCRE2_SIZE;
  ovector: PPCRE2_SIZE;
begin

  re := pcre2_compile_16(pattern, PCRE2_ZERO_TERMINATED, 0, @errornumber, @erroroffset, nil);
  match_data := pcre2_match_data_create_from_pattern_16(re, nil);

  rc := pcre2_match_16(re, subject, PCRE2_ZERO_TERMINATED, 0, 0, match_data, nil);

  if rc < 0 then begin
    WriteLn('Die Zahl 3 wurde nicht gefunden.');
  end else begin
    ovector := pcre2_get_ovector_pointer_16(match_data);
    WriteLn('Treffer gefunden!');
    WriteLn('Die "3" steht an Position: ', ovector[0]);
    WriteLn('Der gefundene Textabschnitt ist: ', subject[ovector[0]]);
  end;

  pcre2_match_data_free_16(match_data);
  pcre2_code_free_16(re);

end;

begin
  main;
  main16;
end.
