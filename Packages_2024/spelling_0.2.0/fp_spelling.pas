unit fp_spelling;

interface

uses
  fp_glib2, fp_GTK4, fp_gtksourceview;

const
  {$IFDEF Linux}
  libspelling = 'spelling-1';
  {$ENDIF}

  {$IFDEF Windows}
  libspelling = 'libspelling-1-2.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include spelling/spelling_language.inc}
  {$include spelling/spelling_provider.inc}
  {$include spelling/spelling_checker.inc}
  {$include spelling/spelling_init.inc}
  {$include spelling/spelling_language_info.inc}
  {$include spelling/spelling_text_buffer_adapter.inc}
  {$include spelling/spelling_version.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include spelling/spelling_language.inc}
{$include spelling/spelling_provider.inc}
{$include spelling/spelling_checker.inc}
{$include spelling/spelling_init.inc}
{$include spelling/spelling_language_info.inc}
{$include spelling/spelling_text_buffer_adapter.inc}
{$include spelling/spelling_version.inc}
{$UNDEF read_implementation}

end.
