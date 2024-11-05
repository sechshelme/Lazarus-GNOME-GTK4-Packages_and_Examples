/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 11-10-2024   16:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


function gst_cuda_nvrtc_load_library: Tgboolean; cdecl; external libgstcuda;
function gst_cuda_nvrtc_compile(Source: Pgchar): Pgchar; cdecl; external libgstcuda;
function gst_cuda_nvrtc_compile_cubin(Source: Pgchar; device: Tgint): Pgchar; cdecl; external libgstcuda;

// === Konventiert am: 11-10-24 15:02:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
