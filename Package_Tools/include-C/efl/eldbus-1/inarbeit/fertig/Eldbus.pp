
unit Eldbus;
interface

{
  Automatically converted by H2Pas 1.0.0 from Eldbus.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Eldbus.h
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
PEldbus_Message  = ^Eldbus_Message;
PEldbus_Pending  = ^Eldbus_Pending;
PEldbus_Version  = ^Eldbus_Version;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @page eldbus_main Eldbus
 *
 * @date 2012 (created)
 *
 * @section eldbus_toc Table of Contents
 *
 * @li @ref eldbus_main_intro
 * @li @ref eldbus_main_compiling
 * @li @ref eldbus_main_next_steps
 * @li @ref eldbus_main_intro_example
 *
 * @section eldbus_main_intro Introduction
 *
 * Eldbus is a wrapper around the
 * <a href="http://www.freedesktop.org/wiki/Software/dbus">dbus</a>
 * library, which is a message bus system. It also implements a set of
 * specifications using dbus as interprocess communication.
 *
 * @subsection eldbus_modules_sec Modules
 *
 * <ul>
 * <li> @ref Eldbus_Core
 * <li> @ref Eldbus_Connection
 * <li> @ref Eldbus_Object_Mapper
 * <li> @ref Eldbus_Proxy
 * <li> @ref Eldbus_Message
 *      <ul>
 *              <li>@ref Eldbus_Message_Iter
 *              <li>@ref Eldbus_Message_Helpers
 *              <li>@ref Eina_Value
 *      </ul>
 * <li> @ref Eldbus_Signal_Handler
 * <li> @ref Eldbus_Pending
 * <li> @ref Eldbus_Service
 * <li> @ref Eldbus_Basic
 * </ul>
 *
 * @section eldbus_main_compiling How to compile
 *
 * Eldbus is a library your application links to. The procedure for this is
 * very simple. You simply have to compile your application with the
 * appropriate compiler flags that the @c pkg-config script outputs. For
 * example:
 *
 * Compiling C or C++ files into object files:
 *
 * @verbatim
   gcc -c -o main.o main.c `pkg-config --cflags eldbus`
   @endverbatim
 *
 * Linking object files into a binary executable:
 *
 * @verbatim
   gcc -o my_application main.o `pkg-config --libs eldbus`
   @endverbatim
 *
 * See @ref pkgconfig
 *
 * @section eldbus_main_next_steps Next Steps
 *
 * After you understood what Eldbus is and installed it in your system
 * you should proceed understanding the programming interface.
 *
 * Recommended reading:
 * @li @ref Eldbus_Core for library init, shutdown and getting a connection.
 * @li @ref Eldbus_Proxy to easily bind a client object to an interface.
 * @li @ref Eldbus_Object_Mapper to monitor server objects and properties.
 *
 * @section eldbus_main_intro_example Introductory Example
 *
 * @include ofono-dial.c
 *
 * More examples can be found at @ref eldbus_examples.
  }
{$ifndef ELDBUS_H}
{$define ELDBUS_H}
{$include <Eina.h>}
{$include <stdarg.h>}
{$include <Efl_Config.h>}
{$include <Eo.h>}
{$ifdef EFL_BETA_API_SUPPORT}
{$include <Efl.h>}
{$endif}
{$ifdef extern}
{$undef extern}
{$endif}
{ C++ extern C conditionnal removed }
{*
 * @defgroup Eldbus_Core Core
 * @ingroup Eldbus
 *
 * @
  }
{*< Eldbus version major number  }

const
  ELDBUS_VERSION_MAJOR = EFL_VERSION_MAJOR;  
{*< Eldbus version minor number  }
  ELDBUS_VERSION_MINOR = EFL_VERSION_MINOR;  
{*< DBus message bus name  }
  ELDBUS_FDO_BUS = 'org.freedesktop.DBus';  
{*< Object that implements message bus interface  }
  ELDBUS_FDO_PATH = '/org/freedesktop/DBus';  
{*< DBus message bus interface  }
  ELDBUS_FDO_INTERFACE = ELDBUS_FDO_BUS;  
{*< DBus Properties interface  }
  ELDBUS_FDO_INTERFACE_PROPERTIES = 'org.freedesktop.DBus.Properties';  
{*< DBus ObjectManager interface  }
  ELDBUS_FDO_INTERFACE_OBJECT_MANAGER = 'org.freedesktop.DBus.ObjectManager';  
{*< DBus Introspectable interface  }
  ELDBUS_FDO_INTERFACE_INTROSPECTABLE = 'org.freedesktop.DBus.Introspectable';  
{*< DBus Peer interface  }
  ELDBUS_FDO_INTEFACE_PEER = 'org.freedesktop.DBus.Peer';  
{*< Canceled error answer  }
  ELDBUS_ERROR_PENDING_CANCELED = 'org.enlightenment.DBus.Canceled';  
{*< Timeout error answer  }
  ELDBUS_ERROR_PENDING_TIMEOUT = 'org.freedesktop.DBus.Error.NoReply';  
{*
 * @typedef Eldbus_Version
 * Represents the current version of Eldbus
  }
{*< major (binary or source incompatible changes)  }
{*< minor (new features, bugfixes, major improvements version)  }
{*< micro (bugfix, internal improvements, no new features version)  }
{*< git revision (0 if a proper release or the git revision number Eldbus is built from)  }
type
  PEldbus_Version = ^TEldbus_Version;
  TEldbus_Version = record
      major : longint;
      minor : longint;
      micro : longint;
      revision : longint;
    end;
(* Const before type ignored *)
  var
    eldbus_version : PEldbus_Version;cvar;external;
{*< Global Eldbus_Version object  }
{*
 * @brief Initialize eldbus.
 *
 * @return 1 or greater on success, 0 otherwise
  }

function eldbus_init:longint;cdecl;external;
{*
 * @brief Shutdown eldbus.
 *
 * @return 0 if e_dbus shuts down, greater than 0 otherwise.
  }
function eldbus_shutdown:longint;cdecl;external;
{*
 * @typedef Eldbus_Free_Cb
 *
 * Callback that is called when the connection is freed.
  }
(* Const before type ignored *)
type

  TEldbus_Free_Cb = procedure (data:pointer; deadptr:pointer);cdecl;
{*
 * @typedef Eldbus_Message
 *
 * Represents the way data is sent and received in DBus.
  }
{*
 * @typedef Eldbus_Message_Iter
 *
 * Represents an iterator over a complex message type (array, dict, struct,
 * or variant). Its life is bound to the message that contains
 * it. The same applies to the returned data.
  }
{*
 * @typedef Eldbus_Pending
 *
 * Represents a message that has been sent but has not yet reached its
 * destination.
  }
{*
 * @typedef Eldbus_Signal_Handler
 *
 * Represents a listener that will listen for signals emitted by other
 * applications.
  }
{*
 * @typedef Eldbus_Message_Cb
 *
 * Callback that is called when answer of a method call message comes.
  }
(* Const before type ignored *)

  TEldbus_Message_Cb = procedure (data:pointer; msg:PEldbus_Message; pending:PEldbus_Pending);cdecl;
{*
 * @typedef Eldbus_Signal_Cb
 *
 * Callback that is called when a signal is received.
  }
(* Const before type ignored *)

  TEldbus_Signal_Cb = procedure (data:pointer; msg:PEldbus_Message);cdecl;
{*
 * @
  }
{ FIXME: these are duplicated as @extern in eldbus_types.eot  }
{* Represents a client object bound to an interface
 *
 * @ingroup Eldbus
  }
{* Represents a connection of one the type of connection with the DBus daemon.
 *
 * @ingroup Eldbus
  }
{* Represents an object path already attached with bus name or unique id
 *
 * @ingroup Eldbus
  }
{$include "eldbus_connection.h"}
{$include "eldbus_message.h"}
{$include "eldbus_signal_handler.h"}
{$include "eldbus_pending.h"}
{$include "eldbus_object.h"}
{$include "eldbus_proxy.h"}
{$include "eldbus_freedesktop.h"}
{$include "eldbus_service.h"}
{$include "eldbus_introspection.h"}
{$ifdef EFL_BETA_API_SUPPORT}
{$include "eldbus_model.eo.h"}
{$include "eldbus_model_arguments.eo.h"}
{$include "eldbus_model_connection.eo.h"}
{$include "eldbus_model_method.eo.h"}
{$include "eldbus_model_object.eo.h"}
{$include "eldbus_model_proxy.eo.h"}
{$include "eldbus_model_signal.eo.h"}

implementation


end.
