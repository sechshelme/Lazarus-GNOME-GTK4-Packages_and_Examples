
unit relaxng;
interface

{
  Automatically converted by H2Pas 1.0.0 from relaxng.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    relaxng.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PFILE  = ^FILE;
PxmlChar  = ^xmlChar;
PxmlRelaxNG  = ^xmlRelaxNG;
PxmlRelaxNGParserCtxt  = ^xmlRelaxNGParserCtxt;
PxmlRelaxNGParserCtxtPtr  = ^xmlRelaxNGParserCtxtPtr;
PxmlRelaxNGParserFlag  = ^xmlRelaxNGParserFlag;
PxmlRelaxNGPtr  = ^xmlRelaxNGPtr;
PxmlRelaxNGValidCtxt  = ^xmlRelaxNGValidCtxt;
PxmlRelaxNGValidCtxtPtr  = ^xmlRelaxNGValidCtxtPtr;
PxmlRelaxNGValidErr  = ^xmlRelaxNGValidErr;
PxmlRelaxNGValidityErrorFunc  = ^xmlRelaxNGValidityErrorFunc;
PxmlRelaxNGValidityWarningFunc  = ^xmlRelaxNGValidityWarningFunc;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type

  PxmlRelaxNGPtr = ^TxmlRelaxNGPtr;
  TxmlRelaxNGPtr = PxmlRelaxNG;
{typedef void ( *xmlRelaxNGValidityErrorFunc) (void *ctx,						      const char *msg,						      ...) ; }
{typedef void ( *xmlRelaxNGValidityWarningFunc) (void *ctx,							const char *msg,						...) ; }

  PxmlRelaxNGParserCtxtPtr = ^TxmlRelaxNGParserCtxtPtr;
  TxmlRelaxNGParserCtxtPtr = PxmlRelaxNGParserCtxt;

  PxmlRelaxNGValidCtxtPtr = ^TxmlRelaxNGValidCtxtPtr;
  TxmlRelaxNGValidCtxtPtr = PxmlRelaxNGValidCtxt;

  PxmlRelaxNGValidErr = ^TxmlRelaxNGValidErr;
  TxmlRelaxNGValidErr =  Longint;
  Const
    XML_RELAXNG_OK = 0;
    XML_RELAXNG_ERR_MEMORY = 1;
    XML_RELAXNG_ERR_TYPE = 2;
    XML_RELAXNG_ERR_TYPEVAL = 3;
    XML_RELAXNG_ERR_DUPID = 4;
    XML_RELAXNG_ERR_TYPECMP = 5;
    XML_RELAXNG_ERR_NOSTATE = 6;
    XML_RELAXNG_ERR_NODEFINE = 7;
    XML_RELAXNG_ERR_LISTEXTRA = 8;
    XML_RELAXNG_ERR_LISTEMPTY = 9;
    XML_RELAXNG_ERR_INTERNODATA = 10;
    XML_RELAXNG_ERR_INTERSEQ = 11;
    XML_RELAXNG_ERR_INTEREXTRA = 12;
    XML_RELAXNG_ERR_ELEMNAME = 13;
    XML_RELAXNG_ERR_ATTRNAME = 14;
    XML_RELAXNG_ERR_ELEMNONS = 15;
    XML_RELAXNG_ERR_ATTRNONS = 16;
    XML_RELAXNG_ERR_ELEMWRONGNS = 17;
    XML_RELAXNG_ERR_ATTRWRONGNS = 18;
    XML_RELAXNG_ERR_ELEMEXTRANS = 19;
    XML_RELAXNG_ERR_ATTREXTRANS = 20;
    XML_RELAXNG_ERR_ELEMNOTEMPTY = 21;
    XML_RELAXNG_ERR_NOELEM = 22;
    XML_RELAXNG_ERR_NOTELEM = 23;
    XML_RELAXNG_ERR_ATTRVALID = 24;
    XML_RELAXNG_ERR_CONTENTVALID = 25;
    XML_RELAXNG_ERR_EXTRACONTENT = 26;
    XML_RELAXNG_ERR_INVALIDATTR = 27;
    XML_RELAXNG_ERR_DATAELEM = 28;
    XML_RELAXNG_ERR_VALELEM = 29;
    XML_RELAXNG_ERR_LISTELEM = 30;
    XML_RELAXNG_ERR_DATATYPE = 31;
    XML_RELAXNG_ERR_VALUE = 32;
    XML_RELAXNG_ERR_LIST = 33;
    XML_RELAXNG_ERR_NOGRAMMAR = 34;
    XML_RELAXNG_ERR_EXTRADATA = 35;
    XML_RELAXNG_ERR_LACKDATA = 36;
    XML_RELAXNG_ERR_INTERNAL = 37;
    XML_RELAXNG_ERR_ELEMWRONG = 38;
    XML_RELAXNG_ERR_TEXTWRONG = 39;
;
type
  PxmlRelaxNGParserFlag = ^TxmlRelaxNGParserFlag;
  TxmlRelaxNGParserFlag =  Longint;
  Const
    XML_RELAXNGP_NONE = 0;
    XML_RELAXNGP_FREE_DOC = 1;
    XML_RELAXNGP_CRNG = 2;
;

function xmlRelaxNGInitTypes:longint;cdecl;external;
procedure xmlRelaxNGCleanupTypes;cdecl;external;
(* Const before type ignored *)
function xmlRelaxNGNewParserCtxt(URL:Pchar):TxmlRelaxNGParserCtxtPtr;cdecl;external;
(* Const before type ignored *)
function xmlRelaxNGNewMemParserCtxt(buffer:Pchar; size:longint):TxmlRelaxNGParserCtxtPtr;cdecl;external;
function xmlRelaxNGNewDocParserCtxt(doc:TxmlDocPtr):TxmlRelaxNGParserCtxtPtr;cdecl;external;
function xmlRelaxParserSetFlag(ctxt:TxmlRelaxNGParserCtxtPtr; flag:longint):longint;cdecl;external;
procedure xmlRelaxNGFreeParserCtxt(ctxt:TxmlRelaxNGParserCtxtPtr);cdecl;external;
procedure xmlRelaxNGSetParserErrors(ctxt:TxmlRelaxNGParserCtxtPtr; err:TxmlRelaxNGValidityErrorFunc; warn:TxmlRelaxNGValidityWarningFunc; ctx:pointer);cdecl;external;
function xmlRelaxNGGetParserErrors(ctxt:TxmlRelaxNGParserCtxtPtr; err:PxmlRelaxNGValidityErrorFunc; warn:PxmlRelaxNGValidityWarningFunc; ctx:Ppointer):longint;cdecl;external;
procedure xmlRelaxNGSetParserStructuredErrors(ctxt:TxmlRelaxNGParserCtxtPtr; serror:TxmlStructuredErrorFunc; ctx:pointer);cdecl;external;
function xmlRelaxNGParse(ctxt:TxmlRelaxNGParserCtxtPtr):TxmlRelaxNGPtr;cdecl;external;
procedure xmlRelaxNGFree(schema:TxmlRelaxNGPtr);cdecl;external;
procedure xmlRelaxNGDump(output:PFILE; schema:TxmlRelaxNGPtr);cdecl;external;
procedure xmlRelaxNGDumpTree(output:PFILE; schema:TxmlRelaxNGPtr);cdecl;external;
procedure xmlRelaxNGSetValidErrors(ctxt:TxmlRelaxNGValidCtxtPtr; err:TxmlRelaxNGValidityErrorFunc; warn:TxmlRelaxNGValidityWarningFunc; ctx:pointer);cdecl;external;
function xmlRelaxNGGetValidErrors(ctxt:TxmlRelaxNGValidCtxtPtr; err:PxmlRelaxNGValidityErrorFunc; warn:PxmlRelaxNGValidityWarningFunc; ctx:Ppointer):longint;cdecl;external;
procedure xmlRelaxNGSetValidStructuredErrors(ctxt:TxmlRelaxNGValidCtxtPtr; serror:TxmlStructuredErrorFunc; ctx:pointer);cdecl;external;
function xmlRelaxNGNewValidCtxt(schema:TxmlRelaxNGPtr):TxmlRelaxNGValidCtxtPtr;cdecl;external;
procedure xmlRelaxNGFreeValidCtxt(ctxt:TxmlRelaxNGValidCtxtPtr);cdecl;external;
function xmlRelaxNGValidateDoc(ctxt:TxmlRelaxNGValidCtxtPtr; doc:TxmlDocPtr):longint;cdecl;external;
function xmlRelaxNGValidatePushElement(ctxt:TxmlRelaxNGValidCtxtPtr; doc:TxmlDocPtr; elem:TxmlNodePtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlRelaxNGValidatePushCData(ctxt:TxmlRelaxNGValidCtxtPtr; data:PxmlChar; len:longint):longint;cdecl;external;
function xmlRelaxNGValidatePopElement(ctxt:TxmlRelaxNGValidCtxtPtr; doc:TxmlDocPtr; elem:TxmlNodePtr):longint;cdecl;external;
function xmlRelaxNGValidateFullElement(ctxt:TxmlRelaxNGValidCtxtPtr; doc:TxmlDocPtr; elem:TxmlNodePtr):longint;cdecl;external;

implementation


end.
