{$IFDEF read_interface}


const
  SSPINE_INVALID_ID = 0;
  SSPINE_MAX_SKINSET_SKINS = 32;
  SSPINE_MAX_STRING_SIZE = 61;

type
  Tsspine_context = record
    id: Tuint32_t;
  end;
  Psspine_context = ^Tsspine_context;

  Tsspine_atlas = record
    id: Tuint32_t;
  end;
  Psspine_atlas = ^Tsspine_atlas;

  Tsspine_skeleton = record
    id: Tuint32_t;
  end;
  Psspine_skeleton = ^Tsspine_skeleton;

  Tsspine_instance = record
    id: Tuint32_t;
  end;
  Psspine_instance = ^Tsspine_instance;

  Tsspine_skinset = record
    id: Tuint32_t;
  end;
  Psspine_skinset = ^Tsspine_skinset;

  Tsspine_image = record
    atlas_id: Tuint32_t;
    index: longint;
  end;
  Psspine_image = ^Tsspine_image;

  Tsspine_atlas_page = record
    atlas_id: Tuint32_t;
    index: longint;
  end;
  Psspine_atlas_page = ^Tsspine_atlas_page;

  Tsspine_anim = record
    skeleton_id: Tuint32_t;
    index: longint;
  end;
  Psspine_anim = ^Tsspine_anim;

  Tsspine_bone = record
    skeleton_id: Tuint32_t;
    index: longint;
  end;
  Psspine_bone = ^Tsspine_bone;

  Tsspine_slot = record
    skeleton_id: Tuint32_t;
    index: longint;
  end;
  Psspine_slot = ^Tsspine_slot;

  Tsspine_event = record
    skeleton_id: Tuint32_t;
    index: longint;
  end;
  Psspine_event = ^Tsspine_event;

  Tsspine_iktarget = record
    skeleton_id: Tuint32_t;
    index: longint;
  end;
  Psspine_iktarget = ^Tsspine_iktarget;

  Tsspine_skin = record
    skeleton_id: Tuint32_t;
    index: longint;
  end;
  Psspine_skin = ^Tsspine_skin;

  Tsspine_range = record
    ptr: pointer;
    size: Tsize_t;
  end;
  Psspine_range = ^Tsspine_range;

  Tsspine_vec2 = record
    x: single;
    y: single;
  end;
  Psspine_vec2 = ^Tsspine_vec2;

  Tsspine_mat4 = record
    m: array[0..15] of single;
  end;
  Psspine_mat4 = ^Tsspine_mat4;

  Psspine_color = ^Tsspine_color;
  Tsspine_color = Tsg_color;

  Tsspine_string = record
    valid: boolean;
    truncated: boolean;
    len: Tuint8_t;
    cstr: array[0..(SSPINE_MAX_STRING_SIZE) - 1] of char;
  end;
  Psspine_string = ^Tsspine_string;

type
  Psspine_resource_state = ^Tsspine_resource_state;
  Tsspine_resource_state = longint;

const
  SSPINE_RESOURCESTATE_INITIAL = 0;
  SSPINE_RESOURCESTATE_ALLOC = 1;
  SSPINE_RESOURCESTATE_VALID = 2;
  SSPINE_RESOURCESTATE_FAILED = 3;
  SSPINE_RESOURCESTATE_INVALID = 4;
  _SSPINE_RESOURCESTATE_FORCE_U32 = $7FFFFFFF;

type
  Tsspine_layer_transform = record
    size: Tsspine_vec2;
    origin: Tsspine_vec2;
  end;
  Psspine_layer_transform = ^Tsspine_layer_transform;

  Tsspine_bone_transform = record
    position: Tsspine_vec2;
    rotation: single;
    scale: Tsspine_vec2;
    shear: Tsspine_vec2;
  end;
  Psspine_bone_transform = ^Tsspine_bone_transform;

  Tsspine_context_desc = record
    max_vertices: longint;
    max_commands: longint;
    color_format: Tsg_pixel_format;
    depth_format: Tsg_pixel_format;
    sample_count: longint;
    color_write_mask: Tsg_color_mask;
  end;
  Psspine_context_desc = ^Tsspine_context_desc;

  Tsspine_context_info = record
    num_vertices: longint;
    num_indices: longint;
    num_commands: longint;
  end;
  Psspine_context_info = ^Tsspine_context_info;

  Tsspine_image_info = record
    valid: Boolean;
    sgimage: Tsg_image;
    sgview: Tsg_view;
    sgsampler: Tsg_sampler;
    min_filter: Tsg_filter;
    mag_filter: Tsg_filter;
    mipmap_filter: Tsg_filter;
    wrap_u: Tsg_wrap;
    wrap_v: Tsg_wrap;
    width: longint;
    height: longint;
    premul_alpha: Boolean;
    filename: Tsspine_string;
  end;
  Psspine_image_info = ^Tsspine_image_info;

  Tsspine_atlas_overrides = record
    min_filter: Tsg_filter;
    mag_filter: Tsg_filter;
    mipmap_filter: Tsg_filter;
    wrap_u: Tsg_wrap;
    wrap_v: Tsg_wrap;
    premul_alpha_enabled: Boolean;
    premul_alpha_disabled: Boolean;
  end;
  Psspine_atlas_overrides = ^Tsspine_atlas_overrides;

  Tsspine_atlas_desc = record
    data: Tsspine_range;
    override: Tsspine_atlas_overrides;
  end;
  Psspine_atlas_desc = ^Tsspine_atlas_desc;

  Tsspine_atlas_page_info = record
    valid: Boolean;
    atlas: Tsspine_atlas;
    image: Tsspine_image_info;
    overrides: Tsspine_atlas_overrides;
  end;
  Psspine_atlas_page_info = ^Tsspine_atlas_page_info;

  Tsspine_skeleton_desc = record
    atlas: Tsspine_atlas;
    prescale: single;
    anim_default_mix: single;
    json_data: pchar;
    binary_data: Tsspine_range;
  end;
  Psspine_skeleton_desc = ^Tsspine_skeleton_desc;

  Tsspine_skinset_desc = record
    skeleton: Tsspine_skeleton;
    skins: array[0..(SSPINE_MAX_SKINSET_SKINS) - 1] of Tsspine_skin;
  end;
  Psspine_skinset_desc = ^Tsspine_skinset_desc;

  Tsspine_anim_info = record
    valid: Boolean;
    index: longint;
    duration: single;
    name: Tsspine_string;
  end;
  Psspine_anim_info = ^Tsspine_anim_info;

  Tsspine_bone_info = record
    valid: Boolean;
    index: longint;
    parent_bone: Tsspine_bone;
    length: single;
    pose: Tsspine_bone_transform;
    color: Tsspine_color;
    name: Tsspine_string;
  end;
  Psspine_bone_info = ^Tsspine_bone_info;

  Tsspine_slot_info = record
    valid: Boolean;
    index: longint;
    bone: Tsspine_bone;
    color: Tsspine_color;
    attachment_name: Tsspine_string;
    name: Tsspine_string;
  end;
  Psspine_slot_info = ^Tsspine_slot_info;

  Tsspine_iktarget_info = record
    valid: Boolean;
    index: longint;
    target_bone: Tsspine_bone;
    name: Tsspine_string;
  end;
  Psspine_iktarget_info = ^Tsspine_iktarget_info;

  Tsspine_skin_info = record
    valid: Boolean;
    index: longint;
    name: Tsspine_string;
  end;
  Psspine_skin_info = ^Tsspine_skin_info;

  Tsspine_event_info = record
    valid: Boolean;
    index: longint;
    int_value: longint;
    float_value: single;
    volume: single;
    balance: single;
    name: Tsspine_string;
    string_value: Tsspine_string;
    audio_path: Tsspine_string;
  end;
  Psspine_event_info = ^Tsspine_event_info;

  Tsspine_triggered_event_info = record
    valid: Boolean;
    event: Tsspine_event;
    time: single;
    int_value: longint;
    float_value: single;
    volume: single;
    balance: single;
    string_value: Tsspine_string;
  end;
  Psspine_triggered_event_info = ^Tsspine_triggered_event_info;

  Tsspine_instance_desc = record
    skeleton: Tsspine_skeleton;
  end;
  Psspine_instance_desc = ^Tsspine_instance_desc;

  Tsspine_allocator = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psspine_allocator = ^Tsspine_allocator;

  Tsspine_logger = record
    func: procedure(tag: pchar; log_level: Tuint32_t; log_item_id: Tuint32_t; message_or_null: pchar; line_nr: Tuint32_t;
      filename_or_null: pchar; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psspine_logger = ^Tsspine_logger;

  Tsspine_desc = record
    max_vertices: longint;
    max_commands: longint;
    context_pool_size: longint;
    atlas_pool_size: longint;
    skeleton_pool_size: longint;
    skinset_pool_size: longint;
    instance_pool_size: longint;
    color_format: Tsg_pixel_format;
    depth_format: Tsg_pixel_format;
    sample_count: longint;
    color_write_mask: Tsg_color_mask;
    allocator: Tsspine_allocator;
    logger: Tsspine_logger;
  end;
  Psspine_desc = ^Tsspine_desc;

procedure sspine_setup(desc: Psspine_desc); cdecl; external libsokol;
procedure sspine_shutdown; cdecl; external libsokol;

function sspine_make_context(desc: Psspine_context_desc): Tsspine_context; cdecl; external libsokol;
procedure sspine_destroy_context(ctx: Tsspine_context); cdecl; external libsokol;
procedure sspine_set_context(ctx: Tsspine_context); cdecl; external libsokol;
function sspine_get_context: Tsspine_context; cdecl; external libsokol;
function sspine_default_context: Tsspine_context; cdecl; external libsokol;
function sspine_get_context_info(ctx: Tsspine_context): Tsspine_context_info; cdecl; external libsokol;

function sspine_make_atlas(desc: Psspine_atlas_desc): Tsspine_atlas; cdecl; external libsokol;
function sspine_make_skeleton(desc: Psspine_skeleton_desc): Tsspine_skeleton; cdecl; external libsokol;
function sspine_make_skinset(desc: Psspine_skinset_desc): Tsspine_skinset; cdecl; external libsokol;
function sspine_make_instance(desc: Psspine_instance_desc): Tsspine_instance; cdecl; external libsokol;
procedure sspine_destroy_atlas(atlas: Tsspine_atlas); cdecl; external libsokol;
procedure sspine_destroy_skeleton(skeleton: Tsspine_skeleton); cdecl; external libsokol;
procedure sspine_destroy_skinset(skinset: Tsspine_skinset); cdecl; external libsokol;
procedure sspine_destroy_instance(instance: Tsspine_instance); cdecl; external libsokol;

procedure sspine_set_skinset(instance: Tsspine_instance; skinset: Tsspine_skinset); cdecl; external libsokol;

procedure sspine_update_instance(instance: Tsspine_instance; delta_time: single); cdecl; external libsokol;

function sspine_num_triggered_events(instance: Tsspine_instance): longint; cdecl; external libsokol;
function sspine_get_triggered_event_info(instance: Tsspine_instance; triggered_event_index: longint): Tsspine_triggered_event_info; cdecl; external libsokol;

procedure sspine_draw_instance_in_layer(instance: Tsspine_instance; layer: longint); cdecl; external libsokol;
procedure sspine_context_draw_instance_in_layer(ctx: Tsspine_context; instance: Tsspine_instance; layer: longint); cdecl; external libsokol;

function sspine_layer_transform_to_mat4(tform: Psspine_layer_transform): Tsspine_mat4; cdecl; external libsokol;

procedure sspine_draw_layer(layer: longint; tform: Psspine_layer_transform); cdecl; external libsokol;
procedure sspine_context_draw_layer(ctx: Tsspine_context; layer: longint; tform: Psspine_layer_transform); cdecl; external libsokol;

function sspine_get_context_resource_state(context: Tsspine_context): Tsspine_resource_state; cdecl; external libsokol;
function sspine_get_atlas_resource_state(atlas: Tsspine_atlas): Tsspine_resource_state; cdecl; external libsokol;
function sspine_get_skeleton_resource_state(skeleton: Tsspine_skeleton): Tsspine_resource_state; cdecl; external libsokol;
function sspine_get_skinset_resource_state(skinset: Tsspine_skinset): Tsspine_resource_state; cdecl; external libsokol;
function sspine_get_instance_resource_state(instance: Tsspine_instance): Tsspine_resource_state; cdecl; external libsokol;

function sspine_context_valid(context: Tsspine_context): Boolean; cdecl; external libsokol;
function sspine_atlas_valid(atlas: Tsspine_atlas): Boolean; cdecl; external libsokol;
function sspine_skeleton_valid(skeleton: Tsspine_skeleton): Boolean; cdecl; external libsokol;
function sspine_instance_valid(instance: Tsspine_instance): Boolean; cdecl; external libsokol;
function sspine_skinset_valid(skinset: Tsspine_skinset): Boolean; cdecl; external libsokol;

function sspine_get_skeleton_atlas(skeleton: Tsspine_skeleton): Tsspine_atlas; cdecl; external libsokol;
function sspine_get_instance_skeleton(instance: Tsspine_instance): Tsspine_skeleton; cdecl; external libsokol;

function sspine_num_images(atlas: Tsspine_atlas): longint; cdecl; external libsokol;
function sspine_image_by_index(atlas: Tsspine_atlas; index: longint): Tsspine_image; cdecl; external libsokol;
function sspine_image_valid(image: Tsspine_image): Boolean; cdecl; external libsokol;
function sspine_image_equal(first: Tsspine_image; second: Tsspine_image): Boolean; cdecl; external libsokol;
function sspine_get_image_info(image: Tsspine_image): Tsspine_image_info; cdecl; external libsokol;

function sspine_num_atlas_pages(atlas: Tsspine_atlas): longint; cdecl; external libsokol;
function sspine_atlas_page_by_index(atlas: Tsspine_atlas; index: longint): Tsspine_atlas_page; cdecl; external libsokol;
function sspine_atlas_page_valid(page: Tsspine_atlas_page): Boolean; cdecl; external libsokol;
function sspine_atlas_page_equal(first: Tsspine_atlas_page; second: Tsspine_atlas_page): Boolean; cdecl; external libsokol;
function sspine_get_atlas_page_info(page: Tsspine_atlas_page): Tsspine_atlas_page_info; cdecl; external libsokol;

procedure sspine_set_position(instance: Tsspine_instance; position: Tsspine_vec2); cdecl; external libsokol;
procedure sspine_set_scale(instance: Tsspine_instance; scale: Tsspine_vec2); cdecl; external libsokol;
procedure sspine_set_color(instance: Tsspine_instance; color: Tsspine_color); cdecl; external libsokol;
function sspine_get_position(instance: Tsspine_instance): Tsspine_vec2; cdecl; external libsokol;
function sspine_get_scale(instance: Tsspine_instance): Tsspine_vec2; cdecl; external libsokol;
function sspine_get_color(instance: Tsspine_instance): Tsspine_color; cdecl; external libsokol;

function sspine_num_anims(skeleton: Tsspine_skeleton): longint; cdecl; external libsokol;
function sspine_anim_by_name(skeleton: Tsspine_skeleton; name: pchar): Tsspine_anim; cdecl; external libsokol;
function sspine_anim_by_index(skeleton: Tsspine_skeleton; index: longint): Tsspine_anim; cdecl; external libsokol;
function sspine_anim_valid(anim: Tsspine_anim): Boolean; cdecl; external libsokol;
function sspine_anim_equal(first: Tsspine_anim; second: Tsspine_anim): Boolean; cdecl; external libsokol;
function sspine_get_anim_info(anim: Tsspine_anim): Tsspine_anim_info; cdecl; external libsokol;
procedure sspine_clear_animation_tracks(instance: Tsspine_instance); cdecl; external libsokol;
procedure sspine_clear_animation_track(instance: Tsspine_instance; track_index: longint); cdecl; external libsokol;
procedure sspine_set_animation(instance: Tsspine_instance; anim: Tsspine_anim; track_index: longint; loop: Boolean); cdecl; external libsokol;
procedure sspine_add_animation(instance: Tsspine_instance; anim: Tsspine_anim; track_index: longint; loop: Boolean; delay: single); cdecl; external libsokol;
procedure sspine_set_empty_animation(instance: Tsspine_instance; track_index: longint; mix_duration: single); cdecl; external libsokol;
procedure sspine_add_empty_animation(instance: Tsspine_instance; track_index: longint; mix_duration: single; delay: single); cdecl; external libsokol;

function sspine_num_bones(skeleton: Tsspine_skeleton): longint; cdecl; external libsokol;
function sspine_bone_by_name(skeleton: Tsspine_skeleton; name: pchar): Tsspine_bone; cdecl; external libsokol;
function sspine_bone_by_index(skeleton: Tsspine_skeleton; index: longint): Tsspine_bone; cdecl; external libsokol;
function sspine_bone_valid(bone: Tsspine_bone): Boolean; cdecl; external libsokol;
function sspine_bone_equal(first: Tsspine_bone; second: Tsspine_bone): Boolean; cdecl; external libsokol;
function sspine_get_bone_info(bone: Tsspine_bone): Tsspine_bone_info; cdecl; external libsokol;
procedure sspine_set_bone_transform(instance: Tsspine_instance; bone: Tsspine_bone; transform: Psspine_bone_transform); cdecl; external libsokol;
procedure sspine_set_bone_position(instance: Tsspine_instance; bone: Tsspine_bone; position: Tsspine_vec2); cdecl; external libsokol;
procedure sspine_set_bone_rotation(instance: Tsspine_instance; bone: Tsspine_bone; rotation: single); cdecl; external libsokol;
procedure sspine_set_bone_scale(instance: Tsspine_instance; bone: Tsspine_bone; scale: Tsspine_vec2); cdecl; external libsokol;
procedure sspine_set_bone_shear(instance: Tsspine_instance; bone: Tsspine_bone; shear: Tsspine_vec2); cdecl; external libsokol;
function sspine_get_bone_transform(instance: Tsspine_instance; bone: Tsspine_bone): Tsspine_bone_transform; cdecl; external libsokol;
function sspine_get_bone_position(instance: Tsspine_instance; bone: Tsspine_bone): Tsspine_vec2; cdecl; external libsokol;
function sspine_get_bone_rotation(instance: Tsspine_instance; bone: Tsspine_bone): single; cdecl; external libsokol;
function sspine_get_bone_scale(instance: Tsspine_instance; bone: Tsspine_bone): Tsspine_vec2; cdecl; external libsokol;
function sspine_get_bone_shear(instance: Tsspine_instance; bone: Tsspine_bone): Tsspine_vec2; cdecl; external libsokol;
function sspine_get_bone_world_position(instance: Tsspine_instance; bone: Tsspine_bone): Tsspine_vec2; cdecl; external libsokol;
function sspine_bone_local_to_world(instance: Tsspine_instance; bone: Tsspine_bone; local_pos: Tsspine_vec2): Tsspine_vec2; cdecl; external libsokol;
function sspine_bone_world_to_local(instance: Tsspine_instance; bone: Tsspine_bone; world_pos: Tsspine_vec2): Tsspine_vec2; cdecl; external libsokol;

function sspine_num_slots(skeleton: Tsspine_skeleton): longint; cdecl; external libsokol;
function sspine_slot_by_name(skeleton: Tsspine_skeleton; name: pchar): Tsspine_slot; cdecl; external libsokol;
function sspine_slot_by_index(skeleton: Tsspine_skeleton; index: longint): Tsspine_slot; cdecl; external libsokol;
function sspine_slot_valid(slot: Tsspine_slot): Boolean; cdecl; external libsokol;
function sspine_slot_equal(first: Tsspine_slot; second: Tsspine_slot): Boolean; cdecl; external libsokol;
function sspine_get_slot_info(slot: Tsspine_slot): Tsspine_slot_info; cdecl; external libsokol;
procedure sspine_set_slot_color(instance: Tsspine_instance; slot: Tsspine_slot; color: Tsspine_color); cdecl; external libsokol;
function sspine_get_slot_color(instance: Tsspine_instance; slot: Tsspine_slot): Tsspine_color; cdecl; external libsokol;

function sspine_num_events(skeleton: Tsspine_skeleton): longint; cdecl; external libsokol;
function sspine_event_by_name(skeleton: Tsspine_skeleton; name: pchar): Tsspine_event; cdecl; external libsokol;
function sspine_event_by_index(skeleton: Tsspine_skeleton; index: longint): Tsspine_event; cdecl; external libsokol;
function sspine_event_valid(event: Tsspine_event): Boolean; cdecl; external libsokol;
function sspine_event_equal(first: Tsspine_event; second: Tsspine_event): Boolean; cdecl; external libsokol;
function sspine_get_event_info(event: Tsspine_event): Tsspine_event_info; cdecl; external libsokol;

function sspine_num_iktargets(skeleton: Tsspine_skeleton): longint; cdecl; external libsokol;
function sspine_iktarget_by_name(skeleton: Tsspine_skeleton; name: pchar): Tsspine_iktarget; cdecl; external libsokol;
function sspine_iktarget_by_index(skeleton: Tsspine_skeleton; index: longint): Tsspine_iktarget; cdecl; external libsokol;
function sspine_iktarget_valid(iktarget: Tsspine_iktarget): Boolean; cdecl; external libsokol;
function sspine_iktarget_equal(first: Tsspine_iktarget; second: Tsspine_iktarget): Boolean; cdecl; external libsokol;
function sspine_get_iktarget_info(iktarget: Tsspine_iktarget): Tsspine_iktarget_info; cdecl; external libsokol;
procedure sspine_set_iktarget_world_pos(instance: Tsspine_instance; iktarget: Tsspine_iktarget; world_pos: Tsspine_vec2); cdecl; external libsokol;

function sspine_num_skins(skeleton: Tsspine_skeleton): longint; cdecl; external libsokol;
function sspine_skin_by_name(skeleton: Tsspine_skeleton; name: pchar): Tsspine_skin; cdecl; external libsokol;
function sspine_skin_by_index(skeleton: Tsspine_skeleton; index: longint): Tsspine_skin; cdecl; external libsokol;
function sspine_skin_valid(skin: Tsspine_skin): Boolean; cdecl; external libsokol;
function sspine_skin_equal(first: Tsspine_skin; second: Tsspine_skin): Boolean; cdecl; external libsokol;
function sspine_get_skin_info(skin: Tsspine_skin): Tsspine_skin_info; cdecl; external libsokol;
procedure sspine_set_skin(instance: Tsspine_instance; skin: Tsspine_skin); cdecl; external libsokol;

// === Konventiert am: 24-3-26 13:40:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
