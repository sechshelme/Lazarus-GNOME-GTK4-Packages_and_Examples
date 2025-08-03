program project1;

uses
  fp_unistd,
  fp_blkid;

  procedure TestDevice(device: pchar);
  var
    pr: Pblkid_probe;
    value: pchar = nil;
    i: integer;
  const
    keys: array of pchar = ('UUID', 'LABEL', 'TYPE', 'PARTUUID', 'PARTLABEL', 'VERSION', 'SEC_TYPE');

  begin
    pr := blkid_new_probe_from_filename(device);
    if pr = nil then begin
      WriteLn('blkid_new_probe_from_filename()   ', device);
      Exit;
    end;

    if blkid_do_probe(pr) <> 0 then begin
      WriteLn('Error probing device');
      blkid_free_probe(pr);
      Exit;
    end;

    WriteLn(#10'Device: ', device);
    for i := 0 to Length(keys) - 1 do begin
      value := nil;
      blkid_probe_lookup_value(pr, keys[i], @value, nil);

      if value <> nil then begin
        WriteLn('  ', keys[i], ': ', value);
      end else begin
        WriteLn('  ', keys[i], ': not found');
      end;
    end;

    blkid_free_probe(pr);
    WriteLn();
  end;

  procedure Scan_Devices;
  var
    ret: longint;
    cache: Pblkid_cache = nil;
    iter: Pblkid_dev_iterate;
    devname: pchar;
    device: Pblkid_dev;
  begin
    ret := blkid_get_cache(@cache, nil);
    if ret < 0 then begin
      WriteLn('blkid_get_cache() ', ret);
      Exit;
    end;

    blkid_probe_all(cache);



    iter := blkid_dev_iterate_begin(cache);
    if iter = nil then begin
      WriteLn('blkid_dev_iterate_begin() ');
      blkid_put_cache(cache);
      Exit;
    end;

    repeat
      ret := blkid_dev_next(iter, @device);
      if ret = 0 then begin
        devname := blkid_dev_devname(device);
        TestDevice(devname);
      end;
    until ret < 0;
  end;

begin
  if geteuid <> 0 then begin
    WriteLn('Programm muss als Root laufen');
    Halt(1);
  end;

  Scan_Devices;
end.
