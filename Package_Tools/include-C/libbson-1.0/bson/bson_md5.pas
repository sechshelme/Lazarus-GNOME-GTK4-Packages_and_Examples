unit bson_md5;

interface

uses
  fp_bson;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tbson_md5_t = record
    count: array[0..1] of Tuint32_t;
    abcd: array[0..3] of Tuint32_t;
    buf: array[0..63] of Tuint8_t;
  end;
  Pbson_md5_t = ^Tbson_md5_t;

procedure bson_md5_init(pms: Pbson_md5_t); cdecl; external libbson; deprecated;
procedure bson_md5_append(pms: Pbson_md5_t; data: Puint8_t; nbytes: Tuint32_t); cdecl; external libbson; deprecated;
procedure bson_md5_finish(pms: Pbson_md5_t; digest: Puint8_t); cdecl; external libbson; deprecated;

// === Konventiert am: 17-5-26 16:53:41 ===


implementation



end.
