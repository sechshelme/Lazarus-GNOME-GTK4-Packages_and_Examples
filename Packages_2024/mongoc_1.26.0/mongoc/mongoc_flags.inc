

  {$IFDEF read_enum}
type
  Pmongoc_delete_flags_t = ^Tmongoc_delete_flags_t;
  Tmongoc_delete_flags_t = longint;

const
  MONGOC_DELETE_NONE = 0;
  MONGOC_DELETE_SINGLE_REMOVE = 1 shl 0;

type
  Pmongoc_remove_flags_t = ^Tmongoc_remove_flags_t;
  Tmongoc_remove_flags_t = longint;

const
  MONGOC_REMOVE_NONE = 0;
  MONGOC_REMOVE_SINGLE_REMOVE = 1 shl 0;

type
  Pmongoc_insert_flags_t = ^Tmongoc_insert_flags_t;
  Tmongoc_insert_flags_t = longint;

const
  MONGOC_INSERT_NONE = 0;
  MONGOC_INSERT_CONTINUE_ON_ERROR = 1 shl 0;

const
  MONGOC_INSERT_NO_VALIDATE = 1 shl 31;

type
  Pmongoc_query_flags_t = ^Tmongoc_query_flags_t;
  Tmongoc_query_flags_t = longint;

const
  MONGOC_QUERY_NONE = 0;
  MONGOC_QUERY_TAILABLE_CURSOR = 1 shl 1;
  MONGOC_QUERY_SLAVE_OK = 1 shl 2;
  MONGOC_QUERY_SECONDARY_OK = 1 shl 2;
  MONGOC_QUERY_OPLOG_REPLAY = 1 shl 3;
  MONGOC_QUERY_NO_CURSOR_TIMEOUT = 1 shl 4;
  MONGOC_QUERY_AWAIT_DATA = 1 shl 5;
  MONGOC_QUERY_EXHAUST = 1 shl 6;
  MONGOC_QUERY_PARTIAL = 1 shl 7;

type
  Pmongoc_reply_flags_t = ^Tmongoc_reply_flags_t;
  Tmongoc_reply_flags_t = longint;

const
  MONGOC_REPLY_NONE = 0;
  MONGOC_REPLY_CURSOR_NOT_FOUND = 1 shl 0;
  MONGOC_REPLY_QUERY_FAILURE = 1 shl 1;
  MONGOC_REPLY_SHARD_CONFIG_STALE = 1 shl 2;
  MONGOC_REPLY_AWAIT_CAPABLE = 1 shl 3;

type
  Pmongoc_update_flags_t = ^Tmongoc_update_flags_t;
  Tmongoc_update_flags_t = longint;

const
  MONGOC_UPDATE_NONE = 0;
  MONGOC_UPDATE_UPSERT = 1 shl 0;
  MONGOC_UPDATE_MULTI_UPDATE = 1 shl 1;

const
  MONGOC_UPDATE_NO_VALIDATE = 1 shl 31;
  {$ENDIF read_enum}

  // === Konventiert am: 15-5-26 15:15:56 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
