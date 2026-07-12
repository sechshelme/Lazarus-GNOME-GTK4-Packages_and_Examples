unit gstidstr;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstIdStr = ^TGstIdStr;
  TGstIdStr = record
    pointer: Tgpointer;
    padding: array[0..7] of Tguint8;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_id_str_get_type: TGType; cdecl; external libgstreamer;
function gst_id_str_get_len(s: PGstIdStr): Tgsize; cdecl; external libgstreamer;
procedure gst_id_str_set(s: PGstIdStr; value: Pgchar); cdecl; external libgstreamer;
procedure gst_id_str_set_with_len(s: PGstIdStr; value: Pgchar; len: Tgsize); cdecl; external libgstreamer;
procedure gst_id_str_set_static_str(s: PGstIdStr; value: Pgchar); cdecl; external libgstreamer;
procedure gst_id_str_set_static_str_with_len(s: PGstIdStr; value: Pgchar; len: Tgsize); cdecl; external libgstreamer;
procedure gst_id_str_init(s: PGstIdStr); cdecl; external libgstreamer;
procedure gst_id_str_clear(s: PGstIdStr); cdecl; external libgstreamer;
function gst_id_str_new: PGstIdStr; cdecl; external libgstreamer;
function gst_id_str_copy(s: PGstIdStr): PGstIdStr; cdecl; external libgstreamer;
procedure gst_id_str_free(s: PGstIdStr); cdecl; external libgstreamer;
procedure gst_id_str_copy_into(d: PGstIdStr; s: PGstIdStr); cdecl; external libgstreamer;
procedure gst_id_str_move(d: PGstIdStr; s: PGstIdStr); cdecl; external libgstreamer;
function gst_id_str_as_str(s: PGstIdStr): Pgchar; cdecl; external libgstreamer;
function gst_id_str_is_equal(s1: PGstIdStr; s2: PGstIdStr): Tgboolean; cdecl; external libgstreamer;
function gst_id_str_is_equal_to_str(s1: PGstIdStr; s2: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_id_str_is_equal_to_str_with_len(s1: PGstIdStr; s2: Pgchar; len: Tgsize): Tgboolean; cdecl; external libgstreamer;
{$ENDIF read_function}

// === Konventiert am: 11-7-26 11:30:50 ===


implementation



end.
