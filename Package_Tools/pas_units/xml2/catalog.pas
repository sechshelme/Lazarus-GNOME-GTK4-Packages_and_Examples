unit catalog;

interface

uses
  ctypes, xml2_common, xmlstring, tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlCatalogPrefer = ^TxmlCatalogPrefer;
  TxmlCatalogPrefer = longint;

const
  XML_CATA_PREFER_NONE = 0;
  XML_CATA_PREFER_PUBLIC = 1;
  XML_CATA_PREFER_SYSTEM = 2;

type
  PxmlCatalogAllow = ^TxmlCatalogAllow;
  TxmlCatalogAllow = longint;

const
  XML_CATA_ALLOW_NONE = 0;
  XML_CATA_ALLOW_GLOBAL = 1;
  XML_CATA_ALLOW_DOCUMENT = 2;
  XML_CATA_ALLOW_ALL = 3;

type
  TxmlCatalog = record
  end;
  PxmlCatalog = ^TxmlCatalog;

  PxmlCatalogPtr = ^TxmlCatalogPtr;
  TxmlCatalogPtr = PxmlCatalog;

function xmlNewCatalog(sgml: longint): TxmlCatalogPtr; cdecl; external libxml2;
function xmlLoadACatalog(filename: pchar): TxmlCatalogPtr; cdecl; external libxml2;
function xmlLoadSGMLSuperCatalog(filename: pchar): TxmlCatalogPtr; cdecl; external libxml2;
function xmlConvertSGMLCatalog(catal: TxmlCatalogPtr): longint; cdecl; external libxml2;
function xmlACatalogAdd(catal: TxmlCatalogPtr; _type: PxmlChar; orig: PxmlChar; replace: PxmlChar): longint; cdecl; external libxml2;
function xmlACatalogRemove(catal: TxmlCatalogPtr; Value: PxmlChar): longint; cdecl; external libxml2;
function xmlACatalogResolve(catal: TxmlCatalogPtr; pubID: PxmlChar; sysID: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlACatalogResolveSystem(catal: TxmlCatalogPtr; sysID: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlACatalogResolvePublic(catal: TxmlCatalogPtr; pubID: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlACatalogResolveURI(catal: TxmlCatalogPtr; URI: PxmlChar): PxmlChar; cdecl; external libxml2;
procedure xmlACatalogDump(catal: TxmlCatalogPtr; out_: PFILE); cdecl; external libxml2;
procedure xmlFreeCatalog(catal: TxmlCatalogPtr); cdecl; external libxml2;
function xmlCatalogIsEmpty(catal: TxmlCatalogPtr): longint; cdecl; external libxml2;
procedure xmlInitializeCatalog; cdecl; external libxml2;
function xmlLoadCatalog(filename: pchar): longint; cdecl; external libxml2;
procedure xmlLoadCatalogs(paths: pchar); cdecl; external libxml2;
procedure xmlCatalogCleanup; cdecl; external libxml2;
procedure xmlCatalogDump(out_: PFILE); cdecl; external libxml2;
function xmlCatalogResolve(pubID: PxmlChar; sysID: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlCatalogResolveSystem(sysID: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlCatalogResolvePublic(pubID: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlCatalogResolveURI(URI: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlCatalogAdd(_type: PxmlChar; orig: PxmlChar; replace: PxmlChar): longint; cdecl; external libxml2;
function xmlCatalogRemove(Value: PxmlChar): longint; cdecl; external libxml2;
function xmlParseCatalogFile(filename: pchar): TxmlDocPtr; cdecl; external libxml2;
function xmlCatalogConvert: longint; cdecl; external libxml2;
procedure xmlCatalogFreeLocal(catalogs: pointer); cdecl; external libxml2;
function xmlCatalogAddLocal(catalogs: pointer; URL: PxmlChar): pointer; cdecl; external libxml2;
function xmlCatalogLocalResolve(catalogs: pointer; pubID: PxmlChar; sysID: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlCatalogLocalResolveURI(catalogs: pointer; URI: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlCatalogSetDebug(level: longint): longint; cdecl; external libxml2;
function xmlCatalogSetDefaultPrefer(prefer: TxmlCatalogPrefer): TxmlCatalogPrefer; cdecl; external libxml2;
procedure xmlCatalogSetDefaults(allow: TxmlCatalogAllow); cdecl; external libxml2;
function xmlCatalogGetDefaults: TxmlCatalogAllow; cdecl; external libxml2;
function xmlCatalogGetSystem(sysID: PxmlChar): PxmlChar; cdecl; external libxml2;
function xmlCatalogGetPublic(pubID: PxmlChar): PxmlChar; cdecl; external libxml2;

function XML_CATALOGS_NAMESPACE: PxmlChar;
function XML_CATALOG_PI: PxmlChar;

// === Konventiert am: 3-3-25 19:17:02 ===


implementation


function XML_CATALOGS_NAMESPACE: PxmlChar;
begin
  XML_CATALOGS_NAMESPACE := PxmlChar('urn:oasis:names:tc:entity:xmlns:xml:catalog');
end;

function XML_CATALOG_PI: PxmlChar;
begin
  XML_CATALOG_PI := PxmlChar('oasis-xml-catalog');
end;


end.
