
  {$IFDEF read_enum}
const
  BSON_HOST_NAME_MAX = 255;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Pmongoc_host_list_t = ^Tmongoc_host_list_t;

  Tmongoc_host_list_t = record
    next: Pmongoc_host_list_t;
    host: array[0..(BSON_HOST_NAME_MAX + 1) - 1] of char;
    host_and_port: array[0..(BSON_HOST_NAME_MAX + 7) - 1] of char;
    port: Tuint16_t;
    family: longint;
    padding: array[0..3] of pointer;
  end;
  {$ENDIF read_struct}

  // === Konventiert am: 15-5-26 15:15:35 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
