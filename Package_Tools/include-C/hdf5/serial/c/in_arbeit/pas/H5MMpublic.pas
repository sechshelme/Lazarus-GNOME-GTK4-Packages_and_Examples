unit H5MMpublic;

interface

uses
  fp_hdf5;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TH5MM_allocate_t = function(size: Tsize_t; alloc_info: pointer): pointer; cdecl;
  PH5MM_allocate_t = ^TH5MM_allocate_t;
  TH5MM_free_t = procedure(mem: pointer; free_info: pointer); cdecl;
  PH5MM_free_t = ^TH5MM_free_t;

  // === Konventiert am: 21-8-26 14:23:51 ===


implementation



end.
