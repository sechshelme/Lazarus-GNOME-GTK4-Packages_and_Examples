unit control_external;

interface

uses
  fp_asound, control;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Psnd_ctl_ext_t=type Pointer;
Psnd_ctl_ext_callback_t=type Pointer;

  Psnd_ctl_ext_key_t = ^Tsnd_ctl_ext_key_t;
  Tsnd_ctl_ext_key_t = dword;

type
  Tsnd_ctl_ext_tlv_rw_t = function(ext: Psnd_ctl_ext_t; key: Tsnd_ctl_ext_key_t; op_flag: Integer; numid: Cardinal; tlv: PCardinal; tlv_size: Cardinal): Integer; cdecl;

const
  SND_CTL_EXT_VERSION_MAJOR = 1;  
  SND_CTL_EXT_VERSION_MINOR = 0;
  SND_CTL_EXT_VERSION_TINY = 1;
  SND_CTL_EXT_VERSION = ((SND_CTL_EXT_VERSION_MAJOR shl 16) or (SND_CTL_EXT_VERSION_MINOR shl 8)) or SND_CTL_EXT_VERSION_TINY;
type
  Tsnd_ctl_ext = record
      version : dword;
      card_idx : longint;
      id : array[0..15] of char;
      driver : array[0..15] of char;
      name : array[0..31] of char;
      longname : array[0..79] of char;
      mixername : array[0..79] of char;
      poll_fd : longint;
      callback : Psnd_ctl_ext_callback_t;
      private_data : pointer;
      handle : Psnd_ctl_t;
      nonblock : longint;
      subscribed : longint;
      tlv : record
          case longint of
            0 : ( c : Tsnd_ctl_ext_tlv_rw_t );
            1 : ( p : Pdword );
          end;
    end;
  Psnd_ctl_ext = ^Tsnd_ctl_ext;

  Tsnd_ctl_ext_callback = record
      close : procedure (ext:Psnd_ctl_ext_t);cdecl;
      elem_count : function (ext:Psnd_ctl_ext_t):longint;cdecl;
      elem_list : function (ext:Psnd_ctl_ext_t; offset:dword; id:Psnd_ctl_elem_id_t):longint;cdecl;
      find_elem : function (ext:Psnd_ctl_ext_t; id:Psnd_ctl_elem_id_t):Tsnd_ctl_ext_key_t;cdecl;
      free_key : procedure (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t);cdecl;
      get_attribute : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; _type:Plongint; acc:Pdword; count:Pdword):longint;cdecl;
      get_integer_info : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; imin:Plongint; imax:Plongint; istep:Plongint):longint;cdecl;
      get_integer64_info : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; imin:Pint64_t; imax:Pint64_t; istep:Pint64_t):longint;cdecl;
      get_enumerated_info : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; items:Pdword):longint;cdecl;
      get_enumerated_name : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; item:dword; name:Pchar; name_max_len:Tsize_t):longint;cdecl;
      read_integer : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; value:Plongint):longint;cdecl;
      read_integer64 : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; value:Pint64_t):longint;cdecl;
      read_enumerated : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; items:Pdword):longint;cdecl;
      read_bytes : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; data:Pbyte; max_bytes:Tsize_t):longint;cdecl;
      read_iec958 : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; iec958:Psnd_aes_iec958_t):longint;cdecl;
      write_integer : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; value:Plongint):longint;cdecl;
      write_integer64 : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; value:Pint64_t):longint;cdecl;
      write_enumerated : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; items:Pdword):longint;cdecl;
      write_bytes : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; data:Pbyte; max_bytes:Tsize_t):longint;cdecl;
      write_iec958 : function (ext:Psnd_ctl_ext_t; key:Tsnd_ctl_ext_key_t; iec958:Psnd_aes_iec958_t):longint;cdecl;
      subscribe_events : procedure (ext:Psnd_ctl_ext_t; subscribe:longint);cdecl;
      read_event : function (ext:Psnd_ctl_ext_t; id:Psnd_ctl_elem_id_t; event_mask:Pdword):longint;cdecl;
      poll_descriptors_count : function (ext:Psnd_ctl_ext_t):longint;cdecl;
      poll_descriptors : function (ext:Psnd_ctl_ext_t; pfds:Ppollfd; space:dword):longint;cdecl;
      poll_revents : function (ext:Psnd_ctl_ext_t; pfds:Ppollfd; nfds:dword; revents:Pword):longint;cdecl;
    end;
  Psnd_ctl_ext_callback = ^Tsnd_ctl_ext_callback;
type
  Psnd_ctl_ext_access_t = ^Tsnd_ctl_ext_access_t;
  Tsnd_ctl_ext_access_t =  Longint;
  Const
    SND_CTL_EXT_ACCESS_READ = 1 shl 0;
    SND_CTL_EXT_ACCESS_WRITE = 1 shl 1;
    SND_CTL_EXT_ACCESS_READWRITE = 3 shl 0;
    SND_CTL_EXT_ACCESS_VOLATILE = 1 shl 2;
    SND_CTL_EXT_ACCESS_TLV_READ = 1 shl 4;
    SND_CTL_EXT_ACCESS_TLV_WRITE = 1 shl 5;
    SND_CTL_EXT_ACCESS_TLV_READWRITE = 3 shl 4;
    SND_CTL_EXT_ACCESS_TLV_COMMAND = 1 shl 6;
    SND_CTL_EXT_ACCESS_INACTIVE = 1 shl 8;
    SND_CTL_EXT_ACCESS_TLV_CALLBACK = 1 shl 28;

    const    SND_CTL_EXT_KEY_NOT_FOUND=Tsnd_ctl_ext_key_t(-(1));

function snd_ctl_ext_create(ext:Psnd_ctl_ext_t; name:Pchar; mode:longint):longint;cdecl;external libasound;
function snd_ctl_ext_delete(ext:Psnd_ctl_ext_t):longint;cdecl;external libasound;

// === Konventiert am: 19-11-25 16:12:35 ===


implementation




end.
