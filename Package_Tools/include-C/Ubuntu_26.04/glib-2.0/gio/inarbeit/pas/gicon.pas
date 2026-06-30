unit gicon;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGIconIface = ^TGIconIface;
  TGIconIface = record
    g_iface: TGTypeInterface;
    hash: function(icon: PGIcon): Tguint; cdecl;
    equal: function(icon1: PGIcon; icon2: PGIcon): Tgboolean; cdecl;
    to_tokens: function(icon: PGIcon; tokens: PGPtrArray; out_version: Pgint): Tgboolean; cdecl;
    from_tokens: function(tokens: PPgchar; num_tokens: Tgint; version: Tgint; error: PPGError): PGIcon; cdecl;
    serialize: function(icon: PGIcon): PGVariant; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_icon_get_type: TGType; cdecl; external libgio2;
function g_icon_hash(icon: Tgconstpointer): Tguint; cdecl; external libgio2;
function g_icon_equal(icon1: PGIcon; icon2: PGIcon): Tgboolean; cdecl; external libgio2;
function g_icon_to_string(icon: PGIcon): Pgchar; cdecl; external libgio2;
function g_icon_new_for_string(str: Pgchar; error: PPGError): PGIcon; cdecl; external libgio2;
function g_icon_serialize(icon: PGIcon): PGVariant; cdecl; external libgio2;
function g_icon_deserialize(value: PGVariant): PGIcon; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:26:23 ===

function G_TYPE_ICON: TGType;
function G_ICON(obj: Pointer): PGIcon;
function G_IS_ICON(obj: Pointer): Tgboolean;
function G_ICON_GET_IFACE(obj: Pointer): PGIconIface;
{$ENDIF read_function}

implementation

function G_TYPE_ICON: TGType;
begin
  G_TYPE_ICON := g_icon_get_type;
end;

function G_ICON(obj: Pointer): PGIcon;
begin
  Result := PGIcon(g_type_check_instance_cast(obj, G_TYPE_ICON));
end;

function G_IS_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_ICON);
end;

function G_ICON_GET_IFACE(obj: Pointer): PGIconIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_ICON);
end;



end.
