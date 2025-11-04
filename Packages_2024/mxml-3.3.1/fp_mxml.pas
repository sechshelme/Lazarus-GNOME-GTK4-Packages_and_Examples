unit fp_mxml;

interface

const
  {$IFDEF Linux}
  libc = 'c';
  libmxml = 'libmxml';
  {$ENDIF}

  {$IFDEF Windows}
  libc = 'msvcrt.dll';
  libmxml = 'libmxml.dll';   // ???????????
  {$ENDIF}

type
  PFILE = type Pointer;

function fopen(__filename: pchar; __modes: pchar): PFILE; cdecl; external libc;
function fclose(__stream: PFILE): longint; cdecl; external libc;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Pmxml_sax_event = ^Tmxml_sax_event;
  Tmxml_sax_event = longint;

const
  MXML_SAX_CDATA = 0;
  MXML_SAX_COMMENT = 1;
  MXML_SAX_DATA = 2;
  MXML_SAX_DIRECTIVE = 3;
  MXML_SAX_ELEMENT_CLOSE = 4;
  MXML_SAX_ELEMENT_OPEN = 5;

type
  Pmxml_type = ^Tmxml_type;
  Tmxml_type = longint;

const
  MXML_IGNORE = -1;
  MXML_ELEMENT = 0;
  MXML_INTEGER = 1;
  MXML_OPAQUE = 2;
  MXML_REAL = 3;
  MXML_TEXT = 4;
  MXML_CUSTOM = 5;

type
  Pmxml_node = type Pointer;
  Pmxml_index = type Pointer;

  Tmxml_custom_destroy_cb_t = procedure(para1: pointer); cdecl;
  Tmxml_error_cb_t = procedure(para1: pchar); cdecl;
  Tmxml_custom_load_cb_t = function(para1: Pmxml_node; para2: pchar): longint; cdecl;
  Tmxml_custom_save_cb_t = function(para1: Pmxml_node): pchar; cdecl;
  Tmxml_entity_cb_t = function(para1: pchar): longint; cdecl;
  Tmxml_load_cb_t = function(para1: Pmxml_node): Tmxml_type; cdecl;
  Tmxml_save_cb_t = function(para1: Pmxml_node; para2: longint): pchar; cdecl;
  Tmxml_sax_cb_t = procedure(para1: Pmxml_node; para2: Tmxml_sax_event; para3: pointer); cdecl;

const
  MXML_MAJOR_VERSION = 3;
  MXML_MINOR_VERSION = 2;
  MXML_TAB = 8;
  MXML_NO_CALLBACK = nil;
  MXML_TEXT_CALLBACK = 0;
  MXML_NO_PARENT = 0;
  MXML_DESCEND = 1;
  MXML_NO_DESCEND = 0;
  MXML_DESCEND_FIRST = -(1);
  MXML_WS_BEFORE_OPEN = 0;
  MXML_WS_AFTER_OPEN = 1;
  MXML_WS_BEFORE_CLOSE = 2;
  MXML_WS_AFTER_CLOSE = 3;
  MXML_ADD_BEFORE = 0;
  MXML_ADD_AFTER = 1;
  MXML_ADD_TO_PARENT = nil;

procedure mxmlAdd(parent: Pmxml_node; where: longint; child: Pmxml_node; node: Pmxml_node); cdecl; external libmxml;
procedure mxmlDelete(node: Pmxml_node); cdecl; external libmxml;
procedure mxmlElementDeleteAttr(node: Pmxml_node; name: pchar); cdecl; external libmxml;
function mxmlElementGetAttr(node: Pmxml_node; name: pchar): pchar; cdecl; external libmxml;
function mxmlElementGetAttrByIndex(node: Pmxml_node; idx: longint; name: PPchar): pchar; cdecl; external libmxml;
function mxmlElementGetAttrCount(node: Pmxml_node): longint; cdecl; external libmxml;
procedure mxmlElementSetAttr(node: Pmxml_node; name: pchar; value: pchar); cdecl; external libmxml;
procedure mxmlElementSetAttrf(node: Pmxml_node; name: pchar; format: pchar; args: array of const); cdecl; external libmxml;
procedure mxmlElementSetAttrf(node: Pmxml_node; name: pchar; format: pchar); cdecl; external libmxml;
function mxmlEntityAddCallback(cb: Tmxml_entity_cb_t): longint; cdecl; external libmxml;
function mxmlEntityGetName(val: longint): pchar; cdecl; external libmxml;
function mxmlEntityGetValue(name: pchar): longint; cdecl; external libmxml;
procedure mxmlEntityRemoveCallback(cb: Tmxml_entity_cb_t); cdecl; external libmxml;
function mxmlFindElement(node: Pmxml_node; top: Pmxml_node; element: pchar; attr: pchar; value: pchar;
  descend: longint): Pmxml_node; cdecl; external libmxml;
function mxmlFindPath(node: Pmxml_node; path: pchar): Pmxml_node; cdecl; external libmxml;
function mxmlGetCDATA(node: Pmxml_node): pchar; cdecl; external libmxml;
function mxmlGetCustom(node: Pmxml_node): pointer; cdecl; external libmxml;
function mxmlGetElement(node: Pmxml_node): pchar; cdecl; external libmxml;
function mxmlGetFirstChild(node: Pmxml_node): Pmxml_node; cdecl; external libmxml;
function mxmlGetInteger(node: Pmxml_node): longint; cdecl; external libmxml;
function mxmlGetLastChild(node: Pmxml_node): Pmxml_node; cdecl; external libmxml;
function mxmlGetNextSibling(node: Pmxml_node): Pmxml_node; cdecl; external libmxml;
function mxmlGetOpaque(node: Pmxml_node): pchar; cdecl; external libmxml;
function mxmlGetParent(node: Pmxml_node): Pmxml_node; cdecl; external libmxml;
function mxmlGetPrevSibling(node: Pmxml_node): Pmxml_node; cdecl; external libmxml;
function mxmlGetReal(node: Pmxml_node): double; cdecl; external libmxml;
function mxmlGetRefCount(node: Pmxml_node): longint; cdecl; external libmxml;
function mxmlGetText(node: Pmxml_node; whitespace: Plongint): pchar; cdecl; external libmxml;
function mxmlGetType(node: Pmxml_node): Tmxml_type; cdecl; external libmxml;
function mxmlGetUserData(node: Pmxml_node): pointer; cdecl; external libmxml;
procedure mxmlIndexDelete(ind: Pmxml_index); cdecl; external libmxml;
function mxmlIndexEnum(ind: Pmxml_index): Pmxml_node; cdecl; external libmxml;
function mxmlIndexFind(ind: Pmxml_index; element: pchar; value: pchar): Pmxml_node; cdecl; external libmxml;
function mxmlIndexGetCount(ind: Pmxml_index): longint; cdecl; external libmxml;
function mxmlIndexNew(node: Pmxml_node; element: pchar; attr: pchar): Pmxml_index; cdecl; external libmxml;
function mxmlIndexReset(ind: Pmxml_index): Pmxml_node; cdecl; external libmxml;

type
  TLoad_cp = function(para1: Pmxml_node): Tmxml_type;

function mxmlLoadFd(top: Pmxml_node; fd: longint; cb: TLoad_cp): Pmxml_node; cdecl; external libmxml;
function mxmlLoadFile(top: Pmxml_node; fp: PFILE; cb: TLoad_cp): Pmxml_node; cdecl; external libmxml;
function mxmlLoadString(top: Pmxml_node; s: pchar; cb: TLoad_cp): Pmxml_node; cdecl; external libmxml;
function mxmlNewCDATA(parent: Pmxml_node; _string: pchar): Pmxml_node; cdecl; external libmxml;
function mxmlNewCustom(parent: Pmxml_node; data: pointer; destroy: Tmxml_custom_destroy_cb_t): Pmxml_node; cdecl; external libmxml;
function mxmlNewElement(parent: Pmxml_node; name: pchar): Pmxml_node; cdecl; external libmxml;
function mxmlNewInteger(parent: Pmxml_node; integer: longint): Pmxml_node; cdecl; external libmxml;
function mxmlNewOpaque(parent: Pmxml_node; opaque: pchar): Pmxml_node; cdecl; external libmxml;
function mxmlNewOpaquef(parent: Pmxml_node; format: pchar; args: array of const): Pmxml_node; cdecl; external libmxml;
function mxmlNewOpaquef(parent: Pmxml_node; format: pchar): Pmxml_node; cdecl; external libmxml;
function mxmlNewReal(parent: Pmxml_node; real: double): Pmxml_node; cdecl; external libmxml;
function mxmlNewText(parent: Pmxml_node; whitespace: longint; _string: pchar): Pmxml_node; cdecl; external libmxml;
function mxmlNewTextf(parent: Pmxml_node; whitespace: longint; format: pchar; args: array of const): Pmxml_node; cdecl; external libmxml;
function mxmlNewTextf(parent: Pmxml_node; whitespace: longint; format: pchar): Pmxml_node; cdecl; external libmxml;
function mxmlNewXML(version: pchar): Pmxml_node; cdecl; external libmxml;
function mxmlRelease(node: Pmxml_node): longint; cdecl; external libmxml;
procedure mxmlRemove(node: Pmxml_node); cdecl; external libmxml;
function mxmlRetain(node: Pmxml_node): longint; cdecl; external libmxml;
function mxmlSaveAllocString(node: Pmxml_node; cb: Tmxml_save_cb_t): pchar; cdecl; external libmxml;
function mxmlSaveFd(node: Pmxml_node; fd: longint; cb: Tmxml_save_cb_t): longint; cdecl; external libmxml;
function mxmlSaveFile(node: Pmxml_node; fp: PFILE; cb: Tmxml_save_cb_t): longint; cdecl; external libmxml;
function mxmlSaveString(node: Pmxml_node; buffer: pchar; bufsize: longint; cb: Tmxml_save_cb_t): longint; cdecl; external libmxml;
function mxmlSAXLoadFd(top: Pmxml_node; fd: longint; cb: TLoad_cp; sax: Tmxml_sax_cb_t; sax_data: pointer): Pmxml_node; cdecl; external libmxml;
function mxmlSAXLoadFile(top: Pmxml_node; fp: PFILE; cb: TLoad_cp; sax: Tmxml_sax_cb_t; sax_data: pointer): Pmxml_node; cdecl; external libmxml;
function mxmlSAXLoadString(top: Pmxml_node; s: pchar; cb: TLoad_cp; sax: Tmxml_sax_cb_t; sax_data: pointer): Pmxml_node; cdecl; external libmxml;
function mxmlSetCDATA(node: Pmxml_node; data: pchar): longint; cdecl; external libmxml;
function mxmlSetCustom(node: Pmxml_node; data: pointer; destroy: Tmxml_custom_destroy_cb_t): longint; cdecl; external libmxml;
procedure mxmlSetCustomHandlers(load: Tmxml_custom_load_cb_t; save: Tmxml_custom_save_cb_t); cdecl; external libmxml;
function mxmlSetElement(node: Pmxml_node; name: pchar): longint; cdecl; external libmxml;
procedure mxmlSetErrorCallback(cb: Tmxml_error_cb_t); cdecl; external libmxml;
function mxmlSetInteger(node: Pmxml_node; integer: longint): longint; cdecl; external libmxml;
function mxmlSetOpaque(node: Pmxml_node; opaque: pchar): longint; cdecl; external libmxml;
function mxmlSetOpaquef(node: Pmxml_node; format: pchar; args: array of const): longint; cdecl; external libmxml;
function mxmlSetOpaquef(node: Pmxml_node; format: pchar): longint; cdecl; external libmxml;
function mxmlSetReal(node: Pmxml_node; real: double): longint; cdecl; external libmxml;
function mxmlSetText(node: Pmxml_node; whitespace: longint; _string: pchar): longint; cdecl; external libmxml;
function mxmlSetTextf(node: Pmxml_node; whitespace: longint; format: pchar; args: array of const): longint; cdecl; external libmxml;
function mxmlSetTextf(node: Pmxml_node; whitespace: longint; format: pchar): longint; cdecl; external libmxml;
function mxmlSetUserData(node: Pmxml_node; data: pointer): longint; cdecl; external libmxml;
procedure mxmlSetWrapMargin(column: longint); cdecl; external libmxml;
function mxmlWalkNext(node: Pmxml_node; top: Pmxml_node; descend: longint): Pmxml_node; cdecl; external libmxml;
function mxmlWalkPrev(node: Pmxml_node; top: Pmxml_node; descend: longint): Pmxml_node; cdecl; external libmxml;

procedure mxml_error(format: pchar); cdecl; varargs; external libmxml;

function mxml_ignore_cb(node: Pmxml_node): Tmxml_type; cdecl; external libmxml;
function mxml_integer_cb(node: Pmxml_node): Tmxml_type; cdecl; external libmxml;
function mxml_opaque_cb(node: Pmxml_node): Tmxml_type; cdecl; external libmxml;
function mxml_real_cb(node: Pmxml_node): Tmxml_type; cdecl; external libmxml;

function MXML_IGNORE_CALLBACK(node: Pmxml_node): Tmxml_type; cdecl; external libmxml name 'mxml_ignore_cb';
function MXML_INTEGER_CALLBACK(node: Pmxml_node): Tmxml_type; cdecl; external libmxml name 'mxml_integer_cb';
function MXML_OPAQUE_CALLBACK(node: Pmxml_node): Tmxml_type; cdecl; external libmxml name 'mxml_opaque_cb';
function MXML_REAL_CALLBACK(node: Pmxml_node): Tmxml_type; cdecl; external libmxml name 'mxml_real_cb';



// === Konventiert am: 4-11-25 13:53:25 ===


implementation



end.
