unit MPSongItem;

interface

uses
  fp_glib2, fp_gst,
  Common;

type
  PMPSongItem = type Pointer;
  PMPSongItemClass = type Pointer;

function mp_song_item_get_type: TGType;
function mp_song_item_new(FullPath: Pgchar; Duration: TGstClockTime): PMPSongItem;
function mp_song_item_get_full_path(o: PMPSongItem): pchar;
function mp_song_item_get_duration(o: PMPSongItem): TGstClockTime;

implementation

// ==== private

type
  TInstPriv = record
    FullPath: Pgchar;
    Duration: TGstClockTime;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  parent_class: Tgpointer = nil;
  instance_size: integer = 0;

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
    if FullPath <> nil then begin
      g_free(FullPath);
    end;
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
    FullPath := nil;
    Duration := 0;
  end;
end;


// ==== public

function mp_song_item_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(G_TYPE_OBJECT, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(G_TYPE_OBJECT, 'MPSongitem',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_song_item_new(FullPath: Pgchar; Duration: TGstClockTime): PMPSongItem;
var
  priv: PInstPriv;
begin
  Result := g_object_new(mp_song_item_get_type, nil);
  priv := GetPriv(Result);
  priv^.FullPath := g_strdup(FullPath);
  priv^.Duration := Duration;
end;

function mp_song_item_get_full_path(o: PMPSongItem): pchar;
var
  priv: PInstPriv;
begin
  priv := GetPriv(o);
  with priv^ do begin
    Result := FullPath;
  end;
end;

function mp_song_item_get_duration(o: PMPSongItem): TGstClockTime;
var
  priv: PInstPriv;
begin
  priv := GetPriv(o);
  with priv^ do begin
    Result := Duration;
  end;
end;

end.
