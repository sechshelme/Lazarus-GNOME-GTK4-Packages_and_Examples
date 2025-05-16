unit eina_simple_xml_parser;

interface

uses
  ctypes, efl, eina_types, eina_inlist;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEina_Simple_XML_Node_Type = ^TEina_Simple_XML_Node_Type;
  TEina_Simple_XML_Node_Type = longint;

const
  EINA_SIMPLE_XML_NODE_ROOT = 0;
  EINA_SIMPLE_XML_NODE_TAG = 1;
  EINA_SIMPLE_XML_NODE_DATA = 2;
  EINA_SIMPLE_XML_NODE_CDATA = 3;
  EINA_SIMPLE_XML_NODE_PROCESSING = 4;
  EINA_SIMPLE_XML_NODE_DOCTYPE = 5;
  EINA_SIMPLE_XML_NODE_COMMENT = 6;
  EINA_SIMPLE_XML_NODE_DOCTYPE_CHILD = 7;

type
  PEina_Simple_XML_Node_Tag = ^TEina_Simple_XML_Node_Tag;

  TEina_Simple_XML_Attribute = record
    __in_list: TEina_Inlist;
    parent: PEina_Simple_XML_Node_Tag;
    key: pchar;
    value: pchar;
  end;
  PEina_Simple_XML_Attribute = ^TEina_Simple_XML_Attribute;

  PEina_Simple_XML_Node = ^TEina_Simple_XML_Node;

  TEina_Simple_XML_Node = record
    __in_list: TEina_Inlist;
    parent: PEina_Simple_XML_Node_Tag;
    _type: TEina_Simple_XML_Node_Type;
  end;

  TEina_Simple_XML_Node_Tag = record
    base: TEina_Simple_XML_Node;
    children: PEina_Inlist;
    attributes: PEina_Inlist;
    name: pchar;
  end;

  PEina_Simple_XML_Node_Data = ^TEina_Simple_XML_Node_Data;

  TEina_Simple_XML_Node_Data = record
    base: TEina_Simple_XML_Node;
    length: Tsize_t;
    data: pchar;
  end;

  TEina_Simple_XML_Node_Root = TEina_Simple_XML_Node_Tag;
  PEina_Simple_XML_Node_Root = ^TEina_Simple_XML_Node_Root;
  TEina_Simple_XML_Node_CData = TEina_Simple_XML_Node_Data;
  PEina_Simple_XML_Node_CData = ^TEina_Simple_XML_Node_CData;
  TEina_Simple_XML_Node_Processing = TEina_Simple_XML_Node_Data;
  PEina_Simple_XML_Node_Processing = ^TEina_Simple_XML_Node_Processing;
  TEina_Simple_XML_Node_Doctype = TEina_Simple_XML_Node_Data;
  PEina_Simple_XML_Node_Doctype = ^TEina_Simple_XML_Node_Doctype;
  TEina_Simple_XML_Node_Comment = TEina_Simple_XML_Node_Data;
  PEina_Simple_XML_Node_Comment = ^TEina_Simple_XML_Node_Comment;
  TEina_Simple_XML_Node_Doctype_Child = TEina_Simple_XML_Node_Data;
  PEina_Simple_XML_Node_Doctype_Child = ^TEina_Simple_XML_Node_Doctype_Child;

type
  PEina_Simple_XML_Type = ^TEina_Simple_XML_Type;
  TEina_Simple_XML_Type = longint;

const
  EINA_SIMPLE_XML_OPEN = 0;
  EINA_SIMPLE_XML_OPEN_EMPTY = 1;
  EINA_SIMPLE_XML_CLOSE = 2;
  EINA_SIMPLE_XML_DATA = 3;
  EINA_SIMPLE_XML_CDATA = 4;
  EINA_SIMPLE_XML_ERROR = 5;
  EINA_SIMPLE_XML_PROCESSING = 6;
  EINA_SIMPLE_XML_DOCTYPE = 7;
  EINA_SIMPLE_XML_COMMENT = 8;
  EINA_SIMPLE_XML_IGNORED = 9;
  EINA_SIMPLE_XML_DOCTYPE_CHILD = 10;

type
  TEina_Simple_XML_Cb = function(data: pointer; _type: TEina_Simple_XML_Type; content: pchar; offset: dword; length: dword): TEina_Bool; cdecl;
  TEina_Simple_XML_Attribute_Cb = function(data: pointer; key: pchar; value: pchar): TEina_Bool; cdecl;

function eina_simple_xml_parse(buf: pchar; buflen: dword; strip: TEina_Bool; func: TEina_Simple_XML_Cb; data: pointer): TEina_Bool; cdecl; external libeina;
function eina_simple_xml_tag_attributes_find(buf: pchar; buflen: dword): pchar; cdecl; external libeina;
function eina_simple_xml_attributes_parse(buf: pchar; buflen: dword; func: TEina_Simple_XML_Attribute_Cb; data: pointer): TEina_Bool; cdecl; external libeina;
function eina_simple_xml_attribute_w3c_parse(buf: pchar; func: TEina_Simple_XML_Attribute_Cb; data: pointer): TEina_Bool; cdecl; external libeina;
function eina_simple_xml_attribute_new(parent: PEina_Simple_XML_Node_Tag; key: pchar; value: pchar): PEina_Simple_XML_Attribute; cdecl; external libeina;
procedure eina_simple_xml_attribute_free(attr: PEina_Simple_XML_Attribute); cdecl; external libeina;
function eina_simple_xml_node_tag_new(parent: PEina_Simple_XML_Node_Tag; name: pchar): PEina_Simple_XML_Node_Tag; cdecl; external libeina;
procedure eina_simple_xml_node_tag_free(tag: PEina_Simple_XML_Node_Tag); cdecl; external libeina;
function eina_simple_xml_node_data_new(parent: PEina_Simple_XML_Node_Tag; contents: pchar; length: Tsize_t): PEina_Simple_XML_Node_Data; cdecl; external libeina;
procedure eina_simple_xml_node_data_free(node: PEina_Simple_XML_Node_Data); cdecl; external libeina;
function eina_simple_xml_node_cdata_new(parent: PEina_Simple_XML_Node_Tag; contents: pchar; length: Tsize_t): PEina_Simple_XML_Node_CData; cdecl; external libeina;
procedure eina_simple_xml_node_cdata_free(node: PEina_Simple_XML_Node_Data); cdecl; external libeina;
function eina_simple_xml_node_doctype_child_new(parent: PEina_Simple_XML_Node_Tag; contents: pchar; length: Tsize_t): PEina_Simple_XML_Node_Doctype_Child; cdecl; external libeina;
procedure eina_simple_xml_node_doctype_child_free(node: PEina_Simple_XML_Node_Data); cdecl; external libeina;
function eina_simple_xml_node_processing_new(parent: PEina_Simple_XML_Node_Tag; contents: pchar; length: Tsize_t): PEina_Simple_XML_Node_Processing; cdecl; external libeina;
procedure eina_simple_xml_node_processing_free(node: PEina_Simple_XML_Node_Data); cdecl; external libeina;
function eina_simple_xml_node_doctype_new(parent: PEina_Simple_XML_Node_Tag; contents: pchar; length: Tsize_t): PEina_Simple_XML_Node_Doctype; cdecl; external libeina;
procedure eina_simple_xml_node_doctype_free(node: PEina_Simple_XML_Node_Data); cdecl; external libeina;
function eina_simple_xml_node_comment_new(parent: PEina_Simple_XML_Node_Tag; contents: pchar; length: Tsize_t): PEina_Simple_XML_Node_Comment; cdecl; external libeina;
procedure eina_simple_xml_node_comment_free(node: PEina_Simple_XML_Node_Data); cdecl; external libeina;
function eina_simple_xml_node_load(buf: pchar; buflen: dword; strip: TEina_Bool): PEina_Simple_XML_Node_Root; cdecl; external libeina;
procedure eina_simple_xml_node_root_free(root: PEina_Simple_XML_Node_Root); cdecl; external libeina;
function eina_simple_xml_node_dump(node: PEina_Simple_XML_Node; indent: pchar): pchar; cdecl; external libeina;

// === Konventiert am: 16-5-25 17:19:41 ===


implementation



end.
