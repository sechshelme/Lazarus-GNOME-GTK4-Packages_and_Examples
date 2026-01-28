{$IFDEF read_interface}


type
  PHPDF_HANDLE = ^THPDF_HANDLE;
  THPDF_HANDLE = pointer;

  PHPDF_Boolean = ^THPDF_Boolean;
  THPDF_Boolean = THPDF_HANDLE;

  PHPDF_Doc = ^THPDF_Doc;
  THPDF_Doc = THPDF_HANDLE;

  PHPDF_Page = ^THPDF_Page;
  THPDF_Page = THPDF_HANDLE;

  PHPDF_Pages = ^THPDF_Pages;
  THPDF_Pages = THPDF_HANDLE;

  PHPDF_Stream = ^THPDF_Stream;
  THPDF_Stream = THPDF_HANDLE;

  PHPDF_Image = ^THPDF_Image;
  THPDF_Image = THPDF_HANDLE;

  PHPDF_Font = ^THPDF_Font;
  THPDF_Font = THPDF_HANDLE;

  PHPDF_Outline = ^THPDF_Outline;
  THPDF_Outline = THPDF_HANDLE;

  PHPDF_Encoder = ^THPDF_Encoder;
  THPDF_Encoder = THPDF_HANDLE;

  PHPDF_3DMeasure = ^THPDF_3DMeasure;
  THPDF_3DMeasure = THPDF_HANDLE;

  PHPDF_ExData = ^THPDF_ExData;
  THPDF_ExData = THPDF_HANDLE;

  PHPDF_Destination = ^THPDF_Destination;
  THPDF_Destination = THPDF_HANDLE;

  PHPDF_XObject = ^THPDF_XObject;
  THPDF_XObject = THPDF_HANDLE;

  PHPDF_Annotation = ^THPDF_Annotation;
  THPDF_Annotation = THPDF_HANDLE;

  PHPDF_ExtGState = ^THPDF_ExtGState;
  THPDF_ExtGState = THPDF_HANDLE;

  PHPDF_FontDef = ^THPDF_FontDef;
  THPDF_FontDef = THPDF_HANDLE;

  PHPDF_U3D = ^THPDF_U3D;
  THPDF_U3D = THPDF_HANDLE;

  PHPDF_JavaScript = ^THPDF_JavaScript;
  THPDF_JavaScript = THPDF_HANDLE;

  PHPDF_Error = ^THPDF_Error;
  THPDF_Error = THPDF_HANDLE;

  PHPDF_MMgr = ^THPDF_MMgr;
  THPDF_MMgr = THPDF_HANDLE;

  PHPDF_Dict = ^THPDF_Dict;
  THPDF_Dict = THPDF_HANDLE;

  PHPDF_EmbeddedFile = ^THPDF_EmbeddedFile;
  THPDF_EmbeddedFile = THPDF_HANDLE;

  PHPDF_OutputIntent = ^THPDF_OutputIntent;
  THPDF_OutputIntent = THPDF_HANDLE;

  PHPDF_Xref = ^THPDF_Xref;
  THPDF_Xref = THPDF_HANDLE;

  PHPDF_Shading = ^THPDF_Shading;
  THPDF_Shading = THPDF_HANDLE;

function HPDF_GetVersion: pchar; cdecl; external libhpdf;
function HPDF_NewEx(user_error_fn: THPDF_Error_Handler; user_alloc_fn: THPDF_Alloc_Func; user_free_fn: THPDF_Free_Func; mem_pool_buf_size: THPDF_UINT; user_data: pointer): THPDF_Doc; cdecl; external libhpdf;
function HPDF_New(user_error_fn: THPDF_Error_Handler; user_data: pointer): THPDF_Doc; cdecl; external libhpdf;
function HPDF_SetErrorHandler(pdf: THPDF_Doc; user_error_fn: THPDF_Error_Handler): THPDF_STATUS; cdecl; external libhpdf;
procedure HPDF_Free(pdf: THPDF_Doc); cdecl; external libhpdf;
function HPDF_GetDocMMgr(doc: THPDF_Doc): THPDF_MMgr; cdecl; external libhpdf;
function HPDF_NewDoc(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
procedure HPDF_FreeDoc(pdf: THPDF_Doc); cdecl; external libhpdf;
function HPDF_HasDoc(pdf: THPDF_Doc): THPDF_BOOL; cdecl; external libhpdf;
procedure HPDF_FreeDocAll(pdf: THPDF_Doc); cdecl; external libhpdf;
function HPDF_SaveToStream(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_GetContents(pdf: THPDF_Doc; buf: PHPDF_BYTE; size: PHPDF_UINT32): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_GetStreamSize(pdf: THPDF_Doc): THPDF_UINT32; cdecl; external libhpdf;
function HPDF_ReadFromStream(pdf: THPDF_Doc; buf: PHPDF_BYTE; size: PHPDF_UINT32): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_ResetStream(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_SaveToFile(pdf: THPDF_Doc; file_name: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_GetError(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_GetErrorDetail(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
procedure HPDF_ResetError(pdf: THPDF_Doc); cdecl; external libhpdf;
function HPDF_CheckError(error: THPDF_Error): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_SetPagesConfiguration(pdf: THPDF_Doc; page_per_pages: THPDF_UINT): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_GetPageByIndex(pdf: THPDF_Doc; index: THPDF_UINT): THPDF_Page; cdecl; external libhpdf;
function HPDF_SetPDFAConformance(pdf: THPDF_Doc; pdfa_type: THPDF_PDFAType): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_AddPDFAXmpExtension(pdf: THPDF_Doc; xmp_description: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_AppendOutputIntents(pdf: THPDF_Doc; iccname: pchar; iccdict: THPDF_Dict): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_GetPageMMgr(page: THPDF_Page): THPDF_MMgr; cdecl; external libhpdf;
function HPDF_GetPageLayout(pdf: THPDF_Doc): THPDF_PageLayout; cdecl; external libhpdf;
function HPDF_SetPageLayout(pdf: THPDF_Doc; layout: THPDF_PageLayout): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_GetPageMode(pdf: THPDF_Doc): THPDF_PageMode; cdecl; external libhpdf;
function HPDF_SetPageMode(pdf: THPDF_Doc; mode: THPDF_PageMode): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_GetViewerPreference(pdf: THPDF_Doc): THPDF_UINT; cdecl; external libhpdf;
function HPDF_SetViewerPreference(pdf: THPDF_Doc; value: THPDF_UINT): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_SetOpenAction(pdf: THPDF_Doc; open_action: THPDF_Destination): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_GetCurrentPage(pdf: THPDF_Doc): THPDF_Page; cdecl; external libhpdf;
function HPDF_AddPage(pdf: THPDF_Doc): THPDF_Page; cdecl; external libhpdf;
function HPDF_InsertPage(pdf: THPDF_Doc; page: THPDF_Page): THPDF_Page; cdecl; external libhpdf;
function HPDF_Page_SetWidth(page: THPDF_Page; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetHeight(page: THPDF_Page; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetBoundary(page: THPDF_Page; boundary: THPDF_PageBoundary; left: THPDF_REAL; bottom: THPDF_REAL; right: THPDF_REAL;
  top: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetSize(page: THPDF_Page; size: THPDF_PageSizes; direction: THPDF_PageDirection): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetRotate(page: THPDF_Page; angle: THPDF_UINT16): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetZoom(page: THPDF_Page; zoom: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_GetFont(pdf: THPDF_Doc; font_name: pchar; encoding_name: pchar): THPDF_Font; cdecl; external libhpdf;
function HPDF_LoadType1FontFromFile(pdf: THPDF_Doc; afm_file_name: pchar; data_file_name: pchar): pchar; cdecl; external libhpdf;
function HPDF_GetTTFontDefFromFile(pdf: THPDF_Doc; file_name: pchar; embedding: THPDF_BOOL): THPDF_FontDef; cdecl; external libhpdf;
function HPDF_LoadTTFontFromFile(pdf: THPDF_Doc; file_name: pchar; embedding: THPDF_BOOL): pchar; cdecl; external libhpdf;
function HPDF_LoadTTFontFromFile2(pdf: THPDF_Doc; file_name: pchar; index: THPDF_UINT; embedding: THPDF_BOOL): pchar; cdecl; external libhpdf;
function HPDF_LoadTTFontFromMemory(pdf: THPDF_Doc; buffer: PHPDF_BYTE; size: THPDF_UINT; embedding: THPDF_BOOL): pchar; cdecl; external libhpdf;
function HPDF_AddPageLabel(pdf: THPDF_Doc; page_num: THPDF_UINT; style: THPDF_PageNumStyle; first_page: THPDF_UINT; prefix: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_UseJPFonts(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_UseKRFonts(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_UseCNSFonts(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_UseCNTFonts(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_CreateOutline(pdf: THPDF_Doc; parent: THPDF_Outline; title: pchar; encoder: THPDF_Encoder): THPDF_Outline; cdecl; external libhpdf;
function HPDF_Outline_SetOpened(outline: THPDF_Outline; opened: THPDF_BOOL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Outline_SetDestination(outline: THPDF_Outline; dst: THPDF_Destination): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_CreateDestination(page: THPDF_Page): THPDF_Destination; cdecl; external libhpdf;
function HPDF_Destination_SetXYZ(dst: THPDF_Destination; left: THPDF_REAL; top: THPDF_REAL; zoom: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Destination_SetFit(dst: THPDF_Destination): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Destination_SetFitH(dst: THPDF_Destination; top: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Destination_SetFitV(dst: THPDF_Destination; left: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Destination_SetFitR(dst: THPDF_Destination; left: THPDF_REAL; bottom: THPDF_REAL; right: THPDF_REAL; top: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Destination_SetFitB(dst: THPDF_Destination): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Destination_SetFitBH(dst: THPDF_Destination; top: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Destination_SetFitBV(dst: THPDF_Destination; left: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_GetEncoder(pdf: THPDF_Doc; encoding_name: pchar): THPDF_Encoder; cdecl; external libhpdf;
function HPDF_GetCurrentEncoder(pdf: THPDF_Doc): THPDF_Encoder; cdecl; external libhpdf;
function HPDF_SetCurrentEncoder(pdf: THPDF_Doc; encoding_name: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Encoder_GetType(encoder: THPDF_Encoder): THPDF_EncoderType; cdecl; external libhpdf;
function HPDF_Encoder_GetByteType(encoder: THPDF_Encoder; text: pchar; index: THPDF_UINT): THPDF_ByteType; cdecl; external libhpdf;
function HPDF_Encoder_GetUnicode(encoder: THPDF_Encoder; code: THPDF_UINT16): THPDF_UNICODE; cdecl; external libhpdf;
function HPDF_Encoder_GetWritingMode(encoder: THPDF_Encoder): THPDF_WritingMode; cdecl; external libhpdf;
function HPDF_UseJPEncodings(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_UseKREncodings(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_UseCNSEncodings(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_UseCNTEncodings(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_UseUTFEncodings(pdf: THPDF_Doc): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_CreateXObjectFromImage(pdf: THPDF_Doc; page: THPDF_Page; rect: THPDF_Rect; image: THPDF_Image; zoom: THPDF_BOOL): THPDF_XObject; cdecl; external libhpdf;
function HPDF_Page_CreateXObjectAsWhiteRect(pdf: THPDF_Doc; page: THPDF_Page; rect: THPDF_Rect): THPDF_XObject; cdecl; external libhpdf;

function HPDF_Page_Create3DAnnot(page: THPDF_Page; rect: THPDF_Rect; tb: THPDF_BOOL; np: THPDF_BOOL; u3d: THPDF_U3D; ap: THPDF_Image): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateTextAnnot(page: THPDF_Page; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateFreeTextAnnot(page: THPDF_Page; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateLineAnnot(page: THPDF_Page; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateWidgetAnnot_WhiteOnlyWhilePrint(pdf: THPDF_Doc; page: THPDF_Page; rect: THPDF_Rect): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateWidgetAnnot(page: THPDF_Page; rect: THPDF_Rect): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateLinkAnnot(page: THPDF_Page; rect: THPDF_Rect; dst: THPDF_Destination): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateURILinkAnnot(page: THPDF_Page; rect: THPDF_Rect; uri: pchar): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateTextMarkupAnnot(page: THPDF_Page; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder; subType: THPDF_AnnotType): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateHighlightAnnot(page: THPDF_Page; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateUnderlineAnnot(page: THPDF_Page; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateSquigglyAnnot(page: THPDF_Page; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateStrikeOutAnnot(page: THPDF_Page; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreatePopupAnnot(page: THPDF_Page; rect: THPDF_Rect; parent: THPDF_Annotation): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateStampAnnot(page: THPDF_Page; rect: THPDF_Rect; name: THPDF_StampAnnotName; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateProjectionAnnot(page: THPDF_Page; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateSquareAnnot(page: THPDF_Page; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_Page_CreateCircleAnnot(page: THPDF_Page; rect: THPDF_Rect; text: pchar; encoder: THPDF_Encoder): THPDF_Annotation; cdecl; external libhpdf;
function HPDF_LinkAnnot_SetHighlightMode(annot: THPDF_Annotation; mode: THPDF_AnnotHighlightMode): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_LinkAnnot_SetJavaScript(annot: THPDF_Annotation; javascript: THPDF_JavaScript): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_LinkAnnot_SetBorderStyle(annot: THPDF_Annotation; width: THPDF_REAL; dash_on: THPDF_UINT16; dash_off: THPDF_UINT16): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_TextAnnot_SetIcon(annot: THPDF_Annotation; icon: THPDF_AnnotIcon): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_TextAnnot_SetOpened(annot: THPDF_Annotation; opened: THPDF_BOOL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Annot_SetRGBColor(annot: THPDF_Annotation; color: THPDF_RGBColor): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Annot_SetCMYKColor(annot: THPDF_Annotation; color: THPDF_CMYKColor): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Annot_SetGrayColor(annot: THPDF_Annotation; color: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Annot_SetNoColor(annot: THPDF_Annotation): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetTitle(annot: THPDF_Annotation; name: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetSubject(annot: THPDF_Annotation; name: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetCreationDate(annot: THPDF_Annotation; value: THPDF_Date): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetTransparency(annot: THPDF_Annotation; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetIntent(annot: THPDF_Annotation; intent: THPDF_AnnotIntent): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetPopup(annot: THPDF_Annotation; popup: THPDF_Annotation): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetRectDiff(annot: THPDF_Annotation; rect: THPDF_Rect): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetCloudEffect(annot: THPDF_Annotation; cloudIntensity: THPDF_INT): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetInteriorRGBColor(annot: THPDF_Annotation; color: THPDF_RGBColor): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetInteriorCMYKColor(annot: THPDF_Annotation; color: THPDF_CMYKColor): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetInteriorGrayColor(annot: THPDF_Annotation; color: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_MarkupAnnot_SetInteriorTransparent(annot: THPDF_Annotation): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_TextMarkupAnnot_SetQuadPoints(annot: THPDF_Annotation; lb: THPDF_Point; rb: THPDF_Point; rt: THPDF_Point; lt: THPDF_Point): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Annot_Set3DView(mmgr: THPDF_MMgr; annot: THPDF_Annotation; annot3d: THPDF_Annotation; view: THPDF_Dict): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_PopupAnnot_SetOpened(annot: THPDF_Annotation; opened: THPDF_BOOL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_FreeTextAnnot_SetLineEndingStyle(annot: THPDF_Annotation; startStyle: THPDF_LineAnnotEndingStyle; endStyle: THPDF_LineAnnotEndingStyle): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_FreeTextAnnot_Set3PointCalloutLine(annot: THPDF_Annotation; startPoint: THPDF_Point; kneePoint: THPDF_Point; endPoint: THPDF_Point): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_FreeTextAnnot_Set2PointCalloutLine(annot: THPDF_Annotation; startPoint: THPDF_Point; endPoint: THPDF_Point): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_FreeTextAnnot_SetDefaultStyle(annot: THPDF_Annotation; style: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_LineAnnot_SetPosition(annot: THPDF_Annotation; startPoint: THPDF_Point; startStyle: THPDF_LineAnnotEndingStyle; endPoint: THPDF_Point; endStyle: THPDF_LineAnnotEndingStyle): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_LineAnnot_SetLeader(annot: THPDF_Annotation; leaderLen: THPDF_INT; leaderExtLen: THPDF_INT; leaderOffsetLen: THPDF_INT): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_LineAnnot_SetCaption(annot: THPDF_Annotation; showCaption: THPDF_BOOL; position: THPDF_LineAnnotCapPosition; horzOffset: THPDF_INT; vertOffset: THPDF_INT): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Annotation_SetBorderStyle(annot: THPDF_Annotation; subtype: THPDF_BSSubtype; width: THPDF_REAL; dash_on: THPDF_UINT16; dash_off: THPDF_UINT16; dash_phase: THPDF_UINT16): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_ProjectionAnnot_SetExData(annot: THPDF_Annotation; exdata: THPDF_ExData): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_Create3DC3DMeasure(page: THPDF_Page; firstanchorpoint: THPDF_Point3D; textanchorpoint: THPDF_Point3D): THPDF_3DMeasure; cdecl; external libhpdf;
function HPDF_Page_CreatePD33DMeasure(page: THPDF_Page; annotationPlaneNormal: THPDF_Point3D; firstAnchorPoint: THPDF_Point3D; secondAnchorPoint: THPDF_Point3D; leaderLinesDirection: THPDF_Point3D; measurementValuePoint: THPDF_Point3D;
  textYDirection: THPDF_Point3D; value: THPDF_REAL; unitsString: pchar): THPDF_3DMeasure; cdecl; external libhpdf;
function HPDF_3DMeasure_SetName(measure: THPDF_3DMeasure; name: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_3DMeasure_SetColor(measure: THPDF_3DMeasure; color: THPDF_RGBColor): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_3DMeasure_SetTextSize(measure: THPDF_3DMeasure; textsize: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_3DC3DMeasure_SetTextBoxSize(measure: THPDF_3DMeasure; x: THPDF_INT32; y: THPDF_INT32): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_3DC3DMeasure_SetText(measure: THPDF_3DMeasure; text: pchar; encoder: THPDF_Encoder): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_3DC3DMeasure_SetProjectionAnotation(measure: THPDF_3DMeasure; projectionanotation: THPDF_Annotation): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_Create3DAnnotExData(page: THPDF_Page): THPDF_ExData; cdecl; external libhpdf;
function HPDF_3DAnnotExData_Set3DMeasurement(exdata: THPDF_ExData; measure: THPDF_3DMeasure): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_Create3DView(page: THPDF_Page; u3d: THPDF_U3D; annot3d: THPDF_Annotation; name: pchar): THPDF_Dict; cdecl; external libhpdf;
function HPDF_3DView_Add3DC3DMeasure(view: THPDF_Dict; measure: THPDF_3DMeasure): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_LoadPngImageFromMem(pdf: THPDF_Doc; buffer: PHPDF_BYTE; size: THPDF_UINT): THPDF_Image; cdecl; external libhpdf;
function HPDF_LoadPngImageFromFile(pdf: THPDF_Doc; filename: pchar): THPDF_Image; cdecl; external libhpdf;
function HPDF_LoadPngImageFromFile2(pdf: THPDF_Doc; filename: pchar): THPDF_Image; cdecl; external libhpdf;
function HPDF_LoadJpegImageFromFile(pdf: THPDF_Doc; filename: pchar): THPDF_Image; cdecl; external libhpdf;
function HPDF_LoadJpegImageFromMem(pdf: THPDF_Doc; buffer: PHPDF_BYTE; size: THPDF_UINT): THPDF_Image; cdecl; external libhpdf;
function HPDF_LoadU3DFromFile(pdf: THPDF_Doc; filename: pchar): THPDF_Image; cdecl; external libhpdf;
function HPDF_LoadU3DFromMem(pdf: THPDF_Doc; buffer: PHPDF_BYTE; size: THPDF_UINT): THPDF_Image; cdecl; external libhpdf;
function HPDF_Image_LoadRaw1BitImageFromMem(pdf: THPDF_Doc; buf: PHPDF_BYTE; width: THPDF_UINT; height: THPDF_UINT; line_width: THPDF_UINT; black_is1: THPDF_BOOL; top_is_first: THPDF_BOOL): THPDF_Image; cdecl; external libhpdf;
function HPDF_LoadRawImageFromFile(pdf: THPDF_Doc; filename: pchar; width: THPDF_UINT; height: THPDF_UINT; color_space: THPDF_ColorSpace): THPDF_Image; cdecl; external libhpdf;
function HPDF_LoadRawImageFromMem(pdf: THPDF_Doc; buf: PHPDF_BYTE; width: THPDF_UINT; height: THPDF_UINT; color_space: THPDF_ColorSpace; bits_per_component: THPDF_UINT): THPDF_Image; cdecl; external libhpdf;
function HPDF_Image_AddSMask(image: THPDF_Image; smask: THPDF_Image): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Image_GetSize(image: THPDF_Image): THPDF_Point; cdecl; external libhpdf;
function HPDF_Image_GetSize2(image: THPDF_Image; size: PHPDF_Point): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Image_GetWidth(image: THPDF_Image): THPDF_UINT; cdecl; external libhpdf;
function HPDF_Image_GetHeight(image: THPDF_Image): THPDF_UINT; cdecl; external libhpdf;
function HPDF_Image_GetBitsPerComponent(image: THPDF_Image): THPDF_UINT; cdecl; external libhpdf;
function HPDF_Image_GetColorSpace(image: THPDF_Image): pchar; cdecl; external libhpdf;
function HPDF_Image_SetColorMask(image: THPDF_Image; rmin: THPDF_UINT; rmax: THPDF_UINT; gmin: THPDF_UINT; gmax: THPDF_UINT; bmin: THPDF_UINT; bmax: THPDF_UINT): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Image_SetMaskImage(image: THPDF_Image; mask_image: THPDF_Image): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_SetInfoAttr(pdf: THPDF_Doc; _type: THPDF_InfoType; value: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_GetInfoAttr(pdf: THPDF_Doc; _type: THPDF_InfoType): pchar; cdecl; external libhpdf;
function HPDF_SetInfoDateAttr(pdf: THPDF_Doc; _type: THPDF_InfoType; value: THPDF_Date): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_SetPassword(pdf: THPDF_Doc; owner_passwd: pchar; user_passwd: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_SetPermission(pdf: THPDF_Doc; permission: THPDF_UINT): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_SetEncryptionMode(pdf: THPDF_Doc; mode: THPDF_EncryptMode; key_len: THPDF_UINT): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_SetCompressionMode(pdf: THPDF_Doc; mode: THPDF_UINT): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Font_GetFontName(font: THPDF_Font): pchar; cdecl; external libhpdf;
function HPDF_Font_GetEncodingName(font: THPDF_Font): pchar; cdecl; external libhpdf;
function HPDF_Font_GetUnicodeWidth(font: THPDF_Font; code: THPDF_UNICODE): THPDF_INT; cdecl; external libhpdf;
function HPDF_Font_GetBBox(font: THPDF_Font): THPDF_Box; cdecl; external libhpdf;
function HPDF_Font_GetAscent(font: THPDF_Font): THPDF_INT; cdecl; external libhpdf;
function HPDF_Font_GetDescent(font: THPDF_Font): THPDF_INT; cdecl; external libhpdf;
function HPDF_Font_GetXHeight(font: THPDF_Font): THPDF_UINT; cdecl; external libhpdf;
function HPDF_Font_GetCapHeight(font: THPDF_Font): THPDF_UINT; cdecl; external libhpdf;
function HPDF_Font_TextWidth(font: THPDF_Font; text: PHPDF_BYTE; len: THPDF_UINT): THPDF_TextWidth; cdecl; external libhpdf;
function HPDF_Font_MeasureText(font: THPDF_Font; text: PHPDF_BYTE; len: THPDF_UINT; width: THPDF_REAL; font_size: THPDF_REAL;
  char_space: THPDF_REAL; word_space: THPDF_REAL; wordwrap: THPDF_BOOL; real_width: PHPDF_REAL): THPDF_UINT; cdecl; external libhpdf;

function HPDF_AttachFile(pdf: THPDF_Doc; file_: pchar): THPDF_EmbeddedFile; cdecl; external libhpdf;
function HPDF_EmbeddedFile_SetName(emfile: THPDF_EmbeddedFile; name: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_EmbeddedFile_SetDescription(emfile: THPDF_EmbeddedFile; new_description: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_EmbeddedFile_SetSubtype(emfile: THPDF_EmbeddedFile; subtype: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_EmbeddedFile_SetAFRelationship(emfile: THPDF_EmbeddedFile; relationship: THPDF_AFRelationship): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_EmbeddedFile_SetSize(emfile: THPDF_EmbeddedFile; size: THPDF_UINT64): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_EmbeddedFile_SetCreationDate(emfile: THPDF_EmbeddedFile; creationDate: THPDF_Date): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_EmbeddedFile_SetLastModificationDate(emfile: THPDF_EmbeddedFile; lastModificationDate: THPDF_Date): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_CreateExtGState(pdf: THPDF_Doc): THPDF_ExtGState; cdecl; external libhpdf;
function HPDF_ExtGState_SetAlphaStroke(ext_gstate: THPDF_ExtGState; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_ExtGState_SetAlphaFill(ext_gstate: THPDF_ExtGState; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_ExtGState_SetBlendMode(ext_gstate: THPDF_ExtGState; mode: THPDF_BlendMode): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_TextWidth(page: THPDF_Page; text: pchar): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_MeasureText(page: THPDF_Page; text: pchar; width: THPDF_REAL; wordwrap: THPDF_BOOL; real_width: PHPDF_REAL): THPDF_UINT; cdecl; external libhpdf;
function HPDF_Page_GetWidth(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetHeight(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetGMode(page: THPDF_Page): THPDF_UINT16; cdecl; external libhpdf;
function HPDF_Page_GetCurrentPos(page: THPDF_Page): THPDF_Point; cdecl; external libhpdf;
function HPDF_Page_GetCurrentPos2(page: THPDF_Page; pos: PHPDF_Point): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_GetCurrentTextPos(page: THPDF_Page): THPDF_Point; cdecl; external libhpdf;
function HPDF_Page_GetCurrentTextPos2(page: THPDF_Page; pos: PHPDF_Point): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_GetCurrentFont(page: THPDF_Page): THPDF_Font; cdecl; external libhpdf;
function HPDF_Page_GetCurrentFontSize(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetTransMatrix(page: THPDF_Page): THPDF_TransMatrix; cdecl; external libhpdf;
function HPDF_Page_GetLineWidth(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetLineCap(page: THPDF_Page): THPDF_LineCap; cdecl; external libhpdf;
function HPDF_Page_GetLineJoin(page: THPDF_Page): THPDF_LineJoin; cdecl; external libhpdf;
function HPDF_Page_GetMiterLimit(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetDash(page: THPDF_Page): THPDF_DashMode; cdecl; external libhpdf;
function HPDF_Page_GetFlat(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetCharSpace(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetWordSpace(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetHorizontalScalling(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetTextLeading(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetTextRenderingMode(page: THPDF_Page): THPDF_TextRenderingMode; cdecl; external libhpdf;
function HPDF_Page_GetTextRaise(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetTextRise(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetRGBFill(page: THPDF_Page): THPDF_RGBColor; cdecl; external libhpdf;
function HPDF_Page_GetRGBStroke(page: THPDF_Page): THPDF_RGBColor; cdecl; external libhpdf;
function HPDF_Page_GetCMYKFill(page: THPDF_Page): THPDF_CMYKColor; cdecl; external libhpdf;
function HPDF_Page_GetCMYKStroke(page: THPDF_Page): THPDF_CMYKColor; cdecl; external libhpdf;
function HPDF_Page_GetGrayFill(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetGrayStroke(page: THPDF_Page): THPDF_REAL; cdecl; external libhpdf;
function HPDF_Page_GetStrokingColorSpace(page: THPDF_Page): THPDF_ColorSpace; cdecl; external libhpdf;
function HPDF_Page_GetFillingColorSpace(page: THPDF_Page): THPDF_ColorSpace; cdecl; external libhpdf;
function HPDF_Page_GetTextMatrix(page: THPDF_Page): THPDF_TransMatrix; cdecl; external libhpdf;
function HPDF_Page_GetGStateDepth(page: THPDF_Page): THPDF_UINT; cdecl; external libhpdf;

function HPDF_Page_SetLineWidth(page: THPDF_Page; line_width: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetLineCap(page: THPDF_Page; line_cap: THPDF_LineCap): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetLineJoin(page: THPDF_Page; line_join: THPDF_LineJoin): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetMiterLimit(page: THPDF_Page; miter_limit: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetDash(page: THPDF_Page; dash_ptn: PHPDF_REAL; num_param: THPDF_UINT; phase: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetFlat(page: THPDF_Page; flatness: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetExtGState(page: THPDF_Page; ext_gstate: THPDF_ExtGState): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetShading(page: THPDF_Page; shading: THPDF_Shading): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_GSave(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_GRestore(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_Concat(page: THPDF_Page; a: THPDF_REAL; b: THPDF_REAL; c: THPDF_REAL; d: THPDF_REAL; x: THPDF_REAL; y: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_MoveTo(page: THPDF_Page; x: THPDF_REAL; y: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_LineTo(page: THPDF_Page; x: THPDF_REAL; y: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_CurveTo(page: THPDF_Page; x1: THPDF_REAL; y1: THPDF_REAL; x2: THPDF_REAL; y2: THPDF_REAL; x3: THPDF_REAL; y3: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_CurveTo2(page: THPDF_Page; x2: THPDF_REAL; y2: THPDF_REAL; x3: THPDF_REAL; y3: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_CurveTo3(page: THPDF_Page; x1: THPDF_REAL; y1: THPDF_REAL; x3: THPDF_REAL; y3: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_ClosePath(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_Rectangle(page: THPDF_Page; x: THPDF_REAL; y: THPDF_REAL; width: THPDF_REAL; height: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_Stroke(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_ClosePathStroke(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_Fill(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_Eofill(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_FillStroke(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_EofillStroke(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_ClosePathFillStroke(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_ClosePathEofillStroke(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_EndPath(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_Clip(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_Eoclip(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_BeginText(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_EndText(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_SetCharSpace(page: THPDF_Page; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetWordSpace(page: THPDF_Page; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetHorizontalScalling(page: THPDF_Page; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetTextLeading(page: THPDF_Page; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetFontAndSize(page: THPDF_Page; font: THPDF_Font; size: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetTextRenderingMode(page: THPDF_Page; mode: THPDF_TextRenderingMode): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetTextRise(page: THPDF_Page; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetTextRaise(page: THPDF_Page; value: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_MoveTextPos(page: THPDF_Page; x: THPDF_REAL; y: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_MoveTextPos2(page: THPDF_Page; x: THPDF_REAL; y: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetTextMatrix(page: THPDF_Page; a: THPDF_REAL; b: THPDF_REAL; c: THPDF_REAL; d: THPDF_REAL; x: THPDF_REAL; y: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_MoveToNextLine(page: THPDF_Page): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_ShowText(page: THPDF_Page; text: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_ShowTextNextLine(page: THPDF_Page; text: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_ShowTextNextLineEx(page: THPDF_Page; word_space: THPDF_REAL; char_space: THPDF_REAL; text: pchar): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_SetGrayFill(page: THPDF_Page; gray: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetGrayStroke(page: THPDF_Page; gray: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetRGBFill(page: THPDF_Page; r: THPDF_REAL; g: THPDF_REAL; b: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetRGBStroke(page: THPDF_Page; r: THPDF_REAL; g: THPDF_REAL; b: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetCMYKFill(page: THPDF_Page; c: THPDF_REAL; m: THPDF_REAL; y: THPDF_REAL; k: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetCMYKStroke(page: THPDF_Page; c: THPDF_REAL; m: THPDF_REAL; y: THPDF_REAL; k: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Shading_New(pdf: THPDF_Doc; _type: THPDF_ShadingType; colorSpace: THPDF_ColorSpace; xMin: THPDF_REAL; xMax: THPDF_REAL;
  yMin: THPDF_REAL; yMax: THPDF_REAL): THPDF_Shading; cdecl; external libhpdf;
function HPDF_Shading_AddVertexRGB(shading: THPDF_Shading; edgeFlag: THPDF_Shading_FreeFormTriangleMeshEdgeFlag; x: THPDF_REAL; y: THPDF_REAL; r: THPDF_UINT8;
  g: THPDF_UINT8; b: THPDF_UINT8): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_ExecuteXObject(page: THPDF_Page; obj: THPDF_XObject): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_New_Content_Stream(page: THPDF_Page; new_stream: PHPDF_Dict): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_Insert_Shared_Content_Stream(page: THPDF_Page; shared_stream: THPDF_Dict): THPDF_STATUS; cdecl; external libhpdf;

function HPDF_Page_DrawImage(page: THPDF_Page; image: THPDF_Image; x: THPDF_REAL; y: THPDF_REAL; width: THPDF_REAL;
  height: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_Circle(page: THPDF_Page; x: THPDF_REAL; y: THPDF_REAL; ray: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_Ellipse(page: THPDF_Page; x: THPDF_REAL; y: THPDF_REAL; xray: THPDF_REAL; yray: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_Arc(page: THPDF_Page; x: THPDF_REAL; y: THPDF_REAL; ray: THPDF_REAL; ang1: THPDF_REAL;
  ang2: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_TextOut(page: THPDF_Page; xpos: THPDF_REAL; ypos: THPDF_REAL; text: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_TextRect(page: THPDF_Page; left: THPDF_REAL; top: THPDF_REAL; right: THPDF_REAL; bottom: THPDF_REAL;
  text: pchar; align: THPDF_TextAlignment; len: PHPDF_UINT): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Page_SetSlideShow(page: THPDF_Page; _type: THPDF_TransitionStyle; disp_time: THPDF_REAL; trans_time: THPDF_REAL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_ICC_LoadIccFromMem(pdf: THPDF_Doc; mmgr: THPDF_MMgr; iccdata: THPDF_Stream; xref: THPDF_Xref; numcomponent: longint): THPDF_OutputIntent; cdecl; external libhpdf;
function HPDF_LoadIccProfileFromFile(pdf: THPDF_Doc; icc_file_name: pchar; numcomponent: longint): THPDF_OutputIntent; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 13:59:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
