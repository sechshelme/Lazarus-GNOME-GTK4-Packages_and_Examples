program project1;

uses
  fp_raqm,
fp_FreeType2;

  procedure PrintSize(s: PChar);
  var
    lib: TFT_Library;
    face: TFT_Face;
    rq: Praqm_t;
    glyphs: Praqm_glyph_t;
    count: Tsize_t;
  begin
    if FT_Init_FreeType(@lib)<>0 then begin
        WriteLn('Fehler: Kann FreeType nicht initialisieren.');
        Exit;;
    end;

    if FT_New_Face(lib, '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf', 0, @face)<>0 then begin
        WriteLn('Fehler: Kann Schrift nicht laden.');
        FT_Done_FreeType(lib);
        Exit;
                    end;

    FT_Set_Char_Size(face, face^.units_per_EM, 0, 0, 0);

    // Raqm-Objekt anlegen
    rq := raqm_create();

    raqm_set_text_utf8(rq, s, Length(s));
    raqm_set_par_direction(rq, RAQM_DIRECTION_LTR);
    raqm_set_freetype_face(rq, face);

    if not raqm_layout(rq) then begin
        WriteLn('Fehler beim Layout.');
        raqm_destroy(rq);
        FT_Done_Face(face);
        FT_Done_FreeType(lib);
        Exit;;
    end;

    // Glyphen ausgeben
    glyphs := raqm_get_glyphs(rq, @count);
    WriteLn('Text: ', s);
    WriteLn('Length: ',Length(s));
    WriteLn('Anzahl Glyphen: ', count);
    WriteLn();

    // Aufräumen
    raqm_destroy(rq);
    FT_Done_Face(face);
    FT_Done_FreeType(lib);

  end;


const
  ascci_text = 'Hello, world!';
  german_text = 'Hello ÄÖÜ ! 😀  😄  ☺️';
  arabic_text = 'السلام عليكم HarfBuzz يعمل! 123';

  procedure main;
  begin
    PrintSize(ascci_text);
    PrintSize(german_text);
    PrintSize(arabic_text);
  end;

begin
  main;
end.
