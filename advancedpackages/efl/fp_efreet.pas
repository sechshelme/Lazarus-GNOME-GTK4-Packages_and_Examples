unit fp_efreet;

interface

uses
  efl,
  fp_eina,
  fp_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$DEFINE read_interface}
  {$include efreet-1/efreet_base.inc}                  // io.
  {$include efreet-1/efreet_ini.inc}                   // io.
  {$include efreet-1/efreet_desktop.inc}               // io. -> efreet_ini
  {$include efreet-1/efreet_menu.inc}                  // io. -> efreet_desktop
  {$include efreet-1/efreet_utils.inc}                 // io. -> efreet_desktop
  {$include efreet-1/efreet_icon.inc}                  // io.
  {$include efreet-1/efreet_uri.inc}                   // io.
  {$include efreet-1/Efreet.inc}                       // io.
  {$include efreet-1/Efreet_Trash.inc}                 // io. -> efreet_uri
  {$include efreet-1/Efreet_Mime.inc}                  // io.
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
  {$include efreet-1/efreet_base.inc}                  // io.
  {$include efreet-1/efreet_ini.inc}                   // io.
  {$include efreet-1/efreet_desktop.inc}               // io. -> efreet_ini
  {$include efreet-1/efreet_menu.inc}                  // io. -> efreet_desktop
  {$include efreet-1/efreet_utils.inc}                 // io. -> efreet_desktop
  {$include efreet-1/efreet_icon.inc}                  // io.
  {$include efreet-1/efreet_uri.inc}                   // io.
  {$include efreet-1/Efreet.inc}                       // io.
  {$include efreet-1/Efreet_Trash.inc}                 // io. -> efreet_uri
  {$include efreet-1/Efreet_Mime.inc}                  // io.
{$UNDEF read_implementation}

end.

