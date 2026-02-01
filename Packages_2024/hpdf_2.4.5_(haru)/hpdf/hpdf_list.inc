{$IFDEF read_interface}


type
  THPDF_List_Rec = record
    mmgr: THPDF_MMgr;
    error: THPDF_Error;
    block_siz: THPDF_UINT;
    items_per_block: THPDF_UINT;
    count: THPDF_UINT;
    obj: ^pointer;
  end;
  PHPDF_List_Rec = ^THPDF_List_Rec;

  PHPDF_List = ^THPDF_List;
  THPDF_List = PHPDF_List_Rec;

function HPDF_List_New(mmgr: THPDF_MMgr; items_per_block: THPDF_UINT): THPDF_List; cdecl; external libhpdf;
procedure HPDF_List_Free(list: THPDF_List); cdecl; external libhpdf;
function HPDF_List_Add(list: THPDF_List; item: pointer): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_List_Insert(list: THPDF_List; target: pointer; item: pointer): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_List_Remove(list: THPDF_List; item: pointer): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_List_RemoveByIndex(list: THPDF_List; index: THPDF_UINT): pointer; cdecl; external libhpdf;
function HPDF_List_ItemAt(list: THPDF_List; index: THPDF_UINT): pointer; cdecl; external libhpdf;
function HPDF_List_Find(list: THPDF_List; item: pointer): THPDF_INT32; cdecl; external libhpdf;
procedure HPDF_List_Clear(list: THPDF_List); cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:02:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
