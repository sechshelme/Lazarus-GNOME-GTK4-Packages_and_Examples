unit gsthip_interop_gl;

interface

uses
  fp_glib2, fp_gst, gsthipdevice, gsthip_interop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gst_hip_gl_get_graphics_resource_from_memory(device: PGstHipDevice; mem: PGstMemory; resource: PPGstHipGraphicsResource): ThipError_t; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:15:31 ===


implementation



end.
