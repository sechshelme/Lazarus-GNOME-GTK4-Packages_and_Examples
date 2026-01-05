program project1;

uses
  fp_fribidi;


  procedure fribidi_show(const string_orig: string);
  var
    fribidi_in_char: array of TFriBidiChar = nil;
    fribidi_visual_char: array of TFriBidiChar = nil;
    fribidi_pbase_dir: TFriBidiParType;
    stat: TFriBidiLevel;
    orig_len, len, new_len: TFriBidiStrIndex;
    string_formatted: string = '';
  begin
    WriteLn('Original:  ', string_orig, ' (', Length(string_orig), ')');

    orig_len := Length(string_orig);

    SetLength(fribidi_in_char, orig_len + 1);
    len := fribidi_charset_to_unicode(FRIBIDI_CHAR_SET_UTF8, pchar(string_orig), orig_len, PFriBidiChar(fribidi_in_char));

    SetLength(fribidi_visual_char, len + 1);
    fribidi_pbase_dir := FRIBIDI_PAR_LTR;

    stat := fribidi_log2vis(PFriBidiChar(fribidi_in_char), len, @fribidi_pbase_dir, PFriBidiChar(fribidi_visual_char), nil, nil, nil);

    if stat <> 0 then begin
      SetLength(string_formatted, len * 4 + 1);
      new_len := fribidi_unicode_to_charset(FRIBIDI_CHAR_SET_UTF8, PFriBidiChar(fribidi_visual_char), len, pchar(string_formatted));
      SetLength(string_formatted, new_len);
      if new_len > 0 then begin
        WriteLn('Convertet: ', string_formatted, ' (', Length(string_formatted), ')');
      end;
    end;
    WriteLn();
  end;

  procedure main;
  const
    texts: array of string = (
      'Hello World',
      'Hello ÄÖÜ ! 😀  😄  ☺️',
      'السلام عليكم');
  var
    i: integer;
  begin
    for i := 0 to Length(texts) - 1 do begin
      fribidi_show(texts[i]);
    end;
  end;

begin
  main;
end.
