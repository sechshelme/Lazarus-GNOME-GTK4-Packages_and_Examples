unit fp_peas2;

interface

uses
  fp_glib2, fp_gmodule;

const
  {$IFDEF linux}
  libpeas2 = 'libpeas-2';
  {$ENDIF}

  {$IFDEF windows}
  libpeas2 = 'libpeas-2-0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {$DEFINE read_interface}
  {$include peas2/peas_plugin_info.inc}
  {$include peas2/peas_engine.inc}
  {$include peas2/peas_extension_base.inc}
  {$include peas2/peas_extension_set.inc}
  {$include peas2/peas_object_module.inc}
  {$include peas2/peas_version.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include peas2/peas_plugin_info.inc}
{$include peas2/peas_engine.inc}
{$include peas2/peas_extension_base.inc}
{$include peas2/peas_extension_set.inc}
{$include peas2/peas_object_module.inc}
{$include peas2/peas_version.inc}
{$UNDEF read_interface}
end.
