{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitScriptWorld, webkit_script_world, WEBKIT, SCRIPT_WORLD, GObject ) }
type
  TWebKitScriptWorld = record
  end;
  PWebKitScriptWorld = ^TWebKitScriptWorld;

  TWebKitScriptWorldClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitScriptWorldClass = ^TWebKitScriptWorldClass;

function webkit_script_world_get_type: TGType; cdecl; external libwebkit;
function webkit_script_world_get_default: PWebKitScriptWorld; cdecl; external libwebkit;
function webkit_script_world_new: PWebKitScriptWorld; cdecl; external libwebkit;
function webkit_script_world_new_with_name(Name: pchar): PWebKitScriptWorld; cdecl; external libwebkit;
function webkit_script_world_get_name(world: PWebKitScriptWorld): pchar; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 14:01:11 ===

function WEBKIT_TYPE_SCRIPT_WORLD: TGType;
function WEBKIT_SCRIPT_WORLD(obj: Pointer): PWebKitScriptWorld;
function WEBKIT_IS_SCRIPT_WORLD(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_SCRIPT_WORLD: TGType;
begin
  Result := webkit_script_world_get_type;
end;

function WEBKIT_SCRIPT_WORLD(obj: Pointer): PWebKitScriptWorld;
begin
  Result := PWebKitScriptWorld(g_type_check_instance_cast(obj, WEBKIT_TYPE_SCRIPT_WORLD));
end;

function WEBKIT_IS_SCRIPT_WORLD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_SCRIPT_WORLD);
end;


{$ENDIF read_implementation}
