unit butteraugli;

interface

uses
  fp_jxl, memory_manager, parallel_runner, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PJxlButteraugliApi = type Pointer;
  PJxlButteraugliResult = type Pointer;

procedure JxlButteraugliResultDestroy(result: PJxlButteraugliResult); cdecl; external libjxl;
function JxlButteraugliApiCreate(memory_manager: PJxlMemoryManager): PJxlButteraugliApi; cdecl; external libjxl;
procedure JxlButteraugliApiSetParallelRunner(api: PJxlButteraugliApi; parallel_runner: TJxlParallelRunner; parallel_runner_opaque: pointer); cdecl; external libjxl;
procedure JxlButteraugliApiSetHFAsymmetry(api: PJxlButteraugliApi; v: single); cdecl; external libjxl;
procedure JxlButteraugliApiSetIntensityTarget(api: PJxlButteraugliApi; v: single); cdecl; external libjxl;
procedure JxlButteraugliApiDestroy(api: PJxlButteraugliApi); cdecl; external libjxl;
function JxlButteraugliCompute(api: PJxlButteraugliApi; xsize: Tuint32_t; ysize: Tuint32_t; pixel_format_orig: PJxlPixelFormat; buffer_orig: pointer;
  size_orig: Tsize_t; pixel_format_dist: PJxlPixelFormat; buffer_dist: pointer; size_dist: Tsize_t): PJxlButteraugliResult; cdecl; external libjxl;
function JxlButteraugliResultGetMaxDistance(result: PJxlButteraugliResult): single; cdecl; external libjxl;
function JxlButteraugliResultGetDistance(result: PJxlButteraugliResult; pnorm: single): single; cdecl; external libjxl;
procedure JxlButteraugliResultGetDistmap(result: PJxlButteraugliResult; buffer: PPsingle; row_stride: Puint32_t); cdecl; external libjxl;

// === Konventiert am: 14-8-26 19:29:19 ===


implementation



end.
