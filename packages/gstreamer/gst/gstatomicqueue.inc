
{$IFDEF read_interface}

type
  TGstAtomicQueue = record
  end;
  PGstAtomicQueue = ^TGstAtomicQueue;

function gst_atomic_queue_get_type: TGType; cdecl; external libgstreamer;
function gst_atomic_queue_new(initial_size: Tguint): PGstAtomicQueue; cdecl; external libgstreamer;
procedure gst_atomic_queue_ref(queue: PGstAtomicQueue); cdecl; external libgstreamer;
procedure gst_atomic_queue_unref(queue: PGstAtomicQueue); cdecl; external libgstreamer;
procedure gst_atomic_queue_push(queue: PGstAtomicQueue; Data: Tgpointer); cdecl; external libgstreamer;
function gst_atomic_queue_pop(queue: PGstAtomicQueue): Tgpointer; cdecl; external libgstreamer;
function gst_atomic_queue_peek(queue: PGstAtomicQueue): Tgpointer; cdecl; external libgstreamer;
function gst_atomic_queue_length(queue: PGstAtomicQueue): Tguint; cdecl; external libgstreamer;

// === Konventiert am: 18-9-24 15:52:02 ===

function GST_TYPE_ATOMIC_QUEUE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_ATOMIC_QUEUE: TGType;
begin
  GST_TYPE_ATOMIC_QUEUE := gst_atomic_queue_get_type;
end;



{$ENDIF read_implementation}
