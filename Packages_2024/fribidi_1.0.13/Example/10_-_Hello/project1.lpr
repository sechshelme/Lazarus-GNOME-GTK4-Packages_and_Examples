program project1;

uses
  fp_fribidi;


  function fribidi_str_convert(const string_orig: string): string;
  var
    fribidi_in_char: array of TFriBidiChar = nil;
    fribidi_visual_char: array of TFriBidiChar = nil;
    fribidi_pbase_dir: TFriBidiParType;
    stat: TFriBidiLevel;
    orig_len, len, new_len: TFriBidiStrIndex;
    string_formatted: string = '';
  begin
    orig_len := Length(string_orig);

    SetLength(fribidi_in_char, orig_len + 1);
    len := fribidi_charset_to_unicode(FRIBIDI_CHAR_SET_UTF8, pchar(string_orig), orig_len, PFriBidiChar(fribidi_in_char));

    SetLength(fribidi_visual_char, len + 1);
    fribidi_pbase_dir := FRIBIDI_PAR_LTR;

    stat := fribidi_log2vis(PFriBidiChar(fribidi_in_char), len, @fribidi_pbase_dir, PFriBidiChar(fribidi_visual_char), nil, nil, nil);

    if stat <> 0 then begin
      SetLength(string_formatted, len * 4 + 1);
      new_len := fribidi_unicode_to_charset(FRIBIDI_CHAR_SET_UTF8, PFriBidiChar(fribidi_visual_char), len, pchar(string_formatted));
      if new_len > 0 then begin
        Exit(string_formatted);
      end;
    end;
    Result := string_orig;
  end;

  procedure PrintStr(const s: string);
  var
    converted: string;
  begin
    WriteLn('Original: '#10, s);

    converted := fribidi_str_convert(pchar(s));
    WriteLn('Converted: '#10, pchar(converted), #10);
  end;

  procedure main;
  const
    arabic_text = 'السلام عليكم';
    german_text = 'Hello ÄÖÜ ! 😀  😄  ☺️';

  begin
    PrintStr(german_text);
    PrintStr(arabic_text);
  end;

begin
  main;
end.
