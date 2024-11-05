program playmp3;
{$mode objfpc}
{$h+}

uses
  crt,
  SysUtils,
  glib280,
  GLIBTools,
  gst124,
  gst124_tag,
  gst124_audio;


  // https://github.com/GStreamer/gst-plugins-good/blob/master/tests/check/elements/id3demux.c
  // id3v2
  // sudo apt install kid3


const
//  path = '/home/tux/Schreibtisch/sound/test2.mp3';
  path = '/home/tux/Schreibtisch/sound/test.wav';

procedure read_tags_from_file_new(pipeline: PGstElement);
var
  bus: PGstBus;
   Name, tag_value: Pgchar;
  msg: PGstMessage=nil;
  tags: PGstTagList=nil;
  Count: Tgint;
  i: integer;
  valueType: PGValue;
  quit:Boolean=False;
begin
  bus := gst_element_get_bus(pipeline);


  repeat
    if msg<>nil then  gst_message_unref(msg);
    WriteLn(1111);
    msg:=  gst_bus_timed_pop(bus, 1000);
    WriteLn(2222);
    if msg <>nil then begin
    case GST_MESSAGE_TYPE(msg) of
      GST_MESSAGE_TAG:quit:=True;
      262144:quit:=True;
      else WriteLn('Msg Typ: ',IntToHex( GST_MESSAGE_TYPE(msg)));
    end;
    end else WriteLn('nil');

  until quit or (msg=nil);

  gst_message_parse_tag(msg, @tags);
  if tags<>nil then WriteLn('Tags io.');

  gst_message_unref(msg);
  gst_object_unref(bus);

  WriteLn('Tag List: ',gst_tag_list_to_string(tags));

  Count := gst_tag_list_n_tags(tags);
  WriteLn('Count: ', Count);
  for i := 0 to Count - 1 do begin
    Name := gst_tag_list_nth_tag_name(tags, i);
    valueType := gst_tag_list_get_value_index(tags, Name, 0);
    Write('name: ', Name, 'Typ: ', valueType^.g_type, '    ');
    if valueType^.g_type = G_TYPE_STRING then begin
      gst_tag_list_get_string(tags, name, @tag_value);
      WriteLn(tag_value);
    end else begin
      WriteLn();
    end;
  end;

  gst_tag_list_unref(tags);

  WriteLn(#10);
end;

  procedure main;
  var
    pipeline: PGstElement = nil;
    volume, equalizer, demux: PGstElement;

    quit: boolean = False;
    vol: Tgdouble = 0.5;
    mute: Tgboolean = False;
    equ: array [0..2] of Tgdouble = (0.0, 0.0, 0.0);
    ch: ansichar;
  begin
    gst_init(@argc, @argv);

//    read_tags_from_file(path);

    pipeline := gst_parse_launch(PChar('filesrc location="' + path + '" ! queue ! id3demux name=demux ! decodebin ! audioconvert ! audioresample ! equalizer-3bands name=equ ! volume name=vol ! autoaudiosink'), nil);

    volume := gst_bin_get_by_interface(GST_BIN(pipeline), gst_stream_volume_get_type());

    // volume := gst_bin_get_by_name(GST_BIN(pipeline), 'vol');
    if volume = nil then begin
      WriteLn('Volume Error');
    end;

    equalizer := gst_bin_get_by_name(GST_BIN(pipeline), 'equ');
    if equalizer = nil then begin
      WriteLn('Equalizer Error');
    end;

    demux := gst_bin_get_by_name(GST_BIN(pipeline), 'demux');
    if demux = nil then begin
      WriteLn('Demux Error');
    end;


    GObjectShowProperty(demux);


    gst_element_set_state(pipeline, GST_STATE_PLAYING);

//    read_tags_from_file_new(pipeline);

    repeat
      g_object_set(volume, 'volume', vol, 'mute', mute, nil);
      g_object_set(equalizer, 'band0', equ[0], 'band1', equ[1], 'band2', equ[2], nil);
      if KeyPressed then begin
        ch := ReadKey;
        case ch of
          #27: begin
            quit := True;
          end;
          #32: begin
            mute := not mute;
            WriteLn('Mute: ', mute);
          end;
          '+': begin
            vol += 0.1;
            if vol >= 1.0 then begin
              vol := 1.0;
            end;
            WriteLn('volume: ', vol: 4: 2);
          end;
          '-': begin
            vol -= 0.1;
            if vol <= 0.0 then begin
              vol := 0.0;
            end;
            WriteLn('volume: ', vol: 4: 2);
          end;
          't': begin
            equ[2] -= 1.0;
            if equ[2] <= -24.0 then begin
              equ[2] := -24.0;
            end;
            WriteLn('Treble: ', equ[2]: 4: 2);
          end;
          'T': begin
            equ[2] += 1.0;
            if equ[2] >= 12.0 then begin
              equ[2] := 12.0;
            end;
            WriteLn('Treble: ', equ[2]: 4: 2);
          end;
          'm': begin
            equ[1] -= 1.0;
            if equ[1] <= -24.0 then begin
              equ[1] := -24.0;
            end;
            WriteLn('Middle: ', equ[1]: 4: 2);
          end;
          'M': begin
            equ[1] += 1.0;
            if equ[1] >= 12.0 then begin
              equ[1] := 12.0;
            end;
            WriteLn('Middle: ', equ[1]: 4: 2);
          end;
          'b': begin
            equ[0] -= 1.0;
            if equ[0] <= -24.0 then begin
              equ[0] := -24.0;
            end;
            WriteLn('Bass: ', equ[0]: 4: 2);
          end;
          'B': begin
            equ[0] += 1.0;
            if equ[0] >= 12.0 then begin
              equ[0] := 12.0;
            end;
            WriteLn('Bass: ', equ[0]: 4: 2);
          end;
          'q': begin
            read_tags_from_file_new(pipeline);
          end;



        end;
      end;
    until quit;

    gst_object_unref(pipeline);
  end;

begin
  main;
end.
