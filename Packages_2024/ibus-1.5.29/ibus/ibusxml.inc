{$IFDEF read_interface}


type
  TIBusXML = record
    name: Pgchar;
    text: Pgchar;
    attributes: ^Pgchar;
    sub_nodes: PGList;
  end;
  PIBusXML = ^TIBusXML;

type
  TXMLNode = TIBusXML;
  PXMLNode = ^TXMLNode;

function ibus_xml_get_type: TGType; cdecl; external libibus;
function ibus_xml_copy(node: PXMLNode): PXMLNode; cdecl; external libibus;
function ibus_xml_parse_file(name: Pgchar): PXMLNode; cdecl; external libibus;
function ibus_xml_parse_buffer(buffer: Pgchar): PXMLNode; cdecl; external libibus;
procedure ibus_xml_free(node: PXMLNode); cdecl; external libibus;
procedure ibus_xml_output(node: PXMLNode; output: PGString); cdecl; external libibus;

// === Konventiert am: 25-7-25 17:10:06 ===

function IBUS_TYPE_XML: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_XML: TGType;
begin
  IBUS_TYPE_XML := ibus_xml_get_type;
end;



{$ENDIF read_implementation}
