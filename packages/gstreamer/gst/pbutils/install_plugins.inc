/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstInstallPluginsReturn = ^TGstInstallPluginsReturn;
  TGstInstallPluginsReturn = longint;

const
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

type
  TGstInstallPluginsContext = record
  end;
  PGstInstallPluginsContext = ^TGstInstallPluginsContext;

function gst_install_plugins_context_new: PGstInstallPluginsContext; cdecl; external libgstpbutils;
function gst_install_plugins_context_copy(ctx: PGstInstallPluginsContext): PGstInstallPluginsContext; cdecl; external libgstpbutils;
procedure gst_install_plugins_context_free(ctx: PGstInstallPluginsContext); cdecl; external libgstpbutils;
procedure gst_install_plugins_context_set_confirm_search(ctx: PGstInstallPluginsContext; confirm_search: Tgboolean); cdecl; external libgstpbutils;
procedure gst_install_plugins_context_set_desktop_id(ctx: PGstInstallPluginsContext; desktop_id: Pgchar); cdecl; external libgstpbutils;
procedure gst_install_plugins_context_set_startup_notification_id(ctx: PGstInstallPluginsContext; startup_id: Pgchar); cdecl; external libgstpbutils;
procedure gst_install_plugins_context_set_xid(ctx: PGstInstallPluginsContext; xid: Tguint); cdecl; external libgstpbutils;
function gst_install_plugins_context_get_type: TGType; cdecl; external libgstpbutils;

type
  TGstInstallPluginsResultFunc = procedure(Result: TGstInstallPluginsReturn; user_data: Tgpointer); cdecl;

function gst_install_plugins_async(details: PPgchar; ctx: PGstInstallPluginsContext; func: TGstInstallPluginsResultFunc; user_data: Tgpointer): TGstInstallPluginsReturn; cdecl; external libgstpbutils;
function gst_install_plugins_sync(details: PPgchar; ctx: PGstInstallPluginsContext): TGstInstallPluginsReturn; cdecl; external libgstpbutils;
function gst_install_plugins_return_get_name(ret: TGstInstallPluginsReturn): Pgchar; cdecl; external libgstpbutils;
function gst_install_plugins_installation_in_progress: Tgboolean; cdecl; external libgstpbutils;
function gst_install_plugins_supported: Tgboolean; cdecl; external libgstpbutils;

// === Konventiert am: 27-9-24 15:44:39 ===

function GST_TYPE_INSTALL_PLUGINS_CONTEXT: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_INSTALL_PLUGINS_CONTEXT: TGType;
begin
  GST_TYPE_INSTALL_PLUGINS_CONTEXT := gst_install_plugins_context_get_type;
end;



{$ENDIF read_implementation}
