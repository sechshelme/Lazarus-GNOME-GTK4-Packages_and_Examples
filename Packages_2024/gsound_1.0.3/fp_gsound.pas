unit fp_gsound;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgsound = 'gsound';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gsound/gsound_context.inc}
  {$include gsound/gsound_attr.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include gsound/gsound_context.inc}
{$include gsound/gsound_attr.inc}
{$UNDEF read_implementation}

end.
