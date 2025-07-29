program project1;

uses
  fp_graphite2;

const
  //  FontPath = 'small.ttf';
  //  FontPath = '/home/tux/Schreibtisch/von_Git/graphite2/graphite/site/assets/fonts/Simple-Graphite-Font.ttf';
  FontPath = '/home/tux/Schreibtisch/von_Git/graphite2/graphite/tests/fonts/grtest1gr.ttf';
  Hello = 'Hello World !'#10'abcdef';
  lineWidth = 12;
  pointsize: integer = 12;
  dpi: integer = 96;
  rtl: integer = 0;


  procedure Simple_Demo;
  var
    face: Pgr_face = nil;
    font: Pgr_font = nil;
    numCodePoints: Tsize_t;
    pError: pchar = nil;
    seg: Pgr_segment = nil;
    s: Pgr_slot;
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

    WriteLn();

    gr_seg_destroy(seg);
    gr_font_destroy(font);
    gr_face_destroy(face);
  end;

  // ================0

  function breakweight_before(s: Pgr_slot; seg: Pgr_segment): integer;
  var
    bbefore, bafter: longint;
  begin
    bbefore := gr_cinfo_break_weight(gr_seg_cinfo(seg, gr_slot_after(gr_slot_prev_in_segment(s))));
    bafter := gr_cinfo_break_weight(gr_seg_cinfo(seg, gr_slot_before(s)));

    if gr_slot_can_insert_before(s) = 0 then  begin
      Exit(50);
    end;
    if bbefore < 0 then begin
      bbefore := 0;
    end;
    if bafter > 0 then begin
      bafter := 0;
    end;

    if bbefore > bafter then begin
      Exit(bbefore);
    end else begin
      Exit(bafter);
    end;
  end;

  procedure LineBreak_Demo;
  const
    dpi = 96;
  var
    pError: pchar = nil;
    width, i: integer;
    numlines: integer = 0;
    lineend: single;
    face: Pgr_face;
    font: Pgr_font;
    numCodePoints: Tsize_t;
    seg: Pgr_segment;
    lineslots: PPgr_slot;
    s: Pgr_slot;

  begin
    width := Round(lineWidth) * dpi div 72;
    lineend := width;

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

    lineslots := GetMem(numCodePoints * sizeof(Pgr_slot));
    lineslots[numlines] := gr_seg_first_slot(seg);
    Inc(numlines);
    s := lineslots[0];
    while s <> nil do begin
      if gr_slot_origin_X(s) > lineend then begin
        while s <> nil do begin
          if breakweight_before(s, seg) >= gr_breakWord then begin
            break;
          end;
          s := gr_slot_prev_in_segment(s);
        end;
        lineslots[numlines] := s;
        Inc(numlines);
        gr_slot_linebreak_before(s);
        lineend := gr_slot_origin_X(s) + width;
      end;
      s := gr_slot_next_in_segment(s);
    end;

    WriteLn(': ', width);
    WriteLn('numlines: ',numlines);
    for i := 0 to numlines - 1 do begin
      gr_seg_justify(seg, lineslots[i], font, width, 0, nil, nil);

      s := gr_seg_first_slot(seg);
      while s <> nil do begin
        WriteLn(gr_slot_gid(s): 6, ' ( ', gr_slot_origin_X(s): 6: 2, ', ', gr_slot_origin_Y(s): 6: 2, '@', gr_slot_attr(s, seg, gr_slatJWidth, 0), ' )');
        s := gr_slot_next_in_segment(s);
      end;
      WriteLn;
    end;
    Freemem(lineslots);
    gr_seg_destroy(seg);
    gr_font_destroy(font);
  end;

begin
  Simple_Demo;
  LineBreak_Demo;
end.
