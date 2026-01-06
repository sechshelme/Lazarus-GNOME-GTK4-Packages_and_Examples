unit xml_tree;

interface

uses
  fp_magiccore, magick_type, splay_tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXMLTreeInfo = type Pointer;

function CanonicalXMLContent(para1: pchar; para2: TMagickBooleanType): pchar; cdecl; external libmagiccore;
function XMLTreeInfoToXML(para1: PXMLTreeInfo): pchar; cdecl; external libmagiccore;
function GetXMLTreeAttribute(para1: PXMLTreeInfo; para2: pchar): pchar; cdecl; external libmagiccore;
function GetXMLTreeContent(para1: PXMLTreeInfo): pchar; cdecl; external libmagiccore;
function GetXMLTreeProcessingInstructions(para1: PXMLTreeInfo; para2: pchar): Ppchar; cdecl; external libmagiccore;
function GetXMLTreeTag(para1: PXMLTreeInfo): pchar; cdecl; external libmagiccore;
function GetXMLTreeAttributes(para1: PXMLTreeInfo; para2: PSplayTreeInfo): TMagickBooleanType; cdecl; external libmagiccore;
function AddChildToXMLTree(para1: PXMLTreeInfo; para2: pchar; para3: Tsize_t): PXMLTreeInfo; cdecl; external libmagiccore;
function AddPathToXMLTree(para1: PXMLTreeInfo; para2: pchar; para3: Tsize_t): PXMLTreeInfo; cdecl; external libmagiccore;
function DestroyXMLTree(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagiccore;
function GetNextXMLTreeTag(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagiccore;
function GetXMLTreeChild(para1: PXMLTreeInfo; para2: pchar): PXMLTreeInfo; cdecl; external libmagiccore;
function GetXMLTreeOrdered(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagiccore;
function GetXMLTreePath(para1: PXMLTreeInfo; para2: pchar): PXMLTreeInfo; cdecl; external libmagiccore;
function GetXMLTreeSibling(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagiccore;
function InsertTagIntoXMLTree(para1: PXMLTreeInfo; para2: PXMLTreeInfo; para3: Tsize_t): PXMLTreeInfo; cdecl; external libmagiccore;
function NewXMLTree(para1: pchar; para2: PExceptionInfo): PXMLTreeInfo; cdecl; external libmagiccore;
function NewXMLTreeTag(para1: pchar): PXMLTreeInfo; cdecl; external libmagiccore;
function ParseTagFromXMLTree(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagiccore;
function PruneTagFromXMLTree(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagiccore;
function SetXMLTreeAttribute(para1: PXMLTreeInfo; para2: pchar; para3: pchar): PXMLTreeInfo; cdecl; external libmagiccore;
function SetXMLTreeContent(para1: PXMLTreeInfo; para2: pchar): PXMLTreeInfo; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:50:57 ===


implementation



end.
