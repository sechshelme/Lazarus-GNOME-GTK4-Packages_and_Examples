unit gremoteactiongroup;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGRemoteActionGroupInterface = ^TGRemoteActionGroupInterface;
  TGRemoteActionGroupInterface = record
    g_iface: TGTypeInterface;
    activate_action_full: procedure(remote: PGRemoteActionGroup; action_name: Pgchar; parameter: PGVariant; platform_data: PGVariant); cdecl;
    change_action_state_full: procedure(remote: PGRemoteActionGroup; action_name: Pgchar; value: PGVariant; platform_data: PGVariant); cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_remote_action_group_get_type: TGType; cdecl; external libgio2;
procedure g_remote_action_group_activate_action_full(remote: PGRemoteActionGroup; action_name: Pgchar; parameter: PGVariant; platform_data: PGVariant); cdecl; external libgio2;
procedure g_remote_action_group_change_action_state_full(remote: PGRemoteActionGroup; action_name: Pgchar; value: PGVariant; platform_data: PGVariant); cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:47:55 ===

function G_TYPE_REMOTE_ACTION_GROUP: TGType;
function G_REMOTE_ACTION_GROUP(obj: Pointer): PGRemoteActionGroup;
function G_IS_REMOTE_ACTION_GROUP(obj: Pointer): Tgboolean;
function G_REMOTE_ACTION_GROUP_GET_IFACE(obj: Pointer): PGRemoteActionGroupInterface;
{$ENDIF read_function}

implementation

function G_TYPE_REMOTE_ACTION_GROUP: TGType;
begin
  G_TYPE_REMOTE_ACTION_GROUP := g_remote_action_group_get_type;
end;

function G_REMOTE_ACTION_GROUP(obj: Pointer): PGRemoteActionGroup;
begin
  Result := PGRemoteActionGroup(g_type_check_instance_cast(obj, G_TYPE_REMOTE_ACTION_GROUP));
end;

function G_IS_REMOTE_ACTION_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_REMOTE_ACTION_GROUP);
end;

function G_REMOTE_ACTION_GROUP_GET_IFACE(obj: Pointer): PGRemoteActionGroupInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_REMOTE_ACTION_GROUP);
end;



end.
