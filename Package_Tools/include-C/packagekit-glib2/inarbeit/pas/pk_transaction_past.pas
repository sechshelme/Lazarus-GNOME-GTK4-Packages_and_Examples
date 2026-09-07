unit pk_transaction_past;

interface

uses
  fp_glib2, fp_packagekit, pk_source, pk_enum;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPkTransactionPastPrivate = type Pointer;

  PPkTransactionPast = ^TPkTransactionPast;
  TPkTransactionPast = record
    parent: TPkSource;
    priv: PPkTransactionPastPrivate;
  end;

  PPkTransactionPastClass = ^TPkTransactionPastClass;
  TPkTransactionPastClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_transaction_past_get_type: TGType; cdecl; external libpackagekit;
function pk_transaction_past_new: PPkTransactionPast; cdecl; external libpackagekit;
function pk_transaction_past_get_cmdline(past: PPkTransactionPast): Pgchar; cdecl; external libpackagekit;
function pk_transaction_past_get_data(past: PPkTransactionPast): Pgchar; cdecl; external libpackagekit;
function pk_transaction_past_get_id(past: PPkTransactionPast): Pgchar; cdecl; external libpackagekit;
function pk_transaction_past_get_timespec(past: PPkTransactionPast): Pgchar; cdecl; external libpackagekit;
function pk_transaction_past_get_datetime(past: PPkTransactionPast): PGDateTime; cdecl; external libpackagekit;
function pk_transaction_past_get_timestamp(past: PPkTransactionPast): Tgint64; cdecl; external libpackagekit;
function pk_transaction_past_get_succeeded(past: PPkTransactionPast): Tgboolean; cdecl; external libpackagekit;
function pk_transaction_past_get_duration(past: PPkTransactionPast): Tguint; cdecl; external libpackagekit;
function pk_transaction_past_get_uid(past: PPkTransactionPast): Tguint; cdecl; external libpackagekit;
function pk_transaction_past_get_role(past: PPkTransactionPast): TPkRoleEnum; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:13:21 ===

function PK_TYPE_TRANSACTION_PAST: TGType;
function PK_TRANSACTION_PAST(obj: Pointer): PPkTransactionPast;
function PK_TRANSACTION_PAST_CLASS(klass: Pointer): PPkTransactionPastClass;
function PK_IS_TRANSACTION_PAST(obj: Pointer): Tgboolean;
function PK_IS_TRANSACTION_PAST_CLASS(klass: Pointer): Tgboolean;
function PK_TRANSACTION_PAST_GET_CLASS(obj: Pointer): PPkTransactionPastClass;

implementation

function PK_TYPE_TRANSACTION_PAST: TGType;
begin
  PK_TYPE_TRANSACTION_PAST := pk_transaction_past_get_type;
end;

function PK_TRANSACTION_PAST(obj: Pointer): PPkTransactionPast;
begin
  Result := PPkTransactionPast(g_type_check_instance_cast(obj, PK_TYPE_TRANSACTION_PAST));
end;

function PK_TRANSACTION_PAST_CLASS(klass: Pointer): PPkTransactionPastClass;
begin
  Result := PPkTransactionPastClass(g_type_check_class_cast(klass, PK_TYPE_TRANSACTION_PAST));
end;

function PK_IS_TRANSACTION_PAST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_TRANSACTION_PAST);
end;

function PK_IS_TRANSACTION_PAST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_TRANSACTION_PAST);
end;

function PK_TRANSACTION_PAST_GET_CLASS(obj: Pointer): PPkTransactionPastClass;
begin
  Result := PPkTransactionPastClass(PGTypeInstance(obj)^.g_class);
end;



end.
