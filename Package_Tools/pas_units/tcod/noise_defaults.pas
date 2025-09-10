unit noise_defaults;

interface

uses
  fp_tcod;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  TCOD_NOISE_MAX_OCTAVES = 128;
  TCOD_NOISE_MAX_DIMENSIONS = 4;
  TCOD_NOISE_DEFAULT_HURST = 0.5;
  TCOD_NOISE_DEFAULT_LACUNARITY = 2.0;

  // === Konventiert am: 10-9-25 13:59:45 ===


implementation



end.
