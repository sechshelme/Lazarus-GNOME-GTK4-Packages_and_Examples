

  {$IFDEF read_struct}
type
  PGIPTosMessage = type Pointer;

  TGIPTosMessageClass = record
    parent_class: TGSocketControlMessageClass;
  end;
  PGIPTosMessageClass = ^TGIPTosMessageClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_ip_tos_message_get_type: TGType; cdecl; external libgio2;
function g_ip_tos_message_new(dscp: Tguint8; ecn: TGEcnCodePoint): PGSocketControlMessage; cdecl; external libgio2;
function g_ip_tos_message_get_dscp(message: PGIPTosMessage): Tguint8; cdecl; external libgio2;
function g_ip_tos_message_get_ecn(message: PGIPTosMessage): TGEcnCodePoint; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:35:14 ===

function G_TYPE_IP_TOS_MESSAGE: TGType;
function G_IP_TOS_MESSAGE(obj: Pointer): PGIPTosMessage;
function G_IS_IP_TOS_MESSAGE(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_IP_TOS_MESSAGE: TGType;
begin
  Result := g_ip_tos_message_get_type;
end;

function G_IP_TOS_MESSAGE(obj: Pointer): PGIPTosMessage;
begin
  Result := PGIPTosMessage(g_type_check_instance_cast(obj, G_TYPE_IP_TOS_MESSAGE));
end;

function G_IS_IP_TOS_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_IP_TOS_MESSAGE);
end;


{$ENDIF read_implementation}
