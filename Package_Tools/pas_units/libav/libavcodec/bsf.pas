unit bsf;

interface

uses
  fp_ffmpeg, avcodec;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVBitStreamFilter = record
    name: pchar;
    codec_ids: PAVCodecID;
    priv_class: PAVClass;
  end;
  PAVBitStreamFilter = ^TAVBitStreamFilter;

  TAVBSFContext = record
    av_class: PAVClass;
    filter: PAVBitStreamFilter;
    priv_data: pointer;
    par_in: PAVCodecParameters;
    par_out: PAVCodecParameters;
    time_base_in: TAVRational;
    time_base_out: TAVRational;
  end;
  PAVBSFContext = ^TAVBSFContext;

function av_bsf_get_by_name(name: pchar): PAVBitStreamFilter; cdecl; external libavcodec;
function av_bsf_iterate(opaque: Ppointer): PAVBitStreamFilter; cdecl; external libavcodec;
function av_bsf_alloc(filter: PAVBitStreamFilter; ctx: PPAVBSFContext): longint; cdecl; external libavcodec;
function av_bsf_init(ctx: PAVBSFContext): longint; cdecl; external libavcodec;
function av_bsf_send_packet(ctx: PAVBSFContext; pkt: PAVPacket): longint; cdecl; external libavcodec;
function av_bsf_receive_packet(ctx: PAVBSFContext; pkt: PAVPacket): longint; cdecl; external libavcodec;
procedure av_bsf_flush(ctx: PAVBSFContext); cdecl; external libavcodec;
procedure av_bsf_free(ctx: PPAVBSFContext); cdecl; external libavcodec;
function av_bsf_get_class: PAVClass; cdecl; external libavcodec;

type
  PAVBSFList = type Pointer;

function av_bsf_list_alloc: PAVBSFList; cdecl; external libavcodec;
procedure av_bsf_list_free(lst: PPAVBSFList); cdecl; external libavcodec;
function av_bsf_list_append(lst: PAVBSFList; bsf: PAVBSFContext): longint; cdecl; external libavcodec;
function av_bsf_list_append2(lst: PAVBSFList; bsf_name: pchar; options: PPAVDictionary): longint; cdecl; external libavcodec;
function av_bsf_list_finalize(lst: PPAVBSFList; bsf: PPAVBSFContext): longint; cdecl; external libavcodec;
function av_bsf_list_parse_str(str: pchar; bsf: PPAVBSFContext): longint; cdecl; external libavcodec;
function av_bsf_get_null_filter(bsf: PPAVBSFContext): longint; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:10:03 ===


implementation



end.
