unit mongoc_version;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  MONGOC_MAJOR_VERSION = 1;
  MONGOC_MINOR_VERSION = 26;
  MONGOC_MICRO_VERSION = 0;
  MONGOC_VERSION_S = '1.26.0';
  MONGOC_VERSION_HEX = ((MONGOC_MAJOR_VERSION shl 24) or (MONGOC_MINOR_VERSION shl 16)) or (MONGOC_MICRO_VERSION shl 8);
  {$ENDIF read_enum}

  // === Konventiert am: 15-5-26 15:14:15 ===


implementation



end.
