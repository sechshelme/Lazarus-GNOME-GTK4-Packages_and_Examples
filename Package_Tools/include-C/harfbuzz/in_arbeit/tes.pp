
unit tes;
interface

{
  Automatically converted by H2Pas 1.0.0 from tes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    tes.h
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
Phb_language_impl_t  = ^hb_language_impl_t;
Phb_language_t  = ^hb_language_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(* Const before type ignored *)
type
  Phb_language_t = ^Thb_language_t;
  Thb_language_t = Phb_language_impl_t;

implementation


end.
