program project1;

uses
  ctypes,
  fp_glib2;

const
  serpath = 'https://example.com/index.html';
  destpath = 'index.html';

  procedure LoadFromWWW;
  var
    fi, fo: PGFile;
    err: PGError = nil;
    ret: Tgboolean;
  begin
    fi := g_file_new_for_uri(serpath);
    fo := g_file_new_for_path(destpath);
    ret := g_file_copy(fi, fo, G_FILE_COPY_OVERWRITE, nil, nil, nil, @err);
    if not ret then begin
      g_printerr('Fehler beim Download: %s'#10, err^.message);
      g_clear_error(@err);
      Exit;
    end;
    g_object_unref(fi);
    g_object_unref(fo);
  end;

  procedure PrintFile;
  var
    f: PGFile;
    err: PGError = nil;
    contents: pchar;
    len: Tgsize;
  begin
    f := g_file_new_for_path(destpath);
    if g_file_load_contents(f, nil, @contents, @len, nil, @err) then begin
      g_printf('Dateiinhalt:'#10'%s'#10, contents);
      g_free(contents);
    end else begin
      g_printerr('Fehler beim Download: %s'#10, err^.message);
      g_clear_error(@err);
    end;
    g_object_unref(f);
  end;

  function main(argc: cint; argv: PPChar): cint;
  begin
    LoadFromWWW;
    PrintFile;
  end;

begin
  main(argc, argv);
end.
