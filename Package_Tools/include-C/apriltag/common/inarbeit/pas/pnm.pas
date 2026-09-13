unit pnm;

interface

uses
  fp_apriltag;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  PNM_FORMAT_BINARY = 4;
  PNM_FORMAT_GRAY = 5;
  PNM_FORMAT_RGB = 6;

type
  Ppnm_t = ^Tpnm_t;
  Tpnm_t = record
    width: longint;
    height: longint;
    format: longint;
    max: longint;
    buflen: Tuint32_t;
    buf: Puint8_t;
  end;


function pnm_create_from_file(path: pchar): Ppnm_t; cdecl; external libapriltag;
procedure pnm_destroy(pnm: Ppnm_t); cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:22:27 ===


implementation



end.
