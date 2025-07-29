unit dbus_pending_call;

interface

uses
  fp_dbus, lib_dbus_arch_deps, dbus_types, dbus_connection, dbus_memory, dbus_message;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  DBUS_TIMEOUT_INFINITE = longint($7fffffff);

const
  DBUS_TIMEOUT_USE_DEFAULT = -(1);

function dbus_pending_call_ref(pending: PDBusPendingCall): PDBusPendingCall; cdecl; external libdbus_1;
procedure dbus_pending_call_unref(pending: PDBusPendingCall); cdecl; external libdbus_1;
function dbus_pending_call_set_notify(pending: PDBusPendingCall; _function: TDBusPendingCallNotifyFunction; user_data: pointer; free_user_data: TDBusFreeFunction): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_pending_call_cancel(pending: PDBusPendingCall); cdecl; external libdbus_1;
function dbus_pending_call_get_completed(pending: PDBusPendingCall): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_pending_call_steal_reply(pending: PDBusPendingCall): PDBusMessage; cdecl; external libdbus_1;
procedure dbus_pending_call_block(pending: PDBusPendingCall); cdecl; external libdbus_1;
function dbus_pending_call_allocate_data_slot(slot_p: Pdbus_int32_t): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_pending_call_free_data_slot(slot_p: Pdbus_int32_t); cdecl; external libdbus_1;
function dbus_pending_call_set_data(pending: PDBusPendingCall; slot: Tdbus_int32_t; data: pointer; free_data_func: TDBusFreeFunction): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_pending_call_get_data(pending: PDBusPendingCall; slot: Tdbus_int32_t): pointer; cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:07:12 ===


implementation


end.
