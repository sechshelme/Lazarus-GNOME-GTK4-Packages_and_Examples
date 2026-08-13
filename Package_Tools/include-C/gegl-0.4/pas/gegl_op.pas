unit gegl_op;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGeglOp = type Pointer;
  {$ENDIF read_struct}


  // === Konventiert am: 12-8-26 15:08:39 ===


implementation



end.
