unit bson_config;

interface

uses
  fp_bson;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  BSON_BYTE_ORDER = 1234;
  BSON_HAVE_STDBOOL_H = 1;
  BSON_OS = 1;
  BSON_HAVE_CLOCK_GETTIME = 1;
  BSON_HAVE_STRINGS_H = 1;
  BSON_HAVE_STRNLEN = 1;
  BSON_HAVE_SNPRINTF = 1;
  BSON_HAVE_GMTIME_R = 1;
  BSON_HAVE_TIMESPEC = 1;
  BSON_EXTRA_ALIGN = 1;
  BSON_HAVE_RAND_R = 1;
  BSON_HAVE_STRLCPY = 1;

  // === Konventiert am: 17-5-26 16:53:58 ===


implementation



end.
