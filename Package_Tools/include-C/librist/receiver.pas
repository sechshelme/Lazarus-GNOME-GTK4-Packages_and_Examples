unit receiver;

interface

uses
  fp_rist, headers, logging;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function rist_receiver_create(ctx: PPrist_ctx; profile: Trist_profile; logging_settings: Prist_logging_settings): longint; cdecl; external librist;

type
  Trist_nack_type = longint;
const
  RIST_NACK_RANGE = 0;
  RIST_NACK_BITMASK = 1;

function rist_receiver_nack_type_set(ctx: Prist_ctx; nacks_type: Trist_nack_type): longint; cdecl; external librist;
function rist_receiver_set_output_fifo_size(ctx: Prist_ctx; desired_size: Tuint32_t): longint; cdecl; external librist;
function rist_receiver_data_read(ctx: Prist_ctx; data_block: PPrist_data_block; timeout: longint): longint; cdecl; external librist; deprecated;
function rist_receiver_data_read2(ctx: Prist_ctx; data_block: PPrist_data_block; timeout: longint): longint; cdecl; external librist;

type
  Treceiver_data_callback_t = function(arg: pointer; data_block: Prist_data_block): longint; cdecl;
  Treceiver_data_callback2_t = function(arg: pointer; data_block: Prist_data_block): longint; cdecl;

function rist_receiver_data_callback_set(ctx: Prist_ctx; para2: Treceiver_data_callback_t; arg: pointer): longint; cdecl; external librist; deprecated;
function rist_receiver_data_callback_set2(ctx: Prist_ctx; para2: Treceiver_data_callback2_t; arg: pointer): longint; cdecl; external librist;
procedure rist_receiver_data_block_free(block: PPrist_data_block); cdecl; external librist; deprecated;
procedure rist_receiver_data_block_free2(block: PPrist_data_block); cdecl; external librist;
function rist_receiver_data_notify_fd_set(ctx: Prist_ctx; fd: longint): longint; cdecl; external librist;

// === Konventiert am: 15-8-26 19:16:50 ===


implementation



end.
