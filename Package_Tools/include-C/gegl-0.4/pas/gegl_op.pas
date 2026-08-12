unit gegl_op;

interface

uses
  fp_glib2, fp_gegl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PGeglOp = ^TGeglOp;
  TGeglOp = record
      parent_instance : TGEGL_OP_Parent;
      properties : Tgpointer;
    end;


// === Konventiert am: 12-8-26 15:08:39 ===


implementation



end.
