{$IFDEF read_interface}


type
  PPkTransactionListPrivate = type Pointer;

  PPkTransactionList = ^TPkTransactionList;
  TPkTransactionList = record
    parent: TGObject;
    priv: PPkTransactionListPrivate;
  end;

  PPkTransactionListClass = ^TPkTransactionListClass;
  TPkTransactionListClass = record
    parent_class: TGObjectClass;
    added: procedure(tlist: PPkTransactionList; tid: Pgchar); cdecl;
    removed: procedure(tlist: PPkTransactionList; tid: Pgchar); cdecl;
  end;

function pk_transaction_list_get_type: TGType; cdecl; external libpackagekit;
function pk_transaction_list_new: PPkTransactionList; cdecl; external libpackagekit;
function pk_transaction_list_get_ids(tlist: PPkTransactionList): PPgchar; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:13:25 ===

function PK_TYPE_TRANSACTION_LIST: TGType;
function PK_TRANSACTION_LIST(obj: Pointer): PPkTransactionList;
function PK_TRANSACTION_LIST_CLASS(klass: Pointer): PPkTransactionListClass;
function PK_IS_TRANSACTION_LIST(obj: Pointer): Tgboolean;
function PK_IS_TRANSACTION_LIST_CLASS(klass: Pointer): Tgboolean;
function PK_TRANSACTION_LIST_GET_CLASS(obj: Pointer): PPkTransactionListClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_TRANSACTION_LIST: TGType;
begin
  PK_TYPE_TRANSACTION_LIST := pk_transaction_list_get_type;
end;

function PK_TRANSACTION_LIST(obj: Pointer): PPkTransactionList;
begin
  Result := PPkTransactionList(g_type_check_instance_cast(obj, PK_TYPE_TRANSACTION_LIST));
end;

function PK_TRANSACTION_LIST_CLASS(klass: Pointer): PPkTransactionListClass;
begin
  Result := PPkTransactionListClass(g_type_check_class_cast(klass, PK_TYPE_TRANSACTION_LIST));
end;

function PK_IS_TRANSACTION_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_TRANSACTION_LIST);
end;

function PK_IS_TRANSACTION_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_TRANSACTION_LIST);
end;

function PK_TRANSACTION_LIST_GET_CLASS(obj: Pointer): PPkTransactionListClass;
begin
  Result := PPkTransactionListClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
