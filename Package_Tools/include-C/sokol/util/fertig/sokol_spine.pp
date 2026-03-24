
unit sokol_spine;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_spine.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_spine.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Psspine_allocator  = ^sspine_allocator;
Psspine_anim  = ^sspine_anim;
Psspine_anim_info  = ^sspine_anim_info;
Psspine_atlas  = ^sspine_atlas;
Psspine_atlas_desc  = ^sspine_atlas_desc;
Psspine_atlas_overrides  = ^sspine_atlas_overrides;
Psspine_atlas_page  = ^sspine_atlas_page;
Psspine_atlas_page_info  = ^sspine_atlas_page_info;
Psspine_bone  = ^sspine_bone;
Psspine_bone_info  = ^sspine_bone_info;
Psspine_bone_transform  = ^sspine_bone_transform;
Psspine_color  = ^sspine_color;
Psspine_context  = ^sspine_context;
Psspine_context_desc  = ^sspine_context_desc;
Psspine_context_info  = ^sspine_context_info;
Psspine_desc  = ^sspine_desc;
Psspine_event  = ^sspine_event;
Psspine_event_info  = ^sspine_event_info;
Psspine_iktarget  = ^sspine_iktarget;
Psspine_iktarget_info  = ^sspine_iktarget_info;
Psspine_image  = ^sspine_image;
Psspine_image_info  = ^sspine_image_info;
Psspine_instance  = ^sspine_instance;
Psspine_instance_desc  = ^sspine_instance_desc;
Psspine_layer_transform  = ^sspine_layer_transform;
Psspine_logger  = ^sspine_logger;
Psspine_mat4  = ^sspine_mat4;
Psspine_range  = ^sspine_range;
Psspine_resource_state  = ^sspine_resource_state;
Psspine_skeleton  = ^sspine_skeleton;
Psspine_skeleton_desc  = ^sspine_skeleton_desc;
Psspine_skin  = ^sspine_skin;
Psspine_skin_info  = ^sspine_skin_info;
Psspine_skinset  = ^sspine_skinset;
Psspine_skinset_desc  = ^sspine_skinset_desc;
Psspine_slot  = ^sspine_slot;
Psspine_slot_info  = ^sspine_slot_info;
Psspine_string  = ^sspine_string;
Psspine_triggered_event_info  = ^sspine_triggered_event_info;
Psspine_vec2  = ^sspine_vec2;
Pxxxx  = ^xxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ see sspine_string struct }
type
  Txxxx =  Longint;
  Const
    SSPINE_INVALID_ID = 0;
    SSPINE_MAX_SKINSET_SKINS = 32;
    SSPINE_MAX_STRING_SIZE = 61;

type
  Psspine_context = ^Tsspine_context;
  Tsspine_context = record
      id : Tuint32_t;
    end;

  Psspine_atlas = ^Tsspine_atlas;
  Tsspine_atlas = record
      id : Tuint32_t;
    end;

  Psspine_skeleton = ^Tsspine_skeleton;
  Tsspine_skeleton = record
      id : Tuint32_t;
    end;

  Psspine_instance = ^Tsspine_instance;
  Tsspine_instance = record
      id : Tuint32_t;
    end;

  Psspine_skinset = ^Tsspine_skinset;
  Tsspine_skinset = record
      id : Tuint32_t;
    end;

  Psspine_image = ^Tsspine_image;
  Tsspine_image = record
      atlas_id : Tuint32_t;
      index : longint;
    end;

  Psspine_atlas_page = ^Tsspine_atlas_page;
  Tsspine_atlas_page = record
      atlas_id : Tuint32_t;
      index : longint;
    end;

  Psspine_anim = ^Tsspine_anim;
  Tsspine_anim = record
      skeleton_id : Tuint32_t;
      index : longint;
    end;

  Psspine_bone = ^Tsspine_bone;
  Tsspine_bone = record
      skeleton_id : Tuint32_t;
      index : longint;
    end;

  Psspine_slot = ^Tsspine_slot;
  Tsspine_slot = record
      skeleton_id : Tuint32_t;
      index : longint;
    end;

  Psspine_event = ^Tsspine_event;
  Tsspine_event = record
      skeleton_id : Tuint32_t;
      index : longint;
    end;

  Psspine_iktarget = ^Tsspine_iktarget;
  Tsspine_iktarget = record
      skeleton_id : Tuint32_t;
      index : longint;
    end;

  Psspine_skin = ^Tsspine_skin;
  Tsspine_skin = record
      skeleton_id : Tuint32_t;
      index : longint;
    end;
(* Const before type ignored *)

  Psspine_range = ^Tsspine_range;
  Tsspine_range = record
      ptr : pointer;
      size : Tsize_t;
    end;

  Psspine_vec2 = ^Tsspine_vec2;
  Tsspine_vec2 = record
      x : single;
      y : single;
    end;

  Psspine_mat4 = ^Tsspine_mat4;
  Tsspine_mat4 = record
      m : array[0..15] of single;
    end;

  Psspine_color = ^Tsspine_color;
  Tsspine_color = Tsg_color;

  Psspine_string = ^Tsspine_string;
  Tsspine_string = record
      valid : Tbool;
      truncated : Tbool;
      len : Tuint8_t;
      cstr : array[0..(SSPINE_MAX_STRING_SIZE)-1] of char;
    end;

  Psspine_resource_state = ^Tsspine_resource_state;
  Tsspine_resource_state =  Longint;
  Const
    SSPINE_RESOURCESTATE_INITIAL = 0;
    SSPINE_RESOURCESTATE_ALLOC = 1;
    SSPINE_RESOURCESTATE_VALID = 2;
    SSPINE_RESOURCESTATE_FAILED = 3;
    SSPINE_RESOURCESTATE_INVALID = 4;
    _SSPINE_RESOURCESTATE_FORCE_U32 = $7FFFFFFF;
;
type
  Psspine_layer_transform = ^Tsspine_layer_transform;
  Tsspine_layer_transform = record
      size : Tsspine_vec2;
      origin : Tsspine_vec2;
    end;
{ in degrees }
{ in degrees }

  Psspine_bone_transform = ^Tsspine_bone_transform;
  Tsspine_bone_transform = record
      position : Tsspine_vec2;
      rotation : single;
      scale : Tsspine_vec2;
      shear : Tsspine_vec2;
    end;

  Psspine_context_desc = ^Tsspine_context_desc;
  Tsspine_context_desc = record
      max_vertices : longint;
      max_commands : longint;
      color_format : Tsg_pixel_format;
      depth_format : Tsg_pixel_format;
      sample_count : longint;
      color_write_mask : Tsg_color_mask;
    end;
{ current number of vertices }
{ current number of indices }
{ current number of commands }

  Psspine_context_info = ^Tsspine_context_info;
  Tsspine_context_info = record
      num_vertices : longint;
      num_indices : longint;
      num_commands : longint;
    end;

  Psspine_image_info = ^Tsspine_image_info;
  Tsspine_image_info = record
      valid : Tbool;
      sgimage : Tsg_image;
      sgview : Tsg_view;
      sgsampler : Tsg_sampler;
      min_filter : Tsg_filter;
      mag_filter : Tsg_filter;
      mipmap_filter : Tsg_filter;
      wrap_u : Tsg_wrap;
      wrap_v : Tsg_wrap;
      width : longint;
      height : longint;
      premul_alpha : Tbool;
      filename : Tsspine_string;
    end;

  Psspine_atlas_overrides = ^Tsspine_atlas_overrides;
  Tsspine_atlas_overrides = record
      min_filter : Tsg_filter;
      mag_filter : Tsg_filter;
      mipmap_filter : Tsg_filter;
      wrap_u : Tsg_wrap;
      wrap_v : Tsg_wrap;
      premul_alpha_enabled : Tbool;
      premul_alpha_disabled : Tbool;
    end;

  Psspine_atlas_desc = ^Tsspine_atlas_desc;
  Tsspine_atlas_desc = record
      data : Tsspine_range;
      override : Tsspine_atlas_overrides;
    end;

  Psspine_atlas_page_info = ^Tsspine_atlas_page_info;
  Tsspine_atlas_page_info = record
      valid : Tbool;
      atlas : Tsspine_atlas;
      image : Tsspine_image_info;
      overrides : Tsspine_atlas_overrides;
    end;
(* Const before type ignored *)

  Psspine_skeleton_desc = ^Tsspine_skeleton_desc;
  Tsspine_skeleton_desc = record
      atlas : Tsspine_atlas;
      prescale : single;
      anim_default_mix : single;
      json_data : Pchar;
      binary_data : Tsspine_range;
    end;

  Psspine_skinset_desc = ^Tsspine_skinset_desc;
  Tsspine_skinset_desc = record
      skeleton : Tsspine_skeleton;
      skins : array[0..(SSPINE_MAX_SKINSET_SKINS)-1] of Tsspine_skin;
    end;

  Psspine_anim_info = ^Tsspine_anim_info;
  Tsspine_anim_info = record
      valid : Tbool;
      index : longint;
      duration : single;
      name : Tsspine_string;
    end;

  Psspine_bone_info = ^Tsspine_bone_info;
  Tsspine_bone_info = record
      valid : Tbool;
      index : longint;
      parent_bone : Tsspine_bone;
      length : single;
      pose : Tsspine_bone_transform;
      color : Tsspine_color;
      name : Tsspine_string;
    end;

  Psspine_slot_info = ^Tsspine_slot_info;
  Tsspine_slot_info = record
      valid : Tbool;
      index : longint;
      bone : Tsspine_bone;
      color : Tsspine_color;
      attachment_name : Tsspine_string;
      name : Tsspine_string;
    end;

  Psspine_iktarget_info = ^Tsspine_iktarget_info;
  Tsspine_iktarget_info = record
      valid : Tbool;
      index : longint;
      target_bone : Tsspine_bone;
      name : Tsspine_string;
    end;

  Psspine_skin_info = ^Tsspine_skin_info;
  Tsspine_skin_info = record
      valid : Tbool;
      index : longint;
      name : Tsspine_string;
    end;

  Psspine_event_info = ^Tsspine_event_info;
  Tsspine_event_info = record
      valid : Tbool;
      index : longint;
      int_value : longint;
      float_value : single;
      volume : single;
      balance : single;
      name : Tsspine_string;
      string_value : Tsspine_string;
      audio_path : Tsspine_string;
    end;

  Psspine_triggered_event_info = ^Tsspine_triggered_event_info;
  Tsspine_triggered_event_info = record
      valid : Tbool;
      event : Tsspine_event;
      time : single;
      int_value : longint;
      float_value : single;
      volume : single;
      balance : single;
      string_value : Tsspine_string;
    end;

  Psspine_instance_desc = ^Tsspine_instance_desc;
  Tsspine_instance_desc = record
      skeleton : Tsspine_skeleton;
    end;

  Psspine_allocator = ^Tsspine_allocator;
  Tsspine_allocator = record
      alloc_fn : function (size:Tsize_t; user_data:pointer):pointer;cdecl;
      free_fn : procedure (ptr:pointer; user_data:pointer);cdecl;
      user_data : pointer;
    end;
(* Const before type ignored *)
{ always "sspine" }
{ 0=panic, 1=error, 2=warning, 3=info }
{ SSPINE_LOGITEM_* }
(* Const before type ignored *)
{ a message string, may be nullptr in release mode }
{ line number in sokol_spine.h }
(* Const before type ignored *)
{ the source filename, may be nullptr in release mode }

  Psspine_logger = ^Tsspine_logger;
  Tsspine_logger = record
      func : procedure (tag:Pchar; log_level:Tuint32_t; log_item_id:Tuint32_t; message_or_null:Pchar; line_nr:Tuint32_t; 
                    filename_or_null:Pchar; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{ optional allocation override functions (default: malloc/free) }
{ optional logging function (default: NO LOGGING!) }

  Psspine_desc = ^Tsspine_desc;
  Tsspine_desc = record
      max_vertices : longint;
      max_commands : longint;
      context_pool_size : longint;
      atlas_pool_size : longint;
      skeleton_pool_size : longint;
      skinset_pool_size : longint;
      instance_pool_size : longint;
      color_format : Tsg_pixel_format;
      depth_format : Tsg_pixel_format;
      sample_count : longint;
      color_write_mask : Tsg_color_mask;
      allocator : Tsspine_allocator;
      logger : Tsspine_logger;
    end;
{ setup/shutdown }
(* Const before type ignored *)

procedure sspine_setup(desc:Psspine_desc);cdecl;external;
procedure sspine_shutdown;cdecl;external;
{ context functions }
(* Const before type ignored *)
function sspine_make_context(desc:Psspine_context_desc):Tsspine_context;cdecl;external;
procedure sspine_destroy_context(ctx:Tsspine_context);cdecl;external;
procedure sspine_set_context(ctx:Tsspine_context);cdecl;external;
function sspine_get_context:Tsspine_context;cdecl;external;
function sspine_default_context:Tsspine_context;cdecl;external;
function sspine_get_context_info(ctx:Tsspine_context):Tsspine_context_info;cdecl;external;
{ create and destroy spine objects }
(* Const before type ignored *)
function sspine_make_atlas(desc:Psspine_atlas_desc):Tsspine_atlas;cdecl;external;
(* Const before type ignored *)
function sspine_make_skeleton(desc:Psspine_skeleton_desc):Tsspine_skeleton;cdecl;external;
(* Const before type ignored *)
function sspine_make_skinset(desc:Psspine_skinset_desc):Tsspine_skinset;cdecl;external;
(* Const before type ignored *)
function sspine_make_instance(desc:Psspine_instance_desc):Tsspine_instance;cdecl;external;
procedure sspine_destroy_atlas(atlas:Tsspine_atlas);cdecl;external;
procedure sspine_destroy_skeleton(skeleton:Tsspine_skeleton);cdecl;external;
procedure sspine_destroy_skinset(skinset:Tsspine_skinset);cdecl;external;
procedure sspine_destroy_instance(instance:Tsspine_instance);cdecl;external;
{ configure instance appearance via skinsets }
procedure sspine_set_skinset(instance:Tsspine_instance; skinset:Tsspine_skinset);cdecl;external;
{ update instance animations before drawing }
procedure sspine_update_instance(instance:Tsspine_instance; delta_time:single);cdecl;external;
{ iterate over triggered events after updating an instance }
function sspine_num_triggered_events(instance:Tsspine_instance):longint;cdecl;external;
function sspine_get_triggered_event_info(instance:Tsspine_instance; triggered_event_index:longint):Tsspine_triggered_event_info;cdecl;external;
{ draw instance into current or explicit context }
procedure sspine_draw_instance_in_layer(instance:Tsspine_instance; layer:longint);cdecl;external;
procedure sspine_context_draw_instance_in_layer(ctx:Tsspine_context; instance:Tsspine_instance; layer:longint);cdecl;external;
{ helper function to convert sspine_layer_transform into projection matrix }
(* Const before type ignored *)
function sspine_layer_transform_to_mat4(tform:Psspine_layer_transform):Tsspine_mat4;cdecl;external;
{ draw a layer in current context or explicit context (call once per context and frame in sokol-gfx pass) }
(* Const before type ignored *)
procedure sspine_draw_layer(layer:longint; tform:Psspine_layer_transform);cdecl;external;
(* Const before type ignored *)
procedure sspine_context_draw_layer(ctx:Tsspine_context; layer:longint; tform:Psspine_layer_transform);cdecl;external;
{ get current resource state (INITIAL, ALLOC, VALID, FAILED, INVALID) }
function sspine_get_context_resource_state(context:Tsspine_context):Tsspine_resource_state;cdecl;external;
function sspine_get_atlas_resource_state(atlas:Tsspine_atlas):Tsspine_resource_state;cdecl;external;
function sspine_get_skeleton_resource_state(skeleton:Tsspine_skeleton):Tsspine_resource_state;cdecl;external;
function sspine_get_skinset_resource_state(skinset:Tsspine_skinset):Tsspine_resource_state;cdecl;external;
function sspine_get_instance_resource_state(instance:Tsspine_instance):Tsspine_resource_state;cdecl;external;
{ shortcut for sspine_get_*_state() == SSPINE_RESOURCESTATE_VALID }
function sspine_context_valid(context:Tsspine_context):Tbool;cdecl;external;
function sspine_atlas_valid(atlas:Tsspine_atlas):Tbool;cdecl;external;
function sspine_skeleton_valid(skeleton:Tsspine_skeleton):Tbool;cdecl;external;
function sspine_instance_valid(instance:Tsspine_instance):Tbool;cdecl;external;
function sspine_skinset_valid(skinset:Tsspine_skinset):Tbool;cdecl;external;
{ get dependency objects }
function sspine_get_skeleton_atlas(skeleton:Tsspine_skeleton):Tsspine_atlas;cdecl;external;
function sspine_get_instance_skeleton(instance:Tsspine_instance):Tsspine_skeleton;cdecl;external;
{ atlas images }
function sspine_num_images(atlas:Tsspine_atlas):longint;cdecl;external;
function sspine_image_by_index(atlas:Tsspine_atlas; index:longint):Tsspine_image;cdecl;external;
function sspine_image_valid(image:Tsspine_image):Tbool;cdecl;external;
function sspine_image_equal(first:Tsspine_image; second:Tsspine_image):Tbool;cdecl;external;
function sspine_get_image_info(image:Tsspine_image):Tsspine_image_info;cdecl;external;
{ atlas page functions }
function sspine_num_atlas_pages(atlas:Tsspine_atlas):longint;cdecl;external;
function sspine_atlas_page_by_index(atlas:Tsspine_atlas; index:longint):Tsspine_atlas_page;cdecl;external;
function sspine_atlas_page_valid(page:Tsspine_atlas_page):Tbool;cdecl;external;
function sspine_atlas_page_equal(first:Tsspine_atlas_page; second:Tsspine_atlas_page):Tbool;cdecl;external;
function sspine_get_atlas_page_info(page:Tsspine_atlas_page):Tsspine_atlas_page_info;cdecl;external;
{ instance transform functions }
procedure sspine_set_position(instance:Tsspine_instance; position:Tsspine_vec2);cdecl;external;
procedure sspine_set_scale(instance:Tsspine_instance; scale:Tsspine_vec2);cdecl;external;
procedure sspine_set_color(instance:Tsspine_instance; color:Tsspine_color);cdecl;external;
function sspine_get_position(instance:Tsspine_instance):Tsspine_vec2;cdecl;external;
function sspine_get_scale(instance:Tsspine_instance):Tsspine_vec2;cdecl;external;
function sspine_get_color(instance:Tsspine_instance):Tsspine_color;cdecl;external;
{ instance animation functions }
function sspine_num_anims(skeleton:Tsspine_skeleton):longint;cdecl;external;
(* Const before type ignored *)
function sspine_anim_by_name(skeleton:Tsspine_skeleton; name:Pchar):Tsspine_anim;cdecl;external;
function sspine_anim_by_index(skeleton:Tsspine_skeleton; index:longint):Tsspine_anim;cdecl;external;
function sspine_anim_valid(anim:Tsspine_anim):Tbool;cdecl;external;
function sspine_anim_equal(first:Tsspine_anim; second:Tsspine_anim):Tbool;cdecl;external;
function sspine_get_anim_info(anim:Tsspine_anim):Tsspine_anim_info;cdecl;external;
procedure sspine_clear_animation_tracks(instance:Tsspine_instance);cdecl;external;
procedure sspine_clear_animation_track(instance:Tsspine_instance; track_index:longint);cdecl;external;
procedure sspine_set_animation(instance:Tsspine_instance; anim:Tsspine_anim; track_index:longint; loop:Tbool);cdecl;external;
procedure sspine_add_animation(instance:Tsspine_instance; anim:Tsspine_anim; track_index:longint; loop:Tbool; delay:single);cdecl;external;
procedure sspine_set_empty_animation(instance:Tsspine_instance; track_index:longint; mix_duration:single);cdecl;external;
procedure sspine_add_empty_animation(instance:Tsspine_instance; track_index:longint; mix_duration:single; delay:single);cdecl;external;
{ bone functions }
function sspine_num_bones(skeleton:Tsspine_skeleton):longint;cdecl;external;
(* Const before type ignored *)
function sspine_bone_by_name(skeleton:Tsspine_skeleton; name:Pchar):Tsspine_bone;cdecl;external;
function sspine_bone_by_index(skeleton:Tsspine_skeleton; index:longint):Tsspine_bone;cdecl;external;
function sspine_bone_valid(bone:Tsspine_bone):Tbool;cdecl;external;
function sspine_bone_equal(first:Tsspine_bone; second:Tsspine_bone):Tbool;cdecl;external;
function sspine_get_bone_info(bone:Tsspine_bone):Tsspine_bone_info;cdecl;external;
(* Const before type ignored *)
procedure sspine_set_bone_transform(instance:Tsspine_instance; bone:Tsspine_bone; transform:Psspine_bone_transform);cdecl;external;
procedure sspine_set_bone_position(instance:Tsspine_instance; bone:Tsspine_bone; position:Tsspine_vec2);cdecl;external;
procedure sspine_set_bone_rotation(instance:Tsspine_instance; bone:Tsspine_bone; rotation:single);cdecl;external;
procedure sspine_set_bone_scale(instance:Tsspine_instance; bone:Tsspine_bone; scale:Tsspine_vec2);cdecl;external;
procedure sspine_set_bone_shear(instance:Tsspine_instance; bone:Tsspine_bone; shear:Tsspine_vec2);cdecl;external;
function sspine_get_bone_transform(instance:Tsspine_instance; bone:Tsspine_bone):Tsspine_bone_transform;cdecl;external;
function sspine_get_bone_position(instance:Tsspine_instance; bone:Tsspine_bone):Tsspine_vec2;cdecl;external;
function sspine_get_bone_rotation(instance:Tsspine_instance; bone:Tsspine_bone):single;cdecl;external;
function sspine_get_bone_scale(instance:Tsspine_instance; bone:Tsspine_bone):Tsspine_vec2;cdecl;external;
function sspine_get_bone_shear(instance:Tsspine_instance; bone:Tsspine_bone):Tsspine_vec2;cdecl;external;
function sspine_get_bone_world_position(instance:Tsspine_instance; bone:Tsspine_bone):Tsspine_vec2;cdecl;external;
function sspine_bone_local_to_world(instance:Tsspine_instance; bone:Tsspine_bone; local_pos:Tsspine_vec2):Tsspine_vec2;cdecl;external;
function sspine_bone_world_to_local(instance:Tsspine_instance; bone:Tsspine_bone; world_pos:Tsspine_vec2):Tsspine_vec2;cdecl;external;
{ slot functions }
function sspine_num_slots(skeleton:Tsspine_skeleton):longint;cdecl;external;
(* Const before type ignored *)
function sspine_slot_by_name(skeleton:Tsspine_skeleton; name:Pchar):Tsspine_slot;cdecl;external;
function sspine_slot_by_index(skeleton:Tsspine_skeleton; index:longint):Tsspine_slot;cdecl;external;
function sspine_slot_valid(slot:Tsspine_slot):Tbool;cdecl;external;
function sspine_slot_equal(first:Tsspine_slot; second:Tsspine_slot):Tbool;cdecl;external;
function sspine_get_slot_info(slot:Tsspine_slot):Tsspine_slot_info;cdecl;external;
procedure sspine_set_slot_color(instance:Tsspine_instance; slot:Tsspine_slot; color:Tsspine_color);cdecl;external;
function sspine_get_slot_color(instance:Tsspine_instance; slot:Tsspine_slot):Tsspine_color;cdecl;external;
{ event functions }
function sspine_num_events(skeleton:Tsspine_skeleton):longint;cdecl;external;
(* Const before type ignored *)
function sspine_event_by_name(skeleton:Tsspine_skeleton; name:Pchar):Tsspine_event;cdecl;external;
function sspine_event_by_index(skeleton:Tsspine_skeleton; index:longint):Tsspine_event;cdecl;external;
function sspine_event_valid(event:Tsspine_event):Tbool;cdecl;external;
function sspine_event_equal(first:Tsspine_event; second:Tsspine_event):Tbool;cdecl;external;
function sspine_get_event_info(event:Tsspine_event):Tsspine_event_info;cdecl;external;
{ ik target functions }
function sspine_num_iktargets(skeleton:Tsspine_skeleton):longint;cdecl;external;
(* Const before type ignored *)
function sspine_iktarget_by_name(skeleton:Tsspine_skeleton; name:Pchar):Tsspine_iktarget;cdecl;external;
function sspine_iktarget_by_index(skeleton:Tsspine_skeleton; index:longint):Tsspine_iktarget;cdecl;external;
function sspine_iktarget_valid(iktarget:Tsspine_iktarget):Tbool;cdecl;external;
function sspine_iktarget_equal(first:Tsspine_iktarget; second:Tsspine_iktarget):Tbool;cdecl;external;
function sspine_get_iktarget_info(iktarget:Tsspine_iktarget):Tsspine_iktarget_info;cdecl;external;
procedure sspine_set_iktarget_world_pos(instance:Tsspine_instance; iktarget:Tsspine_iktarget; world_pos:Tsspine_vec2);cdecl;external;
{ skin functions }
function sspine_num_skins(skeleton:Tsspine_skeleton):longint;cdecl;external;
(* Const before type ignored *)
function sspine_skin_by_name(skeleton:Tsspine_skeleton; name:Pchar):Tsspine_skin;cdecl;external;
function sspine_skin_by_index(skeleton:Tsspine_skeleton; index:longint):Tsspine_skin;cdecl;external;
function sspine_skin_valid(skin:Tsspine_skin):Tbool;cdecl;external;
function sspine_skin_equal(first:Tsspine_skin; second:Tsspine_skin):Tbool;cdecl;external;
function sspine_get_skin_info(skin:Tsspine_skin):Tsspine_skin_info;cdecl;external;
procedure sspine_set_skin(instance:Tsspine_instance; skin:Tsspine_skin);cdecl;external;

implementation


end.
