unit fp_eo;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}

{$include eo-1/Eo.inc}                                                   // io. -> efl_object_eo     ( Extern inline fehlen für inline )
{$include eo-1/efl_class_eo.inc}                                         // io.
{$include eo-1/efl_object_eo.inc}                                        // io.
{$include eo-1/efl_object_override_eo.inc}                               // io.

{$UNDEF read_interface}


implementation

{$DEFINE read_implementation}

{$include eo-1/Eo.inc}                                                   // io. -> efl_object_eo     ( Extern inline fehlen für inline )
{$include eo-1/efl_class_eo.inc}                                         // io.
{$include eo-1/efl_object_eo.inc}                                        // io.
{$include eo-1/efl_object_override_eo.inc}                               // io.

{$UNDEF read_implementation}

end.

