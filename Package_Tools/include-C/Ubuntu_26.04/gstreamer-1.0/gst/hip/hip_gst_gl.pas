unit hip_gst_gl;

interface

uses
  fp_glib2, fp_gst, gsthip_enums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function HipGLGetDevices(vendor: TGstHipVendor; pHipDeviceCount: Pdword; pHipDevices: Plongint; hipDeviceCount: dword; deviceList: ThipGLDeviceList): ThipError_t; cdecl; external libgsthip;
function HipGraphicsGLRegisterBuffer(vendor: TGstHipVendor; resource: PPhipGraphicsResource; buffer: dword; flags: dword): ThipError_t; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:14:26 ===


implementation



end.
