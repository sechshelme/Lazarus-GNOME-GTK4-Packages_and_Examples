unit fp_gst_hip;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_video,
  fp_gst_base;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  ThipError_t = longint;
  ThipDeviceAttribute_t = longint;
  THIPfilter_mode = longint;
  THIPaddress_mode = longint;

  ThipStream_t = Pointer;
  ThipModule_t = Pointer;
  ThipFunction_t = Pointer;
  ThipDeviceptr_t = Pointer;
  ThipTextureObject_t = Pointer;
  ThipGraphicsResource_t = Pointer;
  ThipGLDeviceList = Pointer;
  ThipEvent_t = Pointer;

  PhipStream_t = ^ThipStream_t;
  PhipModule_t = ^ThipModule_t;
  PhipFunction_t = ^ThipFunction_t;
  PhipTextureObject_t = ^ThipTextureObject_t;
  PhipGraphicsResource_t = ^ThipGraphicsResource_t;
  PhipEvent_t = ^ThipEvent_t;

  PhipDeviceProp_t = Pointer;
  Phip_Memcpy2D = Pointer;
  PhipGraphicsResource = Pointer;
  PPhipGraphicsResource = ^PhipGraphicsResource;
  PHIP_RESOURCE_DESC = Pointer;
  PHIP_TEXTURE_DESC = Pointer;
  PHIP_RESOURCE_VIEW_DESC = Pointer;


  {$DEFINE read_interface}
  {$include gst/hip/gsthip_enums.inc}
  {$include gst/hip/gsthipevent.inc}
  {$include gst/hip/gsthipstream.inc}
  {$include gst/hip/gsthipdevice.inc}
  {$include gst/hip/gsthipbufferpool.inc}
  {$include gst/hip/gsthip_interop.inc}
  {$include gst/hip/gsthip_interop_gl.inc}
  {$include gst/hip/gsthiploader.inc}
  {$include gst/hip/gsthipmemory.inc}
  {$include gst/hip/gsthiprtc.inc}
  {$include gst/hip/gsthiputils.inc}
  {$include gst/hip/hip_gst.inc}
  {$include gst/hip/hip_gst_gl.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/hip/gsthip_enums.inc}
{$include gst/hip/gsthipevent.inc}
{$include gst/hip/gsthipstream.inc}
{$include gst/hip/gsthipdevice.inc}
{$include gst/hip/gsthipbufferpool.inc}
{$include gst/hip/gsthip_interop.inc}
{$include gst/hip/gsthip_interop_gl.inc}
{$include gst/hip/gsthiploader.inc}
{$include gst/hip/gsthipmemory.inc}
{$include gst/hip/gsthiprtc.inc}
{$include gst/hip/gsthiputils.inc}
{$include gst/hip/hip_gst.inc}
{$include gst/hip/hip_gst_gl.inc}
{$UNDEF read_implementation}

end.
