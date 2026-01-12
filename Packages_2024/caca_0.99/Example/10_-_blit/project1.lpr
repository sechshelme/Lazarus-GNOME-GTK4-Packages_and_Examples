program project1;

uses
  fp_caca;

const
  pig: pchar =
    '  ,__         __,'#10 +
    '   \)`\_..._/`(/'#10 +
    '   .''  _   _  ''.'#10 +
    '  /    o\ /o   \'#10 +
    '  |    .-.-.    |  _'#10 +
    '  |   /() ()\   | (,`)'#10 +
    ' / \  ''-----''  / \ .'''#10 +
    '|   ''-..___..-''   |'#10 +
    '|                 |'#10 +
    '|                 |'#10 +
    ';                 ;'#10 +
    ' \      / \      /'#10 +
    '  \-..-/''-''\-..-/'#10 +
    'jgs\/\/     \/\/'#10;


  procedure main;
  var
    cv, sprite: Pcaca_canvas_t;
    dp: Pcaca_display_t;
  begin
    cv := caca_create_canvas(80, 24);
    if cv <> nil then begin

      dp := caca_create_display(cv);
      if dp <> nil then begin

        sprite := caca_create_canvas(0, 0);
        caca_set_color_ansi(sprite, CACA_LIGHTRED, CACA_BLACK);
        caca_import_canvas_from_memory(sprite, pig, Length(pig), 'text');
        caca_set_canvas_handle(sprite, caca_get_canvas_width(sprite) div 2,
          caca_get_canvas_height(sprite) div 2);

        caca_set_color_ansi(cv, CACA_WHITE, CACA_BLUE);
        caca_put_str(cv, 0, 0, 'Centered sprite');

        caca_blit(cv, caca_get_canvas_width(cv) div 2,
          caca_get_canvas_height(cv) div 2, sprite, nil);

        caca_refresh_display(dp);

        caca_get_event(dp, CACA_EVENT_KEY_PRESS, nil, -1);

        caca_free_display(dp);
        caca_free_canvas(sprite);
      end;
      caca_free_canvas(cv);
    end;

  end;

begin
  main;
end.
