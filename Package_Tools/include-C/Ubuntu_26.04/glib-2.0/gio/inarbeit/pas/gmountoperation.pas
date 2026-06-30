unit gmountoperation;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGMountOperationPrivate = type Pointer;

  PGMountOperation = ^TGMountOperation;
  TGMountOperation = record
    parent_instance: TGObject;
    priv: PGMountOperationPrivate;
  end;

  PGMountOperationClass = ^TGMountOperationClass;
  TGMountOperationClass = record
    parent_class: TGObjectClass;
    ask_password: procedure(op: PGMountOperation; message: pchar; default_user: pchar; default_domain: pchar; flags: TGAskPasswordFlags); cdecl;
    ask_question: procedure(op: PGMountOperation; message: pchar; choices: PPchar); cdecl;
    reply: procedure(op: PGMountOperation; result: TGMountOperationResult); cdecl;
    aborted: procedure(op: PGMountOperation); cdecl;
    show_processes: procedure(op: PGMountOperation; message: Pgchar; processes: PGArray; choices: PPgchar); cdecl;
    show_unmount_progress: procedure(op: PGMountOperation; message: Pgchar; time_left: Tgint64; bytes_left: Tgint64); cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
    _g_reserved7: procedure; cdecl;
    _g_reserved8: procedure; cdecl;
    _g_reserved9: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_mount_operation_get_type: TGType; cdecl; external libgio2;
function g_mount_operation_new: PGMountOperation; cdecl; external libgio2;
function g_mount_operation_get_username(op: PGMountOperation): pchar; cdecl; external libgio2;
procedure g_mount_operation_set_username(op: PGMountOperation; username: pchar); cdecl; external libgio2;
function g_mount_operation_get_password(op: PGMountOperation): pchar; cdecl; external libgio2;
procedure g_mount_operation_set_password(op: PGMountOperation; password: pchar); cdecl; external libgio2;
function g_mount_operation_get_anonymous(op: PGMountOperation): Tgboolean; cdecl; external libgio2;
procedure g_mount_operation_set_anonymous(op: PGMountOperation; anonymous: Tgboolean); cdecl; external libgio2;
function g_mount_operation_get_domain(op: PGMountOperation): pchar; cdecl; external libgio2;
procedure g_mount_operation_set_domain(op: PGMountOperation; domain: pchar); cdecl; external libgio2;
function g_mount_operation_get_password_save(op: PGMountOperation): TGPasswordSave; cdecl; external libgio2;
procedure g_mount_operation_set_password_save(op: PGMountOperation; save: TGPasswordSave); cdecl; external libgio2;
function g_mount_operation_get_choice(op: PGMountOperation): longint; cdecl; external libgio2;
procedure g_mount_operation_set_choice(op: PGMountOperation; choice: longint); cdecl; external libgio2;
procedure g_mount_operation_reply(op: PGMountOperation; result: TGMountOperationResult); cdecl; external libgio2;
function g_mount_operation_get_is_tcrypt_hidden_volume(op: PGMountOperation): Tgboolean; cdecl; external libgio2;
procedure g_mount_operation_set_is_tcrypt_hidden_volume(op: PGMountOperation; hidden_volume: Tgboolean); cdecl; external libgio2;
function g_mount_operation_get_is_tcrypt_system_volume(op: PGMountOperation): Tgboolean; cdecl; external libgio2;
procedure g_mount_operation_set_is_tcrypt_system_volume(op: PGMountOperation; system_volume: Tgboolean); cdecl; external libgio2;
function g_mount_operation_get_pim(op: PGMountOperation): Tguint; cdecl; external libgio2;
procedure g_mount_operation_set_pim(op: PGMountOperation; pim: Tguint); cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:44:31 ===

function G_TYPE_MOUNT_OPERATION: TGType;
function G_MOUNT_OPERATION(obj: Pointer): PGMountOperation;
function G_MOUNT_OPERATION_CLASS(klass: Pointer): PGMountOperationClass;
function G_IS_MOUNT_OPERATION(obj: Pointer): Tgboolean;
function G_IS_MOUNT_OPERATION_CLASS(klass: Pointer): Tgboolean;
function G_MOUNT_OPERATION_GET_CLASS(obj: Pointer): PGMountOperationClass;
{$ENDIF read_function}

implementation

function G_TYPE_MOUNT_OPERATION: TGType;
begin
  G_TYPE_MOUNT_OPERATION := g_mount_operation_get_type;
end;

function G_MOUNT_OPERATION(obj: Pointer): PGMountOperation;
begin
  Result := PGMountOperation(g_type_check_instance_cast(obj, G_TYPE_MOUNT_OPERATION));
end;

function G_MOUNT_OPERATION_CLASS(klass: Pointer): PGMountOperationClass;
begin
  Result := PGMountOperationClass(g_type_check_class_cast(klass, G_TYPE_MOUNT_OPERATION));
end;

function G_IS_MOUNT_OPERATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_MOUNT_OPERATION);
end;

function G_IS_MOUNT_OPERATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_MOUNT_OPERATION);
end;

function G_MOUNT_OPERATION_GET_CLASS(obj: Pointer): PGMountOperationClass;
begin
  Result := PGMountOperationClass(PGTypeInstance(obj)^.g_class);
end;



end.
