/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 23-11-2024   13:43                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGUnixFDMessageClass = record
    parent_class: TGSocketControlMessageClass;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
  end;
  PGUnixFDMessageClass = ^TGUnixFDMessageClass;

  TGUnixFDMessagePrivate = record
  end;
  PGUnixFDMessagePrivate = ^TGUnixFDMessagePrivate;

  TGUnixFDMessage = record
    parent_instance: TGSocketControlMessage;
    priv: PGUnixFDMessagePrivate;
  end;
  PGUnixFDMessage = ^TGUnixFDMessage;

function g_unix_fd_message_get_type: TGType; cdecl; external libgio2;
function g_unix_fd_message_new_with_fd_list(fd_list: PGUnixFDList): PGSocketControlMessage; cdecl; external libgio2;
function g_unix_fd_message_new: PGSocketControlMessage; cdecl; external libgio2;
function g_unix_fd_message_get_fd_list(message: PGUnixFDMessage): PGUnixFDList; cdecl; external libgio2;
function g_unix_fd_message_steal_fds(message: PGUnixFDMessage; length: Pgint): Pgint; cdecl; external libgio2;
function g_unix_fd_message_append_fd(message: PGUnixFDMessage; fd: Tgint; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 20-11-24 15:19:26 ===

function G_TYPE_UNIX_FD_MESSAGE: TGType;
function G_UNIX_FD_MESSAGE(obj: Pointer): PGUnixFDMessage;
function G_UNIX_FD_MESSAGE_CLASS(klass: Pointer): PGUnixFDMessageClass;
function G_IS_UNIX_FD_MESSAGE(obj: Pointer): Tgboolean;
function G_IS_UNIX_FD_MESSAGE_CLASS(klass: Pointer): Tgboolean;
function G_UNIX_FD_MESSAGE_GET_CLASS(obj: Pointer): PGUnixFDMessageClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_UNIX_FD_MESSAGE: TGType;
begin
  G_TYPE_UNIX_FD_MESSAGE := g_unix_fd_message_get_type;
end;

function G_UNIX_FD_MESSAGE(obj: Pointer): PGUnixFDMessage;
begin
  Result := PGUnixFDMessage(g_type_check_instance_cast(obj, G_TYPE_UNIX_FD_MESSAGE));
end;

function G_UNIX_FD_MESSAGE_CLASS(klass: Pointer): PGUnixFDMessageClass;
begin
  Result := PGUnixFDMessageClass(g_type_check_class_cast(klass, G_TYPE_UNIX_FD_MESSAGE));
end;

function G_IS_UNIX_FD_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_UNIX_FD_MESSAGE);
end;

function G_IS_UNIX_FD_MESSAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_UNIX_FD_MESSAGE);
end;

function G_UNIX_FD_MESSAGE_GET_CLASS(obj: Pointer): PGUnixFDMessageClass;
begin
  Result := PGUnixFDMessageClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
