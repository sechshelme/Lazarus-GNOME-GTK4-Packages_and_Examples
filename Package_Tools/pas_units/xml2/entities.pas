unit entities;

interface

uses
  ctypes, xml2_common, xmlstring, tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlEntityType = ^TxmlEntityType;
  TxmlEntityType = longint;

const
  XML_INTERNAL_GENERAL_ENTITY = 1;
  XML_EXTERNAL_GENERAL_PARSED_ENTITY = 2;
  XML_EXTERNAL_GENERAL_UNPARSED_ENTITY = 3;
  XML_INTERNAL_PARAMETER_ENTITY = 4;
  XML_EXTERNAL_PARAMETER_ENTITY = 5;
  XML_INTERNAL_PREDEFINED_ENTITY = 6;

type
  PxmlEntity = ^TxmlEntity;

  TxmlEntity = record
    _private: pointer;
    _type: TxmlElementType;
    Name: PxmlChar;
    children: PxmlNode;
    last: PxmlNode;
    parent: PxmlDtd;
    Next: PxmlNode;
    prev: PxmlNode;
    doc: PxmlDoc;
    orig: PxmlChar;
    content: PxmlChar;
    length: longint;
    etype: TxmlEntityType;
    ExternalID: PxmlChar;
    SystemID: PxmlChar;
    nexte: PxmlEntity;
    URI: PxmlChar;
    owner: longint;
    Checked: longint;
  end;

  TxmlEntitiesTable = record
  end;
  PxmlEntitiesTable = ^TxmlEntitiesTable;

procedure xmlInitializePredefinedEntities; cdecl; external libxml2;
function xmlNewEntity(doc: PxmlDoc; Name: PxmlChar; _type: longint; ExternalID: PxmlChar; SystemID: PxmlChar;
  content: PxmlChar): PxmlEntity; cdecl; external libxml2;
function xmlAddDocEntity(doc: PxmlDoc; Name: PxmlChar; _type: longint; ExternalID: PxmlChar; SystemID: PxmlChar;
  content: PxmlChar): PxmlEntity; cdecl; external libxml2;
function xmlAddDtdEntity(doc: PxmlDoc; Name: PxmlChar; _type: longint; ExternalID: PxmlChar; SystemID: PxmlChar;
  content: PxmlChar): PxmlEntity; cdecl; external libxml2;
function xmlGetPredefinedEntity(Name: PxmlChar): PxmlEntity; cdecl; external libxml2;
function xmlGetDocEntity(doc: PxmlDoc; Name: PxmlChar): PxmlEntity; cdecl; external libxml2;
function xmlGetDtdEntity(doc: PxmlDoc; Name: PxmlChar): PxmlEntity; cdecl; external libxml2;
function xmlGetParameterEntity(doc: PxmlDoc; Name: PxmlChar): PxmlEntity; cdecl; external libxml2;
function xmlEncodeEntities(doc: PxmlDoc; input: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlEncodeEntitiesReentrant(doc: PxmlDoc; input: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlEncodeSpecialChars(doc: PxmlDoc; input: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlCreateEntitiesTable: PxmlEntitiesTable; cdecl; external libxml2;
function xmlCopyEntitiesTable(table: PxmlEntitiesTable): PxmlEntitiesTable; cdecl; external libxml2;
procedure xmlFreeEntitiesTable(table: PxmlEntitiesTable); cdecl; external libxml2;
procedure xmlDumpEntitiesTable(buf: PxmlBuffer; table: PxmlEntitiesTable); cdecl; external libxml2;
procedure xmlDumpEntityDecl(buf: PxmlBuffer; ent: PxmlEntity); cdecl; external libxml2;
procedure xmlCleanupPredefinedEntities; cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:17:09 ===


implementation



end.
