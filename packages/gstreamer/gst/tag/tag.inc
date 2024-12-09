
{$IFDEF read_interface}


const
  GST_TAG_MUSICBRAINZ_TRACKID = 'musicbrainz-trackid';
  GST_TAG_MUSICBRAINZ_ARTISTID = 'musicbrainz-artistid';
  GST_TAG_MUSICBRAINZ_ALBUMID = 'musicbrainz-albumid';
  GST_TAG_MUSICBRAINZ_ALBUMARTISTID = 'musicbrainz-albumartistid';
  GST_TAG_MUSICBRAINZ_RELEASEGROUPID = 'musicbrainz-releasegroupid';
  GST_TAG_MUSICBRAINZ_RELEASETRACKID = 'musicbrainz-releasetrackid';
  GST_TAG_MUSICBRAINZ_TRMID = 'musicbrainz-trmid';
  GST_TAG_ACOUSTID_ID = 'acoustid-id';
  GST_TAG_ACOUSTID_FINGERPRINT = 'chromaprint-fingerprint';
  GST_TAG_CMML_STREAM = 'cmml-stream';
  GST_TAG_CMML_HEAD = 'cmml-head';
  GST_TAG_CMML_CLIP = 'cmml-clip';
  GST_TAG_MUSICAL_KEY = 'musical-key';
  GST_TAG_CDDA_CDDB_DISCID = 'discid';
  GST_TAG_CDDA_CDDB_DISCID_FULL = 'discid-full';
  GST_TAG_CDDA_MUSICBRAINZ_DISCID = 'musicbrainz-discid';
  GST_TAG_CDDA_MUSICBRAINZ_DISCID_FULL = 'musicbrainz-discid-full';
  GST_TAG_CAPTURING_SHUTTER_SPEED = 'capturing-shutter-speed';
  GST_TAG_CAPTURING_FOCAL_RATIO = 'capturing-focal-ratio';
  GST_TAG_CAPTURING_FOCAL_LENGTH = 'capturing-focal-length';
  GST_TAG_CAPTURING_FOCAL_LENGTH_35_MM = 'capturing-focal-length-35mm';
  GST_TAG_CAPTURING_DIGITAL_ZOOM_RATIO = 'capturing-digital-zoom-ratio';
  GST_TAG_CAPTURING_ISO_SPEED = 'capturing-iso-speed';
  GST_TAG_CAPTURING_EXPOSURE_PROGRAM = 'capturing-exposure-program';
  GST_TAG_CAPTURING_EXPOSURE_MODE = 'capturing-exposure-mode';
  GST_TAG_CAPTURING_EXPOSURE_COMPENSATION = 'capturing-exposure-compensation';
  GST_TAG_CAPTURING_SCENE_CAPTURE_TYPE = 'capturing-scene-capture-type';
  GST_TAG_CAPTURING_GAIN_ADJUSTMENT = 'capturing-gain-adjustment';
  GST_TAG_CAPTURING_WHITE_BALANCE = 'capturing-white-balance';
  GST_TAG_CAPTURING_CONTRAST = 'capturing-contrast';
  GST_TAG_CAPTURING_SATURATION = 'capturing-saturation';
  GST_TAG_CAPTURING_SHARPNESS = 'capturing-sharpness';
  GST_TAG_CAPTURING_FLASH_FIRED = 'capturing-flash-fired';
  GST_TAG_CAPTURING_FLASH_MODE = 'capturing-flash-mode';
  GST_TAG_CAPTURING_METERING_MODE = 'capturing-metering-mode';
  GST_TAG_CAPTURING_SOURCE = 'capturing-source';
  GST_TAG_IMAGE_HORIZONTAL_PPI = 'image-horizontal-ppi';
  GST_TAG_IMAGE_VERTICAL_PPI = 'image-vertical-ppi';

type
  PGstTagImageType = ^TGstTagImageType;
  TGstTagImageType = longint;

const
  GST_TAG_IMAGE_TYPE_NONE = -(1);
  GST_TAG_IMAGE_TYPE_UNDEFINED = 0;
  GST_TAG_IMAGE_TYPE_FRONT_COVER = 1;
  GST_TAG_IMAGE_TYPE_BACK_COVER = 2;
  GST_TAG_IMAGE_TYPE_LEAFLET_PAGE = 3;
  GST_TAG_IMAGE_TYPE_MEDIUM = 4;
  GST_TAG_IMAGE_TYPE_LEAD_ARTIST = 5;
  GST_TAG_IMAGE_TYPE_ARTIST = 6;
  GST_TAG_IMAGE_TYPE_CONDUCTOR = 7;
  GST_TAG_IMAGE_TYPE_BAND_ORCHESTRA = 8;
  GST_TAG_IMAGE_TYPE_COMPOSER = 9;
  GST_TAG_IMAGE_TYPE_LYRICIST = 10;
  GST_TAG_IMAGE_TYPE_RECORDING_LOCATION = 11;
  GST_TAG_IMAGE_TYPE_DURING_RECORDING = 12;
  GST_TAG_IMAGE_TYPE_DURING_PERFORMANCE = 13;
  GST_TAG_IMAGE_TYPE_VIDEO_CAPTURE = 14;
  GST_TAG_IMAGE_TYPE_FISH = 15;
  GST_TAG_IMAGE_TYPE_ILLUSTRATION = 16;
  GST_TAG_IMAGE_TYPE_BAND_ARTIST_LOGO = 17;
  GST_TAG_IMAGE_TYPE_PUBLISHER_STUDIO_LOGO = 18;

const
  GST_TAG_ID3V2_HEADER_SIZE = 10;

function gst_tag_from_vorbis_tag(vorbis_tag: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_to_vorbis_tag(gst_tag: Pgchar): Pgchar; cdecl; external libgsttag;
procedure gst_vorbis_tag_add(list: PGstTagList; tag: Pgchar; Value: Pgchar); cdecl; external libgsttag;
function gst_tag_to_vorbis_comments(list: PGstTagList; tag: Pgchar): PGList; cdecl; external libgsttag;
function gst_tag_list_from_vorbiscomment(Data: Pguint8; size: Tgsize; id_data: Pguint8; id_data_length: Tguint; vendor_string: PPgchar): PGstTagList; cdecl; external libgsttag;
function gst_tag_list_from_vorbiscomment_buffer(buffer: PGstBuffer; id_data: Pguint8; id_data_length: Tguint; vendor_string: PPgchar): PGstTagList; cdecl; external libgsttag;
function gst_tag_list_to_vorbiscomment_buffer(list: PGstTagList; id_data: Pguint8; id_data_length: Tguint; vendor_string: Pgchar): PGstBuffer; cdecl; external libgsttag;
function gst_tag_id3_genre_count: Tguint; cdecl; external libgsttag;
function gst_tag_id3_genre_get(id: Tguint): Pgchar; cdecl; external libgsttag;
function gst_tag_list_new_from_id3v1(Data: Pguint8): PGstTagList; cdecl; external libgsttag;
function gst_tag_from_id3_tag(id3_tag: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_from_id3_user_tag(_type: Pgchar; id3_user_tag: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_to_id3_tag(gst_tag: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_list_add_id3_image(tag_list: PGstTagList; image_data: Pguint8; image_data_len: Tguint; id3_picture_type: Tguint): Tgboolean; cdecl; external libgsttag;
function gst_tag_list_from_id3v2_tag(buffer: PGstBuffer): PGstTagList; cdecl; external libgsttag;
function gst_tag_get_id3v2_tag_size(buffer: PGstBuffer): Tguint; cdecl; external libgsttag;
function gst_tag_list_from_xmp_buffer(buffer: PGstBuffer): PGstTagList; cdecl; external libgsttag;
function gst_tag_list_to_xmp_buffer(list: PGstTagList; read_only: Tgboolean; schemas: PPgchar): PGstBuffer; cdecl; external libgsttag;
function gst_tag_xmp_list_schemas: PPgchar; cdecl; external libgsttag;
function gst_tag_list_to_exif_buffer(taglist: PGstTagList; byte_order: Tgint; base_offset: Tguint32): PGstBuffer; cdecl; external libgsttag;
function gst_tag_list_to_exif_buffer_with_tiff_header(taglist: PGstTagList): PGstBuffer; cdecl; external libgsttag;
function gst_tag_list_from_exif_buffer(buffer: PGstBuffer; byte_order: Tgint; base_offset: Tguint32): PGstTagList; cdecl; external libgsttag;
function gst_tag_list_from_exif_buffer_with_tiff_header(buffer: PGstBuffer): PGstTagList; cdecl; external libgsttag;
function gst_tag_parse_extended_comment(ext_comment: Pgchar; key: PPgchar; lang: PPgchar; Value: PPgchar; fail_if_no_key: Tgboolean): Tgboolean; cdecl; external libgsttag;
function gst_tag_freeform_string_to_utf8(Data: Pgchar; size: Tgint; env_vars: PPgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_image_data_to_image_sample(image_data: Pguint8; image_data_len: Tguint; image_type: TGstTagImageType): PGstSample; cdecl; external libgsttag;
procedure gst_tag_register_musicbrainz_tags; cdecl; external libgsttag;
function gst_tag_get_language_codes: PPgchar; cdecl; external libgsttag;
function gst_tag_get_language_name(language_code: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_get_language_code_iso_639_1(lang_code: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_get_language_code_iso_639_2B(lang_code: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_get_language_code_iso_639_2T(lang_code: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_check_language_code(lang_code: Pgchar): Tgboolean; cdecl; external libgsttag;

type
  PGstTagLicenseFlags = ^TGstTagLicenseFlags;
  TGstTagLicenseFlags = longint;

const
  GST_TAG_LICENSE_PERMITS_REPRODUCTION = 1 shl 0;
  GST_TAG_LICENSE_PERMITS_DISTRIBUTION = 1 shl 1;
  GST_TAG_LICENSE_PERMITS_DERIVATIVE_WORKS = 1 shl 2;
  GST_TAG_LICENSE_PERMITS_SHARING = 1 shl 3;
  GST_TAG_LICENSE_REQUIRES_NOTICE = 1 shl 8;
  GST_TAG_LICENSE_REQUIRES_ATTRIBUTION = 1 shl 9;
  GST_TAG_LICENSE_REQUIRES_SHARE_ALIKE = 1 shl 10;
  GST_TAG_LICENSE_REQUIRES_SOURCE_CODE = 1 shl 11;
  GST_TAG_LICENSE_REQUIRES_COPYLEFT = 1 shl 12;
  GST_TAG_LICENSE_REQUIRES_LESSER_COPYLEFT = 1 shl 13;
  GST_TAG_LICENSE_PROHIBITS_COMMERCIAL_USE = 1 shl 16;
  GST_TAG_LICENSE_PROHIBITS_HIGH_INCOME_NATION_USE = 1 shl 17;
  GST_TAG_LICENSE_CREATIVE_COMMONS_LICENSE = 1 shl 24;
  GST_TAG_LICENSE_FREE_SOFTWARE_FOUNDATION_LICENSE = 1 shl 25;

function gst_tag_get_licenses: PPgchar; cdecl; external libgsttag;
function gst_tag_get_license_flags(license_ref: Pgchar): TGstTagLicenseFlags; cdecl; external libgsttag;
function gst_tag_get_license_nick(license_ref: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_get_license_title(license_ref: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_get_license_version(license_ref: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_get_license_description(license_ref: Pgchar): Pgchar; cdecl; external libgsttag;
function gst_tag_get_license_jurisdiction(license_ref: Pgchar): Pgchar; cdecl; external libgsttag;

function gst_tag_get_language_code(lang_code: Pgchar): Pgchar;

// === Konventiert am: 6-10-24 19:21:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function gst_tag_get_language_code(lang_code: Pgchar): Pgchar;
begin
  gst_tag_get_language_code := gst_tag_get_language_code_iso_639_1(lang_code);
end;


{$ENDIF read_implementation}
