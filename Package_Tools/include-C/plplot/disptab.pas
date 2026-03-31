unit disptab;

interface

uses
  fp_plplot;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Defines the data structure which holds the driver functions. }
{ }
{$ifndef __DISPATCH_H__}
{$define __DISPATCH_H__}
{$include "plConfig.h"}
type
  PPLStream_struct = ^TPLStream_struct;
  TPLStream_struct = record
      {undefined structure}
    end;

  Txxxxx =  Longint;
  Const
    plDevType_FileOriented = 0;
    plDevType_Interactive = 1;
    plDevType_Null = -(1);

{-------------------------------------------------------------------------- }
{ Define structure containing pointers to device dependent functions. }
{ }
{ pl_MenuStr	Pointer to string that is printed in device menu. }
{ }
{ pl_DevName	A short device "name" for device selection by name. }
{ }
{ pl_type	0 for file-oriented device, 1 for interactive }
{		(the null driver uses -1 here) }
{ }
{ pl_seq       The sequence number for ordering the presentation list of the }
{              available drivers.  This is an ordering only, not an absolute }
{              position in the list. }
{ }
{ pl_init	Initialize device.  This routine may also prompt the user }
{		for certain device parameters or open a graphics file }
{		(see note).  Called only once to set things up.  Certain }
{		options such as familying and resolution (dots/mm) should }
{		be set up before calling this routine (note: some drivers }
{		ignore these). }
{ }
{ pl_line	Draws a line between two points. }
{ }
{ pl_polyline	Draws a polyline (no broken segments). }
{ }
{ pl_eop	Finishes out current page (see note). }
{ }
{ pl_bop	Set up for plotting on a new page. May also open a new }
{		a new graphics file (see note). }
{ }
{ pl_tidy	Tidy up. May close graphics file (see note). }
{ }
{ pl_state	Handle change in PLStream state }
{		(color, pen width, fill attribute, etc). }
{ }
{ pl_esc	Escape function for driver-specific commands. }
{ }
{ }
{ Notes: }
{ }
{ Most devices allow multi-page plots to be stored in a single graphics }
{ file, in which case the graphics file should be opened in the pl_init() }
{ routine, closed in pl_tidy(), and page advances done by calling pl_eop }
{ and pl_bop() in sequence. If multi-page plots need to be stored in }
{ different files then pl_bop() should open the file and pl_eop() should }
{ close it.  Do NOT open files in both pl_init() and pl_bop() or close }
{ files in both pl_eop() and pl_tidy(). }
{-------------------------------------------------------------------------- }
type

  TplD_init_fp = procedure (para1:PPLStream_struct);cdecl;

  TplD_line_fp = procedure (para1:PPLStream_struct; para2:smallint; para3:smallint; para4:smallint; para5:smallint);cdecl;

  TplD_polyline_fp = procedure (para1:PPLStream_struct; para2:Psmallint; para3:Psmallint; para4:TPLINT);cdecl;

  TplD_eop_fp = procedure (para1:PPLStream_struct);cdecl;

  TplD_bop_fp = procedure (para1:PPLStream_struct);cdecl;

  TplD_tidy_fp = procedure (para1:PPLStream_struct);cdecl;

  TplD_state_fp = procedure (para1:PPLStream_struct; para2:TPLINT);cdecl;

  TplD_esc_fp = procedure (para1:PPLStream_struct; para2:TPLINT; para3:pointer);cdecl;

  TplD_wait_fp = procedure (para1:PPLStream_struct);cdecl;

  PPLDispatchTable = ^TPLDispatchTable;
  TPLDispatchTable = record
      pl_MenuStr : Pchar;
      pl_DevName : Pchar;
      pl_type : longint;
      pl_seq : longint;
      pl_init : TplD_init_fp;
      pl_line : TplD_line_fp;
      pl_polyline : TplD_polyline_fp;
      pl_eop : TplD_eop_fp;
      pl_bop : TplD_bop_fp;
      pl_tidy : TplD_tidy_fp;
      pl_state : TplD_state_fp;
      pl_esc : TplD_esc_fp;
      pl_wait : TplD_wait_fp;
    end;
{$endif}
{ __DISPATCH_H__ }

// === Konventiert am: 31-3-26 20:05:01 ===


implementation



end.
