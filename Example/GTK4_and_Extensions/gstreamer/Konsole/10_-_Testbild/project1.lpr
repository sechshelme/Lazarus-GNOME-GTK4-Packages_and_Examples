
program project1;

uses
  Crt,
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  fp_gst;

  procedure main(argc: cint; argv: PPChar);
  var
    pipeline, src, sink: PGstElement;
    pattern: Tgint = 0;
    ch: ansichar;
    quit: boolean = False;
    fgCol, bgCol: Tguint;
    flip: Tgboolean;
  begin
    gst_init(@argc, @argv);

    pipeline := gst_parse_launch('videotestsrc name=src ! autovideosink name=sink', nil);
    if pipeline = nil then begin
      WriteLn('pipeline error');
    end else begin
      WriteLn('pipeline io.');
      GObjectShowProperty(pipeline);
    end;

    src := gst_bin_get_by_name(GST_BIN(pipeline), 'src');
    if src = nil then begin
      WriteLn('src error');
    end else begin
      WriteLn('src io.');
      GObjectShowProperty(src);
    end;

    sink:=gst_bin_get_by_name(GST_BIN(pipeline), 'sink');
    if sink = nil then begin
      WriteLn('sink error');
    end else begin
      WriteLn('sink io.');
      GObjectShowProperty(sink);
    end;

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    repeat
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          'c': begin
            fgCol := Random($FFFFFFFF);
            bgCol := Random($FFFFFFFF);
            g_object_set(src, 'foreground-color', fgCol, 'background-color', bgCol, nil);
          end;
          'f': begin
            g_object_get(src, 'flip', @flip, nil);
            flip := not flip;
            ;
            g_object_set(src, 'flip', flip, nil);
          end;
          'p': begin
            Inc(pattern);
            if pattern > 25 then begin
              pattern := 0;
            end;
            g_object_set(src, 'pattern', pattern, nil);
          end;
          'P': begin
            Dec(pattern);
            if pattern < 9 then begin
              pattern := 25;
            end;
            g_object_set(src, 'pattern', pattern, nil);
          end;
        end;
      end;
    until quit;
    gst_object_unref(pipeline);
    gst_object_unref(src);
  end;

begin
  main(argc, argv);
end.
