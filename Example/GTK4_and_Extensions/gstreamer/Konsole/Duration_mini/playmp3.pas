program project1;

uses
  ctypes,
  crt,
  fp_glib2,
  fp_gst,
  fp_gstTools;

const
  path = '/home/tux/Schreibtisch/sound/test.mp3';

  procedure message_cb(bus: PGstBus; msg: PGstMessage; Data: Pointer); cdecl;
  var
    tags: PGstTagList;
    duration: int64;
    pipeline: PGstElement absolute Data;
  begin
    //    WriteLn('Message: ', gst_message_type_get_name(msg^._type));
    case GST_MESSAGE_TYPE(msg) of
      GST_MESSAGE_DURATION_CHANGED: begin
        WriteLn('Duration');
        gst_element_query_duration(GST_ELEMENT(pipeline), GST_FORMAT_TIME, @duration);
        duration := duration div G_USEC_PER_SEC;
        WriteLn(GstClockToStr(duration));

      end;
      GST_MESSAGE_TAG: begin
        WriteLn('Tag');
        gst_message_parse_tag(msg, @tags);
        WriteLn(gst_tag_list_to_string(tags));
      end;
    end;
  end;

  procedure main(argc: cint; argv: PPChar);
  var
    pipeline, demux: PGstElement;
    bus: PGstBus;
    main_loop: PGMainLoop;
    ch: ansichar;
    quit: boolean = False;
  begin
    gst_init(@argc, @argv);

    pipeline := gst_parse_launch(PChar('filesrc location="' + path + '" ! queue ! id3demux name=demux ! decodebin ! audioconvert  ! autoaudiosink'), nil);

    demux := gst_bin_get_by_name(GST_BIN(pipeline), 'demux');
    if demux = nil then begin
      WriteLn('Demux Error');
    end;

    bus := gst_element_get_bus(pipeline);
    if bus = nil then begin
      WriteLn('bus error');
    end;
    gst_bus_add_signal_watch(bus);
    g_signal_connect(G_OBJECT(bus), 'message', TGCallback(@message_cb), pipeline);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    repeat
      g_main_iteration(False);
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
        end;
      end;
    until quit;

    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);
  end;

begin
  main(argc, argv);
end.
