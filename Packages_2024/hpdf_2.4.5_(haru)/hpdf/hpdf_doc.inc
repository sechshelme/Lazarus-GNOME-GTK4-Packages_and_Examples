{$IFDEF read_interface}


const
  HPDF_SIG_BYTES = $41504446;
  HPDF_VER_DEFAULT = HPDF_VER_13;

type
  THPDF_Doc_Rec = record
    sig_bytes: THPDF_UINT32;
    pdf_version: THPDF_PDFVer;
    mmgr: THPDF_MMgr;
    catalog: THPDF_Catalog;
    outlines: THPDF_Outline;
    xref: THPDF_Xref;
    root_pages: THPDF_Pages;
    cur_pages: THPDF_Pages;
    cur_page: THPDF_Page;
    page_list: THPDF_List;
    error: THPDF_Error_Rec;
    info: THPDF_Dict;
    trailer: THPDF_Dict;
    font_mgr: THPDF_List;
    ttfont_tag: array[0..5] of THPDF_BYTE;
    fontdef_list: THPDF_List;
    encoder_list: THPDF_List;
    cur_encoder: THPDF_Encoder;
    compression_mode: THPDF_BOOL;
    encrypt_on: THPDF_BOOL;
    encrypt_dict: THPDF_EncryptDict;
    def_encoder: THPDF_Encoder;
    page_per_pages: THPDF_UINT;
    cur_page_num: THPDF_UINT;
    stream: THPDF_Stream;
    pdfa_type: THPDF_PDFAType;
    xmp_extensions: THPDF_List;
  end;
  PHPDF_Doc_Rec = ^THPDF_Doc_Rec;

//  PHPDF_Doc = ^THPDF_Doc;
//  THPDF_Doc = PHPDF_Doc_Rec;

function HPDF_Doc_FindEncoder(pdf: THPDF_Doc; encoding_name: pchar): THPDF_Encoder; cdecl; external libhpdf;
function HPDF_Doc_FindFontDef(pdf: THPDF_Doc; font_name: pchar): THPDF_FontDef; cdecl; external libhpdf;
function HPDF_Doc_FindFont(pdf: THPDF_Doc; font_name: pchar; encoding_name: pchar): THPDF_Font; cdecl; external libhpdf;
function HPDF_Doc_Validate(pdf: THPDF_Doc): THPDF_BOOL; cdecl; external libhpdf;

function HPDF_Doc_GetCurrentPages(pdf: THPDF_Doc): THPDF_Pages; cdecl; external libhpdf;
function HPDF_Doc_AddPagesTo(pdf: THPDF_Doc; parent: THPDF_Pages): THPDF_Pages; cdecl; external libhpdf;
function HPDF_Doc_SetCurrentPages(pdf: THPDF_Doc; pages: THPDF_Pages): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Doc_SetCurrentPage(pdf: THPDF_Doc; page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_GetFontDef(pdf: THPDF_Doc; font_name: pchar): THPDF_FontDef; cdecl; external libhpdf;
function HPDF_Doc_RegisterFontDef(pdf: THPDF_Doc; fontdef: THPDF_FontDef): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Doc_RegisterEncoder(pdf: THPDF_Doc; encoder: THPDF_Encoder): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Doc_SetEncryptOn(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Doc_SetEncryptOff(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Doc_PrepareEncryption(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:00:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
