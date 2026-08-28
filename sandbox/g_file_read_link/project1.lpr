program project1;

uses
  fp_glib2;

  procedure main;
  var
    mypath: Pgchar;
    err: PGError=nil;
  begin
    mypath := g_file_read_link('/proc/self/exe', @err);
    g_printf('path: %s'#10, mypath);
    mypath := g_file_read_link('/usr/bin/bash', @err);
    g_printf('path: %s'#10, mypath);
    WriteLn('paramstr(⁾ ', ParamStr(0));
    WriteLn('argv[0]: ', argv[0]);
  end;

begin
  main;
end.
