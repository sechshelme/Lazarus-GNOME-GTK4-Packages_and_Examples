unit xmlschemastypes;

interface

uses
  ctypes, xml2_common, xmlstring, xmlschemas, tree, schemasInternals;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlSchemaWhitespaceValueType = ^TxmlSchemaWhitespaceValueType;
  TxmlSchemaWhitespaceValueType = longint;

const
  XML_SCHEMA_WHITESPACE_UNKNOWN = 0;
  XML_SCHEMA_WHITESPACE_PRESERVE = 1;
  XML_SCHEMA_WHITESPACE_REPLACE = 2;
  XML_SCHEMA_WHITESPACE_COLLAPSE = 3;

procedure xmlSchemaInitTypes; cdecl; external libxml2;
procedure xmlSchemaCleanupTypes; cdecl; external libxml2;
function xmlSchemaGetPredefinedType(Name: PxmlChar; ns: PxmlChar): TxmlSchemaTypePtr; cdecl; external libxml2;
function xmlSchemaValidatePredefinedType(_type: TxmlSchemaTypePtr; Value: PxmlChar; val: PxmlSchemaValPtr): longint; cdecl; external libxml2;
function xmlSchemaValPredefTypeNode(_type: TxmlSchemaTypePtr; Value: PxmlChar; val: PxmlSchemaValPtr; node: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlSchemaValidateFacet(base: TxmlSchemaTypePtr; facet: TxmlSchemaFacetPtr; Value: PxmlChar; val: TxmlSchemaValPtr): longint; cdecl; external libxml2;
function xmlSchemaValidateFacetWhtsp(facet: TxmlSchemaFacetPtr; fws: TxmlSchemaWhitespaceValueType; valType: TxmlSchemaValType; Value: PxmlChar; val: TxmlSchemaValPtr;
  ws: TxmlSchemaWhitespaceValueType): longint; cdecl; external libxml2;
procedure xmlSchemaFreeValue(val: TxmlSchemaValPtr); cdecl; external libxml2;
function xmlSchemaNewFacet: TxmlSchemaFacetPtr; cdecl; external libxml2;
function xmlSchemaCheckFacet(facet: TxmlSchemaFacetPtr; typeDecl: TxmlSchemaTypePtr; ctxt: TxmlSchemaParserCtxtPtr; Name: PxmlChar): longint; cdecl; external libxml2;
procedure xmlSchemaFreeFacet(facet: TxmlSchemaFacetPtr); cdecl; external libxml2;
function xmlSchemaCompareValues(x: TxmlSchemaValPtr; y: TxmlSchemaValPtr): longint; cdecl; external libxml2;
function xmlSchemaGetBuiltInListSimpleTypeItemType(_type: TxmlSchemaTypePtr): TxmlSchemaTypePtr; cdecl; external libxml2;
function xmlSchemaValidateListSimpleTypeFacet(facet: TxmlSchemaFacetPtr; Value: PxmlChar; actualLen: dword; expectedLen: Pdword): longint; cdecl; external libxml2;
function xmlSchemaGetBuiltInType(_type: TxmlSchemaValType): TxmlSchemaTypePtr; cdecl; external libxml2;
function xmlSchemaIsBuiltInTypeFacet(_type: TxmlSchemaTypePtr; facetType: longint): longint; cdecl; external libxml2;
function xmlSchemaCollapseString(Value: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlSchemaWhiteSpaceReplace(Value: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlSchemaGetFacetValueAsULong(facet: TxmlSchemaFacetPtr): dword; cdecl; external libxml2;
function xmlSchemaValidateLengthFacet(_type: TxmlSchemaTypePtr; facet: TxmlSchemaFacetPtr; Value: PxmlChar; val: TxmlSchemaValPtr; length: Pdword): longint; cdecl; external libxml2;
function xmlSchemaValidateLengthFacetWhtsp(facet: TxmlSchemaFacetPtr; valType: TxmlSchemaValType; Value: PxmlChar; val: TxmlSchemaValPtr; length: Pdword;
  ws: TxmlSchemaWhitespaceValueType): longint; cdecl; external libxml2;
function xmlSchemaValPredefTypeNodeNoNorm(_type: TxmlSchemaTypePtr; Value: PxmlChar; val: PxmlSchemaValPtr; node: TxmlNodePtr): longint; cdecl; external libxml2;
function xmlSchemaGetCanonValue(val: TxmlSchemaValPtr; retValue: PPxmlChar): longint; cdecl; external libxml2;
function xmlSchemaGetCanonValueWhtsp(val: TxmlSchemaValPtr; retValue: PPxmlChar; ws: TxmlSchemaWhitespaceValueType): longint; cdecl; external libxml2;
function xmlSchemaValueAppend(prev: TxmlSchemaValPtr; cur: TxmlSchemaValPtr): longint; cdecl; external libxml2;
function xmlSchemaValueGetNext(cur: TxmlSchemaValPtr): TxmlSchemaValPtr; cdecl; external libxml2;
function xmlSchemaValueGetAsString(val: TxmlSchemaValPtr): PxmlChar; cdecl; external libxml2;
function xmlSchemaValueGetAsBoolean(val: TxmlSchemaValPtr): longint; cdecl; external libxml2;
function xmlSchemaNewStringValue(_type: TxmlSchemaValType; Value: PxmlChar): TxmlSchemaValPtr; cdecl; external libxml2;
function xmlSchemaNewNOTATIONValue(Name: PxmlChar; ns: PxmlChar): TxmlSchemaValPtr; cdecl; external libxml2;
function xmlSchemaNewQNameValue(namespaceName: PxmlChar; localName: PxmlChar): TxmlSchemaValPtr; cdecl; external libxml2;
function xmlSchemaCompareValuesWhtsp(x: TxmlSchemaValPtr; xws: TxmlSchemaWhitespaceValueType; y: TxmlSchemaValPtr; yws: TxmlSchemaWhitespaceValueType): longint; cdecl; external libxml2;
function xmlSchemaCopyValue(val: TxmlSchemaValPtr): TxmlSchemaValPtr; cdecl; external libxml2;
function xmlSchemaGetValType(val: TxmlSchemaValPtr): TxmlSchemaValType; cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:33:56 ===


implementation



end.
