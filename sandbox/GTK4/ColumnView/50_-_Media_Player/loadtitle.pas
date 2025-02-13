unit LoadTitle;

{$mode ObjFPC}{$H+}

interface

uses
  ctypes,
  fp_glib2,
  //  fp_GLIBTools,
  fp_GTK4;

type
  TSong = record
    Index: Tgint;
    Titel: Pgchar;
    Duration: Tgint64;
  end;
  PSong = ^TSong;

const
  songObjectKey = 'song-object';
  scaleObjectKey = 'scale-widget';

procedure OpenTitel(store: PGListStore);
procedure LoadTitles(store: PGListStore);


implementation

procedure item_object_free_cp(Data: Tgpointer); cdecl;
var
  obj: PSong absolute Data;
begin
  WriteLn(obj^.Titel, '  (freed)');
  g_free(obj^.Titel);
  g_free(obj);
end;

procedure OpenTitel(store: PGListStore);
const
  path = '/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos';
  index: integer = 0;
var
  dir: PGDir;
  human: PSong;
  obj: PGObject;
  entryName: Pgchar;

begin
  dir := g_dir_open(path, 0, nil);
  if dir = nil then begin
    WriteLn('Konnte Ordner nicht öffnen !');
    exit;
  end;

  repeat
    entryName := g_dir_read_name(dir);
    if entryName <> nil then begin
      if g_str_has_suffix(entryName, '.flac') then  begin

        human := g_malloc(SizeOf(TSong));
        human^.Index := index;
        human^.Titel := g_strdup(PChar(path + '/' + entryName));
        human^.Duration := Random(100);
        Inc(index);

        obj := g_object_new(G_TYPE_OBJECT, nil);
        g_object_set_data_full(obj, songObjectKey, human, @item_object_free_cp);
        g_list_store_append(store, obj);
        g_object_unref(obj);
      end;
    end;
  until entryName = nil;

  g_dir_close(dir);
end;

function OpenTitel1(user_data: Tgpointer): Tgboolean; cdecl;
begin

end;

procedure LoadTitles(store: PGListStore);
begin
  g_idle_add(@OpenTitel1, store);
end;



end.
