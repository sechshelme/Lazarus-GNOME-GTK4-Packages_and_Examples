{$IFDEF read_interface}


type
  PHPDF_Catalog = ^THPDF_Catalog;
  THPDF_Catalog = THPDF_Dict;

function HPDF_Catalog_New(mmgr: THPDF_MMgr; xref: THPDF_Xref): THPDF_Catalog; cdecl; external libhpdf;
function HPDF_Catalog_GetNames(catalog: THPDF_Catalog): THPDF_NameDict; cdecl; external libhpdf;
function HPDF_Catalog_SetNames(catalog: THPDF_Catalog; dict: THPDF_NameDict): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Catalog_GetRoot(catalog: THPDF_Catalog): THPDF_Pages; cdecl; external libhpdf;
function HPDF_Catalog_GetPageLayout(catalog: THPDF_Catalog): THPDF_PageLayout; cdecl; external libhpdf;
function HPDF_Catalog_SetPageLayout(catalog: THPDF_Catalog; layout: THPDF_PageLayout): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Catalog_GetPageMode(catalog: THPDF_Catalog): THPDF_PageMode; cdecl; external libhpdf;
function HPDF_Catalog_SetPageMode(catalog: THPDF_Catalog; mode: THPDF_PageMode): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Catalog_SetOpenAction(catalog: THPDF_Catalog; open_action: THPDF_Destination): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Catalog_AddPageLabel(catalog: THPDF_Catalog; page_num: THPDF_UINT; page_label: THPDF_Dict): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Catalog_GetViewerPreference(catalog: THPDF_Catalog): THPDF_UINT; cdecl; external libhpdf;
function HPDF_Catalog_SetViewerPreference(catalog: THPDF_Catalog; value: THPDF_UINT): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Catalog_Validate(catalog: THPDF_Catalog): THPDF_BOOL; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 13:59:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
