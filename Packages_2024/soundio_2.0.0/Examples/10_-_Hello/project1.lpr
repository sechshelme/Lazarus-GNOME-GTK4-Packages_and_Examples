program project1;

uses
  fp_soundio;

type
  TSoundData = record
    phase, phase_increment: single;
  end;
  PSoundData = ^TSoundData;

  procedure write_callback(stream: PSoundIoOutStream; frame_count_min: longint; frame_count_max: longint); cdecl;
  var
    data: PSoundData;
    layout: PSoundIoChannelLayout;
    frames_left, frame_count, err: longint;
    sample: single;
    areas: PSoundIoChannelArea;
    ptr: PSingle;
    frame, channel: integer;
  begin
    data := stream^.userdata;
    layout := @stream^.layout;
    frames_left := frame_count_max;

    while frames_left > 0 do begin
      frame_count := frames_left;
      err := soundio_outstream_begin_write(stream, @areas, @frame_count);
      if err <> 0 then begin
        WriteLn('Begin write error: ', soundio_strerror(err));
        Halt(1);
      end;
      if frame_count = 0 then  begin
        break;
      end;

      for frame := 0 to frame_count - 1 do begin
        sample := sin(data^.phase);
        data^.phase += data^.phase_increment;
        if data^.phase > 2 * PI then  begin
          data^.phase -= 2 * PI;
        end;

        for channel := 0 to layout^.channel_count - 1 do begin
          ptr := PSingle((areas[channel].ptr) + areas[channel].step * frame);
          ptr^ := sample;
        end;
      end;

      err := soundio_outstream_end_write(stream);
      if err <> 0 then begin
        WriteLn('End write error: ', soundio_strerror(err));
        Halt(1);
      end;
      frames_left -= frame_count;
    end;
  end;

  procedure main;
  var
    soundio: PSoundIo;
    err, default_out_device_index: longint;
    device: PSoundIoDevice;
    outstream: PSoundIoOutStream;
    layout: PSoundIoChannelLayout;
    data: TSoundData;
  const
    frequence = 440;
  begin
    soundio := soundio_create;
    if soundio = nil then begin
      WriteLn('Out of memory\n');
      Exit;
    end;

    err := soundio_connect(soundio);
    if err <> 0 then begin
      WriteLn('Connection error: ', soundio_strerror(err));
      Exit;;
    end;

    soundio_flush_events(soundio);

    default_out_device_index := soundio_default_output_device_index(soundio);
    if default_out_device_index < 0 then begin
      WriteLn('No output device found');
      Exit;;
    end;

    device := soundio_get_output_device(soundio, default_out_device_index);

    outstream := soundio_outstream_create(device);
    outstream^.format := SoundIoFormatFloat32NE;
    outstream^.write_callback := @write_callback;
    outstream^.sample_rate := 44100;
    layout := soundio_channel_layout_get_default(2);
    outstream^.layout := layout^;

    data.phase := 0.0;
    data.phase_increment := 2.0 * PI * frequence / single(outstream^.sample_rate);
    outstream^.userdata := @data;

    err := soundio_outstream_open(outstream);
    if err <> 0 then begin
      WriteLn('Outstream open error: ', soundio_strerror(err));
      Exit;
    end;

    err := soundio_outstream_start(outstream);
    if err <> 0 then begin
      WriteLn('Outstream start error: ', soundio_strerror(err));
      Exit;
    end;

    WriteLn('  <Enter> = Close');
    soundio_flush_events(soundio);
    ReadLn;

    soundio_outstream_destroy(outstream);
    soundio_device_unref(device);
    soundio_destroy(soundio);
  end;

begin
  main;
end.
