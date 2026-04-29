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


  type
  PVipsRegion=Pointer;  // Kreuzverbunden
  PPVipsRegion=^PVipsRegion;   // Kreuzverbunden

  PVipsTarget=Pointer;  // sollte nachher gehen


  TVipsOperation=Pointer;
  TVipsOperationCLass=Pointer;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


implementation


end.

