
unit evas_ector_software_buffer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from evas_ector_software_buffer_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    evas_ector_software_buffer_eo.h
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
PEfl_Class  = ^Efl_Class;
PEvas_Ector_Software_Buffer  = ^Evas_Ector_Software_Buffer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_ECTOR_SOFTWARE_BUFFER_EO_H_}
{$define _EVAS_ECTOR_SOFTWARE_BUFFER_EO_H_}
{$ifndef _EVAS_ECTOR_SOFTWARE_BUFFER_EO_CLASS_TYPE}
{$define _EVAS_ECTOR_SOFTWARE_BUFFER_EO_CLASS_TYPE}
type
  PEvas_Ector_Software_Buffer = ^TEvas_Ector_Software_Buffer;
  TEvas_Ector_Software_Buffer = TEo;
{$endif}
{$ifndef _EVAS_ECTOR_SOFTWARE_BUFFER_EO_TYPES}
{$define _EVAS_ECTOR_SOFTWARE_BUFFER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* A buffer object wrapping an existing Evas Image_Entry.
 *
 * @ingroup Evas_Ector_Software_Buffer
  }

{ was #define dname def_expr }
function EVAS_ECTOR_SOFTWARE_BUFFER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function evas_ector_software_buffer_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EVAS_ECTOR_SOFTWARE_BUFFER_CLASS : longint; { return type might be wrong }
  begin
    EVAS_ECTOR_SOFTWARE_BUFFER_CLASS:=evas_ector_software_buffer_class_get;
  end;


end.
