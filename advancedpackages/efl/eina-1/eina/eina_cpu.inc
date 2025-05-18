{$IFDEF read_interface}


type
  PEina_Cpu_Features = ^TEina_Cpu_Features;
  TEina_Cpu_Features = longint;

const
  EINA_CPU_MMX = $00000001;
  EINA_CPU_SSE = $00000002;
  EINA_CPU_SSE2 = $00000004;
  EINA_CPU_SSE3 = $00000008;
  EINA_CPU_ALTIVEC = $00000010;
  EINA_CPU_VIS = $00000020;
  EINA_CPU_NEON = $00000040;
  EINA_CPU_SSSE3 = $00000080;
  EINA_CPU_SSE41 = $00000100;
  EINA_CPU_SSE42 = $00000200;
  EINA_CPU_SVE = $00000400;

var
  eina_cpu_features: TEina_Cpu_Features; cvar;external libeina;

function eina_cpu_features_get: TEina_Cpu_Features; cdecl; external libeina;
function eina_cpu_count: longint; cdecl; external libeina;
function eina_cpu_page_size: longint; cdecl; external libeina;


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
