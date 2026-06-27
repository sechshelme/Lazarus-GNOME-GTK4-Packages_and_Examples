unit gconverter;

interface

uses
  fp_glib2, giotypes, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGConverterIface = ^TGConverterIface;
  TGConverterIface = record
    g_iface: TGTypeInterface;
    convert: function(converter: PGConverter; inbuf: pointer; inbuf_size: Tgsize; outbuf: pointer; outbuf_size: Tgsize; flags: TGConverterFlags; bytes_read: Pgsize; bytes_written: Pgsize; error: PPGError): TGConverterResult; cdecl;
    reset: procedure(converter: PGConverter); cdecl;
  end;

function g_converter_get_type: TGType; cdecl; external libgio2;
function g_converter_convert(converter: PGConverter; inbuf: pointer; inbuf_size: Tgsize; outbuf: pointer; outbuf_size: Tgsize;
  flags: TGConverterFlags; bytes_read: Pgsize; bytes_written: Pgsize; error: PPGError): TGConverterResult; cdecl; external libgio2;
procedure g_converter_reset(converter: PGConverter); cdecl; external libgio2;
function g_converter_convert_bytes(converter: PGConverter; bytes: PGBytes; error: PPGError): PGBytes; cdecl; external libgio2;

// === Konventiert am: 26-6-26 16:35:51 ===

function G_TYPE_CONVERTER: TGType;
function G_CONVERTER(obj: Pointer): PGConverter;
function G_IS_CONVERTER(obj: Pointer): Tgboolean;
function G_CONVERTER_GET_IFACE(obj: Pointer): PGConverterIface;

implementation

function G_TYPE_CONVERTER: TGType;
begin
  G_TYPE_CONVERTER := g_converter_get_type;
end;

function G_CONVERTER(obj: Pointer): PGConverter;
begin
  Result := PGConverter(g_type_check_instance_cast(obj, G_TYPE_CONVERTER));
end;

function G_IS_CONVERTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_CONVERTER);
end;

function G_CONVERTER_GET_IFACE(obj: Pointer): PGConverterIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_CONVERTER);
end;



end.
