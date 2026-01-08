unit magick_config;

interface

uses
  fp_magiccore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$ifdef windows}
const
  MAGICKCORE_DIR_SEPARATOR_CHAR = '\\';
  MAGICKCORE_DIR_SEPARATOR = '\\';
  MAGICKCORE_PATH_SEPARATOR_CHAR = ';';
  MAGICKCORE_PATH_SEPARATOR = ';';
  {$endif}

  {$ifdef linux}
const
  MAGICKCORE_DIR_SEPARATOR_CHAR = '/';
  MAGICKCORE_DIR_SEPARATOR = '/';
  MAGICKCORE_PATH_SEPARATOR_CHAR = ':';
  MAGICKCORE_PATH_SEPARATOR = ':';
  {$endif}

  // === Konventiert am: 6-1-26 14:27:07 ===


implementation



end.
