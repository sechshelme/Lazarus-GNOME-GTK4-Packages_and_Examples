unit netdb_bits;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pnetent = ^Tnetent;

  Tnetent = record
    n_name: pchar;
    n_aliases: ^pchar;
    n_addrtype: longint;
    n_net: uint32;
  end;


  // === Konventiert am: 5-7-25 19:53:37 ===


implementation



end.
