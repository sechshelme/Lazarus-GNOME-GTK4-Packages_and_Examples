unit tftp;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SEGSIZE = 512;
  RRQ = 01;
  WRQ = 02;
  DATA = 03;
  ACK = 04;
  ERROR = 05;

type
  Ttftphdr = record
    th_opcode: smallint;
    th_u1: record
      case longint of
        0: (tu_padding: array[0..2] of char);
        1: (th_u2: record
            th_u3: record
              case longint of
                0: (tu_block: word);
                1: (tu_code: smallint);
              end;
            tu_data: pchar;
            end);
        2: (tu_stuff: pchar);
      end;
  end;
  Ptftphdr = ^Ttftphdr;

const
  EUNDEF = 0;
  ENOTFOUND = 1;
  EACCESS = 2;
  ENOSPACE = 3;
  EBADOP = 4;
  EBADID = 5;
  EEXISTS = 6;
  ENOUSER = 7;

  // === Konventiert am: 13-8-25 19:43:00 ===


implementation



end.
