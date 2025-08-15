unit ftp;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  PRELIM = 1;
  COMPLETE = 2;
  CONTINUE = 3;
  TRANSIENT = 4;
  ERROR = 5;
  TYPE_A = 1;
  TYPE_E = 2;
  TYPE_I = 3;
  TYPE_L = 4;

const
  typenames: array[0..4] of pansichar = ('0', 'ASCII', 'EBCDIC', 'Image', 'Local');

const
  FORM_N = 1;
  FORM_T = 2;
  FORM_C = 3;

const
  formnames: array[0..3] of pansichar = ('0', 'Nonprint', 'Telnet', 'Carriage-control');

const
  STRU_F = 1;
  STRU_R = 2;
  STRU_P = 3;

const
  strunames: array[0..3] of pansichar = ('0', 'File', 'Record', 'Page');

const
  MODE_S = 1;
  MODE_B = 2;
  MODE_C = 3;

const
  modenames: array[0..3] of pansichar = ('0', 'Stream', 'Block', 'Compressed');

const
  REC_ESC = '\377';
  REC_EOR = '\001';
  REC_EOF = '\002';

  BLK_EOR = $80;
  BLK_EOF = $40;
  BLK_ERRORS = $20;
  BLK_RESTART = $10;
  BLK_BYTECOUNT = 2;

  // === Konventiert am: 13-8-25 19:42:47 ===


implementation



end.
