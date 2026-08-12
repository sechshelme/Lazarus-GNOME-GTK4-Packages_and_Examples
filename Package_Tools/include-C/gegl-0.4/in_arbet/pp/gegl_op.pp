
unit gegl_op;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_op.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_op.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGeglOp  = ^GeglOp;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PGeglOp = ^TGeglOp;
  TGeglOp = record
      parent_instance : TGEGL_OP_Parent;
      properties : Tgpointer;
    end;


implementation


end.
