unit fp_json_glib;

interface

uses
  fp_glib2;

const
  {$IFDEF linux}
  libjsonglib = 'json-glib-1.0';
  {$ENDIF}

  {$IFDEF windows}
  libjsonglib = 'libjson-glib-1.0-0.dll';
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_json_glib_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_json_glib_includes.inc}
{$UNDEF read_implementation}

end.
