unit fp_xmlb;


interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF linux}
  libxmlb = 'libxmlb';
  {$ENDIF}

  {$IFDEF windows}
  libxmlb = 'libxmlb-2.dll';
  {$ENDIF}

  {$DEFINE read_interface}
//  {$include fp_xmlb_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_xmlb_includes.inc}
{$UNDEF read_implementation}

end.
