program project1;

uses
  fp_glib2;

const
  serpath = 'https://example.com/index.html';
  destpath = 'index.html';

  procedure LoadFromWEB;
  var
    fin, fout: PGFile;
    err: PGError = nil;
    ret: Tgboolean;
  begin
    fin := g_file_new_for_uri(serpath);
    fout := g_file_new_for_path(destpath);
    ret := g_file_copy(fin, fout, G_FILE_COPY_OVERWRITE, nil, nil, nil, @err);
    if not ret then begin
      g_printerr('Fehler beim Download: %s'#10, err^.message);
      g_clear_error(@err);
      Exit;
    end;
    g_object_unref(fin);
    g_object_unref(fout);
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

  procedure main;
  begin
    LoadFromWEB;
    PrintFile;
  end;

begin
  main;
end.
