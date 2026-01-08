{$IFDEF read_interface}


type
  PXMLTreeInfo = type Pointer;

function CanonicalXMLContent(para1: pchar; para2: TMagickBooleanType): pchar; cdecl; external libmagickcore;
function XMLTreeInfoToXML(para1: PXMLTreeInfo): pchar; cdecl; external libmagickcore;
function GetXMLTreeAttribute(para1: PXMLTreeInfo; para2: pchar): pchar; cdecl; external libmagickcore;
function GetXMLTreeContent(para1: PXMLTreeInfo): pchar; cdecl; external libmagickcore;
function GetXMLTreeProcessingInstructions(para1: PXMLTreeInfo; para2: pchar): Ppchar; cdecl; external libmagickcore;
function GetXMLTreeTag(para1: PXMLTreeInfo): pchar; cdecl; external libmagickcore;
function GetXMLTreeAttributes(para1: PXMLTreeInfo; para2: PSplayTreeInfo): TMagickBooleanType; cdecl; external libmagickcore;
function AddChildToXMLTree(para1: PXMLTreeInfo; para2: pchar; para3: Tsize_t): PXMLTreeInfo; cdecl; external libmagickcore;
function AddPathToXMLTree(para1: PXMLTreeInfo; para2: pchar; para3: Tsize_t): PXMLTreeInfo; cdecl; external libmagickcore;
function DestroyXMLTree(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function GetNextXMLTreeTag(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function GetXMLTreeChild(para1: PXMLTreeInfo; para2: pchar): PXMLTreeInfo; cdecl; external libmagickcore;
function GetXMLTreeOrdered(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function GetXMLTreePath(para1: PXMLTreeInfo; para2: pchar): PXMLTreeInfo; cdecl; external libmagickcore;
function GetXMLTreeSibling(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function InsertTagIntoXMLTree(para1: PXMLTreeInfo; para2: PXMLTreeInfo; para3: Tsize_t): PXMLTreeInfo; cdecl; external libmagickcore;
function NewXMLTree(para1: pchar; para2: PExceptionInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function NewXMLTreeTag(para1: pchar): PXMLTreeInfo; cdecl; external libmagickcore;
function ParseTagFromXMLTree(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function PruneTagFromXMLTree(para1: PXMLTreeInfo): PXMLTreeInfo; cdecl; external libmagickcore;
function SetXMLTreeAttribute(para1: PXMLTreeInfo; para2: pchar; para3: pchar): PXMLTreeInfo; cdecl; external libmagickcore;
function SetXMLTreeContent(para1: PXMLTreeInfo; para2: pchar): PXMLTreeInfo; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:50:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
