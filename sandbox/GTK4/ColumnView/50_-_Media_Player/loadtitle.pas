unit LoadTitle;

{$mode ObjFPC}{$H+}

interface

uses
  ctypes,
  fp_glib2,
  //  fp_GLIBTools,
  fp_GDK4,
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



procedure OpenTitel(cl: PGtkColumnView);


implementation

function FindAllFiles(path: Pgchar): PGtkStringList;
  // https://www.perplexity.ai/search/wie-kriege-ich-den-inhalt-eine-DYkUj_baSWuI.DL7SOKpQQ
var
  sl: PGtkStringList;
  dir: PGDir;
  entryName: Pgchar;
begin
  dir := g_dir_open(path, 0, nil);
  if dir = nil then begin
    WriteLn('Konnte Ordner nicht öffnen !');
    exit(nil);
  end;

  sl := gtk_string_list_new(nil);

  repeat
    entryName := g_dir_read_name(dir);
    if entryName <> nil then begin
      if g_str_has_suffix(entryName, '.flac') then  begin
        gtk_string_list_append(sl, PChar(path + '/' + entryName));
      end;
    end;
  until entryName = nil;

  g_dir_close(dir);
  Result := sl;
end;

procedure item_object_free_cp(Data: Tgpointer); cdecl;
var
  obj: PSong absolute Data;
begin
  WriteLn(obj^.Titel, '  (freed)');
  g_free(obj^.Titel);
  g_free(obj);
end;



procedure ListBoxAppendItem(column_view: PGtkColumnView; Titel: Pgchar);
var
  selection_model: PGtkSelectionModel;
  list_model: PGListModel;
  obj: PGObject;
  human: PSong;
const
  index: integer = 0;
begin
  selection_model := gtk_column_view_get_model(column_view);
  list_model := gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model));

  obj := g_object_new(G_TYPE_OBJECT, nil);

  human := g_malloc(SizeOf(TSong));
  human^.Index := index;
  human^.Titel := g_strdup(Titel);
  human^.Duration := Random(100);
  Inc(index);

  g_object_set_data_full(obj, songObjectKey, human, @item_object_free_cp);
  g_list_store_append(G_LIST_STORE(list_model), obj);
  g_object_unref(obj);
end;


procedure OpenTitel(cl: PGtkColumnView);
const
  folder_path = '/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos';
var
  sl: PGtkStringList;
  n_item: Tguint;
  so: PGtkStringObject;
  i: integer;
  s: pchar;
begin
  sl := FindAllFiles(folder_path);

  n_item := g_list_model_get_n_items(G_LIST_MODEL(sl));
  WriteLn('count: ', n_item);
  for i := 0 to n_item - 1 do begin
    so := GTK_STRING_OBJECT(g_list_model_get_item(G_LIST_MODEL(sl), i));
    s := gtk_string_object_get_string(so);
    g_object_unref(so);
    WriteLn(i: 4, ' --- ', s);

    ListBoxAppendItem(cl, s);
  end;

  g_object_unref(sl);
end;



end.
