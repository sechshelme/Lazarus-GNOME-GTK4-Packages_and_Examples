unit fp_gst_cuda;

interface

uses
  {$IFDEF WINDOWS}
  windows,
  {$ENDIF}
  fp_glib2,
  fp_gst,
  fp_gst_video;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== cuda
  type
    TCUresult = longint;
    TCUlimit = longint;
    TCUGLDeviceList = longint;
    TCUfilter_mode = longint;
    PCUfilter_mode = ^TCUfilter_mode;

    TCUdevice = int32;
    PCUdevice = ^TCUdevice;

    TCUtexObject = uint64;
    PCUtexObject = ^TCUtexObject;

    TCUdeviceptr = QWord;
    PCUdeviceptr = ^TCUdeviceptr;

    TCUmemGenericAllocationHandle = QWord;
    PCUmemGenericAllocationHandle = ^TCUmemGenericAllocationHandle;

    TCUipcEventHandle = record
      reserved: array[0..63] of AnsiChar;
    end;
    PCUipcEventHandle = ^TCUipcEventHandle;

    TCUipcMemHandle = record
      reserved: array[0..63] of AnsiChar;
    end;
    PCUipcMemHandle = ^TCUipcMemHandle;

    TCUexternalMemory = type Pointer;
    PCUexternalMemory = ^TCUexternalMemory;

    TCUexternalSemaphore = type Pointer;
    PCUexternalSemaphore = ^TCUexternalSemaphore;

    TCUcontext = type Pointer;
    PCUcontext = ^TCUcontext;

    TCUgraphicsResource = type Pointer;
    PCUgraphicsResource = ^TCUgraphicsResource;

    TCUstream = type Pointer;
    PCUstream = ^TCUstream;

    TCUmodule = type Pointer;
    PCUmodule = ^TCUmodule;

    TCUmemoryPool = type Pointer;
    PCUmemoryPool = ^TCUmemoryPool;

    TCUevent = type Pointer;
    PCUevent = ^TCUevent;

    TCUfunction = type Pointer;
    PCUfunction = ^TCUfunction;

    TCUgraphicsRegisterFlags = longint;
    TCUgraphicsMapResourceFlags = longint;
    TCUmemAllocationGranularity_flags = longint;
    TCUdevice_attribute = longint;
    TCUmemAllocationHandleType = longint;
    TCUmemPool_attribute = longint;

    PCUmemAllocationProp = Pointer;
    PCUarray = Pointer;
    PCUuuid = Pointer;
    PCUmemAccessDesc = Pointer;
    PCUmemLocation = Pointer;
    PCUmemPoolProps = Pointer;
    PCUmipmappedArray = Pointer;

    PCUDA_MEMCPY2D = Pointer;
    PCUDA_RESOURCE_DESC = Pointer;
    PCUDA_TEXTURE_DESC = Pointer;
    PCUDA_RESOURCE_VIEW_DESC = Pointer;
    PCUDA_EXTERNAL_MEMORY_BUFFER_DESC = Pointer;
    PCUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC = Pointer;
    PCUDA_EXTERNAL_MEMORY_HANDLE_DESC = Pointer;
    PCUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC = Pointer;
    PCUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS = Pointer;
    PCUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS = Pointer;


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
