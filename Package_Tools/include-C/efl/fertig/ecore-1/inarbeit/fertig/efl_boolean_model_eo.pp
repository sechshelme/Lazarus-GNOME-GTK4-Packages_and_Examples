
unit efl_boolean_model_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_boolean_model_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_boolean_model_eo.h
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
PEfl_Boolean_Model  = ^Efl_Boolean_Model;
PEfl_Class  = ^Efl_Class;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_BOOLEAN_MODEL_EO_H_}
{$define _EFL_BOOLEAN_MODEL_EO_H_}
{$ifndef _EFL_BOOLEAN_MODEL_EO_CLASS_TYPE}
{$define _EFL_BOOLEAN_MODEL_EO_CLASS_TYPE}
type
  PEfl_Boolean_Model = ^TEfl_Boolean_Model;
  TEfl_Boolean_Model = TEo;
{$endif}
{$ifndef _EFL_BOOLEAN_MODEL_EO_TYPES}
{$define _EFL_BOOLEAN_MODEL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief @ref Efl_Model that efficiently stores boolean properties (they can
 * only be @c true or @c false).
 *
 * Internally the values are stored in a compact bit buffer, taking up minimum
 * memory. An example usage is @ref Efl_Ui_Select_Model.
 *
 * @ingroup Efl_Boolean_Model
  }

{ was #define dname def_expr }
function EFL_BOOLEAN_MODEL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_boolean_model_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Adds a new named boolean property with a default value.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the new boolean property.
 * @param[in] default_value Default value for new boolean property.
 *
 * @ingroup Efl_Boolean_Model
  }
(* Const before type ignored *)
procedure efl_boolean_model_boolean_add(obj:PEo; name:Pchar; default_value:TEina_Bool);cdecl;external;
{*
 * @brief Deletes an existing named boolean property.
 *
 * @param[in] obj The object.
 * @param[in] name Name of the property to be deleted.
 *
 * @ingroup Efl_Boolean_Model
  }
(* Const before type ignored *)
procedure efl_boolean_model_boolean_del(obj:PEo; name:Pchar);cdecl;external;
{*
 * @brief Gets an iterator that will quickly find all the indices with the
 * requested value for a specific property.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the property to examine.
 * @param[in] request The value to look for.
 *
 * @return The iterator that is valid until any change is made on the model.
 *
 * @ingroup Efl_Boolean_Model
  }
(* Const before type ignored *)
function efl_boolean_model_boolean_iterator_get(obj:PEo; name:Pchar; request:TEina_Bool):PEina_Iterator;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_BOOLEAN_MODEL_CLASS : longint; { return type might be wrong }
  begin
    EFL_BOOLEAN_MODEL_CLASS:=efl_boolean_model_class_get;
  end;


end.
