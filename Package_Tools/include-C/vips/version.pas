unit version;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  VIPS_VERSION = '8.15.1';
  VIPS_VERSION_STRING = '8.15.1';
  VIPS_MAJOR_VERSION = 8;
  VIPS_MINOR_VERSION = 15;
  VIPS_MICRO_VERSION = 1;
  VIPS_LIBRARY_CURRENT = 59;
  VIPS_LIBRARY_REVISION = 1;
  VIPS_LIBRARY_AGE = 17;
  VIPS_ENABLE_DEPRECATED = 1;
  {$ENDIF read_enum}

  // === Konventiert am: 26-4-26 16:08:18 ===


implementation



end.
