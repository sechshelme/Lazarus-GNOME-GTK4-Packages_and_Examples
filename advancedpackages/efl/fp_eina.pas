unit fp_eina;

interface

  uses
    efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_eina_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_eina_includes.inc}
{$UNDEF read_implementation}

end.

