unit as_developer;

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAsDeveloper = record
    parent_instance: TGObject;
  end;
  PAsDeveloper = ^TAsDeveloper;

  PAsDeveloperClass = ^TAsDeveloperClass;
  TAsDeveloperClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
  end;

function as_developer_get_type: TGType; cdecl; external libappstream;
function as_developer_new: PAsDeveloper; cdecl; external libappstream;
function as_developer_get_id(devp: PAsDeveloper): Pgchar; cdecl; external libappstream;
procedure as_developer_set_id(devp: PAsDeveloper; id: Pgchar); cdecl; external libappstream;
function as_developer_get_name(devp: PAsDeveloper): Pgchar; cdecl; external libappstream;
procedure as_developer_set_name(devp: PAsDeveloper; value: Pgchar; locale: Pgchar); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:36:09 ===

function AS_TYPE_DEVELOPER: TGType;
function AS_DEVELOPER(obj: Pointer): PAsDeveloper;
function AS_IS_DEVELOPER(obj: Pointer): Tgboolean;
function AS_DEVELOPER_CLASS(klass: Pointer): PAsDeveloperClass;
function AS_IS_DEVELOPER_CLASS(klass: Pointer): Tgboolean;
function AS_DEVELOPER_GET_CLASS(obj: Pointer): PAsDeveloperClass;

implementation

function AS_TYPE_DEVELOPER: TGType;
begin
  Result := as_developer_get_type;
end;

function AS_DEVELOPER(obj: Pointer): PAsDeveloper;
begin
  Result := PAsDeveloper(g_type_check_instance_cast(obj, AS_TYPE_DEVELOPER));
end;

function AS_IS_DEVELOPER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_DEVELOPER);
end;

function AS_DEVELOPER_CLASS(klass: Pointer): PAsDeveloperClass;
begin
  Result := PAsDeveloperClass(g_type_check_class_cast(klass, AS_TYPE_DEVELOPER));
end;

function AS_IS_DEVELOPER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_DEVELOPER);
end;

function AS_DEVELOPER_GET_CLASS(obj: Pointer): PAsDeveloperClass;
begin
  Result := PAsDeveloperClass(PGTypeInstance(obj)^.g_class);
end;

end.
