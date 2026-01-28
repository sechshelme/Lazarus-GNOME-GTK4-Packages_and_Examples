{$IFDEF read_interface}


function HPDF_Image_Load1BitImageFromMem(mmgr: THPDF_MMgr; buf: PHPDF_BYTE; xref: THPDF_Xref; width: THPDF_UINT; height: THPDF_UINT;
  line_width: THPDF_UINT; top_is_first: THPDF_BOOL): THPDF_Image; cdecl; external libhpdf;
function HPDF_Image_LoadPngImage(mmgr: THPDF_MMgr; png_data: THPDF_Stream; xref: THPDF_Xref; delayed_loading: THPDF_BOOL): THPDF_Image; cdecl; external libhpdf;
function HPDF_Image_LoadJpegImage(mmgr: THPDF_MMgr; jpeg_data: THPDF_Stream; xref: THPDF_Xref): THPDF_Image; cdecl; external libhpdf;
function HPDF_Image_LoadJpegImageFromMem(mmgr: THPDF_MMgr; buf: PHPDF_BYTE; size: THPDF_UINT; xref: THPDF_Xref): THPDF_Image; cdecl; external libhpdf;
function HPDF_Image_LoadRawImage(mmgr: THPDF_MMgr; stream: THPDF_Stream; xref: THPDF_Xref; width: THPDF_UINT; height: THPDF_UINT;
  color_space: THPDF_ColorSpace): THPDF_Image; cdecl; external libhpdf;
function HPDF_Image_LoadRawImageFromMem(mmgr: THPDF_MMgr; buf: PHPDF_BYTE; xref: THPDF_Xref; width: THPDF_UINT; height: THPDF_UINT;
  color_space: THPDF_ColorSpace; bits_per_component: THPDF_UINT): THPDF_Image; cdecl; external libhpdf;
function HPDF_Image_Validate(image: THPDF_Image): THPDF_BOOL; cdecl; external libhpdf;
function HPDF_Image_SetMask(image: THPDF_Image; mask: THPDF_BOOL): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Image_SetColorSpace(image: THPDF_Image; colorspace: THPDF_Array): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_Image_SetRenderingIntent(image: THPDF_Image; intent: pchar): THPDF_STATUS; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:02:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
