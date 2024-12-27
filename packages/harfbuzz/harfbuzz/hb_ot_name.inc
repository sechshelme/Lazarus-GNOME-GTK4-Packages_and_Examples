{$IFDEF read_interface}

type
  Phb_ot_name_id_predefined_t = ^Thb_ot_name_id_predefined_t;
  Thb_ot_name_id_predefined_t = longint;

const
  HB_OT_NAME_ID_COPYRIGHT = 0;
  HB_OT_NAME_ID_FONT_FAMILY = 1;
  HB_OT_NAME_ID_FONT_SUBFAMILY = 2;
  HB_OT_NAME_ID_UNIQUE_ID = 3;
  HB_OT_NAME_ID_FULL_NAME = 4;
  HB_OT_NAME_ID_VERSION_STRING = 5;
  HB_OT_NAME_ID_POSTSCRIPT_NAME = 6;
  HB_OT_NAME_ID_TRADEMARK = 7;
  HB_OT_NAME_ID_MANUFACTURER = 8;
  HB_OT_NAME_ID_DESIGNER = 9;
  HB_OT_NAME_ID_DESCRIPTION = 10;
  HB_OT_NAME_ID_VENDOR_URL = 11;
  HB_OT_NAME_ID_DESIGNER_URL = 12;
  HB_OT_NAME_ID_LICENSE = 13;
  HB_OT_NAME_ID_LICENSE_URL = 14;
  HB_OT_NAME_ID_TYPOGRAPHIC_FAMILY = 16;
  HB_OT_NAME_ID_TYPOGRAPHIC_SUBFAMILY = 17;
  HB_OT_NAME_ID_MAC_FULL_NAME = 18;
  HB_OT_NAME_ID_SAMPLE_TEXT = 19;
  HB_OT_NAME_ID_CID_FINDFONT_NAME = 20;
  HB_OT_NAME_ID_WWS_FAMILY = 21;
  HB_OT_NAME_ID_WWS_SUBFAMILY = 22;
  HB_OT_NAME_ID_LIGHT_BACKGROUND = 23;
  HB_OT_NAME_ID_DARK_BACKGROUND = 24;
  HB_OT_NAME_ID_VARIATIONS_PS_PREFIX = 25;
  HB_OT_NAME_ID_INVALID = $FFFF;

type
  Phb_ot_name_id_t = ^Thb_ot_name_id_t;
  Thb_ot_name_id_t = dword;

  Thb_ot_name_entry_t = record
    name_id: Thb_ot_name_id_t;
    var_: Thb_var_int_t;
    language: Thb_language_t;
  end;
  Phb_ot_name_entry_t = ^Thb_ot_name_entry_t;

function hb_ot_name_list_names(face: Phb_face_t; num_entries: Pdword): Phb_ot_name_entry_t; cdecl; external libharfbuzz;
function hb_ot_name_get_utf8(face: Phb_face_t; name_id: Thb_ot_name_id_t; language: Thb_language_t; text_size: Pdword; Text: pchar): dword; cdecl; external libharfbuzz;
function hb_ot_name_get_utf16(face: Phb_face_t; name_id: Thb_ot_name_id_t; language: Thb_language_t; text_size: Pdword; Text: Puint16_t): dword; cdecl; external libharfbuzz;
function hb_ot_name_get_utf32(face: Phb_face_t; name_id: Thb_ot_name_id_t; language: Thb_language_t; text_size: Pdword; Text: Puint32_t): dword; cdecl; external libharfbuzz;

// === Konventiert am: 26-12-24 16:55:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
