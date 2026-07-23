{$IFDEF read_interface}


const
  GST_MODELINFO_VERSION_MAJOR = 1;
  GST_MODELINFO_VERSION_MINOR = 0;
  GST_MODELINFO_VERSION_STR = '1.0';
  GST_MODELINFO_SECTION_NAME = 'modelinfo';

type
  PGstAnalyticsModelInfoTensorDirection = ^TGstAnalyticsModelInfoTensorDirection;
  TGstAnalyticsModelInfoTensorDirection = longint;
const
  MODELINFO_DIRECTION_UNKNOWN = 0;
  MODELINFO_DIRECTION_INPUT = 1;
  MODELINFO_DIRECTION_OUTPUT = 2;

type
  PGstAnalyticsModelInfo = type Pointer;

function gst_analytics_modelinfo_get_type: TGType; cdecl; external libgstanalytics;
function gst_analytics_modelinfo_load(model_filename: Pgchar): PGstAnalyticsModelInfo; cdecl; external libgstanalytics;
function gst_analytics_modelinfo_find_tensor_name(modelinfo: PGstAnalyticsModelInfo; dir: TGstAnalyticsModelInfoTensorDirection; index: Tgsize; in_tensor_name: Pgchar; data_type: TGstTensorDataType;
  num_dims: Tgsize; dims: Pgsize): Pgchar; cdecl; external libgstanalytics;
function gst_analytics_modelinfo_get_id(modelinfo: PGstAnalyticsModelInfo; tensor_name: Pgchar): Pgchar; cdecl; external libgstanalytics;
function gst_analytics_modelinfo_get_group_id(modelinfo: PGstAnalyticsModelInfo): Pgchar; cdecl; external libgstanalytics;
function gst_analytics_modelinfo_get_quark_id(modelinfo: PGstAnalyticsModelInfo; tensor_name: Pgchar): TGQuark; cdecl; external libgstanalytics;
function gst_analytics_modelinfo_get_quark_group_id(modelinfo: PGstAnalyticsModelInfo): TGQuark; cdecl; external libgstanalytics;
function gst_analytics_modelinfo_get_target_ranges(modelinfo: PGstAnalyticsModelInfo; tensor_name: Pgchar; num_ranges: Pgsize; mins: PPgdouble; maxs: PPgdouble): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_modelinfo_get_input_scales_offsets(modelinfo: PGstAnalyticsModelInfo; tensor_name: Pgchar; num_input_ranges: Tgsize; input_mins: Pgdouble; input_maxs: Pgdouble;
  num_output_ranges: Pgsize; output_scales: PPgdouble; output_offsets: PPgdouble): Tgboolean; cdecl; external libgstanalytics;
function gst_analytics_modelinfo_get_dims_order(modelinfo: PGstAnalyticsModelInfo; tensor_name: Pgchar): TGstTensorDimOrder; cdecl; external libgstanalytics;
function gst_analytics_modelinfo_get_version(modelinfo: PGstAnalyticsModelInfo): Pgchar; cdecl; external libgstanalytics;
procedure gst_analytics_modelinfo_free(model_info: PGstAnalyticsModelInfo); cdecl; external libgstanalytics;


function GST_ANALYTICS_MODELINFO_TYPE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_ANALYTICS_MODELINFO_TYPE: TGType;
begin
  GST_ANALYTICS_MODELINFO_TYPE := gst_analytics_modelinfo_get_type;
end;

{$ENDIF read_implementation}
