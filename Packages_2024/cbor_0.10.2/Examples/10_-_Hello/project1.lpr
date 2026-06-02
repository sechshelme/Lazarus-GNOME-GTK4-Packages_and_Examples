program project1;


uses
  fp_cbor;

const
  path = 'test.cpor';

  procedure free(p: pointer); cdecl; external 'c';


  procedure saveConfig;
  var
    root: Pcbor_item_t;
    cp: Tcbor_pair;
    buffer: pbyte;
    buffer_size: Tsize_t;
    f: file of byte;
  begin
    root := cbor_new_indefinite_map;

    cp.key := cbor_move(cbor_build_string('username'));
    cp.value := cbor_move(cbor_build_string('tux'));
    cbor_map_add(root, cp);

    cp.key := cbor_move(cbor_build_string('port'));
    cp.value := cbor_move(cbor_build_uint32(1234));
    cbor_map_add(root, cp);

    cp.key := cbor_move(cbor_build_string('color'));
    cp.value := cbor_move(cbor_build_uint32($909080FF));
    cbor_map_add(root, cp);

    cp.key := cbor_move(cbor_build_string('float'));
    cp.value := cbor_move(cbor_build_float8(123.456));
    cbor_map_add(root, cp);

    cbor_serialize_alloc(root, @buffer, @buffer_size);

    Assign(f, path);
    Rewrite(f, 1);
    BlockWrite(f, buffer^, buffer_size);
    Close(f);

    free(buffer);
    cbor_decref(@root);
  end;

  procedure loadConfig;
  var
    buffer: pbyte;
    buffer_size: Tsize_t;
    f: file of byte;
    pairs: Pcbor_pair;
    user: pchar;
    root: Pcbor_item_t;
    result: Tcbor_load_result;
    port, color: Tuint64_t;
    fl: Double;
  begin
    Assign(f, path);
    Reset(f, 1);
    buffer_size := FileSize(f);
    buffer := Getmem(buffer_size);
    BlockRead(f, buffer^, buffer_size);
    Close(f);

    root := cbor_load(buffer, buffer_size, @result);

    pairs := cbor_map_handle(root);
    user := pchar(cbor_string_handle(pairs[0].value));
    port := cbor_get_int(pairs[1].value);
    color := cbor_get_int(pairs[2].value);
    fl := cbor_float_get_float8(pairs[3].value);

    WriteLn(#10'Gelesene Konfiguration:');
    WriteLn('Username: ', user);
    WriteLn('Port:     ', port);
    WriteLn('Color:    ', color);
    WriteLn('Float:    ', fl:6:3);

    cbor_decref(@root);

    Freemem(buffer);
  end;

  procedure main;
  begin
    saveConfig;
    loadConfig;
  end;

begin
  main;
end.
