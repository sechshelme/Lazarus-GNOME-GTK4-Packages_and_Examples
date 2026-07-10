
  {$IFDEF read_enum}
type
  PGtkAccessiblePlatformState = ^TGtkAccessiblePlatformState;
  TGtkAccessiblePlatformState = longint;
const
  GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSABLE = 0;
  GTK_ACCESSIBLE_PLATFORM_STATE_FOCUSED = 1;
  GTK_ACCESSIBLE_PLATFORM_STATE_ACTIVE = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkAccessible = type Pointer;
  PPGtkAccessible = ^PGtkAccessible;

  PGtkAccessibleInterface = ^TGtkAccessibleInterface;
  TGtkAccessibleInterface = record
    g_iface: TGTypeInterface;
    get_at_context: function(self: PGtkAccessible): PGtkATContext; cdecl;
    get_platform_state: function(self: PGtkAccessible; state: TGtkAccessiblePlatformState): Tgboolean; cdecl;
    get_accessible_parent: function(self: PGtkAccessible): PGtkAccessible; cdecl;
    get_first_accessible_child: function(self: PGtkAccessible): PGtkAccessible; cdecl;
    get_next_accessible_sibling: function(self: PGtkAccessible): PGtkAccessible; cdecl;
    get_bounds: function(self: PGtkAccessible; x: Plongint; y: Plongint; width: Plongint; height: Plongint): Tgboolean; cdecl;
    get_accessible_id: function(self: PGtkAccessible): pchar; cdecl;
  end;

  PGtkAccessibleList = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_accessible_get_type: TGType; cdecl; external libgtk4;
function gtk_accessible_get_at_context(self: PGtkAccessible): PGtkATContext; cdecl; external libgtk4;
function gtk_accessible_get_platform_state(self: PGtkAccessible; state: TGtkAccessiblePlatformState): Tgboolean; cdecl; external libgtk4;
function gtk_accessible_get_accessible_parent(self: PGtkAccessible): PGtkAccessible; cdecl; external libgtk4;
procedure gtk_accessible_set_accessible_parent(self: PGtkAccessible; parent: PGtkAccessible; next_sibling: PGtkAccessible); cdecl; external libgtk4;
function gtk_accessible_get_first_accessible_child(self: PGtkAccessible): PGtkAccessible; cdecl; external libgtk4;
function gtk_accessible_get_next_accessible_sibling(self: PGtkAccessible): PGtkAccessible; cdecl; external libgtk4;
procedure gtk_accessible_update_next_accessible_sibling(self: PGtkAccessible; new_sibling: PGtkAccessible); cdecl; external libgtk4;
function gtk_accessible_get_bounds(self: PGtkAccessible; x: Plongint; y: Plongint; width: Plongint; height: Plongint): Tgboolean; cdecl; external libgtk4;
function gtk_accessible_get_accessible_id(self: PGtkAccessible): pchar; cdecl; external libgtk4;
function gtk_accessible_get_accessible_role(self: PGtkAccessible): TGtkAccessibleRole; cdecl; external libgtk4;
procedure gtk_accessible_update_state(self: PGtkAccessible; first_state: TGtkAccessibleState; args: array of const); cdecl; external libgtk4;
procedure gtk_accessible_update_state(self: PGtkAccessible; first_state: TGtkAccessibleState); cdecl; external libgtk4;
procedure gtk_accessible_update_property(self: PGtkAccessible; first_property: TGtkAccessibleProperty; args: array of const); cdecl; external libgtk4;
procedure gtk_accessible_update_property(self: PGtkAccessible; first_property: TGtkAccessibleProperty); cdecl; external libgtk4;
procedure gtk_accessible_update_relation(self: PGtkAccessible; first_relation: TGtkAccessibleRelation; args: array of const); cdecl; external libgtk4;
procedure gtk_accessible_update_relation(self: PGtkAccessible; first_relation: TGtkAccessibleRelation); cdecl; external libgtk4;
procedure gtk_accessible_update_state_value(self: PGtkAccessible; n_states: longint; states: PGtkAccessibleState; values: PGValue); cdecl; external libgtk4;
procedure gtk_accessible_update_property_value(self: PGtkAccessible; n_properties: longint; properties: PGtkAccessibleProperty; values: PGValue); cdecl; external libgtk4;
procedure gtk_accessible_update_relation_value(self: PGtkAccessible; n_relations: longint; relations: PGtkAccessibleRelation; values: PGValue); cdecl; external libgtk4;
procedure gtk_accessible_reset_state(self: PGtkAccessible; state: TGtkAccessibleState); cdecl; external libgtk4;
procedure gtk_accessible_reset_property(self: PGtkAccessible; _property: TGtkAccessibleProperty); cdecl; external libgtk4;
procedure gtk_accessible_reset_relation(self: PGtkAccessible; relation: TGtkAccessibleRelation); cdecl; external libgtk4;
procedure gtk_accessible_state_init_value(state: TGtkAccessibleState; value: PGValue); cdecl; external libgtk4;
procedure gtk_accessible_property_init_value(_property: TGtkAccessibleProperty; value: PGValue); cdecl; external libgtk4;
procedure gtk_accessible_relation_init_value(relation: TGtkAccessibleRelation; value: PGValue); cdecl; external libgtk4;

function gtk_accessible_list_get_type: TGType; cdecl; external libgtk4;
function gtk_accessible_list_get_objects(accessible_list: PGtkAccessibleList): PGList; cdecl; external libgtk4;
function gtk_accessible_list_new_from_list(list: PGList): PGtkAccessibleList; cdecl; external libgtk4;
function gtk_accessible_list_new_from_array(accessibles: PPGtkAccessible; n_accessibles: Tgsize): PGtkAccessibleList; cdecl; external libgtk4;
procedure gtk_accessible_announce(self: PGtkAccessible; message: pchar; priority: TGtkAccessibleAnnouncementPriority); cdecl; external libgtk4;
procedure gtk_accessible_update_platform_state(self: PGtkAccessible; state: TGtkAccessiblePlatformState); cdecl; external libgtk4;

function GTK_ACCESSIBLE_LIST: TGType;

// === Konventiert am: 5-7-26 16:29:04 ===

function GTK_TYPE_ACCESSIBLE: TGType;
function GTK_ACCESSIBLE(obj: Pointer): PGtkAccessible;
function GTK_IS_ACCESSIBLE(obj: Pointer): Tgboolean;
function GTK_ACCESSIBLE_GET_IFACE(obj: Pointer): PGtkAccessibleInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_ACCESSIBLE: TGType;
begin
  Result := gtk_accessible_get_type;
end;

function GTK_ACCESSIBLE(obj: Pointer): PGtkAccessible;
begin
  Result := PGtkAccessible(g_type_check_instance_cast(obj, GTK_TYPE_ACCESSIBLE));
end;

function GTK_IS_ACCESSIBLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ACCESSIBLE);
end;

function GTK_ACCESSIBLE_GET_IFACE(obj: Pointer): PGtkAccessibleInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_ACCESSIBLE);
end;


function GTK_ACCESSIBLE_LIST: TGType;
begin
  GTK_ACCESSIBLE_LIST := gtk_accessible_list_get_type;
end;


{$ENDIF read_implementation}
