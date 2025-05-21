
unit efl_composite_model_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_composite_model_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_composite_model_eo.h
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
PEfl_Composite_Model  = ^Efl_Composite_Model;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_COMPOSITE_MODEL_EO_H_}
{$define _EFL_COMPOSITE_MODEL_EO_H_}
{$ifndef _EFL_COMPOSITE_MODEL_EO_CLASS_TYPE}
{$define _EFL_COMPOSITE_MODEL_EO_CLASS_TYPE}
type
  PEfl_Composite_Model = ^TEfl_Composite_Model;
  TEfl_Composite_Model = TEo;
{$endif}
{$ifndef _EFL_COMPOSITE_MODEL_EO_TYPES}
{$define _EFL_COMPOSITE_MODEL_EO_TYPES}
{$endif}
{*
 * @brief Efl model for all composite class which provide a unified API to set
 * source of data.
 *
 * This class also provide an @ref efl_model_property_get "child.index" that
 * match the value of @ref efl_composite_model_index_get.
 *
 * @since 1.23
 *
 * @ingroup Efl_Composite_Model
  }

{ was #define dname def_expr }
function EFL_COMPOSITE_MODEL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_composite_model_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Position of this object in the parent model.
 *
 * It can only be set before the object is finalized but after the Model it
 * composes is set (and only if that Model does not provide an index already).
 * It can only be retrieved after the object has been finalized.
 *
 * @param[in] obj The object.
 * @param[in] index Index of the object in the parent model. The index is
 * unique and starts from zero.
 *
 * @since 1.23
 *
 * @ingroup Efl_Composite_Model
  }
procedure efl_composite_model_index_set(obj:PEo; index:dword);cdecl;external;
{*
 * @brief Position of this object in the parent model.
 *
 * It can only be set before the object is finalized but after the Model it
 * composes is set (and only if that Model does not provide an index already).
 * It can only be retrieved after the object has been finalized.
 *
 * @param[in] obj The object.
 *
 * @return Index of the object in the parent model. The index is unique and
 * starts from zero.
 *
 * @since 1.23
 *
 * @ingroup Efl_Composite_Model
  }
(* Const before type ignored *)
function efl_composite_model_index_get(obj:PEo):dword;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_COMPOSITE_MODEL_CLASS : longint; { return type might be wrong }
  begin
    EFL_COMPOSITE_MODEL_CLASS:=efl_composite_model_class_get;
  end;


end.
