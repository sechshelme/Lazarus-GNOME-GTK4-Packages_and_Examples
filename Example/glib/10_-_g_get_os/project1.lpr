program project1;

uses
  ctypes,
  fp_glib2;

  procedure print_OS_Info;
  type
    TOsInfoKey = record
    Key: pchar;
    Name: pchar;
  end;

  const
    OsInfoKeys: array[0..10] of TOsInfoKey = (
      (Key: G_OS_INFO_KEY_NAME; Name: 'NAME'),
      (Key: G_OS_INFO_KEY_PRETTY_NAME; Name: 'PRETTY_NAME'),
      (Key: G_OS_INFO_KEY_VERSION; Name: 'VERSION'),
      (Key: G_OS_INFO_KEY_VERSION_CODENAME; Name: 'VERSION_CODENAME'),
      (Key: G_OS_INFO_KEY_VERSION_ID; Name: 'VERSION_ID'),
      (Key: G_OS_INFO_KEY_ID; Name: 'ID'),
      (Key: G_OS_INFO_KEY_HOME_URL; Name: 'HOME_URL'),
      (Key: G_OS_INFO_KEY_DOCUMENTATION_URL; Name: 'DOCUMENTATION_URL'),
      (Key: G_OS_INFO_KEY_SUPPORT_URL; Name: 'SUPPORT_URL'),
      (Key: G_OS_INFO_KEY_BUG_REPORT_URL; Name: 'BUG_REPORT_URL'),
      (Key: G_OS_INFO_KEY_PRIVACY_POLICY_URL; Name: 'PRIVACY_POLICY_URL'));

  var
    osInfo: pchar;
    i: integer;
  begin
    for i := Low(OsInfoKeys) to High(OsInfoKeys) do begin
      osInfo := g_get_os_info(OsInfoKeys[i].Key);
      if osInfo <> nil then begin
        g_print('%-20s: %s'#10, OsInfoKeys[i].Name, osInfo);
        g_free(osInfo);
      end else begin
        g_print('%-20s: Not available'#10, OsInfoKeys[i].Name);
      end;
    end;
  end;

  procedure print_g_get;
  type
    TInfoItem = record
    Description: Pgchar;
    Func: function: Pgchar; cdecl;
  end;

  const
    InfoItems: array[0..5] of TInfoItem = (
      (Description: 'Hostname'; Func: @g_get_host_name),
      (Description: 'Username'; Func: @g_get_user_name),
      (Description: 'Real Name'; Func: @g_get_real_name),
      (Description: 'Home Directory'; Func: @g_get_home_dir),
      (Description: 'Temporary Directory'; Func: @g_get_tmp_dir),
      (Description: 'Current Directory'; Func: @g_get_current_dir));

  var
    Value: Pgchar;
    i: integer;
  begin
    for i := Low(InfoItems) to High(InfoItems) do begin
      Value := InfoItems[i].Func();
      g_print('%-20s: %s'#10, InfoItems[i].Description, Value);
      if Value <> nil then begin
        g_free(Value);
      end;
    end;
  end;

procedure print_Sysinfo;
begin
  if G_BYTE_ORDER = G_LITTLE_ENDIAN then  begin
    g_print('System ist little-endian.'#10);
  end else begin
    g_print('System ist big-endian.'#10);
  end;
end;

type
  TTest = bitpacked record
    case integer of
      0: (v_float: single);
      1: (mpn: bitpacked record
          mantissa: 0..(1 shl 23) - 1;       // 23 bits
          biased_exponent: 0..(1 shl 8) - 1; //  8 bits
          sign: 0..1;                        //  1 bit
          end);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    f:TTest;
  begin
    print_OS_Info;
    g_print(#10#10);
    print_g_get;
    g_print(#10#10);
    print_Sysinfo;
    g_print(#10#10);

    f.v_float:=11.11;
    f.mpn.sign:=0;
    WriteLn(f.v_float);
    WriteLn(f.v_float:8:4);

    f.v_float:=11.11;
    f.mpn.sign:=0;
    f.mpn.mantissa:=0;
    f.mpn.biased_exponent:=7;
    WriteLn(f.v_float);
    WriteLn(f.v_float:8:4);
    WriteLn('-------');
    WriteLn(SizeOf(TGFloatIEEE754));
    WriteLn(SizeOf(Single));

    WriteLn(SizeOf(TTest));
    WriteLn(SizeOf(Single));
  end;

begin
  main(argc, argv);
end.
