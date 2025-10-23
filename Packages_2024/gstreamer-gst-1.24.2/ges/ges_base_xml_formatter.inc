{$IFDEF read_interface}

  {GES_DECLARE_TYPE (BaseXmlFormatter, base_xml_formatter, BASE_XML_FORMATTER); }
type
  TGESBaseXmlFormatterPrivate = record
  end;
  PGESBaseXmlFormatterPrivate = ^TGESBaseXmlFormatterPrivate;

  TGESBaseXmlFormatter = record
    parent: TGESFormatter;
    priv: PGESBaseXmlFormatterPrivate;
    xmlcontent: Pgchar;
    _ges_reserved: array[0..(GES_PADDING - 1) - 1] of Tgpointer;
  end;
  PGESBaseXmlFormatter = ^TGESBaseXmlFormatter;

  TGESBaseXmlFormatterClass = record
    parent: TGESFormatterClass;
    content_parser: TGMarkupParser;
    save: function(formatter: PGESFormatter; timeline: PGESTimeline; error: PPGError): PGString; cdecl;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESBaseXmlFormatterClass = ^TGESBaseXmlFormatterClass;

function ges_base_xml_formatter_get_type: TGType; cdecl; external libges;

// === Konventiert am: 13-12-24 16:09:33 ===

function GES_TYPE_BASE_XML_FORMATTER: TGType;
function GES_BASE_XML_FORMATTER(obj: Pointer): PGESBaseXmlFormatter;
function GES_IS_BASE_XML_FORMATTER(obj: Pointer): Tgboolean;
function GES_BASE_XML_FORMATTER_CLASS(klass: Pointer): PGESBaseXmlFormatterClass;
function GES_IS_BASE_XML_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_BASE_XML_FORMATTER_GET_CLASS(obj: Pointer): PGESBaseXmlFormatterClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_BASE_XML_FORMATTER: TGType;
begin
  Result := ges_base_xml_formatter_get_type;
end;

function GES_BASE_XML_FORMATTER(obj: Pointer): PGESBaseXmlFormatter;
begin
  Result := PGESBaseXmlFormatter(g_type_check_instance_cast(obj, GES_TYPE_BASE_XML_FORMATTER));
end;

function GES_IS_BASE_XML_FORMATTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_BASE_XML_FORMATTER);
end;

function GES_BASE_XML_FORMATTER_CLASS(klass: Pointer): PGESBaseXmlFormatterClass;
begin
  Result := PGESBaseXmlFormatterClass(g_type_check_class_cast(klass, GES_TYPE_BASE_XML_FORMATTER));
end;

function GES_IS_BASE_XML_FORMATTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_BASE_XML_FORMATTER);
end;

function GES_BASE_XML_FORMATTER_GET_CLASS(obj: Pointer): PGESBaseXmlFormatterClass;
begin
  Result := PGESBaseXmlFormatterClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
