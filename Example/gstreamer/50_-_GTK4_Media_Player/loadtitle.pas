unit LoadTitle;

{$mode ObjFPC}{$H+}

interface

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  Common,
  LoadSaveSongs,
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

function idele_load_cp(user_data: Tgpointer): Tgboolean; cdecl;
var
  dirStruct: PDirStruct absolute user_data;
  entryName, path: Pgchar;
  i: integer;
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
      path := g_strdup(PChar(dirStruct^.path + '/' + entryName));
      Save_Song(path, dirStruct^.store);
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
  dirStruct^.path := g_strdup(path);
  dirStruct^.dir := g_dir_open(path, 0, nil);

  if dirStruct^.dir = nil then begin
    WriteLn('Konnte Ordner nicht öffnen !');
  end else begin
    g_idle_add(@idele_load_cp, dirStruct);
  end;
end;

end.
