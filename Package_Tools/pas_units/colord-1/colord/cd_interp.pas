unit cd_interp;

interface

uses
  fp_glib2, fp_colord;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  PCdInterpError = ^TCdInterpError;
  TCdInterpError = longint;

const
  CD_INTERP_ERROR_FAILED = 0;
  CD_INTERP_ERROR_LAST = 1;

type
  PCdInterpKind = ^TCdInterpKind;
  TCdInterpKind = longint;

const
  CD_INTERP_KIND_LINEAR = 0;
  CD_INTERP_KIND_AKIMA = 1;
  CD_INTERP_KIND_LAST = 2;

type
  TCdInterp = record
    parent_instance: TGObject;
  end;
  PCdInterp = ^TCdInterp;

  TCdInterpClass = record
    parent_class: TGObjectClass;
    prepare: function(interp: PCdInterp; error: PPGError): Tgboolean; cdecl;
    eval: function(interp: PCdInterp; value: Tgdouble; error: PPGError): Tgdouble; cdecl;
    _cd_interp_reserved1: procedure; cdecl;
    _cd_interp_reserved2: procedure; cdecl;
    _cd_interp_reserved3: procedure; cdecl;
    _cd_interp_reserved4: procedure; cdecl;
    _cd_interp_reserved5: procedure; cdecl;
    _cd_interp_reserved6: procedure; cdecl;
    _cd_interp_reserved7: procedure; cdecl;
    _cd_interp_reserved8: procedure; cdecl;
  end;
  PCdInterpClass = ^TCdInterpClass;

function cd_interp_get_type: TGType; cdecl; external libcolord;
function cd_interp_error_quark: TGQuark; cdecl; external libcolord;
function cd_interp_get_kind(interp: PCdInterp): TCdInterpKind; cdecl; external libcolord;
function cd_interp_get_x(interp: PCdInterp): PGArray; cdecl; external libcolord;
function cd_interp_get_y(interp: PCdInterp): PGArray; cdecl; external libcolord;
function cd_interp_get_size(interp: PCdInterp): Tguint; cdecl; external libcolord;
procedure cd_interp_insert(interp: PCdInterp; x: Tgdouble; y: Tgdouble); cdecl; external libcolord;
function cd_interp_prepare(interp: PCdInterp; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_interp_eval(interp: PCdInterp; value: Tgdouble; error: PPGError): Tgdouble; cdecl; external libcolord;
function cd_interp_kind_to_string(kind: TCdInterpKind): Pgchar; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:07:48 ===

function CD_TYPE_INTERP: TGType;
function CD_INTERP(obj: Pointer): PCdInterp;
function CD_IS_INTERP(obj: Pointer): Tgboolean;
function CD_INTERP_CLASS(klass: Pointer): PCdInterpClass;
function CD_IS_INTERP_CLASS(klass: Pointer): Tgboolean;
function CD_INTERP_GET_CLASS(obj: Pointer): PCdInterpClass;

implementation

function CD_TYPE_INTERP: TGType;
begin
  Result := cd_interp_get_type;
end;

function CD_INTERP(obj: Pointer): PCdInterp;
begin
  Result := PCdInterp(g_type_check_instance_cast(obj, CD_TYPE_INTERP));
end;

function CD_IS_INTERP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_INTERP);
end;

function CD_INTERP_CLASS(klass: Pointer): PCdInterpClass;
begin
  Result := PCdInterpClass(g_type_check_class_cast(klass, CD_TYPE_INTERP));
end;

function CD_IS_INTERP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_INTERP);
end;

function CD_INTERP_GET_CLASS(obj: Pointer): PCdInterpClass;
begin
  Result := PCdInterpClass(PGTypeInstance(obj)^.g_class);
end;


end.
