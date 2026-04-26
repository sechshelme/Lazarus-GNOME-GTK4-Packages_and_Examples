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


  type
  PVipsImage=Pointer;
  PPVipsImage=^PVipsImage;
  PVipsRegion=Pointer;
  PPVipsRegion=^PVipsRegion;
  PVipsPel=Pointer;
  PVipsSource=Pointer;
  PVipsTarget=Pointer;
  PVipsArrayImage=Pointer;
  PVipsRect=Pointer;
  PVipsBlob=Pointer;
  PPVipsBlob=^PVipsBlob;

  TVipsObjectClass=Pointer;
  TVipsObject=Pointer;

  TVipsCoding=Integer;
  TVipsBandFormat=Integer;
  TVipsPrecision=Integer;
  TVipsInterpretation=Integer;
  TVipsOperationBoolean=Integer;

  TVipsCallbackFn=Pointer;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


implementation


end.

