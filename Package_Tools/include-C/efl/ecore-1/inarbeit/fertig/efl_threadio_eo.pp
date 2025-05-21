
unit efl_threadio_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_threadio_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_threadio_eo.h
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
PEfl_Event  = ^Efl_Event;
PEfl_ThreadIO  = ^Efl_ThreadIO;
PEflThreadIOCallSync  = ^EflThreadIOCallSync;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_THREADIO_EO_H_}
{$define _EFL_THREADIO_EO_H_}
{$ifndef _EFL_THREADIO_EO_CLASS_TYPE}
{$define _EFL_THREADIO_EO_CLASS_TYPE}
type
  PEfl_ThreadIO = ^TEfl_ThreadIO;
  TEfl_ThreadIO = TEo;
{$endif}
{$ifndef _EFL_THREADIO_EO_TYPES}
{$define _EFL_THREADIO_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* A Function to be called asynchronously on a different thread.
 *
 * @ingroup EflThreadIOCall
  }
(* Const before type ignored *)
type

  TEflThreadIOCall = procedure (data:pointer; event:PEfl_Event);cdecl;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* A Function to be called synchronously on another thread. Execution will be
 * stopped until this function returns and its return value can be recovered.
 *
 * @ingroup EflThreadIOCallSync
  }
(* Const before type ignored *)
type
  PEflThreadIOCallSync = ^TEflThreadIOCallSync;
  TEflThreadIOCallSync = function (data:pointer; event:PEfl_Event):pointer;cdecl;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* This mixin defines input and output pointers to allow exchanging data with
 * another thread. It also defines a mechanism to call methods on that thread.
 *
 * @ingroup Efl_ThreadIO
  }

{ was #define dname def_expr }
function EFL_THREADIO_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_threadio_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief Input data pointer for the thread.
 *
 * @param[in] obj The object.
 * @param[in] data Data pointer.
 *
 * @ingroup Efl_ThreadIO
  }
procedure efl_threadio_indata_set(obj:PEo; data:pointer);cdecl;external;
{*
 * @brief Input data pointer for the thread.
 *
 * @param[in] obj The object.
 *
 * @return Data pointer.
 *
 * @ingroup Efl_ThreadIO
  }
(* Const before type ignored *)
function efl_threadio_indata_get(obj:PEo):pointer;cdecl;external;
{*
 * @brief Output data pointer for the thread.
 *
 * @param[in] obj The object.
 * @param[in] data Data pointer.
 *
 * @ingroup Efl_ThreadIO
  }
procedure efl_threadio_outdata_set(obj:PEo; data:pointer);cdecl;external;
{*
 * @brief Output data pointer for the thread.
 *
 * @param[in] obj The object.
 *
 * @return Data pointer.
 *
 * @ingroup Efl_ThreadIO
  }
(* Const before type ignored *)
function efl_threadio_outdata_get(obj:PEo):pointer;cdecl;external;
{*
 * @brief Executes a method on a different thread, asynchronously.
 *
 * @param[in] obj The object.
 * @param[in] func The method to execute asynchronously.
 *
 * @ingroup Efl_ThreadIO
  }
procedure efl_threadio_call(obj:PEo; func_data:pointer; func:TEflThreadIOCall; func_free_cb:TEina_Free_Cb);cdecl;external;
{*
 * @brief Executes a method on a different thread, synchronously. This call
 * will not return until the method finishes and its return value can be
 * recovered.
 *
 * @param[in] obj The object.
 * @param[in] func The method to execute synchronously.
 *
 * @return The return value from the method.
 *
 * @ingroup Efl_ThreadIO
  }
function efl_threadio_call_sync(obj:PEo; func_data:pointer; func:TEflThreadIOCallSync; func_free_cb:TEina_Free_Cb):pointer;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_THREADIO_MIXIN : longint; { return type might be wrong }
  begin
    EFL_THREADIO_MIXIN:=efl_threadio_mixin_get;
  end;


end.
