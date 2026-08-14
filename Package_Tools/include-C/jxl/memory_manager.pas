unit memory_manager;

interface

uses
  fp_jxl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tjpegxl_alloc_func = function(opaque: pointer; size: Tsize_t): pointer; cdecl;
  Tjpegxl_free_func = procedure(opaque: pointer; address: pointer); cdecl;

  PJxlMemoryManagerStruct = ^TJxlMemoryManagerStruct;
  TJxlMemoryManagerStruct = record
    opaque: pointer;
    alloc: Tjpegxl_alloc_func;
    free: Tjpegxl_free_func;
  end;
  TJxlMemoryManager = TJxlMemoryManagerStruct;
  PJxlMemoryManager = ^TJxlMemoryManager;

  // === Konventiert am: 14-8-26 19:28:52 ===


implementation



end.
