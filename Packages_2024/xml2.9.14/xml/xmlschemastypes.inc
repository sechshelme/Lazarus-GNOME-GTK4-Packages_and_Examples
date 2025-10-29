{$IFDEF read_interface}

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
function xmlSchemaGetPredefinedType(Name: PxmlChar; ns: PxmlChar): PxmlSchemaType; cdecl; external libxml2;
function xmlSchemaValidatePredefinedType(_type: PxmlSchemaType; Value: PxmlChar; val: PPxmlSchemaVal): longint; cdecl; external libxml2;
function xmlSchemaValPredefTypeNode(_type: PxmlSchemaType; Value: PxmlChar; val: PPxmlSchemaVal; node: PxmlNode): longint; cdecl; external libxml2;
function xmlSchemaValidateFacet(base: PxmlSchemaType; facet: PxmlSchemaFacet; Value: PxmlChar; val: PxmlSchemaVal): longint; cdecl; external libxml2;
function xmlSchemaValidateFacetWhtsp(facet: PxmlSchemaFacet; fws: TxmlSchemaWhitespaceValueType; valType: TxmlSchemaValType; Value: PxmlChar; val: PxmlSchemaVal;
  ws: TxmlSchemaWhitespaceValueType): longint; cdecl; external libxml2;
procedure xmlSchemaFreeValue(val: PxmlSchemaVal); cdecl; external libxml2;
function xmlSchemaNewFacet: PxmlSchemaFacet; cdecl; external libxml2;
function xmlSchemaCheckFacet(facet: PxmlSchemaFacet; typeDecl: PxmlSchemaType; ctxt: PxmlSchemaParserCtxt; Name: PxmlChar): longint; cdecl; external libxml2;
procedure xmlSchemaFreeFacet(facet: PxmlSchemaFacet); cdecl; external libxml2;
function xmlSchemaCompareValues(x: PxmlSchemaVal; y: PxmlSchemaVal): longint; cdecl; external libxml2;
function xmlSchemaGetBuiltInListSimpleTypeItemType(_type: PxmlSchemaType): PxmlSchemaType; cdecl; external libxml2;
function xmlSchemaValidateListSimpleTypeFacet(facet: PxmlSchemaFacet; Value: PxmlChar; actualLen: Tculong; expectedLen: Pculong): longint; cdecl; external libxml2;
function xmlSchemaGetBuiltInType(_type: TxmlSchemaValType): PxmlSchemaType; cdecl; external libxml2;
function xmlSchemaIsBuiltInTypeFacet(_type: PxmlSchemaType; facetType: longint): longint; cdecl; external libxml2;
function xmlSchemaCollapseString(Value: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlSchemaWhiteSpaceReplace(Value: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlSchemaGetFacetValueAsULong(facet: PxmlSchemaFacet): Tculong; cdecl; external libxml2;
function xmlSchemaValidateLengthFacet(_type: PxmlSchemaType; facet: PxmlSchemaFacet; Value: PxmlChar; val: PxmlSchemaVal; length: Pculong): longint; cdecl; external libxml2;
function xmlSchemaValidateLengthFacetWhtsp(facet: PxmlSchemaFacet; valType: TxmlSchemaValType; Value: PxmlChar; val: PxmlSchemaVal; length: Pculong;
  ws: TxmlSchemaWhitespaceValueType): longint; cdecl; external libxml2;
function xmlSchemaValPredefTypeNodeNoNorm(_type: PxmlSchemaType; Value: PxmlChar; val: PPxmlSchemaVal; node: PxmlNode): longint; cdecl; external libxml2;
function xmlSchemaGetCanonValue(val: PxmlSchemaVal; retValue: PPxmlChar): longint; cdecl; external libxml2;
function xmlSchemaGetCanonValueWhtsp(val: PxmlSchemaVal; retValue: PPxmlChar; ws: TxmlSchemaWhitespaceValueType): longint; cdecl; external libxml2;
function xmlSchemaValueAppend(prev: PxmlSchemaVal; cur: PxmlSchemaVal): longint; cdecl; external libxml2;
function xmlSchemaValueGetNext(cur: PxmlSchemaVal): PxmlSchemaVal; cdecl; external libxml2;
function xmlSchemaValueGetAsString(val: PxmlSchemaVal): PxmlChar; cdecl; external libxml2;
function xmlSchemaValueGetAsBoolean(val: PxmlSchemaVal): longint; cdecl; external libxml2;
function xmlSchemaNewStringValue(_type: TxmlSchemaValType; Value: PxmlChar): PxmlSchemaVal; cdecl; external libxml2;
function xmlSchemaNewNOTATIONValue(Name: PxmlChar; ns: PxmlChar): PxmlSchemaVal; cdecl; external libxml2;
function xmlSchemaNewQNameValue(namespaceName: PxmlChar; localName: PxmlChar): PxmlSchemaVal; cdecl; external libxml2;
function xmlSchemaCompareValuesWhtsp(x: PxmlSchemaVal; xws: TxmlSchemaWhitespaceValueType; y: PxmlSchemaVal; yws: TxmlSchemaWhitespaceValueType): longint; cdecl; external libxml2;
function xmlSchemaCopyValue(val: PxmlSchemaVal): PxmlSchemaVal; cdecl; external libxml2;
function xmlSchemaGetValType(val: PxmlSchemaVal): TxmlSchemaValType; cdecl; external libxml2;

// === Konventiert am: 3-3-25 19:33:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
