unit giversion;

interface

uses
  fp_glib2, fp_girepository;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GI_MAJOR_VERSION = 1;
  GI_MINOR_VERSION = 80;
  GI_MICRO_VERSION = 1;

function GI_CHECK_VERSION(major, minor, micro: Tguint): boolean; inline;

function gi_get_major_version: Tguint; cdecl; external libgirepository;
function gi_get_minor_version: Tguint; cdecl; external libgirepository;
function gi_get_micro_version: Tguint; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:32 ===


implementation

function GI_CHECK_VERSION(major, minor, micro: Tguint): boolean;
begin
  Result :=
    (GI_MAJOR_VERSION > major) or
    ((GI_MAJOR_VERSION = major) and (GI_MINOR_VERSION > minor)) or
    ((GI_MAJOR_VERSION = major) and (GI_MINOR_VERSION = minor) and
    (GI_MICRO_VERSION >= micro));
end;

end.
