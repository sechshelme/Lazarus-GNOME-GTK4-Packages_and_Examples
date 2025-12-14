program project1;

uses
  fp_gs;

  procedure main;
  const
    in_pdf = '/home/tux/Downloads/Ei.pdf';
    out_png = '/tmp/test.png';

    gs_argv: array of pchar = (
      'gs',
      '-dNOPAUSE',
      '-dBATCH',
      '-sDEVICE=png16m',
      '-sOutputFile=' + out_png,
      in_pdf);

  var
    code: longint;
    gs_instance: Pointer = nil;
  begin
    code := gsapi_new_instance(@gs_instance, nil);
    if code < 0 then begin
      WriteLn('Failed to create Ghostscript instance');
      Exit;
    end;

    code := gsapi_init_with_args(gs_instance, Length(gs_argv), PPChar(gs_argv));
    if code < 0 then begin
      WriteLn('Ghostscript initialization failed');
      gsapi_exit(gs_instance);
      gsapi_delete_instance(gs_instance);
      Exit;
    end;

    gsapi_exit(gs_instance);
    gsapi_delete_instance(gs_instance);

    WriteLn('Rendering done. Output: ', out_png);
    Exit;
  end;

begin
  main;
end.
