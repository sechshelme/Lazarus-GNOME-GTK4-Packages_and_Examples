
unit efl_container_model_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_container_model_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_container_model_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Container_Model  = ^Efl_Container_Model;
PEina_Iterator  = ^Eina_Iterator;
PEina_Value_Type  = ^Eina_Value_Type;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CONTAINER_MODEL_EO_H_}
{$define _EFL_CONTAINER_MODEL_EO_H_}
{$ifndef _EFL_CONTAINER_MODEL_EO_CLASS_TYPE}
{$define _EFL_CONTAINER_MODEL_EO_CLASS_TYPE}
type
  PEfl_Container_Model = ^TEfl_Container_Model;
  TEfl_Container_Model = TEo;
{$endif}
{$ifndef _EFL_CONTAINER_MODEL_EO_TYPES}
{$define _EFL_CONTAINER_MODEL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Class used to create data models from Eina containers.
 *
 * Each container supplied represents a series of property values, each item
 * being the property value for a child object.
 *
 * The data in the given containers are copied and stored internally.
 *
 * Several containers can be supplied and the number of allocated children is
 * based on the container of the largest size.
 *
 * @ingroup Efl_Container_Model
  }

{ was #define dname def_expr }
function EFL_CONTAINER_MODEL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_container_model_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Gets the type of the given property.
 *
 * @param[in] obj The object.
 * @param[in] name Property name
 *
 * @return Property type
 *
 * @ingroup Efl_Container_Model
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_container_model_child_property_value_type_get(obj:PEo; name:Pchar):PEina_Value_Type;cdecl;external;
{*
 * @brief Adds the given property to child objects and supply the values.
 *
 * Each item will represent the value of the given property in the respective
 * child within the data model.
 *
 * New children objects are allocated as necessary.
 *
 * Value type is required for compatibility with the @ref Efl_Model API.
 *
 * @param[in] obj The object.
 * @param[in] name Property name
 * @param[in] type Property type
 * @param[in] values Values to be added
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Container_Model
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_container_model_child_property_add(obj:PEo; name:Pchar; _type:PEina_Value_Type; values:PEina_Iterator):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CONTAINER_MODEL_CLASS : longint; { return type might be wrong }
  begin
    EFL_CONTAINER_MODEL_CLASS:=efl_container_model_class_get;
  end;


end.
