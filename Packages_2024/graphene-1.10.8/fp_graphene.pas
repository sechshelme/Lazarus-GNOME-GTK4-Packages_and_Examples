unit fp_graphene;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgraphene = 'libgraphene-1.0';
  {$ENDIF}

  {$IFDEF Windows}
  libgraphene = 'libgraphene-1.0-0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_graphene_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_graphene_includes.inc}
{$UNDEF read_implementation}

end.
