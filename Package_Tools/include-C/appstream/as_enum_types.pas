unit as_enum_types;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_enum}
function as_agreement_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_AGREEMENT_KIND: TGType;

function as_size_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_SIZE_KIND: TGType;

function as_artifact_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_ARTIFACT_KIND: TGType;

function as_color_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_COLOR_KIND: TGType;

function as_color_scheme_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_COLOR_SCHEME_KIND: TGType;

function as_bundle_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_BUNDLE_KIND: TGType;

function as_checksum_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_CHECKSUM_KIND: TGType;

function as_component_box_flags_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_COMPONENT_BOX_FLAGS: TGType;

function as_component_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_COMPONENT_KIND: TGType;

function as_merge_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_MERGE_KIND: TGType;

function as_component_scope_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_COMPONENT_SCOPE: TGType;

function as_url_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_URL_KIND: TGType;

function as_content_rating_system_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_CONTENT_RATING_SYSTEM: TGType;

function as_content_rating_value_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_CONTENT_RATING_VALUE: TGType;

function as_format_version_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_FORMAT_VERSION: TGType;

function as_format_style_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_FORMAT_STYLE: TGType;

function as_format_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_FORMAT_KIND: TGType;

function as_value_flags_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_VALUE_FLAGS: TGType;

function as_icon_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_ICON_KIND: TGType;

function as_image_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_IMAGE_KIND: TGType;

function as_issue_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_ISSUE_KIND: TGType;

function as_launchable_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_LAUNCHABLE_KIND: TGType;

function as_parse_flags_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_PARSE_FLAGS: TGType;

function as_metadata_error_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_METADATA_ERROR: TGType;

function as_pool_flags_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_POOL_FLAGS: TGType;

function as_cache_flags_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_CACHE_FLAGS: TGType;

function as_pool_error_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_POOL_ERROR: TGType;

function as_provided_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_PROVIDED_KIND: TGType;

function as_reference_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_REFERENCE_KIND: TGType;

function as_relation_status_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_RELATION_STATUS: TGType;

function as_relation_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_RELATION_KIND: TGType;

function as_relation_item_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_RELATION_ITEM_KIND: TGType;

function as_relation_compare_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_RELATION_COMPARE: TGType;

function as_control_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_CONTROL_KIND: TGType;

function as_display_side_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_DISPLAY_SIDE_KIND: TGType;

function as_internet_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_INTERNET_KIND: TGType;

function as_relation_error_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_RELATION_ERROR: TGType;

function as_release_list_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_RELEASE_LIST_KIND: TGType;

function as_release_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_RELEASE_KIND: TGType;

function as_urgency_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_URGENCY_KIND: TGType;

function as_release_url_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_RELEASE_URL_KIND: TGType;

function as_review_flags_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_REVIEW_FLAGS: TGType;

function as_screenshot_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_SCREENSHOT_KIND: TGType;

function as_screenshot_media_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_SCREENSHOT_MEDIA_KIND: TGType;

function as_suggested_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_SUGGESTED_KIND: TGType;

function as_check_result_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_CHECK_RESULT: TGType;

function as_chassis_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_CHASSIS_KIND: TGType;

function as_system_info_error_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_SYSTEM_INFO_ERROR: TGType;

function as_translation_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_TRANSLATION_KIND: TGType;

function as_utils_error_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_UTILS_ERROR: TGType;

function as_data_id_match_flags_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_DATA_ID_MATCH_FLAGS: TGType;

function as_metadata_location_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_METADATA_LOCATION: TGType;

function as_markup_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_MARKUP_KIND: TGType;

function as_issue_severity_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_ISSUE_SEVERITY: TGType;

function as_validator_error_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_VALIDATOR_ERROR: TGType;

function as_vercmp_flags_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_VERCMP_FLAGS: TGType;

function as_video_codec_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_VIDEO_CODEC_KIND: TGType;

function as_video_container_kind_get_type: TGType; cdecl; external libappstream;
function AS_TYPE_VIDEO_CONTAINER_KIND: TGType;
{$ENDIF read_enum}

// === Konventiert am: 30-7-26 19:36:04 ===


implementation


function AS_TYPE_AGREEMENT_KIND: TGType;
begin
  AS_TYPE_AGREEMENT_KIND := as_agreement_kind_get_type;
end;

function AS_TYPE_SIZE_KIND: TGType;
begin
  AS_TYPE_SIZE_KIND := as_size_kind_get_type;
end;

function AS_TYPE_ARTIFACT_KIND: TGType;
begin
  AS_TYPE_ARTIFACT_KIND := as_artifact_kind_get_type;
end;

function AS_TYPE_COLOR_KIND: TGType;
begin
  AS_TYPE_COLOR_KIND := as_color_kind_get_type;
end;

function AS_TYPE_COLOR_SCHEME_KIND: TGType;
begin
  AS_TYPE_COLOR_SCHEME_KIND := as_color_scheme_kind_get_type;
end;

function AS_TYPE_BUNDLE_KIND: TGType;
begin
  AS_TYPE_BUNDLE_KIND := as_bundle_kind_get_type;
end;

function AS_TYPE_CHECKSUM_KIND: TGType;
begin
  AS_TYPE_CHECKSUM_KIND := as_checksum_kind_get_type;
end;

function AS_TYPE_COMPONENT_BOX_FLAGS: TGType;
begin
  AS_TYPE_COMPONENT_BOX_FLAGS := as_component_box_flags_get_type;
end;

function AS_TYPE_COMPONENT_KIND: TGType;
begin
  AS_TYPE_COMPONENT_KIND := as_component_kind_get_type;
end;

function AS_TYPE_MERGE_KIND: TGType;
begin
  AS_TYPE_MERGE_KIND := as_merge_kind_get_type;
end;

function AS_TYPE_COMPONENT_SCOPE: TGType;
begin
  AS_TYPE_COMPONENT_SCOPE := as_component_scope_get_type;
end;

function AS_TYPE_URL_KIND: TGType;
begin
  AS_TYPE_URL_KIND := as_url_kind_get_type;
end;

function AS_TYPE_CONTENT_RATING_SYSTEM: TGType;
begin
  AS_TYPE_CONTENT_RATING_SYSTEM := as_content_rating_system_get_type;
end;

function AS_TYPE_CONTENT_RATING_VALUE: TGType;
begin
  AS_TYPE_CONTENT_RATING_VALUE := as_content_rating_value_get_type;
end;

function AS_TYPE_FORMAT_VERSION: TGType;
begin
  AS_TYPE_FORMAT_VERSION := as_format_version_get_type;
end;

function AS_TYPE_FORMAT_STYLE: TGType;
begin
  AS_TYPE_FORMAT_STYLE := as_format_style_get_type;
end;

function AS_TYPE_FORMAT_KIND: TGType;
begin
  AS_TYPE_FORMAT_KIND := as_format_kind_get_type;
end;

function AS_TYPE_VALUE_FLAGS: TGType;
begin
  AS_TYPE_VALUE_FLAGS := as_value_flags_get_type;
end;

function AS_TYPE_ICON_KIND: TGType;
begin
  AS_TYPE_ICON_KIND := as_icon_kind_get_type;
end;

function AS_TYPE_IMAGE_KIND: TGType;
begin
  AS_TYPE_IMAGE_KIND := as_image_kind_get_type;
end;

function AS_TYPE_ISSUE_KIND: TGType;
begin
  AS_TYPE_ISSUE_KIND := as_issue_kind_get_type;
end;

function AS_TYPE_LAUNCHABLE_KIND: TGType;
begin
  AS_TYPE_LAUNCHABLE_KIND := as_launchable_kind_get_type;
end;

function AS_TYPE_PARSE_FLAGS: TGType;
begin
  AS_TYPE_PARSE_FLAGS := as_parse_flags_get_type;
end;

function AS_TYPE_METADATA_ERROR: TGType;
begin
  AS_TYPE_METADATA_ERROR := as_metadata_error_get_type;
end;

function AS_TYPE_POOL_FLAGS: TGType;
begin
  AS_TYPE_POOL_FLAGS := as_pool_flags_get_type;
end;

function AS_TYPE_CACHE_FLAGS: TGType;
begin
  AS_TYPE_CACHE_FLAGS := as_cache_flags_get_type;
end;

function AS_TYPE_POOL_ERROR: TGType;
begin
  AS_TYPE_POOL_ERROR := as_pool_error_get_type;
end;

function AS_TYPE_PROVIDED_KIND: TGType;
begin
  AS_TYPE_PROVIDED_KIND := as_provided_kind_get_type;
end;

function AS_TYPE_REFERENCE_KIND: TGType;
begin
  AS_TYPE_REFERENCE_KIND := as_reference_kind_get_type;
end;

function AS_TYPE_RELATION_STATUS: TGType;
begin
  AS_TYPE_RELATION_STATUS := as_relation_status_get_type;
end;

function AS_TYPE_RELATION_KIND: TGType;
begin
  AS_TYPE_RELATION_KIND := as_relation_kind_get_type;
end;

function AS_TYPE_RELATION_ITEM_KIND: TGType;
begin
  AS_TYPE_RELATION_ITEM_KIND := as_relation_item_kind_get_type;
end;

function AS_TYPE_RELATION_COMPARE: TGType;
begin
  AS_TYPE_RELATION_COMPARE := as_relation_compare_get_type;
end;

function AS_TYPE_CONTROL_KIND: TGType;
begin
  AS_TYPE_CONTROL_KIND := as_control_kind_get_type;
end;

function AS_TYPE_DISPLAY_SIDE_KIND: TGType;
begin
  AS_TYPE_DISPLAY_SIDE_KIND := as_display_side_kind_get_type;
end;

function AS_TYPE_INTERNET_KIND: TGType;
begin
  AS_TYPE_INTERNET_KIND := as_internet_kind_get_type;
end;

function AS_TYPE_RELATION_ERROR: TGType;
begin
  AS_TYPE_RELATION_ERROR := as_relation_error_get_type;
end;

function AS_TYPE_RELEASE_LIST_KIND: TGType;
begin
  AS_TYPE_RELEASE_LIST_KIND := as_release_list_kind_get_type;
end;

function AS_TYPE_RELEASE_KIND: TGType;
begin
  AS_TYPE_RELEASE_KIND := as_release_kind_get_type;
end;

function AS_TYPE_URGENCY_KIND: TGType;
begin
  AS_TYPE_URGENCY_KIND := as_urgency_kind_get_type;
end;

function AS_TYPE_RELEASE_URL_KIND: TGType;
begin
  AS_TYPE_RELEASE_URL_KIND := as_release_url_kind_get_type;
end;

function AS_TYPE_REVIEW_FLAGS: TGType;
begin
  AS_TYPE_REVIEW_FLAGS := as_review_flags_get_type;
end;

function AS_TYPE_SCREENSHOT_KIND: TGType;
begin
  AS_TYPE_SCREENSHOT_KIND := as_screenshot_kind_get_type;
end;

function AS_TYPE_SCREENSHOT_MEDIA_KIND: TGType;
begin
  AS_TYPE_SCREENSHOT_MEDIA_KIND := as_screenshot_media_kind_get_type;
end;

function AS_TYPE_SUGGESTED_KIND: TGType;
begin
  AS_TYPE_SUGGESTED_KIND := as_suggested_kind_get_type;
end;

function AS_TYPE_CHECK_RESULT: TGType;
begin
  AS_TYPE_CHECK_RESULT := as_check_result_get_type;
end;

function AS_TYPE_CHASSIS_KIND: TGType;
begin
  AS_TYPE_CHASSIS_KIND := as_chassis_kind_get_type;
end;

function AS_TYPE_SYSTEM_INFO_ERROR: TGType;
begin
  AS_TYPE_SYSTEM_INFO_ERROR := as_system_info_error_get_type;
end;

function AS_TYPE_TRANSLATION_KIND: TGType;
begin
  AS_TYPE_TRANSLATION_KIND := as_translation_kind_get_type;
end;

function AS_TYPE_UTILS_ERROR: TGType;
begin
  AS_TYPE_UTILS_ERROR := as_utils_error_get_type;
end;

function AS_TYPE_DATA_ID_MATCH_FLAGS: TGType;
begin
  AS_TYPE_DATA_ID_MATCH_FLAGS := as_data_id_match_flags_get_type;
end;

function AS_TYPE_METADATA_LOCATION: TGType;
begin
  AS_TYPE_METADATA_LOCATION := as_metadata_location_get_type;
end;

function AS_TYPE_MARKUP_KIND: TGType;
begin
  AS_TYPE_MARKUP_KIND := as_markup_kind_get_type;
end;

function AS_TYPE_ISSUE_SEVERITY: TGType;
begin
  AS_TYPE_ISSUE_SEVERITY := as_issue_severity_get_type;
end;

function AS_TYPE_VALIDATOR_ERROR: TGType;
begin
  AS_TYPE_VALIDATOR_ERROR := as_validator_error_get_type;
end;

function AS_TYPE_VERCMP_FLAGS: TGType;
begin
  AS_TYPE_VERCMP_FLAGS := as_vercmp_flags_get_type;
end;

function AS_TYPE_VIDEO_CODEC_KIND: TGType;
begin
  AS_TYPE_VIDEO_CODEC_KIND := as_video_codec_kind_get_type;
end;

function AS_TYPE_VIDEO_CONTAINER_KIND: TGType;
begin
  AS_TYPE_VIDEO_CONTAINER_KIND := as_video_container_kind_get_type;
end;

end.
