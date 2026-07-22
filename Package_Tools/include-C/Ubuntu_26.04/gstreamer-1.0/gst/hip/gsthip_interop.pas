unit gsthip_interop;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGstHipGraphicsResource = type Pointer;
  PPGstHipGraphicsResource = ^PGstHipGraphicsResource;

function gst_hip_graphics_resource_get_type: TGType; cdecl; external libgsthip;
function gst_hip_graphics_resource_map(resource: PGstHipGraphicsResource; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function gst_hip_graphics_resource_unmap(resource: PGstHipGraphicsResource; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function gst_hip_graphics_resource_get_mapped_pointer(resource: PGstHipGraphicsResource; dev_ptr: Ppointer; size: PSizeUInt): ThipError_t; cdecl; external libgsthip;
function gst_hip_graphics_resource_ref(resource: PGstHipGraphicsResource): PGstHipGraphicsResource; cdecl; external libgsthip;
procedure gst_hip_graphics_resource_unref(resource: PGstHipGraphicsResource); cdecl; external libgsthip;
procedure gst_clear_hip_graphics_resource(resource: PPGstHipGraphicsResource); cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:15:34 ===


implementation



end.
