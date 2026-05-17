unit mongoc_iovec;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_iovec_t = type Pointer;
  {$ENDIF read_struct}

  // === Konventiert am: 15-5-26 15:15:25 ===


implementation



end.
