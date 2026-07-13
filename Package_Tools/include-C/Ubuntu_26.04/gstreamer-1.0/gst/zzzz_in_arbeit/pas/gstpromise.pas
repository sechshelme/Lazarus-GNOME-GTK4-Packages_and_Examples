unit gstpromise;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstminiobject, gststructure;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstPromiseResult = ^TGstPromiseResult;
  TGstPromiseResult = longint;
const
  GST_PROMISE_RESULT_PENDING = 0;
  GST_PROMISE_RESULT_INTERRUPTED = 1;
  GST_PROMISE_RESULT_REPLIED = 2;
  GST_PROMISE_RESULT_EXPIRED = 3;
  {$ENDIF read_struct}

  {$IFDEF read_struct}
type
  PPGstPromise = ^PGstPromise;
  PGstPromise = ^TGstPromise;
  TGstPromise = record
    parent: TGstMiniObject;
  end;

  TGstPromiseChangeFunc = procedure(promise: PGstPromise; user_data: Tgpointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_promise_get_type: TGType; cdecl; external libgstreamer;
function gst_promise_new: PGstPromise; cdecl; external libgstreamer;
function gst_promise_new_with_change_func(func: TGstPromiseChangeFunc; user_data: Tgpointer; notify: TGDestroyNotify): PGstPromise; cdecl; external libgstreamer;
function gst_promise_wait(promise: PGstPromise): TGstPromiseResult; cdecl; external libgstreamer;
procedure gst_promise_reply(promise: PGstPromise; s: PGstStructure); cdecl; external libgstreamer;
procedure gst_promise_interrupt(promise: PGstPromise); cdecl; external libgstreamer;
procedure gst_promise_expire(promise: PGstPromise); cdecl; external libgstreamer;
function gst_promise_get_reply(promise: PGstPromise): PGstStructure; cdecl; external libgstreamer;
function gst_promise_ref(promise: PGstPromise): PGstPromise; cdecl; external libgstreamer;
procedure gst_promise_unref(promise: PGstPromise); cdecl; external libgstreamer;
procedure gst_clear_promise(promise_ptr: PPGstPromise); cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:25:03 ===

function GST_TYPE_PROMISE: TGType;
function GST_IS_PROMISE(obj: Pointer): Tgboolean;
function GST_PROMISE(obj: Pointer): PGstPromise;
{$ENDIF read_function}

implementation

function GST_TYPE_PROMISE: TGType;
begin
  GST_TYPE_PROMISE := gst_promise_get_type;
end;

function GST_IS_PROMISE(obj: Pointer): Tgboolean;
begin
  GST_IS_PROMISE := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_PROMISE);
end;

function GST_PROMISE(obj: Pointer): PGstPromise;
begin
  GST_PROMISE := PGstPromise(obj);
end;

end.
