
{$IFDEF read_interface}

type
  PGstIteratorResult = ^TGstIteratorResult;
  TGstIteratorResult = longint;

const
  GST_ITERATOR_DONE = 0;
  GST_ITERATOR_OK = 1;
  GST_ITERATOR_RESYNC_ = 2;
  GST_ITERATOR_ERROR = 3;

type
  PGstIteratorItem = ^TGstIteratorItem;
  TGstIteratorItem = longint;

const
  GST_ITERATOR_ITEM_SKIP = 0;
  GST_ITERATOR_ITEM_PASS = 1;
  GST_ITERATOR_ITEM_END = 2;

type
  PGstIterator = ^TGstIterator;

  TGstIteratorCopyFunction = procedure(it: PGstIterator; copy: PGstIterator); cdecl;
  TGstIteratorItemFunction = function(it: PGstIterator; item: PGValue): TGstIteratorItem; cdecl;
  TGstIteratorNextFunction = function(it: PGstIterator; Result: PGValue): TGstIteratorResult; cdecl;
  TGstIteratorResyncFunction = procedure(it: PGstIterator); cdecl;
  TGstIteratorFreeFunction = procedure(it: PGstIterator); cdecl;
  TGstIteratorForeachFunction = procedure(item: PGValue; user_data: Tgpointer); cdecl;
  TGstIteratorFoldFunction = function(item: PGValue; ret: PGValue; user_data: Tgpointer): Tgboolean; cdecl;

  TGstIterator = record
    copy: TGstIteratorCopyFunction;
    Next: TGstIteratorNextFunction;
    item: TGstIteratorItemFunction;
    resync: TGstIteratorResyncFunction;
    Free: TGstIteratorFreeFunction;
    pushed: PGstIterator;
    _type: TGType;
    lock: PGMutex;
    cookie: Tguint32;
    master_cookie: Pguint32;
    size: Tguint;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;


function gst_iterator_get_type: TGType; cdecl; external libgstreamer;
function gst_iterator_new(size: Tguint; _type: TGType; lock: PGMutex; master_cookie: Pguint32; copy: TGstIteratorCopyFunction;
  Next: TGstIteratorNextFunction; item: TGstIteratorItemFunction; resync: TGstIteratorResyncFunction; Free: TGstIteratorFreeFunction): PGstIterator; cdecl; external libgstreamer;
function gst_iterator_new_list(_type: TGType; lock: PGMutex; master_cookie: Pguint32; list: PPGList; owner: PGObject;
  item: TGstIteratorItemFunction): PGstIterator; cdecl; external libgstreamer;
function gst_iterator_new_single(_type: TGType; obj: PGValue): PGstIterator; cdecl; external libgstreamer;
function gst_iterator_copy(it: PGstIterator): PGstIterator; cdecl; external libgstreamer;
function gst_iterator_next(it: PGstIterator; elem: PGValue): TGstIteratorResult; cdecl; external libgstreamer;
procedure gst_iterator_resync(it: PGstIterator); cdecl; external libgstreamer;
procedure gst_iterator_free(it: PGstIterator); cdecl; external libgstreamer;
procedure gst_iterator_push(it: PGstIterator; other: PGstIterator); cdecl; external libgstreamer;
function gst_iterator_filter(it: PGstIterator; func: TGCompareFunc; user_data: PGValue): PGstIterator; cdecl; external libgstreamer;
function gst_iterator_fold(it: PGstIterator; func: TGstIteratorFoldFunction; ret: PGValue; user_data: Tgpointer): TGstIteratorResult; cdecl; external libgstreamer;
function gst_iterator_foreach(it: PGstIterator; func: TGstIteratorForeachFunction; user_data: Tgpointer): TGstIteratorResult; cdecl; external libgstreamer;
function gst_iterator_find_custom(it: PGstIterator; func: TGCompareFunc; elem: PGValue; user_data: Tgpointer): Tgboolean; cdecl; external libgstreamer;

function GST_TYPE_ITERATOR: TGType;

function GST_ITERATOR(it: Pointer): PGstIterator;
function GST_ITERATOR_LOCK(it: Pointer): PGMutex;
function GST_ITERATOR_COOKIE(it: Pointer): Tguint32;
function GST_ITERATOR_ORIG_COOKIE(it: Pointer): Pguint32;


// === Konventiert am: 12-9-24 19:00:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_ITERATOR: TGType;
begin
  GST_TYPE_ITERATOR := gst_iterator_get_type;
end;

function GST_ITERATOR(it: Pointer): PGstIterator;
begin
  GST_ITERATOR := PGstIterator(it);
end;

function GST_ITERATOR_LOCK(it: Pointer): PGMutex;
begin
  GST_ITERATOR_LOCK := (GST_ITERATOR(it))^.lock;
end;

function GST_ITERATOR_COOKIE(it: Pointer): Tguint32;
begin
  GST_ITERATOR_COOKIE := (GST_ITERATOR(it))^.cookie;
end;

function GST_ITERATOR_ORIG_COOKIE(it: Pointer): Pguint32;
begin
  GST_ITERATOR_ORIG_COOKIE := (GST_ITERATOR(it))^.master_cookie;
end;


{$ENDIF read_implementation}
