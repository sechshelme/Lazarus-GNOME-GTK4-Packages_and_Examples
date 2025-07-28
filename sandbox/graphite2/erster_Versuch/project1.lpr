program project1;


// gcc -o main main.c `pkg-config --cflags --libs graphite2`

uses
  Types,
  Log,
  Segment,
  Font,

  fp_graphite2;

const
//  FontPath = 'small.ttf';
//  FontPath = '/home/tux/Schreibtisch/von_Git/graphite2/graphite/site/assets/fonts/Simple-Graphite-Font.ttf';
  FontPath = '/home/tux/Schreibtisch/von_Git/graphite2/graphite/tests/fonts/grtest1gr.ttf';
  Hello = 'Hello World abcdef';

  procedure main;
  var
    face: Pgr_face = nil;
    font: Pgr_font = nil;
    numCodePoints: Tsize_t;
    pError: pchar = nil;
    seg: Pgr_segment = nil;
    s: Pgr_slot;
  const
    rtl: integer = 0;
    pointsize: integer = 12;
    dpi: integer = 96;
  begin
    face := gr_make_file_face(FontPath, 0);
    if face = nil then begin
      WriteLn('gr_make_file_face()  error');
      Halt(1);
    end;

    font := gr_make_font(pointsize * dpi / 72.0, face);
    if font = nil then begin
      WriteLn('gr_make_font()  error');
      Halt(2);
    end;

    numCodePoints := gr_count_unicode_characters(gr_utf8, pchar(Hello), nil, PPointer(@pError));
    if pError <> nil then begin
      WriteLn('gr_count_unicode_characters()  error:', pError);
      Halt(3);
    end;

    seg := gr_make_seg(font, face, 0, nil, gr_utf8, pchar(Hello), numCodePoints, rtl);
    if seg = nil then begin
      WriteLn('gr_make_seg()  error');
      Halt(3);
    end;

    s := gr_seg_first_slot(seg);
    while s <> nil do begin
      WriteLn(gr_slot_gid(s): 6, ' ( ', gr_slot_origin_X(s): 6: 2, ', ', gr_slot_origin_Y(s): 6: 2, ' )');

      s := gr_slot_next_in_segment(s);
    end;

    gr_seg_destroy(seg);
    gr_font_destroy(font);
    gr_face_destroy(face);
  end;

begin
  main;
end.
