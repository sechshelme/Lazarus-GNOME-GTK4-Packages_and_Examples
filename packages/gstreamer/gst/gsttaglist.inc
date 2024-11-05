/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstTagMergeMode = ^TGstTagMergeMode;
  TGstTagMergeMode = longint;

const
  GST_TAG_MERGE_UNDEFINED = 0;
  GST_TAG_MERGE_REPLACE_ALL = 1;
  GST_TAG_MERGE_REPLACE = 2;
  GST_TAG_MERGE_APPEND = 3;
  GST_TAG_MERGE_PREPEND = 4;
  GST_TAG_MERGE_KEEP = 5;
  GST_TAG_MERGE_KEEP_ALL = 6;
  GST_TAG_MERGE_COUNT = 7;

type
  PGstTagFlag = ^TGstTagFlag;
  TGstTagFlag = longint;

const
  GST_TAG_FLAG_UNDEFINED = 0;
  GST_TAG_FLAG_META = 1;
  GST_TAG_FLAG_ENCODED = 2;
  GST_TAG_FLAG_DECODED = 3;
  GST_TAG_FLAG_COUNT = 4;

type
  TGstTagList = record
    mini_object: TGstMiniObject;
  end;
  PGstTagList = ^TGstTagList;
  PPGstTagList = ^PGstTagList;

var
  _gst_tag_list_type: TGType; cvar;external libgstreamer;

type
  TGstTagForeachFunc = procedure(list: PGstTagList; tag: Pgchar; user_data: Tgpointer); cdecl;
  TGstTagMergeFunc = procedure(dest: PGValue; src: PGValue); cdecl;

function gst_tag_list_get_type: TGType; cdecl; external libgstreamer;
procedure gst_tag_register(Name: Pgchar; flag: TGstTagFlag; _type: TGType; nick: Pgchar; blurb: Pgchar;
  func: TGstTagMergeFunc); cdecl; external libgstreamer;
procedure gst_tag_register_static(Name: Pgchar; flag: TGstTagFlag; _type: TGType; nick: Pgchar; blurb: Pgchar;
  func: TGstTagMergeFunc); cdecl; external libgstreamer;
procedure gst_tag_merge_use_first(dest: PGValue; src: PGValue); cdecl; external libgstreamer;
procedure gst_tag_merge_strings_with_comma(dest: PGValue; src: PGValue); cdecl; external libgstreamer;
function gst_tag_exists(tag: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_tag_get_type(tag: Pgchar): TGType; cdecl; external libgstreamer;
function gst_tag_get_nick(tag: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_tag_get_description(tag: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_tag_get_flag(tag: Pgchar): TGstTagFlag; cdecl; external libgstreamer;
function gst_tag_is_fixed(tag: Pgchar): Tgboolean; cdecl; external libgstreamer;

type
  PGstTagScope = ^TGstTagScope;
  TGstTagScope = longint;

const
  GST_TAG_SCOPE_STREAM = 0;
  GST_TAG_SCOPE_GLOBAL = 1;

function gst_tag_list_new_empty: PGstTagList; cdecl; external libgstreamer;
function gst_tag_list_new(tag: Pgchar): PGstTagList; varargs cdecl; external libgstreamer;
function gst_tag_list_new_valist(var_args: Tva_list): PGstTagList; cdecl; external libgstreamer;
procedure gst_tag_list_set_scope(list: PGstTagList; scope: TGstTagScope); cdecl; external libgstreamer;
function gst_tag_list_get_scope(list: PGstTagList): TGstTagScope; cdecl; external libgstreamer;
function gst_tag_list_to_string(list: PGstTagList): Pgchar; cdecl; external libgstreamer;
function gst_tag_list_new_from_string(str: Pgchar): PGstTagList; cdecl; external libgstreamer;
function gst_tag_list_n_tags(list: PGstTagList): Tgint; cdecl; external libgstreamer;
function gst_tag_list_nth_tag_name(list: PGstTagList; index: Tguint): Pgchar; cdecl; external libgstreamer;
function gst_tag_list_is_empty(list: PGstTagList): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_is_equal(list1: PGstTagList; list2: PGstTagList): Tgboolean; cdecl; external libgstreamer;
procedure gst_tag_list_insert(into: PGstTagList; from: PGstTagList; mode: TGstTagMergeMode); cdecl; external libgstreamer;
function gst_tag_list_merge(list1: PGstTagList; list2: PGstTagList; mode: TGstTagMergeMode): PGstTagList; cdecl; external libgstreamer;
function gst_tag_list_get_tag_size(list: PGstTagList; tag: Pgchar): Tguint; cdecl; external libgstreamer;
procedure gst_tag_list_add(list: PGstTagList; mode: TGstTagMergeMode; tag: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_tag_list_add_values(list: PGstTagList; mode: TGstTagMergeMode; tag: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_tag_list_add_valist(list: PGstTagList; mode: TGstTagMergeMode; tag: Pgchar; var_args: Tva_list); cdecl; external libgstreamer;
procedure gst_tag_list_add_valist_values(list: PGstTagList; mode: TGstTagMergeMode; tag: Pgchar; var_args: Tva_list); cdecl; external libgstreamer;
procedure gst_tag_list_add_value(list: PGstTagList; mode: TGstTagMergeMode; tag: Pgchar; Value: PGValue); cdecl; external libgstreamer;
procedure gst_tag_list_remove_tag(list: PGstTagList; tag: Pgchar); cdecl; external libgstreamer;
procedure gst_tag_list_foreach(list: PGstTagList; func: TGstTagForeachFunc; user_data: Tgpointer); cdecl; external libgstreamer;
function gst_tag_list_get_value_index(list: PGstTagList; tag: Pgchar; index: Tguint): PGValue; cdecl; external libgstreamer;
function gst_tag_list_copy_value(dest: PGValue; list: PGstTagList; tag: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_boolean(list: PGstTagList; tag: Pgchar; Value: Pgboolean): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_boolean_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: Pgboolean): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_int(list: PGstTagList; tag: Pgchar; Value: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_int_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_uint(list: PGstTagList; tag: Pgchar; Value: Pguint): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_uint_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: Pguint): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_int64(list: PGstTagList; tag: Pgchar; Value: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_int64_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_uint64(list: PGstTagList; tag: Pgchar; Value: Pguint64): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_uint64_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: Pguint64): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_float(list: PGstTagList; tag: Pgchar; Value: Pgfloat): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_float_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: Pgfloat): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_double(list: PGstTagList; tag: Pgchar; Value: Pgdouble): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_double_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: Pgdouble): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_string(list: PGstTagList; tag: Pgchar; Value: PPgchar): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_string_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: PPgchar): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_peek_string_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: PPgchar): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_pointer(list: PGstTagList; tag: Pgchar; Value: Pgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_pointer_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: Pgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_date(list: PGstTagList; tag: Pgchar; Value: PPGDate): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_date_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: PPGDate): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_date_time(list: PGstTagList; tag: Pgchar; Value: PPGstDateTime): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_date_time_index(list: PGstTagList; tag: Pgchar; index: Tguint; Value: PPGstDateTime): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_sample(list: PGstTagList; tag: Pgchar; sample: PPGstSample): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_get_sample_index(list: PGstTagList; tag: Pgchar; index: Tguint; sample: PPGstSample): Tgboolean; cdecl; external libgstreamer;

function gst_tag_list_ref(taglist: PGstTagList): PGstTagList; cdecl; external libgstreamer;
procedure gst_tag_list_unref(taglist: PGstTagList); cdecl; external libgstreamer;
procedure gst_clear_tag_list(taglist_ptr: PPGstTagList); cdecl; external libgstreamer;

function gst_tag_list_copy(taglist: PGstTagList): PGstTagList; cdecl; external libgstreamer;

function gst_tag_list_replace(old_taglist: PPGstTagList; new_taglist: PGstTagList): Tgboolean; cdecl; external libgstreamer;
function gst_tag_list_take(old_taglist: PPGstTagList; new_taglist: PGstTagList): Tgboolean; cdecl; external libgstreamer;

const
  GST_TAG_TITLE = 'title';
  GST_TAG_TITLE_SORTNAME = 'title-sortname';
  GST_TAG_ARTIST = 'artist';
  GST_TAG_ARTIST_SORTNAME = 'artist-sortname';
  GST_TAG_ALBUM = 'album';
  GST_TAG_ALBUM_SORTNAME = 'album-sortname';
  GST_TAG_ALBUM_ARTIST = 'album-artist';
  GST_TAG_ALBUM_ARTIST_SORTNAME = 'album-artist-sortname';
  GST_TAG_COMPOSER = 'composer';
  GST_TAG_CONDUCTOR = 'conductor';
  GST_TAG_DATE = 'date';
  GST_TAG_DATE_TIME = 'datetime';
  GST_TAG_GENRE = 'genre';
  GST_TAG_COMMENT = 'comment';
  GST_TAG_EXTENDED_COMMENT = 'extended-comment';
  GST_TAG_TRACK_NUMBER = 'track-number';
  GST_TAG_TRACK_COUNT = 'track-count';
  GST_TAG_ALBUM_VOLUME_NUMBER = 'album-disc-number';
  GST_TAG_ALBUM_VOLUME_COUNT = 'album-disc-count';
  GST_TAG_LOCATION = 'location';
  GST_TAG_HOMEPAGE = 'homepage';
  GST_TAG_DESCRIPTION = 'description';
  GST_TAG_VERSION = 'version';
  GST_TAG_ISRC = 'isrc';
  GST_TAG_ORGANIZATION = 'organization';
  GST_TAG_COPYRIGHT = 'copyright';
  GST_TAG_COPYRIGHT_URI = 'copyright-uri';
  GST_TAG_ENCODED_BY = 'encoded-by';
  GST_TAG_CONTACT = 'contact';
  GST_TAG_LICENSE = 'license';
  GST_TAG_LICENSE_URI = 'license-uri';
  GST_TAG_PERFORMER = 'performer';
  GST_TAG_DURATION = 'duration';
  GST_TAG_CODEC = 'codec';
  GST_TAG_VIDEO_CODEC = 'video-codec';
  GST_TAG_AUDIO_CODEC = 'audio-codec';
  GST_TAG_SUBTITLE_CODEC = 'subtitle-codec';
  GST_TAG_CONTAINER_FORMAT = 'container-format';
  GST_TAG_BITRATE = 'bitrate';
  GST_TAG_NOMINAL_BITRATE = 'nominal-bitrate';
  GST_TAG_MINIMUM_BITRATE = 'minimum-bitrate';
  GST_TAG_MAXIMUM_BITRATE = 'maximum-bitrate';
  GST_TAG_SERIAL = 'serial';
  GST_TAG_ENCODER = 'encoder';
  GST_TAG_ENCODER_VERSION = 'encoder-version';
  GST_TAG_TRACK_GAIN = 'replaygain-track-gain';
  GST_TAG_TRACK_PEAK = 'replaygain-track-peak';
  GST_TAG_ALBUM_GAIN = 'replaygain-album-gain';
  GST_TAG_ALBUM_PEAK = 'replaygain-album-peak';
  GST_TAG_REFERENCE_LEVEL = 'replaygain-reference-level';
  GST_TAG_LANGUAGE_CODE = 'language-code';
  GST_TAG_LANGUAGE_NAME = 'language-name';
  GST_TAG_IMAGE = 'image';
  GST_TAG_PREVIEW_IMAGE = 'preview-image';
  GST_TAG_ATTACHMENT = 'attachment';
  GST_TAG_BEATS_PER_MINUTE = 'beats-per-minute';
  GST_TAG_KEYWORDS = 'keywords';
  GST_TAG_GEO_LOCATION_NAME = 'geo-location-name';
  GST_TAG_GEO_LOCATION_LATITUDE = 'geo-location-latitude';
  GST_TAG_GEO_LOCATION_LONGITUDE = 'geo-location-longitude';
  GST_TAG_GEO_LOCATION_ELEVATION = 'geo-location-elevation';
  GST_TAG_GEO_LOCATION_COUNTRY = 'geo-location-country';
  GST_TAG_GEO_LOCATION_CITY = 'geo-location-city';
  GST_TAG_GEO_LOCATION_SUBLOCATION = 'geo-location-sublocation';
  GST_TAG_GEO_LOCATION_HORIZONTAL_ERROR = 'geo-location-horizontal-error';
  GST_TAG_GEO_LOCATION_MOVEMENT_SPEED = 'geo-location-movement-speed';
  GST_TAG_GEO_LOCATION_MOVEMENT_DIRECTION = 'geo-location-movement-direction';
  GST_TAG_GEO_LOCATION_CAPTURE_DIRECTION = 'geo-location-capture-direction';
  GST_TAG_SHOW_NAME = 'show-name';
  GST_TAG_SHOW_SORTNAME = 'show-sortname';
  GST_TAG_SHOW_EPISODE_NUMBER = 'show-episode-number';
  GST_TAG_SHOW_SEASON_NUMBER = 'show-season-number';
  GST_TAG_LYRICS = 'lyrics';
  GST_TAG_COMPOSER_SORTNAME = 'composer-sortname';
  GST_TAG_GROUPING = 'grouping';
  GST_TAG_USER_RATING = 'user-rating';
  GST_TAG_DEVICE_MANUFACTURER = 'device-manufacturer';
  GST_TAG_DEVICE_MODEL = 'device-model';
  GST_TAG_APPLICATION_NAME = 'application-name';
  GST_TAG_APPLICATION_DATA = 'application-data';
  GST_TAG_IMAGE_ORIENTATION = 'image-orientation';
  GST_TAG_PUBLISHER = 'publisher';
  GST_TAG_INTERPRETED_BY = 'interpreted-by';
  GST_TAG_MIDI_BASE_NOTE = 'midi-base-note';
  GST_TAG_PRIVATE_DATA = 'private-data';
  GST_TAG_CONTAINER_SPECIFIC_TRACK_ID = 'container-specific-track-id';

function GST_TAG_MODE_IS_VALID(mode: longint): Tgboolean;
function GST_TAG_FLAG_IS_VALID(flag: longint): Tgboolean;
function GST_TAG_LIST(x: Pointer): PGstTagList;
function GST_TYPE_TAG_LIST: TGType;
function GST_IS_TAG_LIST(obj: Pointer): Tgboolean;

function gst_tag_list_is_writable(taglist: PGstTagList): Tgboolean;
function gst_tag_list_make_writable(taglist: PGstTagList): PGstTagList;


// === Konventiert am: 11-9-24 19:34:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TAG_LIST: TGType;
begin
  Result := _gst_tag_list_type;
end;


function GST_TAG_MODE_IS_VALID(mode: longint): Tgboolean;
begin
  Result := (mode > GST_TAG_MERGE_UNDEFINED) and (mode < GST_TAG_MERGE_COUNT);
end;

function GST_TAG_FLAG_IS_VALID(flag: longint): Tgboolean;
begin
  Result := (flag > GST_TAG_FLAG_UNDEFINED) and (flag < GST_TAG_FLAG_COUNT);
end;

function GST_TAG_LIST(x: Pointer): PGstTagList;
begin
  GST_TAG_LIST := PGstTagList(x);
end;

function GST_IS_TAG_LIST(obj: Pointer): Tgboolean;
begin
  GST_IS_TAG_LIST := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_TAG_LIST);
end;

function gst_tag_list_is_writable(taglist: PGstTagList): Tgboolean;
begin
  gst_tag_list_is_writable := gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(taglist));
end;

function gst_tag_list_make_writable(taglist: PGstTagList): PGstTagList;
begin
  gst_tag_list_make_writable := GST_TAG_LIST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(taglist)));
end;


{$ENDIF read_implementation}
