unit gactionmap;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGActionMapInterface = ^TGActionMapInterface;
  TGActionMapInterface = record
    g_iface: TGTypeInterface;
    lookup_action: function(action_map: PGActionMap; action_name: Pgchar): PGAction; cdecl;
    add_action: procedure(action_map: PGActionMap; action: PGAction); cdecl;
    remove_action: procedure(action_map: PGActionMap; action_name: Pgchar); cdecl;
  end;

  PGActionEntry = ^TGActionEntry;
  TGActionEntry = record
    name: Pgchar;
    activate: procedure(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
    parameter_type: Pgchar;
    state: Pgchar;
    change_state: procedure(action: PGSimpleAction; value: PGVariant; user_data: Tgpointer); cdecl;
    padding: array[0..2] of Tgsize;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_action_map_get_type: TGType; cdecl; external libgio2;
function g_action_map_lookup_action(action_map: PGActionMap; action_name: Pgchar): PGAction; cdecl; external libgio2;
procedure g_action_map_add_action(action_map: PGActionMap; action: PGAction); cdecl; external libgio2;
procedure g_action_map_remove_action(action_map: PGActionMap; action_name: Pgchar); cdecl; external libgio2;
procedure g_action_map_add_action_entries(action_map: PGActionMap; entries: PGActionEntry; n_entries: Tgint; user_data: Tgpointer); cdecl; external libgio2;
procedure g_action_map_remove_action_entries(action_map: PGActionMap; entries: PGActionEntry; n_entries: Tgint); cdecl; external libgio2;

// === Konventiert am: 26-6-26 16:29:00 ===

function G_TYPE_ACTION_MAP: TGType;
function G_ACTION_MAP(obj: Pointer): PGActionMap;
function G_IS_ACTION_MAP(obj: Pointer): Tgboolean;
function G_ACTION_MAP_GET_IFACE(obj: Pointer): PGActionMapInterface;
{$ENDIF read_function}

implementation

function G_TYPE_ACTION_MAP: TGType;
begin
  G_TYPE_ACTION_MAP := g_action_map_get_type;
end;

function G_ACTION_MAP(obj: Pointer): PGActionMap;
begin
  Result := PGActionMap(g_type_check_instance_cast(obj, G_TYPE_ACTION_MAP));
end;

function G_IS_ACTION_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_ACTION_MAP);
end;

function G_ACTION_MAP_GET_IFACE(obj: Pointer): PGActionMapInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_ACTION_MAP);
end;



end.
