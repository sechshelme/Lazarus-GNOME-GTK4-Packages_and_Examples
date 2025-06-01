
unit efl_ui_relative_container_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_relative_container_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    efl_ui_relative_container_eo.h
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
PEfl_Gfx_Align  = ^Efl_Gfx_Align;
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEfl_Ui_Relative_Container  = ^Efl_Ui_Relative_Container;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_RELATIVE_CONTAINER_EO_H_}
{$define _EFL_UI_RELATIVE_CONTAINER_EO_H_}
{$ifndef _EFL_UI_RELATIVE_CONTAINER_EO_CLASS_TYPE}
{$define _EFL_UI_RELATIVE_CONTAINER_EO_CLASS_TYPE}
type
  PEfl_Ui_Relative_Container = ^TEfl_Ui_Relative_Container;
  TEfl_Ui_Relative_Container = TEo;
{$endif}
{$ifndef _EFL_UI_RELATIVE_CONTAINER_EO_TYPES}
{$define _EFL_UI_RELATIVE_CONTAINER_EO_TYPES}
{$endif}
{*
 * @brief The relative container class.
 *
 * A relative container calculates the size and position of all the children
 * based on their relationship to each other.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Relative_Container
  }

{ was #define dname def_expr }
function EFL_UI_RELATIVE_CONTAINER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_relative_container_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Specifies the left side edge of the @c child object relative to the
 * @c base object. When @c relative_position is 0 the left edges of the two
 * objects are aligned. When @c relative_position is 1 the left edge of the
 * @c child object is aligned to the right edge of the @c base object.
 *
 * @param[in] obj The object.
 * @param[in] child The child object whose size and position is being changed.
 * @param[in] base The object whose size and position is being used as
 * reference. @c NULL means that the container object is used (this is the
 * default value).
 * @param[in] relative_position The ratio between left and right of the base,
 * ranging from 0.0 to 1.0.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Relative_Container
  }
procedure efl_ui_relative_container_relation_left_set(obj:PEo; child:PEfl_Gfx_Entity; base:PEfl_Gfx_Entity; relative_position:TEfl_Gfx_Align);cdecl;external;
{*
 * @brief Specifies the left side edge of the @c child object relative to the
 * @c base object. When @c relative_position is 0 the left edges of the two
 * objects are aligned. When @c relative_position is 1 the left edge of the
 * @c child object is aligned to the right edge of the @c base object.
 *
 * @param[in] obj The object.
 * @param[in] child The child object whose size and position is being changed.
 * @param[out] base The object whose size and position is being used as
 * reference. @c NULL means that the container object is used (this is the
 * default value).
 * @param[out] relative_position The ratio between left and right of the base,
 * ranging from 0.0 to 1.0.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Relative_Container
  }
(* Const before type ignored *)
procedure efl_ui_relative_container_relation_left_get(obj:PEo; child:PEfl_Gfx_Entity; base:PPEfl_Gfx_Entity; relative_position:PEfl_Gfx_Align);cdecl;external;
{*
 * @brief Specifies the right side edge of the @c child object relative to the
 * @c base object. When @c relative_position is 0 the right edge of the
 * @c child object is aligned to the left edge of the @c base object. When
 * @c relative_position is 1 the right edges of the two objects are aligned.
 *
 * @param[in] obj The object.
 * @param[in] child The child object whose size and position is being changed.
 * @param[in] base The object whose size and position is being used as
 * reference. @c NULL means that the container object is used (this is the
 * default value).
 * @param[in] relative_position The ratio between left and right of the base,
 * ranging from 0.0 to 1.0.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Relative_Container
  }
procedure efl_ui_relative_container_relation_right_set(obj:PEo; child:PEfl_Gfx_Entity; base:PEfl_Gfx_Entity; relative_position:TEfl_Gfx_Align);cdecl;external;
{*
 * @brief Specifies the right side edge of the @c child object relative to the
 * @c base object. When @c relative_position is 0 the right edge of the
 * @c child object is aligned to the left edge of the @c base object. When
 * @c relative_position is 1 the right edges of the two objects are aligned.
 *
 * @param[in] obj The object.
 * @param[in] child The child object whose size and position is being changed.
 * @param[out] base The object whose size and position is being used as
 * reference. @c NULL means that the container object is used (this is the
 * default value).
 * @param[out] relative_position The ratio between left and right of the base,
 * ranging from 0.0 to 1.0.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Relative_Container
  }
(* Const before type ignored *)
procedure efl_ui_relative_container_relation_right_get(obj:PEo; child:PEfl_Gfx_Entity; base:PPEfl_Gfx_Entity; relative_position:PEfl_Gfx_Align);cdecl;external;
{*
 * @brief Specifies the top side edge of the @c child object relative to the
 * @c base object. When @c relative_position is 0 the top edges of the two
 * objects are aligned. When @c relative_position is 1 the top edge of the
 * @c child object is aligned to the bottom edge of the @c base object.
 *
 * @param[in] obj The object.
 * @param[in] child The child object whose size and position is being changed.
 * @param[in] base The object whose size and position is being used as
 * reference. @c NULL means that the container object is used (this is the
 * default value).
 * @param[in] relative_position The ratio between top and bottom of the base,
 * ranging from 0.0 to 1.0.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Relative_Container
  }
procedure efl_ui_relative_container_relation_top_set(obj:PEo; child:PEfl_Gfx_Entity; base:PEfl_Gfx_Entity; relative_position:TEfl_Gfx_Align);cdecl;external;
{*
 * @brief Specifies the top side edge of the @c child object relative to the
 * @c base object. When @c relative_position is 0 the top edges of the two
 * objects are aligned. When @c relative_position is 1 the top edge of the
 * @c child object is aligned to the bottom edge of the @c base object.
 *
 * @param[in] obj The object.
 * @param[in] child The child object whose size and position is being changed.
 * @param[out] base The object whose size and position is being used as
 * reference. @c NULL means that the container object is used (this is the
 * default value).
 * @param[out] relative_position The ratio between top and bottom of the base,
 * ranging from 0.0 to 1.0.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Relative_Container
  }
(* Const before type ignored *)
procedure efl_ui_relative_container_relation_top_get(obj:PEo; child:PEfl_Gfx_Entity; base:PPEfl_Gfx_Entity; relative_position:PEfl_Gfx_Align);cdecl;external;
{*
 * @brief Specifies the bottom side edge of the @c child object relative to the
 * @c base object. When @c relative_position is 0 the bottom edge of the
 * @c child object is aligned to the top edge of the @c base object. When
 * @c relative_position is 1 the bottom edges of the two objects are aligned.
 *
 * @param[in] obj The object.
 * @param[in] child The child object whose size and position is being changed.
 * @param[in] base The object whose size and position is being used as
 * reference. @c NULL means that the container object is used (this is the
 * default value).
 * @param[in] relative_position The ratio between top and bottom of the base,
 * ranging from 0.0 to 1.0.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Relative_Container
  }
procedure efl_ui_relative_container_relation_bottom_set(obj:PEo; child:PEfl_Gfx_Entity; base:PEfl_Gfx_Entity; relative_position:TEfl_Gfx_Align);cdecl;external;
{*
 * @brief Specifies the bottom side edge of the @c child object relative to the
 * @c base object. When @c relative_position is 0 the bottom edge of the
 * @c child object is aligned to the top edge of the @c base object. When
 * @c relative_position is 1 the bottom edges of the two objects are aligned.
 *
 * @param[in] obj The object.
 * @param[in] child The child object whose size and position is being changed.
 * @param[out] base The object whose size and position is being used as
 * reference. @c NULL means that the container object is used (this is the
 * default value).
 * @param[out] relative_position The ratio between top and bottom of the base,
 * ranging from 0.0 to 1.0.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Relative_Container
  }
(* Const before type ignored *)
procedure efl_ui_relative_container_relation_bottom_get(obj:PEo; child:PEfl_Gfx_Entity; base:PPEfl_Gfx_Entity; relative_position:PEfl_Gfx_Align);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_RELATIVE_CONTAINER_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_RELATIVE_CONTAINER_CLASS:=efl_ui_relative_container_class_get;
  end;


end.
