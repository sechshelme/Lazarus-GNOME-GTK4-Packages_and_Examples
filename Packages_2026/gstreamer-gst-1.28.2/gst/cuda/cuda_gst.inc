{$IFDEF read_interface}


function CuInit(Flags: dword): TCUresult; cdecl; external libgstcuda;
function CuGetErrorName(error: TCUresult; pStr: PPchar): TCUresult; cdecl; external libgstcuda;
function CuGetErrorString(error: TCUresult; pStr: PPchar): TCUresult; cdecl; external libgstcuda;
function CuCtxCreate(pctx: PCUcontext; flags: dword; dev: TCUdevice): TCUresult; cdecl; external libgstcuda;
function CuCtxDestroy(ctx: TCUcontext): TCUresult; cdecl; external libgstcuda;
function CuCtxPopCurrent(pctx: PCUcontext): TCUresult; cdecl; external libgstcuda;
function CuCtxPushCurrent(ctx: TCUcontext): TCUresult; cdecl; external libgstcuda;
function CuCtxSynchronize: TCUresult; cdecl; external libgstcuda;
function CuCtxGetLimit(plimit: PSizeUInt; limit: TCUlimit): TCUresult; cdecl; external libgstcuda;
function CuCtxSetLimit(limit: TCUlimit; value: Tsize_t): TCUresult; cdecl; external libgstcuda;
function CuCtxEnablePeerAccess(peerContext: TCUcontext; Flags: dword): TCUresult; cdecl; external libgstcuda;
function CuCtxDisablePeerAccess(peerContext: TCUcontext): TCUresult; cdecl; external libgstcuda;
function CuGraphicsMapResources(count: dword; resources: PCUgraphicsResource; hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuGraphicsUnmapResources(count: dword; resources: PCUgraphicsResource; hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuGraphicsSubResourceGetMappedArray(pArray: PCUarray; resource: TCUgraphicsResource; arrayIndex: dword; mipLevel: dword): TCUresult; cdecl; external libgstcuda;
function CuGraphicsResourceGetMappedPointer(pDevPtr: PCUdeviceptr; pSize: PSizeUInt; resource: TCUgraphicsResource): TCUresult; cdecl; external libgstcuda;
function CuGraphicsUnregisterResource(resource: TCUgraphicsResource): TCUresult; cdecl; external libgstcuda;
function CuMemAlloc(dptr: PCUdeviceptr; bytesize: dword): TCUresult; cdecl; external libgstcuda;
function CuMemAllocPitch(dptr: PCUdeviceptr; pPitch: PSizeUInt; WidthInBytes: Tsize_t; Height: Tsize_t; ElementSizeBytes: dword): TCUresult; cdecl; external libgstcuda;
function CuMemAllocHost(pp: Ppointer; bytesize: dword): TCUresult; cdecl; external libgstcuda;
function CuMemcpy2D(pCopy: PCUDA_MEMCPY2D): TCUresult; cdecl; external libgstcuda;
function CuMemcpy2DAsync(pCopy: PCUDA_MEMCPY2D; hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuMemcpyDtoD(dstDevice: TCUdeviceptr; srcDevice: TCUdeviceptr; ByteCount: Tsize_t): TCUresult; cdecl; external libgstcuda;
function CuMemcpyDtoDAsync(dstDevice: TCUdeviceptr; srcDevice: TCUdeviceptr; ByteCount: Tsize_t; hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuMemcpyDtoH(dstHost: pointer; srcDevice: TCUdeviceptr; ByteCount: Tsize_t): TCUresult; cdecl; external libgstcuda;
function CuMemcpyDtoHAsync(dstHost: pointer; srcDevice: TCUdeviceptr; ByteCount: Tsize_t; hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuMemcpyHtoD(dstDevice: TCUdeviceptr; srcHost: pointer; ByteCount: Tsize_t): TCUresult; cdecl; external libgstcuda;
function CuMemcpyHtoDAsync(dstDevice: TCUdeviceptr; srcHost: pointer; ByteCount: Tsize_t; hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuMemFree(dptr: TCUdeviceptr): TCUresult; cdecl; external libgstcuda;
function CuMemFreeHost(p: pointer): TCUresult; cdecl; external libgstcuda;
function CuStreamCreate(phStream: PCUstream; Flags: dword): TCUresult; cdecl; external libgstcuda;
function CuStreamDestroy(hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuStreamSynchronize(hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuDeviceGet(device: PCUdevice; ordinal: longint): TCUresult; cdecl; external libgstcuda;
function CuDeviceGetCount(count: Plongint): TCUresult; cdecl; external libgstcuda;
function CuDeviceGetName(name: pchar; len: longint; dev: TCUdevice): TCUresult; cdecl; external libgstcuda;
function CuDeviceGetAttribute(pi: Plongint; attrib: TCUdevice_attribute; dev: TCUdevice): TCUresult; cdecl; external libgstcuda;
function CuDeviceGetUuid(uuid: PCUuuid; dev: TCUdevice): TCUresult; cdecl; external libgstcuda;
function CuDeviceCanAccessPeer(canAccessPeer: Plongint; dev: TCUdevice; peerDev: TCUdevice): TCUresult; cdecl; external libgstcuda;
function CuDriverGetVersion(driverVersion: Plongint): TCUresult; cdecl; external libgstcuda;
function CuModuleLoadData(module: PCUmodule; image: pointer): TCUresult; cdecl; external libgstcuda;
function CuModuleUnload(module: TCUmodule): TCUresult; cdecl; external libgstcuda;
function CuModuleGetFunction(hfunc: PCUfunction; hmod: TCUmodule; name: pchar): TCUresult; cdecl; external libgstcuda;
function CuTexObjectCreate(pTexObject: PCUtexObject; pResDesc: PCUDA_RESOURCE_DESC; pTexDesc: PCUDA_TEXTURE_DESC; pResViewDesc: PCUDA_RESOURCE_VIEW_DESC): TCUresult; cdecl; external libgstcuda;
function CuTexObjectDestroy(texObject: TCUtexObject): TCUresult; cdecl; external libgstcuda;
function CuLaunchKernel(f: TCUfunction; gridDimX: dword; gridDimY: dword; gridDimZ: dword; blockDimX: dword;
  blockDimY: dword; blockDimZ: dword; sharedMemBytes: dword; hStream: TCUstream; kernelParams: Ppointer;
  extra: Ppointer): TCUresult; cdecl; external libgstcuda;
function CuEventCreate(phEvent: PCUevent; Flags: dword): TCUresult; cdecl; external libgstcuda;
function CuEventDestroy(hEvent: TCUevent): TCUresult; cdecl; external libgstcuda;
function CuEventRecord(hEvent: TCUevent; hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuEventSynchronize(hEvent: TCUevent): TCUresult; cdecl; external libgstcuda;
function CuIpcGetEventHandle(pHandle: PCUipcEventHandle; event: TCUevent): TCUresult; cdecl; external libgstcuda;
function CuIpcOpenEventHandle(phEvent: PCUevent; handle: TCUipcEventHandle): TCUresult; cdecl; external libgstcuda;
function CuIpcGetMemHandle(pHandle: PCUipcMemHandle; dptr: TCUdeviceptr): TCUresult; cdecl; external libgstcuda;
function CuIpcOpenMemHandle(pdptr: PCUdeviceptr; handle: TCUipcMemHandle; Flags: dword): TCUresult; cdecl; external libgstcuda;
function CuIpcCloseMemHandle(dptr: TCUdeviceptr): TCUresult; cdecl; external libgstcuda;
function CuMemAddressReserve(ptr: PCUdeviceptr; size: Tsize_t; alignment: Tsize_t; addr: TCUdeviceptr; flags: qword): TCUresult; cdecl; external libgstcuda;
function CuMemAddressFree(ptr: TCUdeviceptr; size: Tsize_t): TCUresult; cdecl; external libgstcuda;
function CuMemCreate(handle: PCUmemGenericAllocationHandle; size: Tsize_t; prop: PCUmemAllocationProp; flags: qword): TCUresult; cdecl; external libgstcuda;
function CuMemRelease(handle: TCUmemGenericAllocationHandle): TCUresult; cdecl; external libgstcuda;
function CuMemExportToShareableHandle(shareableHandle: pointer; handle: TCUmemGenericAllocationHandle; handleType: TCUmemAllocationHandleType; flags: qword): TCUresult; cdecl; external libgstcuda;
function CuMemImportFromShareableHandle(handle: PCUmemGenericAllocationHandle; osHandle: pointer; shHandleType: TCUmemAllocationHandleType): TCUresult; cdecl; external libgstcuda;
function CuMemSetAccess(ptr: TCUdeviceptr; size: Tsize_t; desc: PCUmemAccessDesc; count: Tsize_t): TCUresult; cdecl; external libgstcuda;
function CuMemGetAccess(flags: Pqword; location: PCUmemLocation; ptr: TCUdeviceptr): TCUresult; cdecl; external libgstcuda;
function CuMemGetAllocationGranularity(granularity: PSizeUInt; prop: PCUmemAllocationProp; option: TCUmemAllocationGranularity_flags): TCUresult; cdecl; external libgstcuda;
function CuMemGetAllocationPropertiesFromHandle(prop: PCUmemAllocationProp; handle: TCUmemGenericAllocationHandle): TCUresult; cdecl; external libgstcuda;
function CuMemMap(ptr: TCUdeviceptr; size: Tsize_t; offset: Tsize_t; handle: TCUmemGenericAllocationHandle; flags: qword): TCUresult; cdecl; external libgstcuda;
function CuMemUnmap(ptr: TCUdeviceptr; size: Tsize_t): TCUresult; cdecl; external libgstcuda;
function CuMemRetainAllocationHandle(handle: PCUmemGenericAllocationHandle; addr: pointer): TCUresult; cdecl; external libgstcuda;
function CuMemAllocAsync(dptr: PCUdeviceptr; bytesize: Tsize_t; hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuMemAllocFromPoolAsync(dptr: PCUdeviceptr; bytesize: Tsize_t; pool: TCUmemoryPool; hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuMemFreeAsync(dptr: TCUdeviceptr; hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuMemPoolCreate(pool: PCUmemoryPool; poolProps: PCUmemPoolProps): TCUresult; cdecl; external libgstcuda;
function CuMemPoolDestroy(pool: TCUmemoryPool): TCUresult; cdecl; external libgstcuda;
function CuMemPoolSetAttribute(pool: TCUmemoryPool; attr: TCUmemPool_attribute; value: pointer): TCUresult; cdecl; external libgstcuda;
function CuMemPoolGetAttribute(pool: TCUmemoryPool; attr: TCUmemPool_attribute; value: pointer): TCUresult; cdecl; external libgstcuda;
function CuDestroyExternalMemory(extMem: TCUexternalMemory): TCUresult; cdecl; external libgstcuda;
function CuDestroyExternalSemaphore(extSem: TCUexternalSemaphore): TCUresult; cdecl; external libgstcuda;
function CuExternalMemoryGetMappedBuffer(devPtr: PCUdeviceptr; extMem: TCUexternalMemory; bufferDesc: PCUDA_EXTERNAL_MEMORY_BUFFER_DESC): TCUresult; cdecl; external libgstcuda;
function CuExternalMemoryGetMappedMipmappedArray(mipmap: PCUmipmappedArray; extMem: TCUexternalMemory; mipmapDesc: PCUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC): TCUresult; cdecl; external libgstcuda;
function CuImportExternalMemory(extMem_out: PCUexternalMemory; memHandleDesc: PCUDA_EXTERNAL_MEMORY_HANDLE_DESC): TCUresult; cdecl; external libgstcuda;
function CuImportExternalSemaphore(extSem_out: PCUexternalSemaphore; semHandleDesc: PCUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC): TCUresult; cdecl; external libgstcuda;
function CuSignalExternalSemaphoresAsync(extSemArray: PCUexternalSemaphore; paramsArray: PCUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS; numExtSems: dword; stream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuWaitExternalSemaphoresAsync(extSemArray: PCUexternalSemaphore; paramsArray: PCUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS; numExtSems: dword; stream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuMemsetD2D8(dstDevice: TCUdeviceptr; dstPitch: Tsize_t; uc: byte; Width: Tsize_t; Height: Tsize_t): TCUresult; cdecl; external libgstcuda;
function CuMemsetD2D8Async(dstDevice: TCUdeviceptr; dstPitch: Tsize_t; uc: byte; Width: Tsize_t; Height: Tsize_t;
  hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuMemsetD2D16(dstDevice: TCUdeviceptr; dstPitch: Tsize_t; us: word; Width: Tsize_t; Height: Tsize_t): TCUresult; cdecl; external libgstcuda;
function CuMemsetD2D16Async(dstDevice: TCUdeviceptr; dstPitch: Tsize_t; us: word; Width: Tsize_t; Height: Tsize_t;
  hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuMemsetD2D32(dstDevice: TCUdeviceptr; dstPitch: Tsize_t; ui: dword; Width: Tsize_t; Height: Tsize_t): TCUresult; cdecl; external libgstcuda;
function CuMemsetD2D32Async(dstDevice: TCUdeviceptr; dstPitch: Tsize_t; ui: dword; Width: Tsize_t; Height: Tsize_t;
  hStream: TCUstream): TCUresult; cdecl; external libgstcuda;
function CuGraphicsGLRegisterImage(pCudaResource: PCUgraphicsResource; image: dword; target: dword; Flags: dword): TCUresult; cdecl; external libgstcuda;
function CuGraphicsGLRegisterBuffer(pCudaResource: PCUgraphicsResource; buffer: dword; Flags: dword): TCUresult; cdecl; external libgstcuda;
function CuGraphicsResourceSetMapFlags(resource: TCUgraphicsResource; flags: dword): TCUresult; cdecl; external libgstcuda;
function CuGLGetDevices(pCudaDeviceCount: Pdword; pCudaDevices: PCUdevice; cudaDeviceCount: dword; deviceList: TCUGLDeviceList): TCUresult; cdecl; external libgstcuda;

{$ifdef windows}
function CuGraphicsD3D11RegisterResource(pCudaResource: PCUgraphicsResource; pD3DResource: PID3D11Resource; Flags: dword): TCUresult; cdecl; external libgstcuda;
function CuD3D11GetDevice(device: PCUdevice; pAdapter: PIDXGIAdapter): TCUresult; cdecl; external libgstcuda;
function CuD3D11GetDevices(pCudaDeviceCount: Pdword; pCudaDevices: PCUdevice; cudaDeviceCount: dword; pD3D11Device: PID3D11Device; deviceList: TCUd3d11DeviceList): TCUresult; cdecl; external libgstcuda;
{$endif}

// === Konventiert am: 24-7-26 15:40:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
