
unit efl_canvas_textblock_factory_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_textblock_factory_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_textblock_factory_eo.h
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
Pchar  = ^char;
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Canvas_Textblock_Factory  = ^Efl_Canvas_Textblock_Factory;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_TEXTBLOCK_FACTORY_EO_H_}
{$define _EFL_CANVAS_TEXTBLOCK_FACTORY_EO_H_}
{$ifndef _EFL_CANVAS_TEXTBLOCK_FACTORY_EO_CLASS_TYPE}
{$define _EFL_CANVAS_TEXTBLOCK_FACTORY_EO_CLASS_TYPE}
type
  PEfl_Canvas_Textblock_Factory = ^TEfl_Canvas_Textblock_Factory;
  TEfl_Canvas_Textblock_Factory = TEo;
{$endif}
{$ifndef _EFL_CANVAS_TEXTBLOCK_FACTORY_EO_TYPES}
{$define _EFL_CANVAS_TEXTBLOCK_FACTORY_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Object factory that creates Efl.Canvas.Object objects.
 *
 * Translates a given key to an object (item), to be later placed in a text for
 * higher level usages. The translation implementation is left to be decided by
 * the inheriting class, whether it is by treating the @c key as an image path,
 * or a key associated with a real-path in a hashtable or something else
 * entirely.
 *
 * @ingroup Efl_Canvas_Textblock_Factory
  }

{ was #define dname def_expr }
function EFL_CANVAS_TEXTBLOCK_FACTORY_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_textblock_factory_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Translates a given @c key to an item object, and returns the object.
 * The returned object should be owned by the passed @c object.
 *
 * @param[in] obj The object.
 * @param[in] object The parent of the created object
 * @param[in] key Key that is associated to an item object
 *
 * @ingroup Efl_Canvas_Textblock_Factory
  }
(* Const before type ignored *)
function efl_canvas_textblock_factory_create(obj:PEo; object:PEfl_Canvas_Object; key:Pchar):PEfl_Canvas_Object;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_TEXTBLOCK_FACTORY_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_TEXTBLOCK_FACTORY_INTERFACE:=efl_canvas_textblock_factory_interface_get;
  end;


end.
