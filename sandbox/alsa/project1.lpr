program project1;

uses
  fp_asound;

const
  EPIPE = 32;

  procedure main;
  const
    sample_rate: uint32 = 44100;
    frames: Tsnd_pcm_uframes_t = 1024 * 4;
    freq = 440 / 2;
    duration_seconds = 20;
  var
    rc, dir: longint;
    handle: Psnd_pcm_t;
    params: Psnd_pcm_hw_params_t;
    buffer: array of int16;
    frame_index: integer = 0;
    total_frames, i: integer;
    frames_to_write: Tsnd_pcm_uframes_t;
    sample: int16;


  begin
    total_frames := sample_rate * duration_seconds;
    rc := snd_pcm_open(@handle, 'default', SND_PCM_STREAM_PLAYBACK, 0);
    if rc < 0 then begin
      WriteLn('Fehler beim Öffnen des PCM-Geräts: ', snd_strerror(rc));
      Exit;
    end;

    rc := snd_pcm_hw_params_malloc(@params);

    snd_pcm_hw_params_any(handle, params);
    snd_pcm_hw_params_set_access(handle, params, SND_PCM_ACCESS_RW_INTERLEAVED);
    snd_pcm_hw_params_set_format(handle, params, SND_PCM_FORMAT_S16_LE);
    snd_pcm_hw_params_set_channels(handle, params, 2);
    snd_pcm_hw_params_set_rate_near(handle, params, @sample_rate, @dir);
    snd_pcm_hw_params_set_period_size_near(handle, params, @frames, @dir);

    rc := snd_pcm_hw_params(handle, params);
    if rc < 0 then begin
      WriteLn('Fehler beim Setzen der Hardware-Parameter: ', snd_strerror(rc));
      snd_pcm_close(handle);
      Exit;
    end;

    snd_pcm_hw_params_get_period_size(params, @frames, @dir);
    SetLength(buffer, frames * 2);

    while frame_index < total_frames do begin
      Write('.');
      frames_to_write := frames;
      if total_frames - frame_index < frames then begin
        frames_to_write := total_frames - frame_index;
      end;

      for  i := 0 to frames_to_write - 1 do begin
        sample := round((sin(2.0 * PI * freq * (frame_index + i) / sample_rate) * 32767));

        buffer[2 * i + 0] := sample;
        buffer[2 * i + 1] := sample;
      end;

      rc := snd_pcm_writei(handle, Pointer(buffer), frames_to_write);
      if rc = -EPIPE then begin
        WriteLn('Buffer underrun');
        snd_pcm_prepare(handle);
      end else if rc < 0 then begin
        WriteLn('Fehler beim Schreiben: ', snd_strerror(rc));
      end else if rc <> frames_to_write then begin
        WriteLn('Schrieb nur ', rc, ' Frames (erwartet ', frames_to_write, ')');
      end;

      frame_index += frames_to_write;
    end;

    snd_pcm_hw_params_free(params);
    SetLength(buffer, 0);
    snd_pcm_drain(handle);
    snd_pcm_close(handle);

    WriteLn('Abspielen beendet');
  end;

begin
  main;
end.
