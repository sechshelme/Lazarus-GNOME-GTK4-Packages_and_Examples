{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_libc_packages;

{$warn 5023 off : no warning about unused units}
interface

uses
  clib, fp_termios, fp_netdb, fp_unistd, fp_socket, fp_fcntl, fp_stdlib, 
  fp_string, fp_strings, fp_pwd, fp_grp, fp_ioctl, fp_signal, fp_stdio, 
  fp_shadow, fp_inotify, fp_errno, fp_error, fp_pidfd, fp_getopt, fp_argp, 
  fp_time, fp_ctype, fp_locale, fp_setjmp, fp_fenv, fp_complex, fp_math, 
  fp_netinet, fp_libc_tools, fp_net, fp_ifaddrs, fp_arpa, fp_wchar, fp_stat, 
  fp_poll, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_libc_packages', @Register);
end.
