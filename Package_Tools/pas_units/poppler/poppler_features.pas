unit poppler_features;

interface

uses
  fp_glib2, fp_cairo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  POPPLER_HAS_CAIRO = 1;
  POPPLER_MAJOR_VERSION = 24;
  POPPLER_MINOR_VERSION = 2;
  POPPLER_MICRO_VERSION = 0;

function POPPLER_CHECK_VERSION(major, minor, micro: integer): boolean;

// === Konventiert am: 15-8-25 16:54:42 ===


implementation

function POPPLER_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result := (POPPLER_MAJOR_VERSION > major) or
    ((POPPLER_MAJOR_VERSION = major) and (POPPLER_MINOR_VERSION > minor)) or
    ((POPPLER_MAJOR_VERSION = major) and (POPPLER_MINOR_VERSION = minor) and (POPPLER_MICRO_VERSION >= micro));
end;


end.
