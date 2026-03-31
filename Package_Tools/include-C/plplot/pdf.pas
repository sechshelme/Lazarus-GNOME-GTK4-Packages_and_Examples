unit pdf;

interface

uses
  fp_plplot;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{  Copyright (C) 1992 by Maurice J. LeBrun }
{ }
{  Macros and prototypes for the PDF package. }
{ }
{  This software may be freely copied, modified and redistributed without }
{  fee provided that this copyright notice is preserved intact on all }
{  copies and modified copies. }
{ }
{  There is no warranty or other guarantee of fitness of this software. }
{  It is provided solely "as is". The author(s) disclaim(s) all }
{  responsibility and liability with respect to this software's usage or }
{  its effect upon hardware or computer systems. }
{ }
{$ifndef __PDF_H__}
{$define __PDF_H__}
{-------------------------------------------------------------------------- }
{ dll functions }
{-------------------------------------------------------------------------- }
{$include "pldll.h"}
{ Some unsigned types }
{$ifndef U_CHAR}

const
  U_CHAR = byte;  
{$endif}
{$ifndef U_SHORT}

const
  U_SHORT = word;  
{$endif}
{$ifndef U_INT}

const
  U_INT = dword;  
{$endif}
{$ifndef U_LONG}

const
  U_LONG = dword;  
{$endif}
{$ifdef PLPLOT_USE_TCL_CHANNELS}
{$include <tcl.h>}
{$endif}
{ PDFstrm definition }
{ The low level PDF i/o routines use the transfer method appropriate for }
{ the first non-null type below }
{ Filesystem }
{ Memory buffer }
{$ifdef PLPLOT_USE_TCL_CHANNELS}
{ Tcl channel }
{$endif}
{ Buffer pointer and max size }
type
  PPDFstrm = ^TPDFstrm;
  TPDFstrm = record
      file : PFILE;
      buffer : Pbyte;
      tclChan : TTcl_Channel;
      bp : Tsize_t;
      bufmax : Tsize_t;
    end;
{ Info for the i/o device.  Only used by Tcl/TK/dp drivers for now }
{ I/O device file descriptor }
{ File handle }
{ Fifo or socket name (if needed) }
{ Handle for use from interpreter }
{ Communication channel type }
{ As above, but in string form }

  PPLiodev = ^TPLiodev;
  TPLiodev = record
      fd : longint;
      file : PFILE;
      fileName : Pchar;
      fileHandle : Pchar;
      _type : longint;
      typeName : Pchar;
    end;
{ Error numbers }

const
  PDF_ERROR = 1;  { Unknown error }
  PDF_FNOPEN = 2;  { File not open }
  PDF_FAOPEN = 3;  { File already open }
  PDF_BADUN = 4;  { Bad unit number }
  PDF_BADNBITS = 5;  { Invalid # of bits }
  PDF_RDERR = 6;  { Read error }
  PDF_WRERR = 7;  { Write error }
  PDF_NOTPDF = 8;  { Not a valid PDF file }
{ Prototypes }
{ Use a wrapper for the prototypes for use from K&R C }

procedure pdf_set(option:Pchar; value:longint);cdecl;external libplplot;
function pdf_fopen(fileName:Pchar; mode:Pchar):PPDFstrm;cdecl;external libplplot;
function pdf_bopen(buffer:PU_CHAR; bufmax:Tsize_t):PPDFstrm;cdecl;external libplplot;
function pdf_finit(file:PFILE):PPDFstrm;cdecl;external libplplot;
function plLibOpenPdfstrm(fn:Pchar):PPDFstrm;cdecl;external libplplot;
function pdf_close(pdfs:PPDFstrm):longint;cdecl;external libplplot;
function pdf_putc(c:longint; pdfs:PPDFstrm):longint;cdecl;external libplplot;
function pdf_getc(pdfs:PPDFstrm):longint;cdecl;external libplplot;
function pdf_ungetc(c:longint; pdfs:PPDFstrm):longint;cdecl;external libplplot;
function pdf_rdx(x:PU_CHAR; nitems:longint; pdfs:PPDFstrm):longint;cdecl;external libplplot;
function pdf_rd_header(pdfs:PPDFstrm; header:Pchar):longint;cdecl;external libplplot;
function pdf_wr_header(pdfs:PPDFstrm; header:Pchar):longint;cdecl;external libplplot;
function pdf_wr_string(pdfs:PPDFstrm; _string:Pchar):longint;cdecl;external libplplot;
function pdf_rd_string(pdfs:PPDFstrm; _string:Pchar; nmax:longint):longint;cdecl;external libplplot;
function pdf_wr_1byte(pdfs:PPDFstrm; s:TU_CHAR):longint;cdecl;external libplplot;
function pdf_rd_1byte(pdfs:PPDFstrm; ps:PU_CHAR):longint;cdecl;external libplplot;
function pdf_wr_2bytes(pdfs:PPDFstrm; s:TU_SHORT):longint;cdecl;external libplplot;
function pdf_rd_2bytes(pdfs:PPDFstrm; ps:PU_SHORT):longint;cdecl;external libplplot;
function pdf_wr_2nbytes(pdfs:PPDFstrm; s:PU_SHORT; n:TPLINT):longint;cdecl;external libplplot;
function pdf_rd_2nbytes(pdfs:PPDFstrm; s:PU_SHORT; n:TPLINT):longint;cdecl;external libplplot;
function pdf_wr_4bytes(pdfs:PPDFstrm; s:TU_LONG):longint;cdecl;external libplplot;
function pdf_rd_4bytes(pdfs:PPDFstrm; ps:PU_LONG):longint;cdecl;external libplplot;
function pdf_wr_ieeef(pdfs:PPDFstrm; f:single):longint;cdecl;external libplplot;
function pdf_rd_ieeef(pdfs:PPDFstrm; pf:Psingle):longint;cdecl;external libplplot;
{$endif}
{ __PDF_H__ }

// === Konventiert am: 31-3-26 20:05:07 ===


implementation



end.
