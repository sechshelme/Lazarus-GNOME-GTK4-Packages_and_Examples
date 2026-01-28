unit hpdf_mmgr;

interface

uses
  fp_hpdf, hpdf, hpdf_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PHPDF_MPool_Node_Rec = ^THPDF_MPool_Node_Rec;
  PHPDF_MPool_Node = ^THPDF_MPool_Node;
  THPDF_MPool_Node = PHPDF_MPool_Node_Rec;

  THPDF_MPool_Node_Rec = record
    buf: PHPDF_BYTE;
    size: THPDF_UINT;
    used_size: THPDF_UINT;
    next_node: THPDF_MPool_Node;
  end;

  PHPDF_MMgr_Rec = ^THPDF_MMgr_Rec;
  PHPDF_MMgr = ^THPDF_MMgr;
  THPDF_MMgr = PHPDF_MMgr_Rec;

  THPDF_MMgr_Rec = record
    error: THPDF_Error;
    alloc_fn: THPDF_Alloc_Func;
    free_fn: THPDF_Free_Func;
    mpool: THPDF_MPool_Node;
    buf_size: THPDF_UINT;
    alloc_cnt: THPDF_UINT;
    free_cnt: THPDF_UINT;
  end;

function HPDF_MMgr_New(error: THPDF_Error; buf_size: THPDF_UINT; alloc_fn: THPDF_Alloc_Func; free_fn: THPDF_Free_Func): THPDF_MMgr; cdecl; external libhpdf;
procedure HPDF_MMgr_Free(mmgr: THPDF_MMgr); cdecl; external libhpdf;
function HPDF_GetMem(mmgr: THPDF_MMgr; size: THPDF_UINT): pointer; cdecl; external libhpdf;
procedure HPDF_FreeMem(mmgr: THPDF_MMgr; aptr: pointer); cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:02:42 ===


implementation



end.
