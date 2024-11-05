
program project1;

uses
  Crt,
  ctypes,
  glib280,
  GLIBTools,
  gst124;

  procedure main(argc: cint; argv: PPChar);
  var
    pipeline, src, sink1, sink2, queue1, tee: PGstElement;
    pattern: Tgint = 0;  // GstVideoTestSrcPattern
    ch: ansichar;
    quit: boolean = False;
    fgCol, bgCol: Tguint;
    flip: Tgboolean;
  begin
    gst_init(@argc, @argv);

//    pipeline := gst_parse_launch('videotestsrc name=src ! autovideosink name=sink', nil);
    pipeline := gst_parse_launch('videotestsrc name=src ! videoconvert ! tee name=tee ! queue name=queue1 ! autovideosink name=sink1 tee. ! queue name=queue2  ! autovideosink name=sink2', nil);
if pipeline = nil then begin
      WriteLn('pipeline error');
    end else begin
      WriteLn('pipeline io.');
      GObjectShowProperty(pipeline);
    end;
    WriteLn('---------------------------------------');

    src := gst_bin_get_by_name(GST_BIN(pipeline), 'src');
    if src = nil then begin
      WriteLn('src error');
    end else begin
      WriteLn('src io.');
      GObjectShowProperty(src);
    end;
    WriteLn('---------------------------------------');

    tee := gst_bin_get_by_name(GST_BIN(pipeline), 'tee');
    if tee = nil then begin
      WriteLn('tee error');
    end else begin
      WriteLn('tee io.');
      GObjectShowProperty(tee);
    end;
    WriteLn('---------------------------------------');

    sink1:=gst_bin_get_by_name(GST_BIN(pipeline), 'sink1');
    if sink1 = nil then begin
      WriteLn('sink1 error');
    end else begin
      WriteLn('sink1 io.');
      GObjectShowProperty(sink1);
    end;
    WriteLn('---------------------------------------');

    sink2:=gst_bin_get_by_name(GST_BIN(pipeline), 'sink2');
    if sink2 = nil then begin
      WriteLn('sink2 error');
    end else begin
      WriteLn('sink2 io.');
      GObjectShowProperty(sink2);
    end;
    WriteLn('---------------------------------------');

    queue1:=gst_bin_get_by_name(GST_BIN(pipeline), 'queue1');
    if queue1 = nil then begin
      WriteLn('queue1 error');
    end else begin
      WriteLn('queue1 io.');
      GObjectShowProperty(queue1);
    end;
    WriteLn('---------------------------------------');

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
