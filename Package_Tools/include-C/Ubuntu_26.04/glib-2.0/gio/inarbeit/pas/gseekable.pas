unit gseekable;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGSeekableIface = ^TGSeekableIface;
  TGSeekableIface = record
    g_iface: TGTypeInterface;
    tell: function(seekable: PGSeekable): Tgoffset; cdecl;
    can_seek: function(seekable: PGSeekable): Tgboolean; cdecl;
    seek: function(seekable: PGSeekable; offset: Tgoffset; _type: TGSeekType; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    can_truncate: function(seekable: PGSeekable): Tgboolean; cdecl;
    truncate_fn: function(seekable: PGSeekable; offset: Tgoffset; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_seekable_get_type: TGType; cdecl; external libgio2;
function g_seekable_tell(seekable: PGSeekable): Tgoffset; cdecl; external libgio2;
function g_seekable_can_seek(seekable: PGSeekable): Tgboolean; cdecl; external libgio2;
function g_seekable_seek(seekable: PGSeekable; offset: Tgoffset; _type: TGSeekType; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_seekable_can_truncate(seekable: PGSeekable): Tgboolean; cdecl; external libgio2;
function g_seekable_truncate(seekable: PGSeekable; offset: Tgoffset; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:52:41 ===

function G_TYPE_SEEKABLE: TGType;
function G_SEEKABLE(obj: Pointer): PGSeekable;
function G_IS_SEEKABLE(obj: Pointer): Tgboolean;
function G_SEEKABLE_GET_IFACE(obj: Pointer): PGSeekableIface;
{$ENDIF read_function}

implementation

function G_TYPE_SEEKABLE: TGType;
begin
  G_TYPE_SEEKABLE := g_seekable_get_type;
end;

function G_SEEKABLE(obj: Pointer): PGSeekable;
begin
  Result := PGSeekable(g_type_check_instance_cast(obj, G_TYPE_SEEKABLE));
end;

function G_IS_SEEKABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SEEKABLE);
end;

function G_SEEKABLE_GET_IFACE(obj: Pointer): PGSeekableIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_SEEKABLE);
end;



end.
