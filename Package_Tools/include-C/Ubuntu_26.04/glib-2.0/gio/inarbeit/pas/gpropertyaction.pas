unit gpropertyaction;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function g_property_action_get_type: TGType; cdecl; external libgio2;
function g_property_action_new(name: Pgchar; obj: Tgpointer; property_name: Pgchar): PGPropertyAction; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:48:32 ===

function G_TYPE_PROPERTY_ACTION: TGType;
function G_PROPERTY_ACTION(obj: Pointer): PGPropertyAction;
function G_IS_PROPERTY_ACTION(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function G_TYPE_PROPERTY_ACTION: TGType;
begin
  G_TYPE_PROPERTY_ACTION := g_property_action_get_type;
end;

function G_PROPERTY_ACTION(obj: Pointer): PGPropertyAction;
begin
  Result := PGPropertyAction(g_type_check_instance_cast(obj, G_TYPE_PROPERTY_ACTION));
end;

function G_IS_PROPERTY_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_PROPERTY_ACTION);
end;



end.
