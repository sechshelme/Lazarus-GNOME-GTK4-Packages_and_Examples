unit fp_gst_cuda;

interface

uses
  {$IFDEF WINDOWS}
  windows,
  {$ENDIF}
  fp_glib2,
  fp_gst,
  fp_gst_base,
  fp_gst_video,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== cuda
type
  TCUresult = longint;


  TCUlimit = type Pointer;
  TCUexternalMemory = type Pointer;
  TCUexternalSemaphore = type Pointer;
  TCUGLDeviceList = type Pointer;


  TCUcontext = type Pointer;
  PCUcontext = ^TCUcontext;

  TCUdevice = uint32;
  PCUdevice = ^TCUdevice;

  TCUgraphicsResource = type Pointer;
  PCUgraphicsResource = ^TCUgraphicsResource;

  TCUipcEventHandle = type Pointer;
  PCUipcEventHandle = ^TCUipcEventHandle;

  TCUstream = type Pointer;
  PCUstream = ^TCUstream;

  TCUmodule = type Pointer;
  PCUmodule = ^TCUmodule;

  TCUmemoryPool = type Pointer;
  PCUmemoryPool = ^TCUmemoryPool;

  TCUipcMemHandle = type Pointer;
  PCUipcMemHandle = ^TCUipcMemHandle;

  TCUmemGenericAllocationHandle = type Pointer;
  PCUmemGenericAllocationHandle = ^TCUmemGenericAllocationHandle;

  TCUevent = type Pointer;
  TCUfunction = type Pointer;

  TCUfilter_mode = longint;
  PCUfilter_mode = ^TCUfilter_mode;

  TCUtexObject = uint64;
  PCUtexObject = ^TCUtexObject;

  TCUdeviceptr = uint64;
  PCUdeviceptr = ^TCUdeviceptr;

  PCUmemAllocationProp = type Pointer;
  PCUarray = type Pointer;
  PCUuuid = type Pointer;
  PCUfunction = type Pointer;
  PCUevent = type Pointer;
  PCUmemAccessDesc = type Pointer;
  PCUmemLocation = type Pointer;
  PCUmemPoolProps = type Pointer;
  PCUmipmappedArray = type Pointer;
  PCUexternalMemory = type Pointer;
  PCUexternalSemaphore = type Pointer;


  TCUgraphicsRegisterFlags = longint;
  TCUgraphicsMapResourceFlags = longint;
  TCUmemAllocationGranularity_flags = longint;
  TCUdevice_attribute = longint;
  TCUmemAllocationHandleType = longint;
  TCUmemPool_attribute = longint;

  PCUDA_MEMCPY2D = type Pointer;
  PCUDA_RESOURCE_DESC = type Pointer;
  PCUDA_TEXTURE_DESC = type Pointer;
  PCUDA_RESOURCE_VIEW_DESC = type Pointer;
  PCUDA_EXTERNAL_MEMORY_BUFFER_DESC = type Pointer;
  PCUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC = type Pointer;
  PCUDA_EXTERNAL_MEMORY_HANDLE_DESC = type Pointer;
  PCUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC = type Pointer;
  PCUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS = type Pointer;
  PCUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS = type Pointer;

  {$DEFINE read_interface}
  {$include gst/cuda//cuda_gst.inc}
  {$include gst/cuda//gstcudacontext.inc}
  {$include gst/cuda//gstcudastream.inc}
  {$include gst/cuda//gstcudamemorypool.inc}
  {$include gst/cuda//gstcudamemory.inc}
  {$include gst/cuda//gstcudabufferpool.inc}
  {$include gst/cuda//gstcudaloader.inc}
  {$include gst/cuda//gstcudanvrtc.inc}
  {$include gst/cuda//gstcudautils.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/cuda//cuda_gst.inc}
{$include gst/cuda//gstcudacontext.inc}
{$include gst/cuda//gstcudastream.inc}
{$include gst/cuda//gstcudamemorypool.inc}
{$include gst/cuda//gstcudamemory.inc}
{$include gst/cuda//gstcudabufferpool.inc}
{$include gst/cuda//gstcudaloader.inc}
{$include gst/cuda//gstcudanvrtc.inc}
{$include gst/cuda//gstcudautils.inc}
{$UNDEF read_implementation}

end.
