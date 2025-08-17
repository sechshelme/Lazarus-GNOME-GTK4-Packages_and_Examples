unit endianness;

interface

uses
  fp_lept;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$if !defined (L_BIG_ENDIAN) && !defined (L_LITTLE_ENDIAN)}
{$if 0}
{$ifdef __BIG_ENDIAN__}
{$define L_BIG_ENDIAN}
{$else}
{$define L_LITTLE_ENDIAN}
{$endif}
{$else}
{$define L_LITTLE_ENDIAN}
{$endif}
{$endif}

// === Konventiert am: 17-8-25 13:40:02 ===


implementation



end.
