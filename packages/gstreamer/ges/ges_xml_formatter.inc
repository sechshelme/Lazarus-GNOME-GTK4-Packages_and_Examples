{$IFDEF read_interface}

  {GES_DECLARE_TYPE (XmlFormatter, xml_formatter, XML_FORMATTER); }
type
  TGESXmlFormatterPrivate = record
  end;
  PGESXmlFormatterPrivate = ^TGESXmlFormatterPrivate;

  TGESXmlFormatter = record
    parent: TGESBaseXmlFormatter;
    priv: PGESXmlFormatterPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESXmlFormatter = ^TGESXmlFormatter;

  TGESXmlFormatterClass = record
    parent: TGESBaseXmlFormatterClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESXmlFormatterClass = ^TGESXmlFormatterClass;

function ges_xml_formatter_get_type: TGType; cdecl; external libges;

// === Konventiert am: 13-12-24 17:08:40 ===

function GES_TYPE_XML_FORMATTER: TGType;
function GES_XML_FORMATTER(obj: Pointer): PGESXmlFormatter;
function GES_IS_XML_FORMATTER(obj: Pointer): Tgboolean;
function GES_XML_FORMATTER_CLASS(klass: Pointer): PGESXmlFormatterClass;
function GES_IS_XML_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_XML_FORMATTER_GET_CLASS(obj: Pointer): PGESXmlFormatterClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_XML_FORMATTER: TGType;
begin
  Result := ges_xml_formatter_get_type;
end;

function GES_XML_FORMATTER(obj: Pointer): PGESXmlFormatter;
begin
  Result := PGESXmlFormatter(g_type_check_instance_cast(obj, GES_TYPE_XML_FORMATTER));
end;

function GES_IS_XML_FORMATTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_XML_FORMATTER);
end;

function GES_XML_FORMATTER_CLASS(klass: Pointer): PGESXmlFormatterClass;
begin
  Result := PGESXmlFormatterClass(g_type_check_class_cast(klass, GES_TYPE_XML_FORMATTER));
end;

function GES_IS_XML_FORMATTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_XML_FORMATTER);
end;

function GES_XML_FORMATTER_GET_CLASS(obj: Pointer): PGESXmlFormatterClass;
begin
  Result := PGESXmlFormatterClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
