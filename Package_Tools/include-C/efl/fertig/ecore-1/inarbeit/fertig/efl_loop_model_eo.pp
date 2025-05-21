
unit efl_loop_model_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_loop_model_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_loop_model_eo.h
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
PEfl_Loop_Model  = ^Efl_Loop_Model;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LOOP_MODEL_EO_H_}
{$define _EFL_LOOP_MODEL_EO_H_}
{$ifndef _EFL_LOOP_MODEL_EO_CLASS_TYPE}
{$define _EFL_LOOP_MODEL_EO_CLASS_TYPE}
type
  PEfl_Loop_Model = ^TEfl_Loop_Model;
  TEfl_Loop_Model = TEo;
{$endif}
{$ifndef _EFL_LOOP_MODEL_EO_TYPES}
{$define _EFL_LOOP_MODEL_EO_TYPES}
{$endif}
{* The Efl Loop Model class
 *
 * @since 1.23
 *
 * @ingroup Efl_Loop_Model
  }

{ was #define dname def_expr }
function EFL_LOOP_MODEL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_loop_model_class_get:PEfl_Class;cdecl;external;
{*
 * @brief To be called when a Child model is created by
 * @ref efl_model_children_slice_get by the one creating the child object.
 *
 * This function is used to properly define the lifecycle of the new Child
 * Model object and make sure that once it has 0 ref except its parent Model,
 * it will be destroyed. This function should only be called once per child. It
 * is useful for @ref Efl_Model who have a lot of children and shouldn't keep
 * more than what is used in memory.
 *
 * @param[in] obj The object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Loop_Model
  }
procedure efl_loop_model_volatile_make(obj:PEo);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_LOOP_MODEL_CLASS : longint; { return type might be wrong }
  begin
    EFL_LOOP_MODEL_CLASS:=efl_loop_model_class_get;
  end;


end.
