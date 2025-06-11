unit fp_chafa;

interface

uses
  fp_glib2;


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}
{$MACRO ON}

{$DEFINE includes:=
  {$include chafa/chafa_common.inc}
  {$include chafa/chafa_version_macros.inc}
  {$include chafa/chafa_symbol_map.inc}
  {$include chafa/chafa_canvas_config.inc}
  {$include chafa/chafa_term_info.inc}
  {$include chafa/chafa_frame.inc}
  {$include chafa/chafa_image.inc}
  {$include chafa/chafa_placement.inc}
  {$include chafa/chafa_canvas.inc}
  {$include chafa/chafa_features.inc}
  {$include chafa/chafa_term_db.inc}
  {$include chafa/chafa_util.inc}
}


{$DEFINE read_interface}
includes
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
includes
{$UNDEF read_implementation}

end.

