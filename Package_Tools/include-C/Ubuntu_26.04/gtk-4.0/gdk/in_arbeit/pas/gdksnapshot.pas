unit gdksnapshot;

interface

uses
  fp_glib2, fp_gtk4, gdktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gdk_snapshot_get_type: TGType; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:26:20 ===

function GDK_TYPE_SNAPSHOT: TGType;
function GDK_SNAPSHOT(obj: Pointer): PGdkSnapshot;
function GDK_IS_SNAPSHOT(obj: Pointer): Tgboolean;

implementation

function GDK_TYPE_SNAPSHOT: TGType;
begin
  GDK_TYPE_SNAPSHOT := gdk_snapshot_get_type;
end;

function GDK_SNAPSHOT(obj: Pointer): PGdkSnapshot;
begin
  Result := PGdkSnapshot(g_type_check_instance_cast(obj, GDK_TYPE_SNAPSHOT));
end;

function GDK_IS_SNAPSHOT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_SNAPSHOT);
end;



end.
