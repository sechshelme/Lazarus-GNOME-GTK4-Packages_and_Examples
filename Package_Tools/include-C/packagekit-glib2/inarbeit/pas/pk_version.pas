unit pk_version;

interface

uses
  fp_glib2, fp_packagekit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  PK_MAJOR_VERSION = 1;
  PK_MINOR_VERSION = 2;
  PK_MICRO_VERSION = 8;

function PK_CHECK_VERSION(major, minor, micro: integer): boolean;

// === Konventiert am: 7-9-26 15:13:10 ===


implementation

function PK_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result := (PK_MAJOR_VERSION > major) or
    ((PK_MAJOR_VERSION = major) and (PK_MINOR_VERSION > minor)) or
    ((PK_MAJOR_VERSION = major) and (PK_MINOR_VERSION = minor) and (PK_MICRO_VERSION >= micro));
end;




end.
