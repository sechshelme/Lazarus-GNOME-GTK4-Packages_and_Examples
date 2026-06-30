unit gipv6tclassmessage;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, gioenums, gsocketcontrolmessage;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGIPv6TclassMessage = type Pointer;

  TGIPv6TclassMessageClass = record
    parent_class: TGSocketControlMessageClass;
  end;
  PGIPv6TclassMessageClass = ^TGIPv6TclassMessageClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_ipv6_tclass_message_get_type: TGType; cdecl; external libgio2;
function g_ipv6_tclass_message_new(dscp: Tguint8; ecn: TGEcnCodePoint): PGSocketControlMessage; cdecl; external libgio2;
function g_ipv6_tclass_message_get_dscp(message: PGIPv6TclassMessage): Tguint8; cdecl; external libgio2;
function g_ipv6_tclass_message_get_ecn(message: PGIPv6TclassMessage): TGEcnCodePoint; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:35:18 ===

function G_TYPE_IPV6_TCLASS_MESSAGE: TGType;
function G_IPV6_TCLASS_MESSAGE(obj: Pointer): PGIPv6TclassMessage;
function G_IS_IPV6_TCLASS_MESSAGE(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function G_TYPE_IPV6_TCLASS_MESSAGE: TGType;
begin
  Result := g_ipv6_tclass_message_get_type;
end;

function G_IPV6_TCLASS_MESSAGE(obj: Pointer): PGIPv6TclassMessage;
begin
  Result := PGIPv6TclassMessage(g_type_check_instance_cast(obj, G_TYPE_IPV6_TCLASS_MESSAGE));
end;

function G_IS_IPV6_TCLASS_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_IPV6_TCLASS_MESSAGE);
end;


end.
