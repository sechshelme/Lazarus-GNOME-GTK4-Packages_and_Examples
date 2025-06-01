
unit efl_ui_win_socket_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_win_socket_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_win_socket_eo.h
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
PEfl_Ui_Win_Socket  = ^Efl_Ui_Win_Socket;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_WIN_SOCKET_EO_H_}
{$define _EFL_UI_WIN_SOCKET_EO_H_}
{$ifndef _EFL_UI_WIN_SOCKET_EO_CLASS_TYPE}
{$define _EFL_UI_WIN_SOCKET_EO_CLASS_TYPE}
type
  PEfl_Ui_Win_Socket = ^TEfl_Ui_Win_Socket;
  TEfl_Ui_Win_Socket = TEo;
{$endif}
{$ifndef _EFL_UI_WIN_SOCKET_EO_TYPES}
{$define _EFL_UI_WIN_SOCKET_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief An off-screen window to be displayed in a remote process.
 *
 * The window is rendered onto an image buffer to be displayed in another
 * process' plug image object. No actual window is created for this type. The
 * window contents can then be sent over a socket so that another process
 * displays it inside a plug image.
 *
 * @ingroup Efl_Ui_Win_Socket
  }

{ was #define dname def_expr }
function EFL_UI_WIN_SOCKET_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_win_socket_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Create a socket to provide the service for Plug widget.
 *
 * @param[in] obj The object.
 * @param[in] svcname The name of the service to be advertised. Ensure that it
 * is unique (when combined with @c svcnum) otherwise creation may fail.
 * @param[in] svcnum A number (any value, 0 being the common default) to
 * differentiate multiple instances of services with the same name.
 * @param[in] svcsys A boolean which when true specifies the creation of a
 * system-wide service to which all users can connect, otherwise the service is
 * private to the user id that created it.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Ui_Win_Socket
  }
(* Const before type ignored *)
function efl_ui_win_socket_listen(obj:PEo; svcname:Pchar; svcnum:longint; svcsys:TEina_Bool):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_WIN_SOCKET_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_WIN_SOCKET_CLASS:=efl_ui_win_socket_class_get;
  end;


end.
