program project1;

uses
  fp_asound;

  procedure main;
  const
         sample_rate:UInt32 = 44100;
         frames :Tsnd_pcm_uframes_t= 1024 * 4;
         freq = 440 / 2;
         duration_seconds = 2;


  var
    size:Integer;
    rc, dir: LongInt;
    handle: Psnd_pcm_t;
    params: Psnd_pcm_hw_params_t;
    buffer: PChar;
    frame_index :Integer= 0;
    total_frames:Integer ;
    frames_to_write: Tsnd_pcm_uframes_t;


  begin
    size:=  frames * 2  * 2 ;
    total_frames:= sample_rate * duration_seconds;
//  snd_pcm_t *handle;
//  snd_pcm_hw_params_t *params;
//    int dir;
//    snd_pcm_uframes_t frames = 1024 * 4;
//    char *buffer;
//    int rc;
//    int freq = 440 / 2; // Tonfrequenz A4
//    int duration_seconds = 2; // Dauer des Tons
//    int total_frames = sample_rate * duration_seconds;

    // PCM-Gerät öffnen (default, Playback)
    rc := snd_pcm_open(@handle, 'default', SND_PCM_STREAM_PLAYBACK, 0);
    if rc < 0 then begin
        WriteLn('Fehler beim Öffnen des PCM-Geräts: ', snd_strerror(rc));
        Exit;
    end;

    // Hardware-Parameter-Objekt initialisieren
//    snd_pcm_hw_params_alloca(@params);
//    Getmem(params, SizeOf(Tsnd_pcm_hw_params_t));

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

    // Puffergröße bestimmen
    snd_pcm_hw_params_get_period_size(params, @frames, @dir);
    buffer := GetMem(size);

    while frame_index < total_frames do begin
         frames_to_write := frames;
        if total_frames - frame_index < frames then
            frames_to_write := total_frames - frame_index;

        for  i := 0 to  frames_to_write- 1 do begin
            sample := (short)(sin(2.0 * M_PI * freq * (frame_index + i) / (double)sample_rate) * 32767);

            // Stereo: links und rechts gleich
            ((short*)buffer)[2*i] = sample;
            ((short*)buffer)[2*i + 1] = sample;
        }

        rc = snd_pcm_writei(handle, buffer, frames_to_write);
        if (rc == -EPIPE) {
            fprintf(stderr, "Buffer underrun\n");
            snd_pcm_prepare(handle);
        } else if (rc < 0) {
            fprintf(stderr, "Fehler beim Schreiben: %s\n", snd_strerror(rc));
        } else if (rc != frames_to_write) {
            fprintf(stderr, "Schrieb nur %d Frames (erwartet %d)\n", rc, frames_to_write);
        }

        frame_index += frames_to_write;
    }

    free(buffer);
    snd_pcm_drain(handle);
    snd_pcm_close(handle);

    printf("Abspielen beendet\n");

  end;

begin
  main;
end.
