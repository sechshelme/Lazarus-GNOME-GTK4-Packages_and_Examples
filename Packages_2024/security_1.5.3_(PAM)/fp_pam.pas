unit fp_pam;

interface

uses
  clib,
  fp_stdio,
  fp_shadow,
  fp_grp,
  fp_pwd;

const
  {$IFDEF linux}
  libpam = 'libpam';
  libpam_misc = 'libpam_misc';
  libpamc = 'libpamc';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_pam_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_pam_includes.inc}
{$UNDEF read_implementation}

end.
