unit hpdf_conf;

interface

uses
  fp_hpdf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  HPDF_STREAM_BUF_SIZ = 4096;
  HPDF_DEF_ITEMS_PER_BLOCK = 20;
  HPDF_DEFALUT_XREF_ENTRY_NUM = 1024;
  HPDF_DEF_CHAR_WIDTHS_NUM = 128;
  HPDF_DEF_PAGE_LIST_NUM = 256;
  HPDF_DEF_RANGE_TBL_NUM = 128;
  HPDF_MPOOL_BUF_SIZ = 8192;
  HPDF_MIN_MPOOL_BUF_SIZ = 256;
  HPDF_MAX_MPOOL_BUF_SIZ = 1048576;

function HPDF_ALIGNMENT_SIZE: SizeUInt;


// === Konventiert am: 28-1-26 13:59:53 ===


implementation


function HPDF_ALIGNMENT_SIZE: SizeUInt;
begin
  HPDF_ALIGNMENT_SIZE := sizeof(longint);
end;


end.
