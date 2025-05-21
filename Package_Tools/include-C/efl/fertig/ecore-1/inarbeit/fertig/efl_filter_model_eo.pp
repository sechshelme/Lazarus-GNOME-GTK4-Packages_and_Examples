
unit efl_filter_model_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_filter_model_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_filter_model_eo.h
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
PEfl_Filter_Model  = ^Efl_Filter_Model;
PEfl_Model  = ^Efl_Model;
PEflFilterModel  = ^EflFilterModel;
PEina_Future  = ^Eina_Future;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_FILTER_MODEL_EO_H_}
{$define _EFL_FILTER_MODEL_EO_H_}
{$ifndef _EFL_FILTER_MODEL_EO_CLASS_TYPE}
{$define _EFL_FILTER_MODEL_EO_CLASS_TYPE}
type
  PEfl_Filter_Model = ^TEfl_Filter_Model;
  TEfl_Filter_Model = TEo;
{$endif}
{$ifndef _EFL_FILTER_MODEL_EO_TYPES}
{$define _EFL_FILTER_MODEL_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* EflFilterModel function
 *
 * @ingroup EflFilterModel
  }
type
  PEflFilterModel = ^TEflFilterModel;
  TEflFilterModel = function (data:pointer; parent:PEfl_Filter_Model; child:PEfl_Model):PEina_Future;cdecl;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Filtering data that @ref Efl_Model provides is the main feature of this
 * class. This class provides a filter function so only children that match it
 * are returned.
 *
 * @ingroup Efl_Filter_Model
  }

{ was #define dname def_expr }
function EFL_FILTER_MODEL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_filter_model_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Set a filter function that will catch children from the composited
 * model.
 *
 * @param[in] obj The object.
 * @param[in] filter Filter callback.
 *
 * @ingroup Efl_Filter_Model
  }
procedure efl_filter_model_filter_set(obj:PEo; filter_data:pointer; filter:TEflFilterModel; filter_free_cb:TEina_Free_Cb);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_FILTER_MODEL_CLASS : longint; { return type might be wrong }
  begin
    EFL_FILTER_MODEL_CLASS:=efl_filter_model_class_get;
  end;


end.
