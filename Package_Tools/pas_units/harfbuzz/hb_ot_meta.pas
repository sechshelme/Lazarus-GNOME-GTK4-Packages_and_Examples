unit hb_ot_meta;

interface

uses
  fp_glib2, hb_common, hb_blob;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Phb_ot_meta_tag_t = ^Thb_ot_meta_tag_t;
  Thb_ot_meta_tag_t = longint;

const
  HB_OT_META_TAG_DESIGN_LANGUAGES = (Ord('d') shl 24) or (Ord('l') shl 16) or (Ord('n') shl 8) or Ord('g');
  HB_OT_META_TAG_SUPPORTED_LANGUAGES = (Ord('s') shl 24) or (Ord('l') shl 16) or (Ord('n') shl 8) or Ord('g');
  _HB_OT_META_TAG_MAX_VALUE = HB_TAG_MAX_SIGNED;

function hb_ot_meta_get_entry_tags(face: Phb_face_t; start_offset: dword; entries_count: Pdword; entries: Phb_ot_meta_tag_t): dword; cdecl; external libharfbuzz;
function hb_ot_meta_reference_entry(face: Phb_face_t; meta_tag: Thb_ot_meta_tag_t): Phb_blob_t; cdecl; external libharfbuzz;

// === Konventiert am: 27-12-24 15:19:08 ===


implementation



end.
