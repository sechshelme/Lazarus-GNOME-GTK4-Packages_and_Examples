program project1;

uses
  ctypes,
  fp_glib2,
  fp_gst;

  // https://gstreamer.freedesktop.org/documentation/tutorials/basic/media-formats-and-pad-capabilities.html?gi-language=c

  function print_field(field_id: TGQuark; Value: PGValue; pfx: Tgpointer): Tgboolean; cdecl;
  var
    s: Pgchar;
  begin
    s := gst_value_serialize(Value);
    g_print('%s %15s: %s'#10, pfx, g_quark_to_string(field_id), s);
    g_free(s);
    Result := True;
  end;

  procedure print_caps(caps: PGstCaps; pfx: Pgchar);
  var
    i: integer;
    structure: PGstStructure;
  begin
    if caps = nil then begin
      g_print('caps error !'#10);
      Exit;
    end;

    if gst_caps_is_any(caps) then begin
      g_print('%sANY'#10, pfx);
      Exit;
    end;

    if gst_caps_is_empty(caps) then begin
      g_print('%sEMPTY'#10, pfx);
      Exit;
    end;

    for i := 0 to gst_caps_get_size(caps) - 1 do begin
      structure := gst_caps_get_structure(caps, i);
      g_print('%s%s'#10, pfx, gst_structure_get_name(structure));
      gst_structure_foreach(structure, @print_field, pfx);
    end;
  end;

  procedure print_pad_templates_information(factory: PGstElementFactory);
  const
    pads: PGList = nil;
  var
    padtemplate: PGstStaticPadTemplate;
    caps: PGstCaps;
  begin
    //  gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_LONGNAME);
    g_print('Pad Templates for %s:'#10, gst_element_factory_get_longname(factory));
    if gst_element_factory_get_num_pad_templates(factory) = 0 then begin
      g_print('  none'#10);
      exit;
    end;

    pads := gst_element_factory_get_static_pad_templates(factory);
    while pads <> nil do begin
      padtemplate := pads^.Data;
      pads := g_list_next(pads);

      case padtemplate^.direction of
        GST_PAD_SRC: begin
          g_print('  SRC template: ''%s'''#10, padtemplate^.name_template);
        end;
        GST_PAD_SINK: begin
          g_print('  SINK template: ''%s'''#10, padtemplate^.name_template);
        end;
        else begin
          g_print('  UNKNOWN!!! template: ''%s'''#10, padtemplate^.name_template);
        end;
      end;

      case padtemplate^.presence of
        GST_PAD_ALWAYS: begin
          g_print('   Availability: Always'#10);
        end;
        GST_PAD_SOMETIMES: begin
          g_print('   Availability: Sometines'#10);
        end;
        GST_PAD_REQUEST: begin
          g_print('   Availability: On request'#10);
        end;
        else begin
          g_print('   Availability: UNKKNOW!!!!'#10);
        end;
      end;

      if padtemplate^.static_caps._string <> nil then begin
        g_print('  Capabilities:'#10);
        caps := gst_static_caps_get(@padtemplate^.static_caps);
        print_caps(caps, '    ');
        gst_caps_unref(caps);
      end;
    end;

    g_print(#10);
  end;

  procedure print_pad_capatilities(element: PGstElement; pad_name: Pgchar);
  var
    pad: PGstPad;
    caps: PGstCaps;
  begin
    pad := gst_element_get_static_pad(element, pad_name);
    if pad = nil then begin
      g_printerr('Could not retrieve pad ''%s'''#10, pad_name);
      Exit;
    end;

    caps := gst_pad_get_current_caps(pad);
    if caps = nil then begin
      caps := gst_pad_query_caps(pad, nil);
    end;

    g_print('Caps for the %s pad:'#10, pad_name);
    print_caps(caps, '     ');
    gst_caps_unref(caps);
    gst_object_unref(pad);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    source_factory, sink_factory: PGstElementFactory;
    sink, Source, pipeline: PGstElement;
    ret: TGstStateChangeReturn;
    bus: PGstBus;
    msg: PGstMessage;
    err: PGError;
    debug_info, db: Pgchar;
    terminate: boolean = False;
    old_state, new_state, pending_state: TGstState;
  begin
    gst_init(@argc, @argv);

    source_factory := gst_element_factory_find('audiotestsrc');
    sink_factory := gst_element_factory_find('autoaudiosink');
    if (source_factory = nil) or (sink_factory = nil) then begin
      gst_printerr('Not all element factories could be created.'#10);
      Exit(-1);
    end;

    print_pad_templates_information(source_factory);
    print_pad_templates_information(sink_factory);

    Source := gst_element_factory_create(source_factory, 'source');
    sink := gst_element_factory_create(sink_factory, 'sink');

    pipeline := gst_pipeline_new('test-pipeline');
    if (pipeline = nil) or (Source = nil) or (sink = nil) then begin
      g_print('Not all elements could be created.'#10);
      Exit(-1);
    end;

    gst_bin_add_many(GST_BIN(pipeline), Source, sink, nil);
    if not gst_element_link(Source, sink) then begin
      g_printerr('Elements could not be linked.'#10);
      gst_object_unref(pipeline);
      Exit(-1);
    end;

    g_print('In NULL state:'#10);
    print_pad_capatilities(sink, 'sink');

    ret := gst_element_set_state(pipeline, GST_STATE_PLAYING);

    ret := gst_element_set_state(pipeline, GST_STATE_PLAYING);
    if ret = GST_STATE_CHANGE_FAILURE then begin
      g_printerr('Kann pipeline nicht abspielen'#10);
      g_object_unref(pipeline);
      Exit(-1);
    end;

    bus := gst_element_get_bus(pipeline);
    repeat
      msg := gst_bus_timed_pop_filtered(bus, GST_CLOCK_TIME_NONE, GST_MESSAGE_STATE_CHANGED or GST_MESSAGE_ERROR or GST_MESSAGE_EOS);
      if msg <> nil then begin
        case GST_MESSAGE_TYPE(msg) of
          GST_MESSAGE_ERROR: begin
            gst_message_parse_error(msg, @err, @debug_info);
            g_printerr('Error received from elemment %s: %s'#10, GST_OBJECT_NAME(msg^.src), err^.message);
            if debug_info = nil then begin
              db := 'none';
            end else begin
              db := debug_info;
            end;
            g_printerr('Debugging information: %s'#10, db);
            g_clear_error(@err);
            g_free(debug_info);
            terminate := True;
          end;
          GST_MESSAGE_EOS: begin
            g_print('End-Of-Stream reached.'#10);
            terminate := True;
          end;
          GST_MESSAGE_STATE_CHANGED: begin
            if GST_MESSAGE_SRC(msg) = GST_OBJECT(pipeline) then begin
              gst_message_parse_state_changed(msg, @old_state, @new_state, @pending_state);
              g_print('Pipeline state changed from %s to %s '#10, gst_element_state_get_name(old_state), gst_element_state_get_name(new_state));
            end;
          end;
          else begin
            g_print('Pipeline state unbekannt'#10);
          end;
        end;
      end;
      gst_message_unref(msg)
    until terminate;

    gst_object_unref(bus);
    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);

    WriteLn('ende');
    Result := 0;

  end;

begin
  main(argc, argv);
end.
