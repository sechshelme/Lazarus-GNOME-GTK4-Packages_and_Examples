{$IFDEF read_interface}


type
  PGstCameraBinPreviewPipelineData = ^TGstCameraBinPreviewPipelineData;
  TGstCameraBinPreviewPipelineData = record
    pipeline: PGstElement;
    appsrc: PGstElement;
    filter: PGstElement;
    appsink: PGstElement;
    vscale: PGstElement;
    element: PGstElement;
    pending_preview_caps: PGstCaps;
    processing: Tguint;
    processing_lock: TGMutex;
    processing_cond: TGCond;
  end;

function gst_camerabin_create_preview_pipeline(element: PGstElement; filter: PGstElement): PGstCameraBinPreviewPipelineData; cdecl; external libgstbasecamerabinsrc;
procedure gst_camerabin_destroy_preview_pipeline(preview: PGstCameraBinPreviewPipelineData); cdecl; external libgstbasecamerabinsrc;
function gst_camerabin_preview_pipeline_post(preview: PGstCameraBinPreviewPipelineData; sample: PGstSample): Tgboolean; cdecl; external libgstbasecamerabinsrc;
procedure gst_camerabin_preview_set_caps(preview: PGstCameraBinPreviewPipelineData; caps: PGstCaps); cdecl; external libgstbasecamerabinsrc;
function gst_camerabin_preview_set_filter(preview: PGstCameraBinPreviewPipelineData; filter: PGstElement): Tgboolean; cdecl; external libgstbasecamerabinsrc;

// === Konventiert am: 27-7-26 13:07:16 ===

{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
