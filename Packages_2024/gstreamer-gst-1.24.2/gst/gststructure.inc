
{$IFDEF read_interface}

var
  _gst_structure_type: TGType; cvar;external libgstreamer;

type
  typePGstSerializeFlags = ^TGstSerializeFlags;
  TGstSerializeFlags = longint;

const
  GST_SERIALIZE_FLAG_NONE = 0;
  GST_SERIALIZE_FLAG_BACKWARD_COMPAT = 1 shl 0;
  GST_SERIALIZE_FLAG_STRICT = 1 shl 1;

type
  TGstStructureForeachFunc = function(field_id: TGQuark; Value: PGValue; user_data: Tgpointer): Tgboolean; cdecl;
  TGstStructureMapFunc = function(field_id: TGQuark; Value: PGValue; user_data: Tgpointer): Tgboolean; cdecl;
  TGstStructureFilterMapFunc = function(field_id: TGQuark; Value: PGValue; user_data: Tgpointer): Tgboolean; cdecl;

  TGstStructure = record
    _type: TGType;
    Name: TGQuark;
  end;
  PGstStructure = ^TGstStructure;
  PPGstStructure = ^PGstStructure;

function gst_structure_get_type: TGType; cdecl; external libgstreamer;
function gst_structure_new_empty(Name: Pgchar): PGstStructure; cdecl; external libgstreamer;
function gst_structure_new_id_empty(quark: TGQuark): PGstStructure; cdecl; external libgstreamer;
function gst_structure_new(Name: Pgchar; firstfield: Pgchar): PGstStructure; varargs cdecl; external libgstreamer;
function gst_structure_new_valist(Name: Pgchar; firstfield: Pgchar; varargs: Tva_list): PGstStructure; cdecl; external libgstreamer;
function gst_structure_new_id(name_quark: TGQuark; field_quark: TGQuark): PGstStructure; varargs cdecl; external libgstreamer;
function gst_structure_new_from_string(_string: Pgchar): PGstStructure; cdecl; external libgstreamer;
function gst_structure_copy(structure: PGstStructure): PGstStructure; cdecl; external libgstreamer;
function gst_structure_set_parent_refcount(structure: PGstStructure; refcount: Pgint): Tgboolean; cdecl; external libgstreamer;
procedure gst_structure_free(structure: PGstStructure); cdecl; external libgstreamer;
procedure gst_clear_structure(structure_ptr: PPGstStructure); cdecl; external libgstreamer;

function gst_structure_take(oldstr_ptr: PPGstStructure; newstr: PGstStructure): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_name(structure: PGstStructure): Pgchar; cdecl; external libgstreamer;
function gst_structure_get_name_id(structure: PGstStructure): TGQuark; cdecl; external libgstreamer;
function gst_structure_has_name(structure: PGstStructure; Name: Pgchar): Tgboolean; cdecl; external libgstreamer;
procedure gst_structure_set_name(structure: PGstStructure; Name: Pgchar); cdecl; external libgstreamer;
procedure gst_structure_id_set_value(structure: PGstStructure; field: TGQuark; Value: PGValue); cdecl; external libgstreamer;
procedure gst_structure_set_value(structure: PGstStructure; fieldname: Pgchar; Value: PGValue); cdecl; external libgstreamer;
procedure gst_structure_set_array(structure: PGstStructure; fieldname: Pgchar; arr: PGValueArray); cdecl; external libgstreamer;
procedure gst_structure_set_list(structure: PGstStructure; fieldname: Pgchar; arr: PGValueArray); cdecl; external libgstreamer;
procedure gst_structure_id_take_value(structure: PGstStructure; field: TGQuark; Value: PGValue); cdecl; external libgstreamer;
procedure gst_structure_take_value(structure: PGstStructure; fieldname: Pgchar; Value: PGValue); cdecl; external libgstreamer;
procedure gst_structure_set(structure: PGstStructure; fieldname: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_structure_set_valist(structure: PGstStructure; fieldname: Pgchar; varargs: Tva_list); cdecl; external libgstreamer;
procedure gst_structure_id_set(structure: PGstStructure; fieldname: TGQuark); varargs cdecl; external libgstreamer;
procedure gst_structure_id_set_valist(structure: PGstStructure; fieldname: TGQuark; varargs: Tva_list); cdecl; external libgstreamer;
function gst_structure_get_valist(structure: PGstStructure; first_fieldname: PChar; args: Tva_list): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get(structure: PGstStructure; first_fieldname: PChar): Tgboolean; varargs cdecl; external libgstreamer;
function gst_structure_id_get_valist(structure: PGstStructure; first_field_id: TGQuark; args: Tva_list): Tgboolean; cdecl; external libgstreamer;
function gst_structure_id_get(structure: PGstStructure; first_field_id: TGQuark): Tgboolean; varargs cdecl; external libgstreamer;
function gst_structure_id_get_value(structure: PGstStructure; field: TGQuark): PGValue; cdecl; external libgstreamer;
function gst_structure_get_value(structure: PGstStructure; fieldname: Pgchar): PGValue; cdecl; external libgstreamer;
procedure gst_structure_remove_field(structure: PGstStructure; fieldname: Pgchar); cdecl; external libgstreamer;
procedure gst_structure_remove_fields(structure: PGstStructure; fieldname: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_structure_remove_fields_valist(structure: PGstStructure; fieldname: Pgchar; varargs: Tva_list); cdecl; external libgstreamer;
procedure gst_structure_remove_all_fields(structure: PGstStructure); cdecl; external libgstreamer;
function gst_structure_get_field_type(structure: PGstStructure; fieldname: Pgchar): TGType; cdecl; external libgstreamer;
function gst_structure_foreach(structure: PGstStructure; func: TGstStructureForeachFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_structure_map_in_place(structure: PGstStructure; func: TGstStructureMapFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgstreamer;
procedure gst_structure_filter_and_map_in_place(structure: PGstStructure; func: TGstStructureFilterMapFunc; user_data: Tgpointer); cdecl; external libgstreamer;
function gst_structure_n_fields(structure: PGstStructure): Tgint; cdecl; external libgstreamer;
function gst_structure_nth_field_name(structure: PGstStructure; index: Tguint): Pgchar; cdecl; external libgstreamer;
function gst_structure_id_has_field(structure: PGstStructure; field: TGQuark): Tgboolean; cdecl; external libgstreamer;
function gst_structure_id_has_field_typed(structure: PGstStructure; field: TGQuark; _type: TGType): Tgboolean; cdecl; external libgstreamer;
function gst_structure_has_field(structure: PGstStructure; fieldname: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_structure_has_field_typed(structure: PGstStructure; fieldname: Pgchar; _type: TGType): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_boolean(structure: PGstStructure; fieldname: Pgchar; Value: Pgboolean): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_int(structure: PGstStructure; fieldname: Pgchar; Value: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_uint(structure: PGstStructure; fieldname: Pgchar; Value: Pguint): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_int64(structure: PGstStructure; fieldname: Pgchar; Value: Pgint64): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_uint64(structure: PGstStructure; fieldname: Pgchar; Value: Pguint64): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_double(structure: PGstStructure; fieldname: Pgchar; Value: Pgdouble): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_date(structure: PGstStructure; fieldname: Pgchar; Value: PPGDate): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_date_time(structure: PGstStructure; fieldname: Pgchar; Value: PPGstDateTime): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_clock_time(structure: PGstStructure; fieldname: Pgchar; Value: PGstClockTime): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_string(structure: PGstStructure; fieldname: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_structure_get_enum(structure: PGstStructure; fieldname: Pgchar; enumtype: TGType; Value: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_fraction(structure: PGstStructure; fieldname: Pgchar; value_numerator: Pgint; value_denominator: Pgint): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_flagset(structure: PGstStructure; fieldname: Pgchar; value_flags: Pguint; value_mask: Pguint): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_array(structure: PGstStructure; fieldname: Pgchar; arr: PPGValueArray): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_list(structure: PGstStructure; fieldname: Pgchar; arr: PPGValueArray): Tgboolean; cdecl; external libgstreamer;
function gst_structure_get_flags(structure: PGstStructure; fieldname: Pgchar; flags_type: TGType; Value: Pguint): Tgboolean; cdecl; external libgstreamer;
function gst_structure_to_string(structure: PGstStructure): Pgchar; cdecl; external libgstreamer;
function gst_structure_serialize(structure: PGstStructure; flags: TGstSerializeFlags): Pgchar; cdecl; external libgstreamer; deprecated 'GST_DEPRECATED_FOR(gst_structure_serialize_full)';
function gst_structure_serialize_full(structure: PGstStructure; flags: TGstSerializeFlags): Pgchar; cdecl; external libgstreamer;
function gst_structure_from_string(_string: Pgchar; end_: PPgchar): PGstStructure; cdecl; external libgstreamer;
function gst_structure_fixate_field_nearest_int(structure: PGstStructure; field_name: PChar; target: longint): Tgboolean; cdecl; external libgstreamer;
function gst_structure_fixate_field_nearest_double(structure: PGstStructure; field_name: PChar; target: double): Tgboolean; cdecl; external libgstreamer;
function gst_structure_fixate_field_boolean(structure: PGstStructure; field_name: PChar; target: Tgboolean): Tgboolean; cdecl; external libgstreamer;
function gst_structure_fixate_field_string(structure: PGstStructure; field_name: PChar; target: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_structure_fixate_field_nearest_fraction(structure: PGstStructure; field_name: PChar; target_numerator: Tgint; target_denominator: Tgint): Tgboolean; cdecl; external libgstreamer;
function gst_structure_fixate_field(structure: PGstStructure; field_name: PChar): Tgboolean; cdecl; external libgstreamer;
procedure gst_structure_fixate(structure: PGstStructure); cdecl; external libgstreamer;
function gst_structure_is_equal(structure1: PGstStructure; structure2: PGstStructure): Tgboolean; cdecl; external libgstreamer;
function gst_structure_is_subset(subset: PGstStructure; superset: PGstStructure): Tgboolean; cdecl; external libgstreamer;
function gst_structure_can_intersect(struct1: PGstStructure; struct2: PGstStructure): Tgboolean; cdecl; external libgstreamer;
function gst_structure_intersect(struct1: PGstStructure; struct2: PGstStructure): PGstStructure; cdecl; external libgstreamer;


procedure gst_clear_structure(structure_ptr: Pgpointer);

function GST_TYPE_STRUCTURE: TGType;
function GST_STRUCTURE(obj: Pointer): PGstStructure;
function GST_IS_STRUCTURE(obj: Pointer): Tgboolean;
function GST_STRUCTURE_CAST(obj: Pointer): PGstStructure;


// === Konventiert am: 11-9-24 16:26:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure gst_clear_structure(structure_ptr: Pgpointer);
begin
  g_clear_pointer(structure_ptr, TGDestroyNotify(@gst_structure_free));
end;

function GST_TYPE_STRUCTURE: TGType;
begin
  Result := _gst_structure_type;
end;

function GST_STRUCTURE(obj: Pointer): PGstStructure;
begin
  GST_STRUCTURE := GST_STRUCTURE_CAST(obj);
end;

function GST_IS_STRUCTURE(obj: Pointer): Tgboolean;
begin
  // #define GST_IS_STRUCTURE(object)       ((object) && (GST_STRUCTURE(object)->type == GST_TYPE_STRUCTURE))
  Result := g_type_check_instance_is_a(obj, GST_TYPE_STRUCTURE);
end;

function GST_STRUCTURE_CAST(obj: Pointer): PGstStructure;
begin
  GST_STRUCTURE_CAST := PGstStructure(obj);
end;


{$ENDIF read_implementation}
