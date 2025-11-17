unit gphoto2_port_info_list;

interface

uses
  fp_glib2, fp_gphoto2, gphoto2_port_log;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGPPortType = ^TGPPortType;
  TGPPortType = longint;

const
  GP_PORT_NONE = 0;
  GP_PORT_SERIAL = 1 shl 0;
  GP_PORT_USB = 1 shl 2;
  GP_PORT_DISK = 1 shl 3;
  GP_PORT_PTPIP = 1 shl 4;
  GP_PORT_USB_DISK_DIRECT = 1 shl 5;
  GP_PORT_USB_SCSI = 1 shl 6;
  GP_PORT_IP = 1 shl 7;

type
  PGPPortInfo = type Pointer;
  PPGPPortInfo = ^PGPPortInfo;

var
  gpi_gphoto_port_type_map: PStringFlagItem; cvar;external libgphoto2;

function gp_port_info_new(info: PPGPPortInfo): longint; cdecl; external libgphoto2;
function gp_port_info_get_name(info: PGPPortInfo; name: PPchar): longint; cdecl; external libgphoto2;
function gp_port_info_set_name(info: PGPPortInfo; name: pchar): longint; cdecl; external libgphoto2;
function gp_port_info_get_path(info: PGPPortInfo; path: PPchar): longint; cdecl; external libgphoto2;
function gp_port_info_set_path(info: PGPPortInfo; path: pchar): longint; cdecl; external libgphoto2;
function gp_port_info_get_type(info: PGPPortInfo; _type: PGPPortType): longint; cdecl; external libgphoto2;
function gp_port_info_set_type(info: PGPPortInfo; _type: TGPPortType): longint; cdecl; external libgphoto2;
function gp_port_info_get_library_filename(info: PGPPortInfo; lib: PPchar): longint; cdecl; external libgphoto2;
function gp_port_info_set_library_filename(info: PGPPortInfo; lib: pchar): longint; cdecl; external libgphoto2;

type
  PGPPortInfoList = type Pointer;
  PPGPPortInfoList = ^PGPPortInfoList;

function gp_port_info_list_new(list: PPGPPortInfoList): longint; cdecl; external libgphoto2;
function gp_port_info_list_free(list: PGPPortInfoList): longint; cdecl; external libgphoto2;
function gp_port_info_list_append(list: PGPPortInfoList; info: PGPPortInfo): longint; cdecl; external libgphoto2;
function gp_port_info_list_load(list: PGPPortInfoList): longint; cdecl; external libgphoto2;
function gp_port_info_list_count(list: PGPPortInfoList): longint; cdecl; external libgphoto2;
function gp_port_info_list_lookup_path(list: PGPPortInfoList; path: pchar): longint; cdecl; external libgphoto2;
function gp_port_info_list_lookup_name(list: PGPPortInfoList; name: pchar): longint; cdecl; external libgphoto2;
function gp_port_info_list_get_info(list: PGPPortInfoList; n: longint; info: PGPPortInfo): longint; cdecl; external libgphoto2;
function gp_port_message_codeset(para1: pchar): pchar; cdecl; external libgphoto2;
function gp_port_init_localedir(localedir: pchar): longint; cdecl; external libgphoto2;

const
  IOLIBDIR_ENV = 'IOLIBS';

  // === Konventiert am: 17-11-25 15:47:03 ===


implementation



end.
