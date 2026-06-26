unit gvalue;

interface

uses
  fp_glib2, gtype;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGValueTransform = procedure(src_value: PGValue; dest_value: PGValue); cdecl;

function g_value_init(value: PGValue; g_type: TGType): PGValue; cdecl; external libgobject2_0;
procedure g_value_copy(src_value: PGValue; dest_value: PGValue); cdecl; external libgobject2_0;
function g_value_reset(value: PGValue): PGValue; cdecl; external libgobject2_0;
procedure g_value_unset(value: PGValue); cdecl; external libgobject2_0;
procedure g_value_set_instance(value: PGValue; instance: Tgpointer); cdecl; external libgobject2_0;
procedure g_value_init_from_instance(value: PGValue; instance: Tgpointer); cdecl; external libgobject2_0;

function g_value_fits_pointer(value: PGValue): Tgboolean; cdecl; external libgobject2_0;
function g_value_peek_pointer(value: PGValue): Tgpointer; cdecl; external libgobject2_0;

function g_value_type_compatible(src_type: TGType; dest_type: TGType): Tgboolean; cdecl; external libgobject2_0;
function g_value_type_transformable(src_type: TGType; dest_type: TGType): Tgboolean; cdecl; external libgobject2_0;
function g_value_transform(src_value: PGValue; dest_value: PGValue): Tgboolean; cdecl; external libgobject2_0;
procedure g_value_register_transform_func(src_type: TGType; dest_type: TGType; transform_func: TGValueTransform); cdecl; external libgobject2_0;

const
  G_VALUE_NOCOPY_CONTENTS = 1 shl 27;
  G_VALUE_INTERNED_STRING = 1 shl 28;

  G_VALUE_INIT_: TGValue = (g_type: 0; Data: ((v_int: 0), (v_int: 0)));

function G_TYPE_IS_VALUE(_type: TGType): Tgboolean;
function G_IS_VALUE(Value: PGValue): Tgboolean;
function G_VALUE_TYPE(Value: PGValue): TGType;
function G_VALUE_TYPE_NAME(Value: PGValue): Pgchar;
function G_VALUE_HOLDS(Value: PGValue; _type: TGType): Tgboolean;

// === Konventiert am: 25-6-26 15:14:39 ===


implementation


function G_TYPE_IS_VALUE(_type: TGType): Tgboolean;
begin
  G_TYPE_IS_VALUE := g_type_check_is_value_type(_type);
end;

function G_IS_VALUE(Value: PGValue): Tgboolean;
begin
  G_IS_VALUE := g_type_check_value(Value);
end;

function G_VALUE_TYPE(Value: PGValue): TGType;
begin
  G_VALUE_TYPE := (PGValue(Value))^.g_type;
end;

function G_VALUE_TYPE_NAME(Value: PGValue): Pgchar;
begin
  G_VALUE_TYPE_NAME := g_type_name(G_VALUE_TYPE(Value));
end;

function G_VALUE_HOLDS(Value: PGValue; _type: TGType): Tgboolean;
begin
  G_VALUE_HOLDS := g_type_check_value_holds(Value, _type);
end;

end.
