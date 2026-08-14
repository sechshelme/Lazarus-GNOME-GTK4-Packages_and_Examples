unit fp_gegl;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgegl = 'gegl-0.4';
  {$ENDIF}

  {$IFDEF Windows}
  libgegl = 'libgegl-0.4-0.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  type
  PBabl=type Pointer;    // #include <babl/babl.h>

// =====

PGeglBuffer = type Pointer;
PGeglSampler = type Pointer;

// --- zum entfernen
//PGeglTileBackend=Pointer;



{$DEFINE read_enum}
{$include fp_gegl_includes.inc}
{$UNDEF read_enum}

{$DEFINE read_struct}
{$include fp_gegl_includes.inc}
{$UNDEF read_struct}

{$DEFINE read_function}
{$include fp_gegl_includes.inc}
{$UNDEF read_function}

implementation

{$DEFINE read_implementation}
{$include fp_gegl_includes.inc}
{$UNDEF read_implementation}

end.
