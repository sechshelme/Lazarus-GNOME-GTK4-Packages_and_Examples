
unit ecore_con_eet_base_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_con_eet_base_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_con_eet_base_eo.h
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
PEcore_Con_Eet_Base  = ^Ecore_Con_Eet_Base;
PEcore_Con_Reply  = ^Ecore_Con_Reply;
PEcore_Con_Server  = ^Ecore_Con_Server;
PEet_Data_Descriptor  = ^Eet_Data_Descriptor;
PEfl_Class  = ^Efl_Class;
PEina_Binbuf  = ^Eina_Binbuf;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_CON_EET_BASE_EO_H_}
{$define _ECORE_CON_EET_BASE_EO_H_}
{$ifndef _ECORE_CON_EET_BASE_EO_CLASS_TYPE}
{$define _ECORE_CON_EET_BASE_EO_CLASS_TYPE}
type
  PEcore_Con_Eet_Base = ^TEcore_Con_Eet_Base;
  TEcore_Con_Eet_Base = TEo;
{$endif}
{$ifndef _ECORE_CON_EET_BASE_EO_TYPES}
{$define _ECORE_CON_EET_BASE_EO_TYPES}
{* Ecore connection reply data structure
 *
 * @ingroup Ecore_Con
  }
type
{$endif}
{*
 * @brief Ecore Connection Eet Base class.
 *
 * This class provides Eet data serialization features to Ecore Connection
 * objects.
 *
 * @ingroup Ecore_Con_Eet_Base
  }

{ was #define dname def_expr }
function ECORE_CON_EET_BASE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function ecore_con_eet_base_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The server object to which we send and receive.
 *
 * @param[in] obj The object.
 * @param[in] data Server object
 *
 * @ingroup Ecore_Con_Eet_Base
  }
procedure ecore_con_eet_base_server_set(obj:PEo; data:PEcore_Con_Server);cdecl;external;
{*
 * @brief The server object to which we send and receive.
 *
 * @param[in] obj The object.
 *
 * @return Server object
 *
 * @ingroup Ecore_Con_Eet_Base
  }
(* Const before type ignored *)
function ecore_con_eet_base_server_get(obj:PEo):PEcore_Con_Server;cdecl;external;
{*
 * @brief A callback function which should be called when data is received by
 * ecore_con_eet_object.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the eet stream.
 * @param[in] func The callback function.
 * @param[in] data The data (if any) that should be passed to callback
 * function.
 *
 * @ingroup Ecore_Con_Eet_Base
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_con_eet_base_data_callback_set(obj:PEo; name:Pchar; func:TEcore_Con_Eet_Data_Cb; data:pointer);cdecl;external;
{*
 * @brief A callback function which should be calledn when raw data is received
 * by ecore_con_eet_object.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the eet stream.
 * @param[in] func The callback function.
 * @param[in] data The data (if any) that should be passed to callback
 * function.
 *
 * @ingroup Ecore_Con_Eet_Base
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_con_eet_base_raw_data_callback_set(obj:PEo; name:Pchar; func:TEcore_Con_Eet_Raw_Data_Cb; data:pointer);cdecl;external;
{*
 * @brief Function to delete the @ref ecore_con_eet_base_data_callback_set.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the eet stream.
 *
 * @ingroup Ecore_Con_Eet_Base
  }
(* Const before type ignored *)
procedure ecore_con_eet_base_data_callback_del(obj:PEo; name:Pchar);cdecl;external;
{*
 * @brief Function to delete the @ref ecore_con_eet_base_raw_data_callback_set.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the eet stream.
 *
 * @ingroup Ecore_Con_Eet_Base
  }
(* Const before type ignored *)
procedure ecore_con_eet_base_raw_data_callback_del(obj:PEo; name:Pchar);cdecl;external;
{*
 * @brief Function to register a @ref Eet.Data.Descriptor to the ecore_con_eet
 * object.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the eet stream.
 * @param[in] edd The Eet.Data.Descriptor that is to be registered.
 *
 * @ingroup Ecore_Con_Eet_Base
  }
(* Const before type ignored *)
procedure ecore_con_eet_base_register(obj:PEo; name:Pchar; edd:PEet_Data_Descriptor);cdecl;external;
{*
 * @brief Function to send data.
 *
 * @param[in] obj The object.
 * @param[in] reply Contains the ecore_con_eet object to which the data has to
 * be sent.
 * @param[in] name The name of the eet stream.
 * @param[in] value Actual data
 *
 * @ingroup Ecore_Con_Eet_Base
  }
(* Const before type ignored *)
procedure ecore_con_eet_base_send(obj:PEo; reply:PEcore_Con_Reply; name:Pchar; value:pointer);cdecl;external;
{*
 * @brief Function to send raw data.
 *
 * @param[in] obj The object.
 * @param[in] reply Contains the ecore_con_eet object to which the data has to
 * be sent.
 * @param[in] protocol_name The name of the eet stream.
 * @param[in] section Name of section in the eet descriptor.
 * @param[in] section_data
 *
 * @ingroup Ecore_Con_Eet_Base
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_con_eet_base_raw_send(obj:PEo; reply:PEcore_Con_Reply; protocol_name:Pchar; section:Pchar; section_data:PEina_Binbuf);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function ECORE_CON_EET_BASE_CLASS : longint; { return type might be wrong }
  begin
    ECORE_CON_EET_BASE_CLASS:=ecore_con_eet_base_class_get;
  end;


end.
