unit pk_enum_types;

interface

uses
  fp_glib2, fp_packagekit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function pk_client_error_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_CLIENT_ERROR: TGType;

function pk_control_error_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_CONTROL_ERROR: TGType;

function pk_role_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_ROLE_ENUM: TGType;

function pk_status_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_STATUS_ENUM: TGType;

function pk_exit_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_EXIT_ENUM: TGType;

function pk_network_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_NETWORK_ENUM: TGType;

function pk_filter_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_FILTER_ENUM: TGType;

function pk_restart_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_RESTART_ENUM: TGType;

function pk_error_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_ERROR_ENUM: TGType;

function pk_group_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_GROUP_ENUM: TGType;

function pk_update_state_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_UPDATE_STATE_ENUM: TGType;

function pk_info_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_INFO_ENUM: TGType;

function pk_distro_upgrade_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_DISTRO_UPGRADE_ENUM: TGType;

function pk_sig_type_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_SIG_TYPE_ENUM: TGType;

function pk_media_type_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_MEDIA_TYPE_ENUM: TGType;

function pk_authorize_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_AUTHORIZE_ENUM: TGType;

function pk_upgrade_kind_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_UPGRADE_KIND_ENUM: TGType;

function pk_transaction_flag_enum_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_TRANSACTION_FLAG_ENUM: TGType;

function pk_offline_action_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_OFFLINE_ACTION: TGType;

function pk_offline_error_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_OFFLINE_ERROR: TGType;

function pk_offline_flags_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_OFFLINE_FLAGS: TGType;

function pk_package_sack_sort_type_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_PACKAGE_SACK_SORT_TYPE: TGType;

function pk_progress_type_get_type: TGType; cdecl; external libpackagekit;
function PK_TYPE_PROGRESS_TYPE: TGType;


// === Konventiert am: 7-9-26 15:08:54 ===


implementation


function PK_TYPE_CLIENT_ERROR: TGType;
begin
  PK_TYPE_CLIENT_ERROR := pk_client_error_get_type;
end;

function PK_TYPE_CONTROL_ERROR: TGType;
begin
  PK_TYPE_CONTROL_ERROR := pk_control_error_get_type;
end;

function PK_TYPE_ROLE_ENUM: TGType;
begin
  PK_TYPE_ROLE_ENUM := pk_role_enum_get_type;
end;

function PK_TYPE_STATUS_ENUM: TGType;
begin
  PK_TYPE_STATUS_ENUM := pk_status_enum_get_type;
end;

function PK_TYPE_EXIT_ENUM: TGType;
begin
  PK_TYPE_EXIT_ENUM := pk_exit_enum_get_type;
end;

function PK_TYPE_NETWORK_ENUM: TGType;
begin
  PK_TYPE_NETWORK_ENUM := pk_network_enum_get_type;
end;

function PK_TYPE_FILTER_ENUM: TGType;
begin
  PK_TYPE_FILTER_ENUM := pk_filter_enum_get_type;
end;

function PK_TYPE_RESTART_ENUM: TGType;
begin
  PK_TYPE_RESTART_ENUM := pk_restart_enum_get_type;
end;

function PK_TYPE_ERROR_ENUM: TGType;
begin
  PK_TYPE_ERROR_ENUM := pk_error_enum_get_type;
end;

function PK_TYPE_GROUP_ENUM: TGType;
begin
  PK_TYPE_GROUP_ENUM := pk_group_enum_get_type;
end;

function PK_TYPE_UPDATE_STATE_ENUM: TGType;
begin
  PK_TYPE_UPDATE_STATE_ENUM := pk_update_state_enum_get_type;
end;

function PK_TYPE_INFO_ENUM: TGType;
begin
  PK_TYPE_INFO_ENUM := pk_info_enum_get_type;
end;

function PK_TYPE_DISTRO_UPGRADE_ENUM: TGType;
begin
  PK_TYPE_DISTRO_UPGRADE_ENUM := pk_distro_upgrade_enum_get_type;
end;

function PK_TYPE_SIG_TYPE_ENUM: TGType;
begin
  PK_TYPE_SIG_TYPE_ENUM := pk_sig_type_enum_get_type;
end;

function PK_TYPE_MEDIA_TYPE_ENUM: TGType;
begin
  PK_TYPE_MEDIA_TYPE_ENUM := pk_media_type_enum_get_type;
end;

function PK_TYPE_AUTHORIZE_ENUM: TGType;
begin
  PK_TYPE_AUTHORIZE_ENUM := pk_authorize_enum_get_type;
end;

function PK_TYPE_UPGRADE_KIND_ENUM: TGType;
begin
  PK_TYPE_UPGRADE_KIND_ENUM := pk_upgrade_kind_enum_get_type;
end;

function PK_TYPE_TRANSACTION_FLAG_ENUM: TGType;
begin
  PK_TYPE_TRANSACTION_FLAG_ENUM := pk_transaction_flag_enum_get_type;
end;

function PK_TYPE_OFFLINE_ACTION: TGType;
begin
  PK_TYPE_OFFLINE_ACTION := pk_offline_action_get_type;
end;

function PK_TYPE_OFFLINE_ERROR: TGType;
begin
  PK_TYPE_OFFLINE_ERROR := pk_offline_error_get_type;
end;

function PK_TYPE_OFFLINE_FLAGS: TGType;
begin
  PK_TYPE_OFFLINE_FLAGS := pk_offline_flags_get_type;
end;

function PK_TYPE_PACKAGE_SACK_SORT_TYPE: TGType;
begin
  PK_TYPE_PACKAGE_SACK_SORT_TYPE := pk_package_sack_sort_type_get_type;
end;

function PK_TYPE_PROGRESS_TYPE: TGType;
begin
  PK_TYPE_PROGRESS_TYPE := pk_progress_type_get_type;
end;


end.
