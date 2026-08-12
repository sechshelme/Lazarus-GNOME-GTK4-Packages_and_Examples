unit fp_gegl;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgegl = 'libgegl';
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




  {$DEFINE read_interface}
//  {$include fp_gegl_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_gegl_includes.inc}
{$UNDEF read_implementation}

end.
