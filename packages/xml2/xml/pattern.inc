{$IFDEF read_interface}

type
  TxmlPattern = record
  end;
  PxmlPattern = ^TxmlPattern;

type
  PxmlPatternFlags = ^TxmlPatternFlags;
  TxmlPatternFlags = longint;

const
  XML_PATTERN_DEFAULT = 0;
  XML_PATTERN_XPATH = 1 shl 0;
  XML_PATTERN_XSSEL = 1 shl 1;
  XML_PATTERN_XSFIELD = 1 shl 2;

procedure xmlFreePattern(comp: PxmlPattern); cdecl; external libxml2;
procedure xmlFreePatternList(comp: PxmlPattern); cdecl; external libxml2;
function xmlPatterncompile(pattern: PxmlChar; dict: PxmlDict; flags: longint; namespaces: PPxmlChar): PxmlPattern; cdecl; external libxml2;
function xmlPatternMatch(comp: PxmlPattern; node: PxmlNode): longint; cdecl; external libxml2;

type
  TxmlStreamCtxt = record
  end;
  PxmlStreamCtxt = ^TxmlStreamCtxt;

function xmlPatternStreamable(comp: PxmlPattern): longint; cdecl; external libxml2;
function xmlPatternMaxDepth(comp: PxmlPattern): longint; cdecl; external libxml2;
function xmlPatternMinDepth(comp: PxmlPattern): longint; cdecl; external libxml2;
function xmlPatternFromRoot(comp: PxmlPattern): longint; cdecl; external libxml2;
function xmlPatternGetStreamCtxt(comp: PxmlPattern): PxmlStreamCtxt; cdecl; external libxml2;
procedure xmlFreeStreamCtxt(stream: PxmlStreamCtxt); cdecl; external libxml2;
function xmlStreamPushNode(stream: PxmlStreamCtxt; Name: PxmlChar; ns: PxmlChar; nodeType: longint): longint; cdecl; external libxml2;
function xmlStreamPush(stream: PxmlStreamCtxt; Name: PxmlChar; ns: PxmlChar): longint; cdecl; external libxml2;
function xmlStreamPushAttr(stream: PxmlStreamCtxt; Name: PxmlChar; ns: PxmlChar): longint; cdecl; external libxml2;
function xmlStreamPop(stream: PxmlStreamCtxt): longint; cdecl; external libxml2;
function xmlStreamWantsAnyNode(stream: PxmlStreamCtxt): longint; cdecl; external libxml2;

// === Konventiert am: 4-3-25 13:30:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
