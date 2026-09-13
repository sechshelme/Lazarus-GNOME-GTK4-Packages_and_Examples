unit image_types;

interface

uses
  fp_apriltag;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pimage_u8_t = ^Timage_u8_t;
  Timage_u8_t = record
    width: Tint32_t;
    height: Tint32_t;
    stride: Tint32_t;
    buf: Puint8_t;
  end;

  Pimage_u8x3_t = ^Timage_u8x3_t;
  Timage_u8x3_t = record
    width: Tint32_t;
    height: Tint32_t;
    stride: Tint32_t;
    buf: Puint8_t;
  end;

  Pimage_u8x4_t = ^Timage_u8x4_t;
  Timage_u8x4_t = record
    width: Tint32_t;
    height: Tint32_t;
    stride: Tint32_t;
    buf: Puint8_t;
  end;

  Pimage_f32_t = ^Timage_f32_t;
  Timage_f32_t = record
    width: Tint32_t;
    height: Tint32_t;
    stride: Tint32_t;
    buf: Psingle;
  end;

  Pimage_u32_t = ^Timage_u32_t;
  Timage_u32_t = record
    width: Tint32_t;
    height: Tint32_t;
    stride: Tint32_t;
    buf: Puint32_t;
  end;


  // === Konventiert am: 12-9-26 17:14:18 ===


implementation



end.
