unit fp_fuse3;

interface

uses
  clib, fp_socket, fp_stat;

const
  {$IFDEF linux}
  libfuse3 = 'libfuse3';
  {$ENDIF}

  {$IFDEF windows}
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tva_list = Pointer;

  Tmode_t = Pointer;


  Pflock = Pointer;
  Pstatvfs = Pointer;


  {$DEFINE read_interface}
  {$include fuse3/fuse_opt.inc}
  {$include fuse3/fuse_common.inc}
  {$include fuse3/fuse.inc}
  {$include fuse3/fuse_log.inc}
  {$include fuse3/fuse_lowlevel.inc}
  {$include fuse3/cuse_lowlevel.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fuse3/fuse_opt.inc}
{$include fuse3/fuse_common.inc}
{$include fuse3/fuse.inc}
{$include fuse3/fuse_log.inc}
{$include fuse3/fuse_lowlevel.inc}
{$include fuse3/cuse_lowlevel.inc}
{$UNDEF read_interface}
end.
