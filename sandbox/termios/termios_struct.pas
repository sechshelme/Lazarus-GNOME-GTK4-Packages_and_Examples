unit termios_struct;

interface

uses
  termios_bits;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  NCCS = 32;  
type
  Ptermios = ^Ttermios;
  Ttermios = record
      c_iflag : Ttcflag_t;
      c_oflag : Ttcflag_t;
      c_cflag : Ttcflag_t;
      c_lflag : Ttcflag_t;
      c_line : Tcc_t;
      c_cc : array[0..(NCCS)-1] of Tcc_t;
      c_ispeed : Tspeed_t;
      c_ospeed : Tspeed_t;
    end;


// === Konventiert am: 30-6-25 19:37:59 ===


implementation



end.
