unit pdf;

interface

uses
  fp_plplot, plplot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TU_CHAR = byte;
  PU_CHAR=^TU_CHAR;
  TU_SHORT = word;
  PU_SHORT=^TU_SHORT;
  TU_INT = dword;
  PU_INT=^TU_INT;
  TU_LONG = qword;
  PU_LONG=^TU_LONG;

type
//  TPDFstrm = record
    //file_: PFILE;
    //buffer: pbyte;
    //tclChan: TTcl_Channel;
    //bp: Tsize_t;
    //bufmax: Tsize_t;
//  end;
  PPDFstrm = type Pointer;

  TPLiodev = record
    fd: longint;
    file_: PFILE;
    fileName: pchar;
    fileHandle: pchar;
    _type: longint;
    typeName: pchar;
  end;
  PPLiodev = ^TPLiodev;

const
  PDF_ERROR = 1;
  PDF_FNOPEN = 2;
  PDF_FAOPEN = 3;
  PDF_BADUN = 4;
  PDF_BADNBITS = 5;
  PDF_RDERR = 6;
  PDF_WRERR = 7;
  PDF_NOTPDF = 8;

procedure pdf_set(option: pchar; value: longint); cdecl; external libplplot;
function pdf_fopen(fileName: pchar; mode: pchar): PPDFstrm; cdecl; external libplplot;
function pdf_bopen(buffer: PU_CHAR; bufmax: Tsize_t): PPDFstrm; cdecl; external libplplot;
function pdf_finit(file_: PFILE): PPDFstrm; cdecl; external libplplot;
function plLibOpenPdfstrm(fn: pchar): PPDFstrm; cdecl; external libplplot;
function pdf_close(pdfs: PPDFstrm): longint; cdecl; external libplplot;
function pdf_putc(c: longint; pdfs: PPDFstrm): longint; cdecl; external libplplot;
function pdf_getc(pdfs: PPDFstrm): longint; cdecl; external libplplot;
function pdf_ungetc(c: longint; pdfs: PPDFstrm): longint; cdecl; external libplplot;
function pdf_rdx(x: PU_CHAR; nitems: longint; pdfs: PPDFstrm): longint; cdecl; external libplplot;
function pdf_rd_header(pdfs: PPDFstrm; header: pchar): longint; cdecl; external libplplot;
function pdf_wr_header(pdfs: PPDFstrm; header: pchar): longint; cdecl; external libplplot;
function pdf_wr_string(pdfs: PPDFstrm; _string: pchar): longint; cdecl; external libplplot;
function pdf_rd_string(pdfs: PPDFstrm; _string: pchar; nmax: longint): longint; cdecl; external libplplot;
function pdf_wr_1byte(pdfs: PPDFstrm; s: TU_CHAR): longint; cdecl; external libplplot;
function pdf_rd_1byte(pdfs: PPDFstrm; ps: PU_CHAR): longint; cdecl; external libplplot;
function pdf_wr_2bytes(pdfs: PPDFstrm; s: TU_SHORT): longint; cdecl; external libplplot;
function pdf_rd_2bytes(pdfs: PPDFstrm; ps: PU_SHORT): longint; cdecl; external libplplot;
function pdf_wr_2nbytes(pdfs: PPDFstrm; s: PU_SHORT; n: TPLINT): longint; cdecl; external libplplot;
function pdf_rd_2nbytes(pdfs: PPDFstrm; s: PU_SHORT; n: TPLINT): longint; cdecl; external libplplot;
function pdf_wr_4bytes(pdfs: PPDFstrm; s: TU_LONG): longint; cdecl; external libplplot;
function pdf_rd_4bytes(pdfs: PPDFstrm; ps: PU_LONG): longint; cdecl; external libplplot;
function pdf_wr_ieeef(pdfs: PPDFstrm; f: single): longint; cdecl; external libplplot;
function pdf_rd_ieeef(pdfs: PPDFstrm; pf: Psingle): longint; cdecl; external libplplot;

// === Konventiert am: 31-3-26 20:05:07 ===


implementation



end.
