unit MPIdleSongLoader;

interface

uses
  fp_glib2,
  Common,
  MPStreamer,
  MPSongItem;

type
  PIdleSongLoader = type Pointer;
  PIdleSongLoaderClass = type Pointer;

function idle_song_loader_get_type: TGType;
function idle_song_loader_new: PIdleSongLoader;
procedure idle_song_loader_add(o: PIdleSongLoader; path: Pgchar);
procedure idle_song_loader_add_path(o: PIdleSongLoader; path: Pgchar);

implementation

// ==== private

type
  TInstPriv = record
    idle_id: Tguint;
    songpaths: PGPtrArray;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  parent_class: Tgpointer = nil;
  instance_size: integer = 0;
  signal_id: Tguint = 0;


function GetPriv(w: Tgpointer): PInstPriv; inline;
begin
  Result := PInstPriv(w + instance_size);
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(obj);
  with priv^ do begin
    if idle_id <> 0 then  begin
      g_source_remove(idle_id);
    end;
    idle_id := 0;

    if songpaths <> nil then begin
      g_ptr_array_unref(songpaths);
    end;
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);
  signal_id := g_signal_new('triggered', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST, 0, nil, nil, nil, G_TYPE_NONE, 1, mp_song_item_get_type);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
    idle_id := 0;
    songpaths := g_ptr_array_new_with_free_func(@g_free);
  end;
end;

// ======

function add_item_cp(user_data: Tgpointer): Tgboolean; cdecl;
var
  priv: PInstPriv;
  first_path: Pgchar;
  item: PMPSongItem;
begin
  priv := GetPriv(user_data);
  with priv^ do begin
    if (songpaths <> nil) and (songpaths^.len > 0) then begin

      first_path := g_ptr_array_index(songpaths, 0);
      item := mp_song_item_new(first_path, get_duration(first_path));
      g_signal_emit(user_data, signal_id, 0, item);
      g_object_unref(item);

      g_ptr_array_remove_index(songpaths, 0);
      if songpaths^.len > 0 then begin
        Result := G_SOURCE_CONTINUE;
      end else begin
        Result := G_SOURCE_REMOVE_;
        idle_id := 0;
      end;
    end else begin
      Result := G_SOURCE_REMOVE_;
      idle_id := 0;
    end;
  end;
end;


// ==== public

function idle_song_loader_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(G_TYPE_OBJECT, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(G_TYPE_OBJECT, 'IdleObject',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function idle_song_loader_new: PIdleSongLoader;
var
  priv: PInstPriv;
begin
  Result := g_object_new(idle_song_loader_get_type, nil);
  priv := GetPriv(Result);
end;

procedure idle_song_loader_add(o: PIdleSongLoader; path: Pgchar);
var
  priv: PInstPriv;
begin
  priv := GetPriv(o);
  g_ptr_array_add(priv^.songpaths, path);
end;

procedure idle_song_loader_add_path(o: PIdleSongLoader; path: Pgchar);
var
  priv: PInstPriv;
  dir: PGDir;
  entryName, fullPath: Pgchar;
  i: integer;
begin
  priv := GetPriv(o);
  with priv^ do begin
    dir := g_dir_open(path, 0, nil);
    if dir = nil then begin
      WriteLn('Konnte Ordner nicht öffnen!');
      Exit;
    end;

    entryName := g_dir_read_name(dir);
    while entryName <> nil do begin
      for i := 0 to Length(AudioExtensions) - 1 do begin
        if g_str_has_suffix(entryName, AudioExtensions[i]) then begin
          fullPath := g_build_filename(path, entryName, nil);
          idle_song_loader_add(o, fullPath);
          Break;
        end;
      end;
      entryName := g_dir_read_name(dir);
    end;

    if idle_id = 0 then  begin
      idle_id := g_idle_add(@add_item_cp, o);
    end;

    g_dir_close(dir);
  end;
end;


end.
