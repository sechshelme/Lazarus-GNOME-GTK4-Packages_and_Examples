unit xvmc;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  AV_XVMC_ID = $1DC711C0;

type
  Txvmc_pix_fmt = record
    xvmc_id: longint;
    data_blocks: Psmallint;
    mv_blocks: PXvMCMacroBlock;
    allocated_mv_blocks: longint;
    allocated_data_blocks: longint;
    idct: longint;
    unsigned_intra: longint;
    p_surface: PXvMCSurface;
    p_past_surface: PXvMCSurface;
    p_future_surface: PXvMCSurface;
    picture_structure: dword;
    flags: dword;
    start_mv_blocks_num: longint;
    filled_mv_blocks_num: longint;
    next_free_data_block_num: longint;
  end;
  Pxvmc_pix_fmt = ^Txvmc_pix_fmt;

  // === Konventiert am: 19-12-25 17:16:29 ===


implementation



end.
