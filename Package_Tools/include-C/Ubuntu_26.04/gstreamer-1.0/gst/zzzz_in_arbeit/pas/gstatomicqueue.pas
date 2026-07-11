unit gstatomicqueue;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstAtomicQueue = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_atomic_queue_get_type: TGType; cdecl; external libgstreamer;
function gst_atomic_queue_new(initial_size: Tguint): PGstAtomicQueue; cdecl; external libgstreamer;
procedure gst_atomic_queue_ref(queue: PGstAtomicQueue); cdecl; external libgstreamer;
procedure gst_atomic_queue_unref(queue: PGstAtomicQueue); cdecl; external libgstreamer;
procedure gst_atomic_queue_push(queue: PGstAtomicQueue; data: Tgpointer); cdecl; external libgstreamer;
function gst_atomic_queue_pop(queue: PGstAtomicQueue): Tgpointer; cdecl; external libgstreamer;
function gst_atomic_queue_peek(queue: PGstAtomicQueue): Tgpointer; cdecl; external libgstreamer;
function gst_atomic_queue_length(queue: PGstAtomicQueue): Tguint; cdecl; external libgstreamer;

// === Konventiert am: 10-7-26 19:47:35 ===

function GST_TYPE_ATOMIC_QUEUE: TGType;
{$ENDIF read_function}

implementation

function GST_TYPE_ATOMIC_QUEUE: TGType;
begin
  GST_TYPE_ATOMIC_QUEUE := gst_atomic_queue_get_type;
end;



end.
