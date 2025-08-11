unit if_fddi;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tfddi_header = record
    fddi_fc: Tuint8_t;
    fddi_dhost: array[0..(FDDI_K_ALEN) - 1] of Tuint8_t;
    fddi_shost: array[0..(FDDI_K_ALEN) - 1] of Tuint8_t;
  end;
  Pfddi_header = ^Tfddi_header;

  // === Konventiert am: 10-8-25 17:28:04 ===


implementation



end.
