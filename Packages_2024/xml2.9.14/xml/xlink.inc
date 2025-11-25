{$IFDEF read_interface}

type
  PxlinkHRef = ^TxlinkHRef;
  TxlinkHRef = PxmlChar;

  PxlinkRole = ^TxlinkRole;
  TxlinkRole = PxmlChar;

  PxlinkTitle = ^TxlinkTitle;
  TxlinkTitle = PxmlChar;

  PxlinkType = ^TxlinkType;
  TxlinkType = longint;

const
  XLINK_TYPE_NONE = 0;
  XLINK_TYPE_SIMPLE = 1;
  XLINK_TYPE_EXTENDED = 2;
  XLINK_TYPE_EXTENDED_SET = 3;

type
  PxlinkShow = ^TxlinkShow;
  TxlinkShow = longint;

const
  XLINK_SHOW_NONE = 0;
  XLINK_SHOW_NEW = 1;
  XLINK_SHOW_EMBED = 2;
  XLINK_SHOW_REPLACE = 3;

type
  PxlinkActuate = ^TxlinkActuate;
  TxlinkActuate = longint;

const
  XLINK_ACTUATE_NONE = 0;
  XLINK_ACTUATE_AUTO = 1;
  XLINK_ACTUATE_ONREQUEST = 2;

type
  TxlinkNodeDetectFunc = procedure(ctx: pointer; node: PxmlNode); cdecl;
  TxlinkSimpleLinkFunk = procedure(ctx: pointer; node: PxmlNode; href: TxlinkHRef; role: TxlinkRole; title: TxlinkTitle); cdecl;
  TxlinkExtendedLinkFunk = procedure(ctx: pointer; node: PxmlNode; nbLocators: longint; hrefs: PxlinkHRef; roles: PxlinkRole; nbArcs: longint; from: PxlinkRole; to_: PxlinkRole; Show: PxlinkShow;actuate:PxlinkActuate; nbTitles: longint; titles: PxlinkTitle; langs: PPxmlChar); cdecl;
  TxlinkExtendedLinkSetFunk = procedure(ctx: pointer; node: PxmlNode; nbLocators: longint; hrefs: PxlinkHRef; roles: PxlinkRole; nbTitles: longint; titles: PxlinkTitle; langs: PPxmlChar); cdecl;

  TxlinkHandler = record
    simple: TxlinkSimpleLinkFunk;
    extended: TxlinkExtendedLinkFunk;
    set_: TxlinkExtendedLinkSetFunk;
  end;
  PxlinkHandler = ^TxlinkHandler;

function xlinkGetDefaultDetect: TxlinkNodeDetectFunc; cdecl; external libxml2;
procedure xlinkSetDefaultDetect(func: TxlinkNodeDetectFunc); cdecl; external libxml2;
function xlinkGetDefaultHandler: PxlinkHandler; cdecl; external libxml2;
procedure xlinkSetDefaultHandler(handler: PxlinkHandler); cdecl; external libxml2;
function xlinkIsLink(doc: PxmlDoc; node: PxmlNode): TxlinkType; cdecl; external libxml2;

// === Konventiert am: 3-3-25 17:42:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
