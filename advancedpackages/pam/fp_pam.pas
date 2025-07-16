unit fp_pam;

interface

uses
  clib,
  fp_stdio,
  fp_shadow,
  fp_grp,
  fp_pwd;

const
  libpam = 'libpam';
  libpam_misc = 'libpam_misc';
  libpamc = 'libpamc';


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
