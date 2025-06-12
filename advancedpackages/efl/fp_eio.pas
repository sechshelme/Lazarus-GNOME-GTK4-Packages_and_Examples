unit fp_eio;

interface

uses
  efl, fp_eina, fp_eo, fp_eet;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
  {$include eio-1/Eio.inc}
  {$include eio-1/Eio_Legacy.inc}
  {$include eio-1/eio_sentry_eo.inc}
  {$include eio-1/efl_io_manager_eo.inc}
  {$include eio-1/efl_io_model_eo.inc}
  {$include eio-1/eio_inline_helper.inc}
{$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
  {$include eio-1/Eio.inc}
  {$include eio-1/Eio_Legacy.inc}
  {$include eio-1/eio_sentry_eo.inc}
  {$include eio-1/efl_io_manager_eo.inc}
  {$include eio-1/efl_io_model_eo.inc}
  {$include eio-1/eio_inline_helper.inc}
{$UNDEF read_implementation}

end.

