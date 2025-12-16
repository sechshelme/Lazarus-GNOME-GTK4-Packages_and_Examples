unit intfloat;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tav_intfloat32 = record
    case longint of
      0: (i: Tuint32_t);
      1: (f: single);
  end;
  Pav_intfloat32 = ^Tav_intfloat32;

  Tav_intfloat64 = record
    case longint of
      0: (i: Tuint64_t);
      1: (f: double);
  end;
  Pav_intfloat64 = ^Tav_intfloat64;

  // === Konventiert am: 14-12-25 17:31:30 ===


implementation



end.
