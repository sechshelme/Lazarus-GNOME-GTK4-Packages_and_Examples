

  {$IFDEF read_struct}
type
  PGESXmlFormatterClass = ^TGESXmlFormatterClass;
  TGESXmlFormatterClass = record
    parent: TGESBaseXmlFormatterClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_xml_formatter_get_type: TGType; cdecl; external libges;

// === Konventiert am: 28-7-26 13:21:51 ===

function GES_TYPE_XML_FORMATTER: TGType;
function GES_XML_FORMATTER(obj: Pointer): PGESXmlFormatter;
function GES_IS_XML_FORMATTER(obj: Pointer): Tgboolean;
function GES_XML_FORMATTER_CLASS(klass: Pointer): PGESXmlFormatterClass;
function GES_IS_XML_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_XML_FORMATTER_GET_CLASS(obj: Pointer): PGESXmlFormatterClass;
{$ENDIF read_function}


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
