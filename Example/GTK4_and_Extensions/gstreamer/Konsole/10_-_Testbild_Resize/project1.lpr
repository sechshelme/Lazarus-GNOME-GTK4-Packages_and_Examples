
program project1;

uses
  Crt,
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  fp_gst;

var
  Width: Tgint = 320;
  Height: Tgint = 200;

  procedure SetSize(caps: PGstElement; w, h: Tgint);
  var
    video: PGstCaps;
  begin
    video := gst_caps_new_simple('video/x-raw',
      'width', G_TYPE_INT, w,
      'height', G_TYPE_INT, h,
      nil);
    g_object_set(caps, 'caps', video, nil);
    gst_caps_unref(video);
  end;

  procedure SetWinSize(sink: PGstElement; w, h: Tgint);
  begin
    g_object_set(sink, 'windows-width', w, 'window-height', h, nil);
    GObjectShowProperty(sink);
  end;

  procedure main(argc: cint; argv: PPChar);
  var
    pipeline, src, sink, caps: PGstElement;
    pattern: Tgint = 0;  // GstVideoTestSrcPattern
    ch: ansichar;
    quit: boolean = False;
    fgCol, bgCol: Tguint;
    flip: Tgboolean;
    video: PGstCaps;
  begin
    gst_init(@argc, @argv);

//    pipeline := gst_parse_launch('videotestsrc name=src ! capsfilter name = caps ! autovideosink name=sink', nil);
    pipeline := gst_parse_launch('videotestsrc name=src ! capsfilter name = caps ! ximagesink name=sink', nil);
    if pipeline = nil then begin
      WriteLn('pipeline error');
    end else begin
      WriteLn('pipeline io.');
    end;

    src := gst_bin_get_by_name(GST_BIN(pipeline), 'src');
    if src = nil then begin
      WriteLn('src error');
    end else begin
      WriteLn('src io.');
    end;

    caps := gst_bin_get_by_name(GST_BIN(pipeline), 'caps');
    if caps = nil then begin
      WriteLn('caps error');
    end else begin
      WriteLn('caps io.');
    end;

    if video = nil then begin
      WriteLn('video error');
    end else begin
      WriteLn('video io.');
    end;

    sink := gst_bin_get_by_name(GST_BIN(pipeline), 'sink');
    if sink = nil then begin
      WriteLn('sink error');
    end else begin
      WriteLn('sink io.');
    end;

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    repeat
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          #32: begin
            WriteLn('space');
            //            GObjectShowProperty(pipeline);
            //            GObjectShowProperty(src);
            //            GObjectShowProperty(caps);
            //            GObjectShowProperty(video);
            //            GObjectShowProperty(sink);
          end;
          'w': begin
            Inc(Width);
            SetSize(caps, Width, Height);
            SetWinSize(sink, Width, Height);
          end;
          'h': begin
            Inc(Height);
            SetSize(caps, Width, Height);
            SetWinSize(sink, Width, Height);
          end;
          'c': begin
            fgCol := Random($FFFFFFFF);
            bgCol := Random($FFFFFFFF);
            g_object_set(src, 'foreground-color', fgCol, 'background-color', bgCol, nil);
          end;
          'f': begin
            g_object_get(src, 'flip', @flip, nil);
            flip := not flip;
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
