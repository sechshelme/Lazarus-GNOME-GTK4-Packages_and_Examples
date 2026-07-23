
unit install_plugins;
interface

{
  Automatically converted by H2Pas 1.0.0 from install_plugins.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    install_plugins.h
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
Pgchar  = ^gchar;
PGstInstallPluginsContext  = ^GstInstallPluginsContext;
PGstInstallPluginsReturn  = ^GstInstallPluginsReturn;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer base utils library plugin install support for applications
 * Copyright (C) 2007 Tim-Philipp Müller <tim centricular net>
 * Copyright (C) 2006 Ryan Lortie <desrt desrt ca>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_PB_UTILS_INSTALL_PLUGINS_H__}
{$define __GST_PB_UTILS_INSTALL_PLUGINS_H__}
{$include <gst/gst.h>}
{$include <gst/pbutils/pbutils-prelude.h>}
{
 * functions for use by applications to initiate installation of missing plugins
  }
{*
 * GstInstallPluginsReturn:
 * @GST_INSTALL_PLUGINS_SUCCESS: all of the requested plugins could be
 *     installed
 * @GST_INSTALL_PLUGINS_NOT_FOUND: no appropriate installation candidate for
 *     any of the requested plugins could be found. Only return this if nothing
 *     has been installed. Return #GST_INSTALL_PLUGINS_PARTIAL_SUCCESS if
 *     some (but not all) of the requested plugins could be installed.
 * @GST_INSTALL_PLUGINS_ERROR: an error occurred during the installation. If
 *     this happens, the  user has already seen an error message and another
 *     one should not be displayed
 * @GST_INSTALL_PLUGINS_CRASHED: the installer had an unclean exit code
 *     (ie. death by signal)
 * @GST_INSTALL_PLUGINS_PARTIAL_SUCCESS: some of the requested plugins could
 *     be installed, but not all
 * @GST_INSTALL_PLUGINS_USER_ABORT: the user has aborted the installation
 * @GST_INSTALL_PLUGINS_INVALID: the helper returned an invalid status code
 * @GST_INSTALL_PLUGINS_STARTED_OK: returned by gst_install_plugins_async() to
 *     indicate that everything went fine so far and the provided callback
 *     will be called with the result of the installation later
 * @GST_INSTALL_PLUGINS_INTERNAL_FAILURE: some internal failure has
 *     occurred when trying to start the installer
 * @GST_INSTALL_PLUGINS_HELPER_MISSING: the helper script to call the
 *     actual installer is not installed
 * @GST_INSTALL_PLUGINS_INSTALL_IN_PROGRESS: a previously-started plugin
 *     installation is still in progress, try again later
 *
 * Result codes returned by gst_install_plugins_async() and
 * gst_install_plugins_sync(), and also the result code passed to the
 * #GstInstallPluginsResultFunc specified with gst_install_plugins_async().
 *
 * These codes indicate success or failure of starting an external installer
 * program and to what extent the requested plugins could be installed.
  }
{ Return codes from the installer. Returned by gst_install_plugins_sync(),
   * or passed as result code to your #GstInstallPluginsResultFunc  }
{ Returned by gst_install_plugins_sync(), or passed as result code to your
   * #GstInstallPluginsResultFunc  }
{ Return codes from starting the external helper, may be returned by both
   * gst_install_plugins_sync() and gst_install_plugins_async(), but should
   * never be seen by a #GstInstallPluginsResultFunc  }
type
  PGstInstallPluginsReturn = ^TGstInstallPluginsReturn;
  TGstInstallPluginsReturn =  Longint;
  Const
    GST_INSTALL_PLUGINS_SUCCESS = 0;
    GST_INSTALL_PLUGINS_NOT_FOUND = 1;
    GST_INSTALL_PLUGINS_ERROR = 2;
    GST_INSTALL_PLUGINS_PARTIAL_SUCCESS = 3;
    GST_INSTALL_PLUGINS_USER_ABORT = 4;
    GST_INSTALL_PLUGINS_CRASHED = 100;
    GST_INSTALL_PLUGINS_INVALID = 101;
    GST_INSTALL_PLUGINS_STARTED_OK = 200;
    GST_INSTALL_PLUGINS_INTERNAL_FAILURE = 201;
    GST_INSTALL_PLUGINS_HELPER_MISSING = 202;
    GST_INSTALL_PLUGINS_INSTALL_IN_PROGRESS = 203;
;
{*
 * GstInstallPluginsContext:
 *
 * Opaque context structure for the plugin installation. Use the provided
 * API to set details on it.
  }

{ was #define dname def_expr }
function GST_TYPE_INSTALL_PLUGINS_CONTEXT : longint; { return type might be wrong }

type

function gst_install_plugins_context_new:PGstInstallPluginsContext;cdecl;external;
function gst_install_plugins_context_copy(ctx:PGstInstallPluginsContext):PGstInstallPluginsContext;cdecl;external;
procedure gst_install_plugins_context_free(ctx:PGstInstallPluginsContext);cdecl;external;
procedure gst_install_plugins_context_set_confirm_search(ctx:PGstInstallPluginsContext; confirm_search:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure gst_install_plugins_context_set_desktop_id(ctx:PGstInstallPluginsContext; desktop_id:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure gst_install_plugins_context_set_startup_notification_id(ctx:PGstInstallPluginsContext; startup_id:Pgchar);cdecl;external;
procedure gst_install_plugins_context_set_xid(ctx:PGstInstallPluginsContext; xid:Tguint);cdecl;external;
function gst_install_plugins_context_get_type:TGType;cdecl;external;
{*
 * GstInstallPluginsResultFunc:
 * @result: whether the installation of the requested plugins succeeded or not
 * @user_data: the user data passed to gst_install_plugins_async()
 *
 * The prototype of the callback function that will be called once the
 * external plugin installer program has returned. You only need to provide
 * a callback function if you are using the asynchronous interface.
  }
type

  TGstInstallPluginsResultFunc = procedure (result:TGstInstallPluginsReturn; user_data:Tgpointer);cdecl;
(* Const before type ignored *)
(* Const before declarator ignored *)

function gst_install_plugins_async(details:PPgchar; ctx:PGstInstallPluginsContext; func:TGstInstallPluginsResultFunc; user_data:Tgpointer):TGstInstallPluginsReturn;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gst_install_plugins_sync(details:PPgchar; ctx:PGstInstallPluginsContext):TGstInstallPluginsReturn;cdecl;external;
(* Const before type ignored *)
function gst_install_plugins_return_get_name(ret:TGstInstallPluginsReturn):Pgchar;cdecl;external;
function gst_install_plugins_installation_in_progress:Tgboolean;cdecl;external;
function gst_install_plugins_supported:Tgboolean;cdecl;external;
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstInstallPluginsContext, gst_install_plugins_context_free) }
{$endif}
{ __GST_PB_UTILS_INSTALL_PLUGINS_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_INSTALL_PLUGINS_CONTEXT : longint; { return type might be wrong }
  begin
    GST_TYPE_INSTALL_PLUGINS_CONTEXT:=gst_install_plugins_context_get_type;
  end;


end.
