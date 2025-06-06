
unit elm_scale;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_scale.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_scale.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup Elm_Scaling Widget Scaling
 * @ingroup Elementary
 *
 * Different widgets can be scaled independently. These functions
 * allow you to manipulate this scaling on a per-widget basis. The
 * object and all its children get their scaling factors multiplied
 * by the scale factor set. This is multiplicative, in that if a
 * child also has a scale size set it is in turn multiplied by its
 * parent's scale size. @c 1.0 means “don't scale”, @c 2.0 is
 * double size, @c 0.5 is half, etc.
 *
 * @ref general_functions_example_page "This" example contemplates
 * some of these functions.
  }
{*
 * Set the scaling factor for a given Elementary object
 *
 * @param obj The Elementary to operate on
 * @param scale Scale factor (from @c 0.0 up, with @c 1.0 meaning
 * no scaling)
 *
 * @ingroup Elm_Scaling
  }

procedure elm_object_scale_set(obj:PEvas_Object; scale:Tdouble);cdecl;external;
{*
 * Get the scaling factor for a given Elementary object
 *
 * @param obj The object
 * @return The scaling factor set by elm_object_scale_set()
 *
 * @ingroup Elm_Scaling
  }
(* Const before type ignored *)
function elm_object_scale_get(obj:PEvas_Object):Tdouble;cdecl;external;

implementation


end.
