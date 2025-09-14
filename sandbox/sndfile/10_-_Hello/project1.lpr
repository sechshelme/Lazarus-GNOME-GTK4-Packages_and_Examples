program project1;

uses
  fp_sndfile;

const
  BUFFSIZE = 1024;

  procedure main;
  var
    infile, outfile: PSNDFILE;
    sfinfo_in, sfinfo_out: TSF_INFO;
    num_read: Tsf_count_t;
    buffer: array[0..BUFFSIZE - 1] of single;
    i: Tsf_count_t;
  begin
    infile := sf_open('/home/tux/Schreibtisch/sound/test.mp3', SFM_READ, @sfinfo_in);
    if infile = nil then begin
      WriteLn('Fehler beim Öffnen der Eingabe-Datei: ', sf_strerror(infile));
      Exit;
    end;

    WriteLn('Sample rate: ', sfinfo_in.samplerate);
    WriteLn('Kanäle: ', sfinfo_in.channels);
    WriteLn('Frames: ', sfinfo_in.frames);

    sfinfo_out:=sfinfo_in;
    sfinfo_out.format:=SF_FORMAT_FLAC or SF_FORMAT_PCM_16;


    outfile := sf_open('/home/tux/Schreibtisch/sound/output.flac', SFM_WRITE, @sfinfo_out);
    if outfile = nil then begin
      WriteLn('Fehler beim Öffnen der Ausgabe-Datei: ', sf_strerror(infile));
      Exit;
    end;

    repeat
      num_read := sf_read_float(infile, buffer, BUFFSIZE);
      Write('.');
      sf_write_float(outfile, buffer, num_read);
      for i := 0 to num_read - 1 do begin
//        Write(buffer[i]: 4: 2);
      end;

    until num_read = 0;
    sf_close(infile);
    sf_close(outfile);
  end;

begin
  main;
end.
