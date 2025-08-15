unit poppler_date;

interface

uses
  fp_glib2, fp_cairo, fp_poppler_glib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function poppler_date_parse(date: Pgchar; timet: Ptime_t): Tgboolean; cdecl; external poppler_glib;

// === Konventiert am: 15-8-25 16:54:11 ===


implementation



end.
