unit disptab;

interface

uses
  fp_plplot, plplot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPLStream_struct = type Pointer;

const
  plDevType_FileOriented = 0;
  plDevType_Interactive = 1;
  plDevType_Null = -(1);

type
  TplD_init_fp = procedure(para1: PPLStream_struct); cdecl;
  TplD_line_fp = procedure(para1: PPLStream_struct; para2: smallint; para3: smallint; para4: smallint; para5: smallint); cdecl;
  TplD_polyline_fp = procedure(para1: PPLStream_struct; para2: Psmallint; para3: Psmallint; para4: TPLINT); cdecl;
  TplD_eop_fp = procedure(para1: PPLStream_struct); cdecl;
  TplD_bop_fp = procedure(para1: PPLStream_struct); cdecl;
  TplD_tidy_fp = procedure(para1: PPLStream_struct); cdecl;
  TplD_state_fp = procedure(para1: PPLStream_struct; para2: TPLINT); cdecl;
  TplD_esc_fp = procedure(para1: PPLStream_struct; para2: TPLINT; para3: pointer); cdecl;
  TplD_wait_fp = procedure(para1: PPLStream_struct); cdecl;

  TPLDispatchTable = record
    pl_MenuStr: pchar;
    pl_DevName: pchar;
    pl_type: longint;
    pl_seq: longint;
    pl_init: TplD_init_fp;
    pl_line: TplD_line_fp;
    pl_polyline: TplD_polyline_fp;
    pl_eop: TplD_eop_fp;
    pl_bop: TplD_bop_fp;
    pl_tidy: TplD_tidy_fp;
    pl_state: TplD_state_fp;
    pl_esc: TplD_esc_fp;
    pl_wait: TplD_wait_fp;
  end;
  PPLDispatchTable = ^TPLDispatchTable;

  // === Konventiert am: 31-3-26 20:05:01 ===


implementation



end.
