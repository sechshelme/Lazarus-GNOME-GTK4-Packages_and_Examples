unit H5Epublic;

interface

uses
  fp_hdf5, H5Ipublic, H5public;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  H5E_DEFAULT = 0;

type
  PH5E_type_t = ^TH5E_type_t;
  TH5E_type_t = longint;
const
  H5E_MAJOR = 0;
  H5E_MINOR = 1;

type
  PH5E_error2_t = ^TH5E_error2_t;
  TH5E_error2_t = record
    cls_id: Thid_t;
    maj_num: Thid_t;
    min_num: Thid_t;
    line: dword;
    func_name: pchar;
    file_name: pchar;
    desc: pchar;
  end;

type
  PH5E_direction_t = ^TH5E_direction_t;
  TH5E_direction_t = longint;
const
  H5E_WALK_UPWARD = 0;
  H5E_WALK_DOWNWARD = 1;

type
  TH5E_walk2_t = function(n: dword; err_desc: PH5E_error2_t; client_data: pointer): Therr_t; cdecl;
  TH5E_auto2_t = function(estack: Thid_t; client_data: pointer): Therr_t; cdecl;
  PH5E_auto2_t = ^TH5E_auto2_t;

function H5Eregister_class(cls_name: pchar; lib_name: pchar; version: pchar): Thid_t; cdecl; external libhdf5;
function H5Eunregister_class(class_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Eclose_msg(err_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Ecreate_msg(cls: Thid_t; msg_type: TH5E_type_t; msg: pchar): Thid_t; cdecl; external libhdf5;
function H5Ecreate_stack: Thid_t; cdecl; external libhdf5;
function H5Eget_current_stack: Thid_t; cdecl; external libhdf5;
function H5Eclose_stack(stack_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Eget_class_name(class_id: Thid_t; name: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5;
function H5Eset_current_stack(err_stack_id: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Epush2(err_stack: Thid_t; file_: pchar; func: pchar; line: dword; cls_id: Thid_t;
  maj_id: Thid_t; min_id: Thid_t; msg: pchar): Therr_t; cdecl; varargs; external libhdf5;
function H5Epop(err_stack: Thid_t; count: Tsize_t): Therr_t; cdecl; external libhdf5;
function H5Eprint2(err_stack: Thid_t; stream: PFILE): Therr_t; cdecl; external libhdf5;
function H5Ewalk2(err_stack: Thid_t; direction: TH5E_direction_t; func: TH5E_walk2_t; client_data: pointer): Therr_t; cdecl; external libhdf5;
function H5Eget_auto2(estack_id: Thid_t; func: PH5E_auto2_t; client_data: Ppointer): Therr_t; cdecl; external libhdf5;
function H5Eset_auto2(estack_id: Thid_t; func: TH5E_auto2_t; client_data: pointer): Therr_t; cdecl; external libhdf5;
function H5Eclear2(err_stack: Thid_t): Therr_t; cdecl; external libhdf5;
function H5Eauto_is_v2(err_stack: Thid_t; is_stack: Pdword): Therr_t; cdecl; external libhdf5;
function H5Eget_msg(msg_id: Thid_t; _type: PH5E_type_t; msg: pchar; size: Tsize_t): Tssize_t; cdecl; external libhdf5;
function H5Eget_num(error_stack_id: Thid_t): Tssize_t; cdecl; external libhdf5;

type
  PH5E_major_t = ^TH5E_major_t;
  TH5E_major_t = Thid_t;

  PH5E_minor_t = ^TH5E_minor_t;
  TH5E_minor_t = Thid_t;

  PH5E_error1_t = ^TH5E_error1_t;
  TH5E_error1_t = record
    maj_num: TH5E_major_t;
    min_num: TH5E_minor_t;
    func_name: pchar;
    file_name: pchar;
    line: dword;
    desc: pchar;
  end;

  TH5E_walk1_t = function(n: longint; err_desc: PH5E_error1_t; client_data: pointer): Therr_t; cdecl;
  TH5E_auto1_t = function(client_data: pointer): Therr_t; cdecl;
  PH5E_auto1_t = ^TH5E_auto1_t;

function H5Eclear1: Therr_t; cdecl; external libhdf5;
function H5Eget_auto1(func: PH5E_auto1_t; client_data: Ppointer): Therr_t; cdecl; external libhdf5;
function H5Epush1(file_: pchar; func: pchar; line: dword; maj: TH5E_major_t; min: TH5E_minor_t;
  str: pchar): Therr_t; cdecl; external libhdf5;
function H5Eprint1(stream: PFILE): Therr_t; cdecl; external libhdf5;
function H5Eset_auto1(func: TH5E_auto1_t; client_data: pointer): Therr_t; cdecl; external libhdf5;
function H5Ewalk1(direction: TH5E_direction_t; func: TH5E_walk1_t; client_data: pointer): Therr_t; cdecl; external libhdf5;
function H5Eget_major(maj: TH5E_major_t): pchar; cdecl; external libhdf5;
function H5Eget_minor(min: TH5E_minor_t): pchar; cdecl; external libhdf5;

// === Konventiert am: 20-8-26 19:37:16 ===


implementation



end.
