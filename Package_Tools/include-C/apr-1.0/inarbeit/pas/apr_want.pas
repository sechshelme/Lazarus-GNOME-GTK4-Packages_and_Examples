unit apr_want;

interface

uses
  fp_apr;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Piovec = ^Tiovec;
  Tiovec = record
    iov_base: pointer;
    iov_len: SizeUInt;
  end;


  // === Konventiert am: 10-9-26 16:58:27 ===


implementation



end.
