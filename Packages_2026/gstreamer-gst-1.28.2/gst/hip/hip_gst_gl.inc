{$IFDEF read_interface}


function HipGLGetDevices(vendor: TGstHipVendor; pHipDeviceCount: Pdword; pHipDevices: Plongint; hipDeviceCount: dword; deviceList: ThipGLDeviceList): ThipError_t; cdecl; external libgsthip;
function HipGraphicsGLRegisterBuffer(vendor: TGstHipVendor; resource: PPhipGraphicsResource; buffer: dword; flags: dword): ThipError_t; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:14:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
