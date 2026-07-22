unit hip_gst;

interface

uses
  fp_glib2, fp_gst, gsthip_enums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function HipInit(vendor: TGstHipVendor; flags: dword): ThipError_t; cdecl; external libgsthip;
function HipDriverGetVersion(vendor: TGstHipVendor; driverVersion: Plongint): ThipError_t; cdecl; external libgsthip;
function HipRuntimeGetVersion(vendor: TGstHipVendor; runtimeVersion: Plongint): ThipError_t; cdecl; external libgsthip;
function HipGetErrorName(vendor: TGstHipVendor; hip_error: ThipError_t): pchar; cdecl; external libgsthip;
function HipGetErrorString(vendor: TGstHipVendor; hipError: ThipError_t): pchar; cdecl; external libgsthip;
function HipGetDeviceCount(vendor: TGstHipVendor; count: Plongint): ThipError_t; cdecl; external libgsthip;
function HipGetDeviceProperties(vendor: TGstHipVendor; prop: PhipDeviceProp_t; deviceId: longint): ThipError_t; cdecl; external libgsthip;
function HipDeviceGetAttribute(vendor: TGstHipVendor; pi: Plongint; attr: ThipDeviceAttribute_t; deviceId: longint): ThipError_t; cdecl; external libgsthip;
function HipSetDevice(vendor: TGstHipVendor; deviceId: longint): ThipError_t; cdecl; external libgsthip;
function HipMalloc(vendor: TGstHipVendor; ptr: Ppointer; size: Tsize_t): ThipError_t; cdecl; external libgsthip;
function HipFree(vendor: TGstHipVendor; ptr: pointer): ThipError_t; cdecl; external libgsthip;
function HipHostMalloc(vendor: TGstHipVendor; ptr: Ppointer; size: Tsize_t; flags: dword): ThipError_t; cdecl; external libgsthip;
function HipHostFree(vendor: TGstHipVendor; ptr: pointer): ThipError_t; cdecl; external libgsthip;
function HipStreamCreate(vendor: TGstHipVendor; stream: PhipStream_t): ThipError_t; cdecl; external libgsthip;
function HipStreamDestroy(vendor: TGstHipVendor; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function HipStreamSynchronize(vendor: TGstHipVendor; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function HipEventCreateWithFlags(vendor: TGstHipVendor; event: PhipEvent_t; flags: dword): ThipError_t; cdecl; external libgsthip;
function HipEventRecord(vendor: TGstHipVendor; event: ThipEvent_t; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function HipEventDestroy(vendor: TGstHipVendor; event: ThipEvent_t): ThipError_t; cdecl; external libgsthip;
function HipEventSynchronize(vendor: TGstHipVendor; event: ThipEvent_t): ThipError_t; cdecl; external libgsthip;
function HipEventQuery(vendor: TGstHipVendor; event: ThipEvent_t): ThipError_t; cdecl; external libgsthip;
function HipModuleLoadData(vendor: TGstHipVendor; module: PhipModule_t; image: pointer): ThipError_t; cdecl; external libgsthip;
function HipModuleUnload(vendor: TGstHipVendor; module: ThipModule_t): ThipError_t; cdecl; external libgsthip;
function HipModuleGetFunction(vendor: TGstHipVendor; _function: PhipFunction_t; module: ThipModule_t; kname: pchar): ThipError_t; cdecl; external libgsthip;
function HipModuleLaunchKernel(vendor: TGstHipVendor; f: ThipFunction_t; gridDimX: dword; gridDimY: dword; gridDimZ: dword;
  blockDimX: dword; blockDimY: dword; blockDimZ: dword; sharedMemBytes: dword; stream: ThipStream_t;
  kernelParams: Ppointer; extra: Ppointer): ThipError_t; cdecl; external libgsthip;
function HipMemcpyParam2DAsync(vendor: TGstHipVendor; pCopy: Phip_Memcpy2D; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function HipMemsetD8Async(vendor: TGstHipVendor; dest: ThipDeviceptr_t; value: byte; count: Tsize_t; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function HipMemsetD16Async(vendor: TGstHipVendor; dest: ThipDeviceptr_t; value: word; count: Tsize_t; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function HipMemsetD32Async(vendor: TGstHipVendor; dst: ThipDeviceptr_t; value: longint; count: Tsize_t; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function HipTexObjectCreate(vendor: TGstHipVendor; pTexObject: PhipTextureObject_t; pResDesc: PHIP_RESOURCE_DESC; pTexDesc: PHIP_TEXTURE_DESC; pResViewDesc: PHIP_RESOURCE_VIEW_DESC): ThipError_t; cdecl; external libgsthip;
function HipTexObjectDestroy(vendor: TGstHipVendor; texObject: ThipTextureObject_t): ThipError_t; cdecl; external libgsthip;
function HipGraphicsMapResources(vendor: TGstHipVendor; count: longint; resources: PhipGraphicsResource_t; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function HipGraphicsResourceGetMappedPointer(vendor: TGstHipVendor; devPtr: Ppointer; size: PSizeUInt; resource: ThipGraphicsResource_t): ThipError_t; cdecl; external libgsthip;
function HipGraphicsUnmapResources(vendor: TGstHipVendor; count: longint; resources: PhipGraphicsResource_t; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function HipGraphicsUnregisterResource(vendor: TGstHipVendor; resource: ThipGraphicsResource_t): ThipError_t; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:14:53 ===


implementation



end.
