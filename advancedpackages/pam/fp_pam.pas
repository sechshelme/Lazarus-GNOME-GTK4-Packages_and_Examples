unit fp_pam;

interface

const
  libpam = 'libpam';
  libpam_misc = 'libpam_misc';
  libpamc = 'libpamc';

type
  Ttime_t = uint64;
  Tva_list = Pointer;

type  // /usr/include/unistd.h
  Tuid_t = uint32;
  Tgid_t = uint32;
  Pgid_t = ^Tgid_t;

type  // /usr/include/pwd.h
  Ppasswd = Pointer;

type  // /usr/include/grp.h
  Pgroup = Pointer;

type  // /usr/include/shadow.h
  Pspwd = Pointer;


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
