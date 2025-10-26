{$IFDEF read_interface}


const
  GLIBTOP_CMND_QUIT = 0;
  GLIBTOP_CMND_SYSDEPS = 1;
  GLIBTOP_CMND_CPU = 2;
  GLIBTOP_CMND_MEM = 3;
  GLIBTOP_CMND_SWAP = 4;
  GLIBTOP_CMND_UPTIME = 5;
  GLIBTOP_CMND_LOADAVG = 6;
  GLIBTOP_CMND_SHM_LIMITS = 7;
  GLIBTOP_CMND_MSG_LIMITS = 8;
  GLIBTOP_CMND_SEM_LIMITS = 9;
  GLIBTOP_CMND_PROCLIST = 10;
  GLIBTOP_CMND_PROC_STATE = 11;
  GLIBTOP_CMND_PROC_UID = 12;
  GLIBTOP_CMND_PROC_MEM = 13;
  GLIBTOP_CMND_PROC_TIME = 14;
  GLIBTOP_CMND_PROC_SIGNAL = 15;
  GLIBTOP_CMND_PROC_KERNEL = 16;
  GLIBTOP_CMND_PROC_SEGMENT = 17;
  GLIBTOP_CMND_PROC_ARGS = 18;
  GLIBTOP_CMND_PROC_MAP = 19;
  GLIBTOP_CMND_MOUNTLIST = 20;
  GLIBTOP_CMND_FSUSAGE = 21;
  GLIBTOP_CMND_NETLOAD = 22;
  GLIBTOP_CMND_PPP = 23;
  GLIBTOP_CMND_NETLIST = 24;
  GLIBTOP_CMND_PROC_OPEN_FILES = 25;
  GLIBTOP_CMND_PROC_WD = 26;
  GLIBTOP_CMND_PROC_AFFINITY = 27;
  GLIBTOP_CMND_PROC_IO = 28;
  GLIBTOP_CMND_DISK = 29;
  GLIBTOP_MAX_CMND = 30;
  _GLIBTOP_PARAM_SIZE = 16;

type
  Tglibtop_command = record
    command: Tguint64;
    size: Tguint64;
    data_size: Tguint64;
    parameter: array[0..(_GLIBTOP_PARAM_SIZE) - 1] of char;
  end;
  Pglibtop_command = ^Tglibtop_command;

  Tglibtop_response_union = record
    case longint of
      0: (data: Tglibtop_union);
      1: (sysdeps: Tglibtop_sysdeps);
  end;
  Pglibtop_response_union = ^Tglibtop_response_union;

  Tglibtop_response = record
    offset: Tgint64;
    size: Tguint64;
    data_size: Tguint64;
    u: Tglibtop_response_union;
  end;
  Pglibtop_response = ^Tglibtop_response;

function glibtop_call(p1, p2, p3, p4: longint): longint;

function glibtop_call_l(server: Pglibtop; command: dword; send_size: Tsize_t; send_buf: pointer; recv_size: Tsize_t; recv_buf: pointer): pointer; cdecl; external libgtop2;
function glibtop_call_s(server: Pglibtop; command: dword; send_size: Tsize_t; send_buf: pointer; recv_size: Tsize_t; recv_buf: pointer): pointer; cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function glibtop_call(p1, p2, p3, p4: longint): longint;
begin
  // Fehlt im original Header
//  glibtop_call := glibtop_call_r(glibtop_global_server, p1, p2, p3, p4);
end;


{$ENDIF read_implementation}
