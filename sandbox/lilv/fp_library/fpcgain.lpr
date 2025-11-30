library fpcgain;

{$I-}

uses
  lv2,
  lv2_util,                // inline ????

  fp_lv2;

const
  GAIN_INPUT = 0;
  GAIN_OUTPUT = 1;
  GAIN_GAIN = 2;

type
  Tgain = record
    input: PSingle;
    output: PSingle;
    gain: PSingle;
  end;
  Pgain = ^Tgain;

  function instantiate(descriptor: PLV2_Descriptor; sample_rate: double; bundle_path: pchar; features: PPLV2_Feature): TLV2_Handle; cdecl;
  begin
    WriteLn('--- instantiate');
    Result := GetMem(SizeOf(Tgain));
  end;

  procedure connect_port(instance: TLV2_Handle; port: Tuint32_t; data_location: pointer); cdecl;
  var
    gain: Pgain absolute instance;
  begin
    WriteLn('--- connect_port');
    case port of
      GAIN_INPUT: begin
        gain^.input := PSingle(data_location);
      end;
      GAIN_OUTPUT: begin
        gain^.output := PSingle(data_location);
      end;
      GAIN_GAIN: begin
        gain^.gain := PSingle(data_location);
      end;
    end;
  end;

  procedure activate(instance: TLV2_Handle); cdecl;
  begin
    WriteLn('--- activate');
  end;

  procedure run(instance: TLV2_Handle; sample_count: Tuint32_t); cdecl;
  var
    gain: Pgain absolute instance;
    gain_value: single;
    i: integer;
  begin
    WriteLn('--- run');
    gain_value := gain^.gain^;
    for  i := 0 to sample_count - 1 do begin
      gain^.output[i] := gain^.input[i] * gain_value;
    end;
  end;

  procedure deactivate(instance: TLV2_Handle); cdecl;
  begin
    WriteLn('--- deactivate');
  end;

  procedure cleanup(instance: TLV2_Handle); cdecl;
  begin
    WriteLn('--- cleanup');
    Freemem(instance);
  end;

  function extension_data(uri: pchar): pointer; cdecl;
  begin
    WriteLn('--- extension_data');
    Result := nil;
  end;


  function lv2_descriptor(index: uint32): PLV2_Descriptor;
  const // muss "const" sein
    descriptor: TLV2_Descriptor = (
      URI: 'http://example.org/plugins/fpcgain';
      instantiate: @instantiate;
      connect_port: @connect_port;
      activate: @activate;
      run: @run;
      deactivate: @deactivate;
      cleanup: @cleanup;
      extension_data: @extension_data);
  begin
    if index = 0 then begin
      Result := @descriptor;
    end else begin
      Result := nil;
    end;
  end;

exports lv2_descriptor;

end.
