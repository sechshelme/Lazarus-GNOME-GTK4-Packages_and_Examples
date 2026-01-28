unit hpdf_pages;

interface

uses
  fp_hpdf, hpdf_types, hpdf, hpdf_gstate;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function HPDF_Pages_New(mmgr: THPDF_MMgr; parent: THPDF_Pages; xref: THPDF_Xref): THPDF_Pages; cdecl; external libhpdf;
function HPDF_Pages_Validate(pages: THPDF_Pages): THPDF_BOOL; cdecl; external libhpdf;
function HPDF_Pages_AddKids(parent: THPDF_Pages; kid: THPDF_Dict): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_InsertBefore(page: THPDF_Page; target: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;

type
  PHPDF_PageAttr_Rec = ^THPDF_PageAttr_Rec;
  PHPDF_PageAttr = ^THPDF_PageAttr;
  THPDF_PageAttr = PHPDF_PageAttr_Rec;

  THPDF_PageAttr_Rec = record
    parent: THPDF_Pages;
    fonts: THPDF_Dict;
    xobjects: THPDF_Dict;
    ext_gstates: THPDF_Dict;
    shadings: THPDF_Dict;
    gstate: THPDF_GState;
    str_pos: THPDF_Point;
    cur_pos: THPDF_Point;
    text_pos: THPDF_Point;
    text_matrix: THPDF_TransMatrix;
    gmode: THPDF_UINT16;
    contents: THPDF_Dict;
    stream: THPDF_Stream;
    xref: THPDF_Xref;
    compression_mode: THPDF_UINT;
    ver: PHPDF_PDFVer;
  end;

function HPDF_Page_Validate(page: THPDF_Page): THPDF_BOOL; cdecl; external libhpdf;
function HPDF_Page_New(mmgr: THPDF_MMgr; xref: THPDF_Xref): THPDF_Page; cdecl; external libhpdf;
function HPDF_Page_GetInheritableItem(page: THPDF_Page; key: pchar; obj_class: THPDF_UINT16): pointer; cdecl; external libhpdf;
function HPDF_Page_GetXObjectName(page: THPDF_Page; xobj: THPDF_XObject): pchar; cdecl; external libhpdf;
function HPDF_Page_GetLocalFontName(page: THPDF_Page; font: THPDF_Font): pchar; cdecl; external libhpdf;
function HPDF_Page_GetExtGStateName(page: THPDF_Page; gstate: THPDF_ExtGState): pchar; cdecl; external libhpdf;
function HPDF_Page_GetShadingName(page: THPDF_Page; shading: THPDF_Shading): pchar; cdecl; external libhpdf;
function HPDF_Page_GetMediaBox(page: THPDF_Page): THPDF_Box; cdecl; external libhpdf;
function HPDF_Page_SetBoxValue(page: THPDF_Page; name: pchar; index: THPDF_UINT; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
procedure HPDF_Page_SetFilter(page: THPDF_Page; filter: THPDF_UINT); cdecl; external libhpdf;
function HPDF_Page_CheckState(page: THPDF_Page; mode: THPDF_UINT): THPDF_STATUS; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:09:40 ===


implementation



end.
