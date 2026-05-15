unit mongoc_host_list;

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  BSON_HOST_NAME_MAX = 255;

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

  // === Konventiert am: 15-5-26 15:15:35 ===


implementation



end.
