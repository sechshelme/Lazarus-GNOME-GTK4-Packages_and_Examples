unit LoadTitle;

{$mode ObjFPC}{$H+}

interface

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  Common,
  Streamer;

procedure LoadTitles(store: PGListStore; path: Pgchar);

implementation

type
  TDirStruct = record
    store: PGListStore;
    path: Pgchar;
    dir: PGDir;
  end;
  PDirStruct = ^TDirStruct;

function OpenTitel1(user_data: Tgpointer): Tgboolean; cdecl;
var
  dirStruct: PDirStruct absolute user_data;
  entryName: Pgchar;
  obj: PGObject;
  song: PSong;
  i: integer;
const
  index: integer = 0;

begin
  entryName := g_dir_read_name(dirStruct^.dir);
  if entryName = nil then begin
    g_dir_close(dirStruct^.dir);
    g_free(dirStruct^.path);
    g_free(dirStruct);
    Exit(G_SOURCE_REMOVE_);
  end;

  for i := 0 to Length(AudioExtensions) - 1 do begin
    if g_str_has_suffix(entryName, AudioExtensions[i]) then  begin
      song := g_malloc(SizeOf(TSong));
      song^.Index := index;
      song^.FullPath:=     g_strdup(PChar(dirStruct^.path + '/' + entryName));
//      song^.Duration := get_duration(song^.FullPath) div G_USEC_PER_SEC;
      song^.Duration := get_duration(song^.FullPath);
      Inc(index);

      obj := g_object_new(G_TYPE_OBJECT, nil);
      g_object_set_data_full(obj, songObjectKey, song, @songitem_object_free_cp);
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
  dirStruct^.path := g_strdup( path);
  dirStruct^.dir := g_dir_open(path, 0, nil);

  if dirStruct^.dir = nil then begin
    WriteLn('Konnte Ordner nicht öffnen !');
  end else begin
    g_idle_add(@OpenTitel1, dirStruct);
  end;
end;



end.
