unit LoadTitle;

{$mode ObjFPC}{$H+}

interface

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  Common,
  Streamer;

type
  TSong = record
    Index: Tgint;
    FullPath: Pgchar;
    Duration: Tgint64;
  end;
  PSong = ^TSong;

const
  songObjectKey = 'song-object';

procedure LoadTitles(store: PGListStore; path: Pgchar);

implementation

type
  TDirStruct = record
    store: PGListStore;
    path: Pgchar;
    dir: PGDir;
  end;
  PDirStruct = ^TDirStruct;

procedure item_object_free_cp(Data: Tgpointer); cdecl;
var
  obj: PSong absolute Data;
begin
  WriteLn(obj^.FullPath, '  (freed)');
  g_free(obj^.FullPath);
  g_free(obj);
end;

function OpenTitel1(user_data: Tgpointer): Tgboolean; cdecl;
var
  dirStruct: PDirStruct absolute user_data;
  entryName, fullPath: Pgchar;
  obj: PGObject;
  song: PSong;
  i: integer;
const
  index: integer = 0;

begin
  entryName := g_dir_read_name(dirStruct^.dir);
  if entryName = nil then begin
    g_dir_close(dirStruct^.dir);
    g_free(dirStruct);
    Exit(G_SOURCE_REMOVE_);
  end;

  for i := 0 to Length(AudioExtensions) - 1 do begin
    if g_str_has_suffix(entryName, AudioExtensions[i]) then  begin
      song := g_malloc(SizeOf(TSong));
      song^.Index := index;
      fullPath:=     g_strdup(PChar(dirStruct^.path + '/' + entryName));
      song^.FullPath :=fullPath;
      song^.Duration := get_duration(fullPath);
      Inc(index);

      obj := g_object_new(G_TYPE_OBJECT, nil);
      g_object_set_data_full(obj, songObjectKey, song, @item_object_free_cp);
      g_list_store_append(dirStruct^.store, obj);
      g_object_unref(obj);
      Break;
    end;
  end;

  Exit(G_SOURCE_CONTINUE);
end;

procedure LoadTitles(store: PGListStore; path: Pgchar);
var
  dirStruct: PDirStruct;
begin
  dirStruct := g_malloc(SizeOf(TDirStruct));
  dirStruct^.store := store;
  dirStruct^.path := path;
  dirStruct^.dir := g_dir_open(path, 0, nil);

  if dirStruct^.dir = nil then begin
    WriteLn('Konnte Ordner nicht öffnen !');
  end else begin
    g_idle_add(@OpenTitel1, dirStruct);
  end;
end;



end.
