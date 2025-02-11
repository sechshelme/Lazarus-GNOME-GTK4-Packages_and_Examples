unit fp_GTK4_unix_print;

//{$modeswitch typehelpers}

interface

uses
  fp_glib2, fp_cairo, fp_GTK4;

  {$IFDEF Linux}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include unix-print/gtk/print/gtkpagesetupunixdialog.inc }
  {$include unix-print/gtk/print/gtkprinter.inc }
  {$include unix-print/gtk/print/gtkprintunixdialog.inc }
  {$include unix-print/gtk/print/gtkprintjob.inc }

  {$UNDEF read_interface}

  {$ENDIF}

implementation

{$IFDEF Linux}

{$DEFINE read_implementation}
{$include unix-print/gtk/print/gtkpagesetupunixdialog.inc }
{$include unix-print/gtk/print/gtkprinter.inc }
{$include unix-print/gtk/print/gtkprintunixdialog.inc }
{$include unix-print/gtk/print/gtkprintjob.inc }
{$UNDEF read_implementation}

{$ENDIF}

end.
