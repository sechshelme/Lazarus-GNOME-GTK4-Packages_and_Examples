
unit efl_io_model;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_io_model.eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_io_model.eo.h
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
PEfl_Io_Model  = ^Efl_Io_Model;
PEina_File_Direct_Info  = ^Eina_File_Direct_Info;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_IO_MODEL_EO_H_}
{$define _EFL_IO_MODEL_EO_H_}
{$ifndef _EFL_IO_MODEL_EO_CLASS_TYPE}
{$define _EFL_IO_MODEL_EO_CLASS_TYPE}
type
  PEfl_Io_Model = ^TEfl_Io_Model;
  TEfl_Io_Model = TEo;
{$endif}
{$ifndef _EFL_IO_MODEL_EO_TYPES}
{$define _EFL_IO_MODEL_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* EflIoFilter function
 *
 * @ingroup EflIoFilter
  }
type

  TEflIoFilter = function (data:pointer; model:PEfl_Io_Model; entry:PEina_File_Direct_Info):longint;cdecl;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Efl Io model class
 *
 * Model is populated asynchronously from a monitoring thread, so values won't
 * be correct immediately.
 *
 * @ingroup Efl_Io_Model
  }

{ was #define dname def_expr }
function EFL_IO_MODEL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_io_model_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Set children filter callback.
 *
 * This function sets, along with user's private data userdata, the Eio's
 * Eio_Filter_Direct_Cb which is a mid-step before receiving the real data.
 * Once in filter callback we can decide, by returning either EINA_FALSE, to
 * abort the notification or EINA_TRUE to keep it.
 *
 * See also @ref efl_model_children_slice_get.
 *
 * @param[in] obj The object.
 * @param[in] filter Filter callback
 *
 * @ingroup Efl_Io_Model
  }
procedure efl_io_model_children_filter_set(obj:PEo; filter_data:pointer; filter:TEflIoFilter; filter_free_cb:TEina_Free_Cb);cdecl;external;
{*
 * @brief Define the root path of a model.
 *
 * Only possible during construction.
 *
 * @param[in] obj The object.
 * @param[in] path Root path of the model.
 *
 * @ingroup Efl_Io_Model
  }
(* Const before type ignored *)
procedure efl_io_model_path_set(obj:PEo; path:Pchar);cdecl;external;
{*
 * @brief Define the root path of a model.
 *
 * @param[in] obj The object.
 *
 * @return Root path of the model.
 *
 * @ingroup Efl_Io_Model
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_io_model_path_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_IO_MODEL_CLASS : longint; { return type might be wrong }
  begin
    EFL_IO_MODEL_CLASS:=efl_io_model_class_get;
  end;


end.
