unit fp_vips;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libvips = 'vips';
  {$ENDIF}

  {$IFDEF Windows}
  libvips = 'libvips-42.dll';
  {$ENDIF}

  type
  Tsize_t=SizeUInt;
  Psize_t=^Tsize_t;

  Toff_t=SizeInt;


//  type
//  PVipsRegion=Pointer;  // Kreuzverbunden
//  PPVipsRegion=^PVipsRegion;   // Kreuzverbunden

//  PVipsTarget=Pointer;  // sollte nachher gehen


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_enum}
  {$include fp_vips_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  {$include fp_vips_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  {$include fp_vips_includes.inc}
  {$UNDEF read_function}

implementation

{$DEFINE read_implementation}
{$include fp_vips_includes.inc}
{$UNDEF read_implementation}


end.

