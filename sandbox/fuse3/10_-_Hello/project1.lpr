program project1;

uses
fuse_opt,
fuse_common,

cuse_lowlevel,
fuse,       // fuse_main    makro
fuse_log,
fuse_lowlevel,


  fp_fuse;


  procedure main;
  begin
  end;

begin

  fuse_new
  fuse_loop_mt
  fuse_parse_cmdline
  fuse_session_loop_mt
  main;
end.
