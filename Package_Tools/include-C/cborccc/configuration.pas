unit configuration;

interface

uses
  fp_cbor;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  CBOR_MAJOR_VERSION = 0;
  CBOR_MINOR_VERSION = 10;
  CBOR_PATCH_VERSION = 2;
  CBOR_BUFFER_GROWTH = 2;
  CBOR_MAX_STACK_SIZE = 2048;
  CBOR_PRETTY_PRINTER = 1;

  // === Konventiert am: 9-4-26 17:15:25 ===


implementation



end.
