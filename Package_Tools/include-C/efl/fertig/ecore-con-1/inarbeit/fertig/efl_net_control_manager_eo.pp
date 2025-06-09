
unit efl_net_control_manager_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_control_manager_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_control_manager_eo.h
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
PEfl_Net_Control_Access_Point  = ^Efl_Net_Control_Access_Point;
PEfl_Net_Control_Agent_Browser_Url  = ^Efl_Net_Control_Agent_Browser_Url;
PEfl_Net_Control_Agent_Error  = ^Efl_Net_Control_Agent_Error;
PEfl_Net_Control_Agent_Request_Input  = ^Efl_Net_Control_Agent_Request_Input;
PEfl_Net_Control_Agent_Request_Input_Field  = ^Efl_Net_Control_Agent_Request_Input_Field;
PEfl_Net_Control_Agent_Request_Input_Information  = ^Efl_Net_Control_Agent_Request_Input_Information;
PEfl_Net_Control_Manager  = ^Efl_Net_Control_Manager;
PEfl_Net_Control_State  = ^Efl_Net_Control_State;
PEina_Accessor  = ^Eina_Accessor;
PEina_Iterator  = ^Eina_Iterator;
PEina_Slice  = ^Eina_Slice;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_CONTROL_MANAGER_EO_H_}
{$define _EFL_NET_CONTROL_MANAGER_EO_H_}
{$ifndef _EFL_NET_CONTROL_MANAGER_EO_CLASS_TYPE}
{$define _EFL_NET_CONTROL_MANAGER_EO_CLASS_TYPE}
type
  PEfl_Net_Control_Manager = ^TEfl_Net_Control_Manager;
  TEfl_Net_Control_Manager = TEo;
{$endif}
{$ifndef _EFL_NET_CONTROL_MANAGER_EO_TYPES}
{$define _EFL_NET_CONTROL_MANAGER_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Provides the global network connectivity state.
 *
 * For more details, use @ref Efl_Net_Control_Manager access points and their
 * property state.
 *
 * @ingroup Efl_Net_Control_State
  }
{*< No access point is connected.  }
{*< At least one access point is connected and
                                * the internet connection hasn't been verified.
                                 }
{*< At least one access point is connected and
                                * the internet has been verified  }
type
  PEfl_Net_Control_State = ^TEfl_Net_Control_State;
  TEfl_Net_Control_State =  Longint;
  Const
    EFL_NET_CONTROL_STATE_OFFLINE = 0;
    EFL_NET_CONTROL_STATE_LOCAL = 1;
    EFL_NET_CONTROL_STATE_ONLINE = 2;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Bitwise-able fields requested to the agent.
 *
 * @ingroup Efl_Net_Control_Agent_Request_Input_Field
  }
{ 1 >> 0  }{*< Used for hidden WiFi access points.
                                                                    * If SSID is present, this is an
                                                                    * alternative to that.  }
{ 1 >> 1  }{*< Used for hidden WiFi access points.
                                                                    * If name is present, this is an
                                                                    * alternative to that.  }
{ 1 >> 2  }{*< Identity or username requested  }
{ 1 >> 3  }{*< Password or passphrase requested  }
{ 1 >> 4  }{*< Use WPS authentication. If
                                                                   * passphrase is present, this is an
                                                                   * alternative to that.  }
type
  PEfl_Net_Control_Agent_Request_Input_Field = ^TEfl_Net_Control_Agent_Request_Input_Field;
  TEfl_Net_Control_Agent_Request_Input_Field =  Longint;
  Const
    EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_NAME = 1;
    EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_SSID = 2;
    EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_USERNAME = 4;
    EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_PASSPHRASE = 8;
    EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_WPS = 16;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Name-value information pair provided to the agent.
 *
 * @ingroup Efl_Net_Control_Agent_Request_Input_Information
  }
(* Const before type ignored *)
{*< The information name, such as PreviousPassphrase, Host,
                     * Name...  }
(* Const before type ignored *)
{*< The contents of the information  }
type
  PEfl_Net_Control_Agent_Request_Input_Information = ^TEfl_Net_Control_Agent_Request_Input_Information;
  TEfl_Net_Control_Agent_Request_Input_Information = record
      name : Pchar;
      value : Pchar;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Requests input to the agent.
 *
 * @ingroup Efl_Net_Control_Agent_Request_Input
  }
{*< The access point which
                                               * triggered this request.  }
{*< Bitwise OR of fields
                                                     * present in this request.
                                                      }
(* Const before type ignored *)
{*< Extra detail for the passphrase field, such
                                * as wep, psk, response (IEEE802.X GTC/OTP),
                                * string...  }
{*< Such as the previous passphrase, VPN host
                                  }
type
  PEfl_Net_Control_Agent_Request_Input = ^TEfl_Net_Control_Agent_Request_Input;
  TEfl_Net_Control_Agent_Request_Input = record
      access_point : PEfl_Net_Control_Access_Point;
      fields : TEfl_Net_Control_Agent_Request_Input_Field;
      passphrase_type : Pchar;
      informational : PEina_Accessor;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Reports error to the agent.
 *
 * @ingroup Efl_Net_Control_Agent_Error
  }
{*< The access point that
                                               * triggered this error.  }
(* Const before type ignored *)
{*< The error message.  }
type
  PEfl_Net_Control_Agent_Error = ^TEfl_Net_Control_Agent_Error;
  TEfl_Net_Control_Agent_Error = record
      access_point : PEfl_Net_Control_Access_Point;
      message : Pchar;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Reports to agent that it should open a browser at a given URL.
 *
 * @ingroup Efl_Net_Control_Agent_Browser_Url
  }
{*< The access point that
                                               * triggered this request.  }
(* Const before type ignored *)
{*< The URL to point the browser at.  }
type
  PEfl_Net_Control_Agent_Browser_Url = ^TEfl_Net_Control_Agent_Browser_Url;
  TEfl_Net_Control_Agent_Browser_Url = record
      access_point : PEfl_Net_Control_Access_Point;
      url : Pchar;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Controls network connectivity.
 *
 * This class and its child objects are only useful to implement control of the
 * network connectivity. If your application only needs to request access to
 * the network, use @ref Efl_Net_Session instead.
 *
 * Network connectivity is defined on top of technologies that provide access
 * points. A technology can be "ethernet", "wifi", "bluetooth" or something
 * else. Ethernet will provide a single access point, while "wifi" will expose
 * zero or more access points that can come and go.
 *
 * Users willing to use access points are expected to monitor
 * "access_point,add" event to know when access points are added. To know when
 * they were deleted, "access_point,del" or an
 * @ref Efl_Net_Control_Access_Point "del" event. Finally
 * "access_points,changed" is relative to additions, deletions and reordering
 * of access point due changes in their priorities.
 *
 * The backend system is responsible for remembering connection details such as
 * passphrase, last connected access point and priority. The user is NOT
 * supposed to do that.
 *
 * For ease of use @ref efl_net_control_manager_state_get determines if at
 * least one access point is online (verified connectivity), local (connected
 * but unverified) or offline.
 *
 * For safety reasons all radio transmissions may be disabled with
 * @ref efl_net_control_manager_radios_offline_get property. This is usually
 * called "airplane mode" on some platforms.
 *
 * Some platforms may not implement the backend for this class, in which case
 * the system will report @ref efl_net_control_manager_state_get as permanently
 * "online" (@Efl.Net.Control.State.online) and iterators for
 * @ref efl_net_control_manager_access_points_get and
 * @ref efl_net_control_manager_technologies_get will be empty (they will be
 * returned but won't contain any items).
 *
 * @ingroup Efl_Net_Control_Manager
  }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_control_manager_class_get:PEfl_Class;cdecl;external;
{*
 * @brief If @c true disable all network technologies that use radio
 * transmission, such as bluetooth and wifi. If @c false, allows radio to be
 * used.
 *
 * @param[in] obj The object.
 * @param[in] radios_offline @c true if all radios are offline, @c false
 * otherwise
 *
 * @ingroup Efl_Net_Control_Manager
  }
procedure efl_net_control_manager_radios_offline_set(obj:PEo; radios_offline:TEina_Bool);cdecl;external;
{*
 * @brief If @c true disable all network technologies that use radio
 * transmission, such as bluetooth and wifi. If @c false, allows radio to be
 * used.
 *
 * @param[in] obj The object.
 *
 * @return @c true if all radios are offline, @c false otherwise
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
function efl_net_control_manager_radios_offline_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Summary of network connectivity.
 *
 * - offline means no connectivity;
 *
 * - local means local connectivity, that is, the access point is connected but
 * couldn't reach the internet;
 *
 * - online means verified connectivity.
 *
 * @note if there is no backend for this class, then state will always be
 * online, however @ref efl_net_control_manager_access_points_get and
 * @ref efl_net_control_manager_technologies_get will be empty iterators (valid
 * pointers but no items in them).
 *
 * @param[in] obj The object.
 *
 * @return Network state
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
function efl_net_control_manager_state_get(obj:PEo):TEfl_Net_Control_State;cdecl;external;
{*
 * @brief The iterator of current access points.
 *
 * The iterator is valid only before the function returns to the main loop. By
 * then, if the events "access_point,add" or "access_point,del" are emitted,
 * the iterator will become invalid.
 *
 * @param[in] obj The object.
 *
 * @return Iterator of current access points
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
function efl_net_control_manager_access_points_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief The iterator of current technologies.
 *
 * The iterator is valid only before the function returns to the main loop. By
 * then, if the events "technology,add" or "technology,del" are emitted, the
 * iterator will become invalid.
 *
 * @param[in] obj The object.
 *
 * @return Iterator of current technologies
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
function efl_net_control_manager_technologies_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief The agent is responsible for user interaction.
 *
 * When enabled, the local process will become the agent for user interaction,
 * such as requesting passphrases, asking the user to open a browser to perform
 * web-authentication and report connection errors.
 *
 * There can be only one agent in the system at any time: Registering one will
 * unregister the other. Special permissions may be required to become an
 * agent.
 *
 * A useful agent should monitor "agent_error", "agent_browser_url" and
 * "agent_request_input" events. When input is requested, reply using
 * @ref efl_net_control_manager_agent_reply.
 *
 * @param[in] obj The object.
 * @param[in] agent_enabled @c true if to become the agent, @c false otherwise
 *
 * @ingroup Efl_Net_Control_Manager
  }
procedure efl_net_control_manager_agent_enabled_set(obj:PEo; agent_enabled:TEina_Bool);cdecl;external;
{*
 * @brief The agent is responsible for user interaction.
 *
 * When enabled, the local process will become the agent for user interaction,
 * such as requesting passphrases, asking the user to open a browser to perform
 * web-authentication and report connection errors.
 *
 * There can be only one agent in the system at any time: Registering one will
 * unregister the other. Special permissions may be required to become an
 * agent.
 *
 * A useful agent should monitor "agent_error", "agent_browser_url" and
 * "agent_request_input" events. When input is requested, reply using
 * @ref efl_net_control_manager_agent_reply.
 *
 * @param[in] obj The object.
 *
 * @return @c true if to become the agent, @c false otherwise
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
function efl_net_control_manager_agent_enabled_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief If event "agent_request_input" was emitted, this will reply with the
 * requested data
 *
 * @param[in] obj The object.
 * @param[in] name If @ref EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_NAME was
 * present, this should contain the network name or the 'ssid' parameter should
 * be used.
 * @param[in] ssid If @ref EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_SSID was
 * present, this should contain the network SSID or the 'name' parameter should
 * be used.
 * @param[in] username If
 * @ref EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_USERNAME was present, this
 * should contain the identity or username
 * @param[in] passphrase If
 * @ref EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_PASSPHRASE was present, this
 * should contain the password or passphrase, more details on how it should be
 * interpreted was given in
 * Efl.Net.Control.Agent_Request_Input.passphrase_type.
 * @param[in] wps If @ref EFL_NET_CONTROL_AGENT_REQUEST_INPUT_FIELD_WPS was
 * present, this should contain the WPS PIN or an empty string "" to use the
 * WPS push button instead.
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_control_manager_agent_reply(obj:PEo; name:Pchar; ssid:PEina_Slice; username:Pchar; passphrase:Pchar; 
            wps:Pchar);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_ADD : TEfl_Event_Description;cvar;external;
{* The given access point has been added
 * @return Efl_Net_Control_Access_Point *
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
    _EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_DEL : TEfl_Event_Description;cvar;external;
{* The given access point will be deleted
 * @return Efl_Net_Control_Access_Point *
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
    _EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINTS_CHANGED : TEfl_Event_Description;cvar;external;
{* Access points were added, deleted or reordered.
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
    _EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_ADD : TEfl_Event_Description;cvar;external;
{* The given technology has been added
 * @return Efl_Net_Control_Technology *
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
    _EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_DEL : TEfl_Event_Description;cvar;external;
{* The given technology will be deleted
 * @return Efl_Net_Control_Technology *
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
    _EFL_NET_CONTROL_MANAGER_EVENT_RADIOS_OFFLINE_CHANGED : TEfl_Event_Description;cvar;external;
{* Property @ref efl_net_control_manager_radios_offline_get changed
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
    _EFL_NET_CONTROL_MANAGER_EVENT_STATE_CHANGED : TEfl_Event_Description;cvar;external;
{* Property @ref efl_net_control_manager_state_get changed
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
    _EFL_NET_CONTROL_MANAGER_EVENT_AGENT_RELEASED : TEfl_Event_Description;cvar;external;
{* Notifies we're not the agent anymore
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
    _EFL_NET_CONTROL_MANAGER_EVENT_AGENT_ERROR : TEfl_Event_Description;cvar;external;
{* Requires the error to be reported to the user
 * @return Efl_Net_Control_Agent_Error
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
    _EFL_NET_CONTROL_MANAGER_EVENT_AGENT_BROWSER_URL : TEfl_Event_Description;cvar;external;
{* Requires the user to visit a web page
 * @return Efl_Net_Control_Agent_Browser_Url
 *
 * @ingroup Efl_Net_Control_Manager
  }
(* Const before type ignored *)
    _EFL_NET_CONTROL_MANAGER_EVENT_AGENT_REQUEST_INPUT : TEfl_Event_Description;cvar;external;
{* Requires the user to enter information in order to proceed, such as hidden
 * SSID, passphrase, etc. After the user enters the information, reply by
 * calling @ref efl_net_control_manager_agent_reply
 * @return Efl_Net_Control_Agent_Request_Input
 *
 * @ingroup Efl_Net_Control_Manager
  }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_ADD : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_DEL : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINTS_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_ADD : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_DEL : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_RADIOS_OFFLINE_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_STATE_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_RELEASED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_BROWSER_URL : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_REQUEST_INPUT : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_CLASS:=efl_net_control_manager_class_get;
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_ADD : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_ADD:=@(_EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_ADD);
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_DEL : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_DEL:=@(_EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINT_DEL);
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINTS_CHANGED : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINTS_CHANGED:=@(_EFL_NET_CONTROL_MANAGER_EVENT_ACCESS_POINTS_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_ADD : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_ADD:=@(_EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_ADD);
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_DEL : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_DEL:=@(_EFL_NET_CONTROL_MANAGER_EVENT_TECHNOLOGY_DEL);
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_RADIOS_OFFLINE_CHANGED : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_EVENT_RADIOS_OFFLINE_CHANGED:=@(_EFL_NET_CONTROL_MANAGER_EVENT_RADIOS_OFFLINE_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_STATE_CHANGED : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_EVENT_STATE_CHANGED:=@(_EFL_NET_CONTROL_MANAGER_EVENT_STATE_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_RELEASED : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_EVENT_AGENT_RELEASED:=@(_EFL_NET_CONTROL_MANAGER_EVENT_AGENT_RELEASED);
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_ERROR : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_EVENT_AGENT_ERROR:=@(_EFL_NET_CONTROL_MANAGER_EVENT_AGENT_ERROR);
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_BROWSER_URL : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_EVENT_AGENT_BROWSER_URL:=@(_EFL_NET_CONTROL_MANAGER_EVENT_AGENT_BROWSER_URL);
  end;

{ was #define dname def_expr }
function EFL_NET_CONTROL_MANAGER_EVENT_AGENT_REQUEST_INPUT : longint; { return type might be wrong }
  begin
    EFL_NET_CONTROL_MANAGER_EVENT_AGENT_REQUEST_INPUT:=@(_EFL_NET_CONTROL_MANAGER_EVENT_AGENT_REQUEST_INPUT);
  end;


end.
