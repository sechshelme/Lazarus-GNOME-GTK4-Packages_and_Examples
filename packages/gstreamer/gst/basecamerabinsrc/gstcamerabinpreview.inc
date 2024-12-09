
{$IFDEF read_interface}

  {#warning "camera bin preview is unstable API and may change in future." }
  {#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
type
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
  PGstCameraBinPreviewPipelineData = ^TGstCameraBinPreviewPipelineData;

function gst_camerabin_create_preview_pipeline(element: PGstElement; filter: PGstElement): PGstCameraBinPreviewPipelineData; cdecl; external libgstbasecamerabinsrc;
procedure gst_camerabin_destroy_preview_pipeline(preview: PGstCameraBinPreviewPipelineData); cdecl; external libgstbasecamerabinsrc;
function gst_camerabin_preview_pipeline_post(preview: PGstCameraBinPreviewPipelineData; sample: PGstSample): Tgboolean; cdecl; external libgstbasecamerabinsrc;
procedure gst_camerabin_preview_set_caps(preview: PGstCameraBinPreviewPipelineData; caps: PGstCaps); cdecl; external libgstbasecamerabinsrc;
function gst_camerabin_preview_set_filter(preview: PGstCameraBinPreviewPipelineData; filter: PGstElement): Tgboolean; cdecl; external libgstbasecamerabinsrc;

// === Konventiert am: 12-10-24 17:25:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
