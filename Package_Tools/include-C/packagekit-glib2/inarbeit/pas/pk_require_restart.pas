unit pk_require_restart;

interface

uses
  fp_glib2, fp_packagekit, pk_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPkRequireRestartPrivate = type Pointer;

  PPkRequireRestart = ^TPkRequireRestart;
  TPkRequireRestart = record
    parent: TPkSource;
    priv: PPkRequireRestartPrivate;
  end;

  PPkRequireRestartClass = ^TPkRequireRestartClass;
  TPkRequireRestartClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_require_restart_get_type: TGType; cdecl; external libpackagekit;
function pk_require_restart_new: PPkRequireRestart; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:13:51 ===

function PK_TYPE_REQUIRE_RESTART: TGType;
function PK_REQUIRE_RESTART(obj: Pointer): PPkRequireRestart;
function PK_REQUIRE_RESTART_CLASS(klass: Pointer): PPkRequireRestartClass;
function PK_IS_REQUIRE_RESTART(obj: Pointer): Tgboolean;
function PK_IS_REQUIRE_RESTART_CLASS(klass: Pointer): Tgboolean;
function PK_REQUIRE_RESTART_GET_CLASS(obj: Pointer): PPkRequireRestartClass;

implementation

function PK_TYPE_REQUIRE_RESTART: TGType;
begin
  PK_TYPE_REQUIRE_RESTART := pk_require_restart_get_type;
end;

function PK_REQUIRE_RESTART(obj: Pointer): PPkRequireRestart;
begin
  Result := PPkRequireRestart(g_type_check_instance_cast(obj, PK_TYPE_REQUIRE_RESTART));
end;

function PK_REQUIRE_RESTART_CLASS(klass: Pointer): PPkRequireRestartClass;
begin
  Result := PPkRequireRestartClass(g_type_check_class_cast(klass, PK_TYPE_REQUIRE_RESTART));
end;

function PK_IS_REQUIRE_RESTART(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_REQUIRE_RESTART);
end;

function PK_IS_REQUIRE_RESTART_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_REQUIRE_RESTART);
end;

function PK_REQUIRE_RESTART_GET_CLASS(obj: Pointer): PPkRequireRestartClass;
begin
  Result := PPkRequireRestartClass(PGTypeInstance(obj)^.g_class);
end;



end.
