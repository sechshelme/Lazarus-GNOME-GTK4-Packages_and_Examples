{$IFDEF read_interface}


{ GStreamer RIFF I/O
 * Copyright (C) 2003 Ronald Bultje <rbultje@ronald.bitfreak.net>
 *
 * riff-ids.h: RIFF IDs and structs
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_RIFF_IDS_H__}
{$define __GST_RIFF_IDS_H__}
{$include <gst/gst.h>}
{$include "riff-prelude.h"}
{ RIFF types  }

{ was #define dname def_expr }
function GST_RIFF_RIFF_WAVE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_RIFF_AVI : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_RIFF_CDXA : longint; { return type might be wrong }

{ tags  }
{ was #define dname def_expr }
function GST_RIFF_TAG_RIFF : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_AVF0 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_RF64 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_RIFX : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_LIST : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_avih : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_strd : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_strn : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_strh : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_strf : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_vedt : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_JUNK : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_JUNQ : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_idx1 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_dmlh : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_ID32 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_id3 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_IDVX : longint; { return type might be wrong }

{ WAV stuff  }
{ was #define dname def_expr }
function GST_RIFF_TAG_fmt : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_data : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_plst : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_cue : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_bext : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_BEXT : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_fact : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_acid : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_labl : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_note : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_smpl : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_inst : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TAG_FLLR : longint; { return type might be wrong }

{ LIST types  }
{ was #define dname def_expr }
function GST_RIFF_LIST_movi : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_LIST_hdrl : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_LIST_odml : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_LIST_strl : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_LIST_INFO : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_LIST_AVIX : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_LIST_adtl : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_LIST_ncdt : longint; { return type might be wrong }

{ fcc types  }
{ was #define dname def_expr }
function GST_RIFF_FCC_vids : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_FCC_auds : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_FCC_pads : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_FCC_txts : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_FCC_vidc : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_FCC_iavs : longint; { return type might be wrong }

{ fcc handlers  }
{ was #define dname def_expr }
function GST_RIFF_FCCH_RLE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_FCCH_msvc : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_FCCH_MSVC : longint; { return type might be wrong }

{ INFO types - see http://www.saettler.com/RIFFMCI/riffmci.html  }
{ location  }
{ was #define dname def_expr }
function GST_RIFF_INFO_IARL : longint; { return type might be wrong }

{ artist  }
{ was #define dname def_expr }
function GST_RIFF_INFO_IART : longint; { return type might be wrong }

{ commissioned  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ICMS : longint; { return type might be wrong }

{ comment  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ICMT : longint; { return type might be wrong }

{ copyright  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ICOP : longint; { return type might be wrong }

{ creation date  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ICRD : longint; { return type might be wrong }

{ cropped  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ICRP : longint; { return type might be wrong }

{ dimensions  }
{ was #define dname def_expr }
function GST_RIFF_INFO_IDIM : longint; { return type might be wrong }

{ dots-per-inch  }
{ was #define dname def_expr }
function GST_RIFF_INFO_IDPI : longint; { return type might be wrong }

{ engineer(s)  }
{ was #define dname def_expr }
function GST_RIFF_INFO_IENG : longint; { return type might be wrong }

{ genre  }
{ was #define dname def_expr }
function GST_RIFF_INFO_IGNR : longint; { return type might be wrong }

{ keywords  }
{ was #define dname def_expr }
function GST_RIFF_INFO_IKEY : longint; { return type might be wrong }

{ lightness  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ILGT : longint; { return type might be wrong }

{ medium  }
{ was #define dname def_expr }
function GST_RIFF_INFO_IMED : longint; { return type might be wrong }

{ name  }
{ was #define dname def_expr }
function GST_RIFF_INFO_INAM : longint; { return type might be wrong }

{ palette setting  }
{ was #define dname def_expr }
function GST_RIFF_INFO_IPLT : longint; { return type might be wrong }

{ product (album)  }
{ was #define dname def_expr }
function GST_RIFF_INFO_IPRD : longint; { return type might be wrong }

{ subject  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ISBJ : longint; { return type might be wrong }

{ software  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ISFT : longint; { return type might be wrong }

{ sharpness  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ISHP : longint; { return type might be wrong }

{ source  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ISRC : longint; { return type might be wrong }

{ source form  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ISRF : longint; { return type might be wrong }

{ technician(s)  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ITCH : longint; { return type might be wrong }

{ album artist  }
{ was #define dname def_expr }
function GST_RIFF_INFO_IAAR : longint; { return type might be wrong }

{ track number  }
{ was #define dname def_expr }
function GST_RIFF_INFO_ITRK : longint; { return type might be wrong }

{ ncdt types - see http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/Nikon.html#NCDT  }
{ was #define dname def_expr }
function GST_RIFF_LIST_nctg : longint; { return type might be wrong }

{********Chunk Names************** }
{ was #define dname def_expr }
function GST_RIFF_FF00 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_01 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_02 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_03 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_04 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_05 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_06 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_07 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00pc : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_01pc : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00dc : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00dx : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00db : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00xx : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00id : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00rt : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_0021 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00iv : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_0031 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_0032 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00vc : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00xm : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_01wb : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_01dc : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00__ : longint; { return type might be wrong }

{********VIDEO CODECS************* }
{ was #define dname def_expr }
function GST_RIFF_cram : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_CRAM : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_wham : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_WHAM : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_rgb : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_RGB : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_RAW : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_DIB : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_rle8 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_RLE8 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_rle4 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_RLE4 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_none : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_NONE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_pack : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_PACK : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_tran : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_TRAN : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_ccc : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_CCC : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_cyuv : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_CYUV : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_jpeg : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_JPEG : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_MJPG : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_mJPG : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_IJPG : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_rt21 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_RT21 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_iv31 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_IV31 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_iv32 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_IV32 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_iv41 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_IV41 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_iv50 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_IV50 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_cvid : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_CVID : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_ULTI : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_ulti : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_YUV9 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_YVU9 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_XMPG : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_xmpg : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_VDOW : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_MVI1 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_v422 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_V422 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_mvi1 : longint; { return type might be wrong }

{ MotionPixels munged their id  }
{ was #define dname def_expr }
function GST_RIFF_MPIX : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_AURA : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_DMB1 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_dmb1 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_BW10 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_bw10 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_yuy2 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_YUY2 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_YUV8 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_WINX : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_WPY2 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_m263 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_M263 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_H263 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_h263 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_i263 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_L263 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_x263 : longint; { return type might be wrong }

{ H2.64  }
{ was #define dname def_expr }
function GST_RIFF_VSSH : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_Q1_0 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_SFMC : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_y41p : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_Y41P : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_yv12 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_YV12 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_vixl : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_VIXL : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_iyuv : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_IYUV : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_i420 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_I420 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_vyuy : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_VYUY : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_DIV3 : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_rpza : longint; { return type might be wrong }

{ And this here's the mistakes that need to be supported  }
{ recognize Apple's rpza mangled?  }
{ was #define dname def_expr }
function GST_RIFF_azpr : longint; { return type might be wrong }

{********** FND in MJPG ********* }
{ was #define dname def_expr }
function GST_RIFF_ISFT : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_IDIT : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_00AM : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_DISP : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_ISBJ : longint; { return type might be wrong }

{ was #define dname def_expr }
function GST_RIFF_rec : longint; { return type might be wrong }

{ common data structures  }
{ stream type  }
{ fcc_handler  }
{ flags values  }
{ initial frames (???)  }
{ suggested buffer size  }
{ rcFrame, RECT structure(struct of 4 shorts)
  gint32  left;
  gint32  top;
  gint32  right;
  gint32  bottom;
   }
type
  Pgst_riff_strh = ^Tgst_riff_strh;
  Tgst_riff_strh = record
      _type : Tguint32;
      fcc_handler : Tguint32;
      flags : Tguint32;
      priority : Tguint32;
      init_frames : Tguint32;
      scale : Tguint32;
      rate : Tguint32;
      start : Tguint32;
      length : Tguint32;
      bufsize : Tguint32;
      quality : Tguint32;
      samplesize : Tguint32;
    end;

const
  GST_RIFF_STRH_DISABLED = $000000001;  
  GST_RIFF_STRH_VIDEOPALCHANGES = $000010000;  
{ == BitMapInfoHeader  }
{ used colors  }
{ important colors  }
{ may be more for some codecs  }
type
  Pgst_riff_strf_vids = ^Tgst_riff_strf_vids;
  Tgst_riff_strf_vids = record
      size : Tguint32;
      width : Tguint32;
      height : Tguint32;
      planes : Tguint16;
      bit_cnt : Tguint16;
      compression : Tguint32;
      image_size : Tguint32;
      xpels_meter : Tguint32;
      ypels_meter : Tguint32;
      num_colors : Tguint32;
      imp_colors : Tguint32;
    end;
{ == WaveHeader (?)  }
{*** from public Microsoft RIFF docs ***** }
{$if 0}
{ missing field  }
{$endif}
type
  Pgst_riff_strf_auds = ^Tgst_riff_strf_auds;
  Tgst_riff_strf_auds = record
      format : Tguint16;
      channels : Tguint16;
      rate : Tguint32;
      av_bps : Tguint32;
      blockalign : Tguint16;
      bits_per_sample : Tguint16;
      extra_size : Tguint16;
    end;

const
  GST_RIFF_WAVE_FORMAT_UNKNOWN = $0000;  
  GST_RIFF_WAVE_FORMAT_PCM = $0001;  
  GST_RIFF_WAVE_FORMAT_ADPCM = $0002;  
  GST_RIFF_WAVE_FORMAT_IEEE_FLOAT = $0003;  
  GST_RIFF_WAVE_FORMAT_VSELP = $0004;  
  GST_RIFF_WAVE_FORMAT_IBM_CVSD = $0005;  
  GST_RIFF_WAVE_FORMAT_ALAW = $0006;  
  GST_RIFF_WAVE_FORMAT_MULAW = $0007;  
{ WMS Windows Media Audio Speech  }
  GST_RIFF_WAVE_FORMAT_WMS = $000a;  
  GST_RIFF_WAVE_FORMAT_OKI_ADPCM = $0010;  
  GST_RIFF_WAVE_FORMAT_DVI_ADPCM = $0011;  
  GST_RIFF_WAVE_FORMAT_MEDIASPACE_ADPCM = $0012;  
  GST_RIFF_WAVE_FORMAT_SIERRA_ADPCM = $0013;  
  GST_RIFF_WAVE_FORMAT_G723_ADPCM = $0014;  
  GST_RIFF_WAVE_FORMAT_DIGISTD = $0015;  
  GST_RIFF_WAVE_FORMAT_DIGIFIX = $0016;  
  GST_RIFF_WAVE_FORMAT_DIALOGIC_OKI_ADPCM = $0017;  
  GST_RIFF_WAVE_FORMAT_MEDIAVISION_ADPCM = $0018;  
  GST_RIFF_WAVE_FORMAT_CU_CODEC = $0019;  
  GST_RIFF_WAVE_FORMAT_YAMAHA_ADPCM = $0020;  
  GST_RIFF_WAVE_FORMAT_SONARC = $0021;  
  GST_RIFF_WAVE_FORMAT_DSP_TRUESPEECH = $0022;  
  GST_RIFF_WAVE_FORMAT_ECHOSC1 = $0023;  
  GST_RIFF_WAVE_FORMAT_AUDIOFILE_AF36 = $0024;  
  GST_RIFF_WAVE_FORMAT_APTX = $0025;  
  GST_RIFF_WAVE_FORMAT_AUDIOFILE_AF10 = $0026;  
  GST_RIFF_WAVE_FORMAT_PROSODY_1612 = $0027;  
  GST_RIFF_WAVE_FORMAT_LRC = $0028;  
  GST_RIFF_WAVE_FORMAT_DOLBY_AC2 = $0030;  
  GST_RIFF_WAVE_FORMAT_GSM610 = $0031;  
  GST_RIFF_WAVE_FORMAT_MSN = $0032;  
  GST_RIFF_WAVE_FORMAT_ANTEX_ADPCME = $0033;  
  GST_RIFF_WAVE_FORMAT_CONTROL_RES_VQLPC = $0034;  
  GST_RIFF_WAVE_FORMAT_DIGIREAL = $0035;  
  GST_RIFF_WAVE_FORMAT_DIGIADPCM = $0036;  
  GST_RIFF_WAVE_FORMAT_CONTROL_RES_CR10 = $0037;  
  GST_RIFF_WAVE_FORMAT_NMS_VBXADPCM = $0038;  
  GST_RIFF_WAVE_FORMAT_CS_IMAADPCM = $0039;  
  GST_RIFF_WAVE_FORMAT_ECHOSC3 = $003A;  
  GST_RIFF_WAVE_FORMAT_ROCKWELL_ADPCM = $003B;  
  GST_RIFF_WAVE_FORMAT_ROCKWELL_DIGITALK = $003C;  
  GST_RIFF_WAVE_FORMAT_XEBEC = $003D;  
  GST_RIFF_WAVE_FORMAT_ITU_G721_ADPCM = $0040;  
  GST_RIFF_WAVE_FORMAT_G728_CELP = $0041;  
  GST_RIFF_WAVE_FORMAT_MSG723 = $0042;  
  GST_RIFF_WAVE_FORMAT_ITU_G726_ADPCM = $0045;  
  GST_RIFF_WAVE_FORMAT_MPEGL12 = $0050;  
  GST_RIFF_WAVE_FORMAT_RT24 = $0052;  
  GST_RIFF_WAVE_FORMAT_PAC = $0053;  
  GST_RIFF_WAVE_FORMAT_MPEGL3 = $0055;  
  GST_RIFF_WAVE_FORMAT_AMR_NB = $0057;  
  GST_RIFF_WAVE_FORMAT_AMR_WB = $0058;  
  GST_RIFF_WAVE_FORMAT_LUCENT_G723 = $0059;  
  GST_RIFF_WAVE_FORMAT_CIRRUS = $0060;  
{ not official  }
  GST_RIFF_WAVE_FORMAT_ADPCM_IMA_DK4 = $0061;  
{ not official  }
  GST_RIFF_WAVE_FORMAT_ADPCM_IMA_DK3 = $0062;  
{ FIXME: where are these from? are they used at all?  }
{$if 0}

const
  GST_RIFF_WAVE_FORMAT_ESPCM = $0061;  
  GST_RIFF_WAVE_FORMAT_VOXWARE = $0062;  
{$endif}

const
  GST_RIFF_WAVE_FORMAT_CANOPUS_ATRAC = $0063;  
  GST_RIFF_WAVE_FORMAT_G726_ADPCM = $0064;  
  GST_RIFF_WAVE_FORMAT_G722_ADPCM = $0065;  
  GST_RIFF_WAVE_FORMAT_ADPCM_G722 = $028F;  
  GST_RIFF_WAVE_FORMAT_DSAT_DISPLAY = $0067;  
  GST_RIFF_WAVE_FORMAT_ADPCM_IMA_WAV = $0069;  
{ FIXME: where are these from? are they used at all?  }
{$if 0}

const
  GST_RIFF_WAVE_FORMAT_VOXWARE_BYTE_ALIGNED = $0069;  
{$endif}

const
  GST_RIFF_WAVE_FORMAT_VOXWARE_AC8 = $0070;  
  GST_RIFF_WAVE_FORMAT_VOXWARE_AC10 = $0071;  
  GST_RIFF_WAVE_FORMAT_VOXWARE_AC16 = $0072;  
  GST_RIFF_WAVE_FORMAT_VOXWARE_AC20 = $0073;  
  GST_RIFF_WAVE_FORMAT_VOXWARE_METAVOICE = $0074;  
  GST_RIFF_WAVE_FORMAT_VOXWARE_METASOUND = $0075;  
  GST_RIFF_WAVE_FORMAT_VOXWARE_RT29HW = $0076;  
  GST_RIFF_WAVE_FORMAT_VOXWARE_VR12 = $0077;  
  GST_RIFF_WAVE_FORMAT_VOXWARE_VR18 = $0078;  
  GST_RIFF_WAVE_FORMAT_VOXWARE_TQ40 = $0079;  
  GST_RIFF_WAVE_FORMAT_SOFTSOUND = $0080;  
  GST_RIFF_WAVE_FORMAT_VOXWARE_TQ60 = $0081;  
  GST_RIFF_WAVE_FORMAT_MSRT24 = $0082;  
  GST_RIFF_WAVE_FORMAT_G729A = $0083;  
  GST_RIFF_WAVE_FORMAT_MVI_MVI2 = $0084;  
  GST_RIFF_WAVE_FORMAT_DF_G726 = $0085;  
  GST_RIFF_WAVE_FORMAT_DF_GSM610 = $0086;  
  GST_RIFF_WAVE_FORMAT_ISIAUDIO = $0088;  
  GST_RIFF_WAVE_FORMAT_ONLIVE = $0089;  
  GST_RIFF_WAVE_FORMAT_SBC24 = $0091;  
  GST_RIFF_WAVE_FORMAT_DOLBY_AC3_SPDIF = $0092;  
  GST_RIFF_WAVE_FORMAT_MEDIASONIC_G723 = $0093;  
  GST_RIFF_WAVE_FORMAT_PROSODY_8KBPS = $0094;  
  GST_RIFF_WAVE_FORMAT_ZYXEL_ADPCM = $0097;  
  GST_RIFF_WAVE_FORMAT_PHILIPS_LPCBB = $0098;  
  GST_RIFF_WAVE_FORMAT_PACKED = $0099;  
  GST_RIFF_WAVE_FORMAT_MALDEN_PHONYTALK = $00A0;  
  GST_RIFF_WAVE_FORMAT_AAC = $00ff;  
  GST_RIFF_WAVE_FORMAT_RHETOREX_ADPCM = $0100;  
  GST_RIFF_IBM_FORMAT_MULAW = $0101;  
  GST_RIFF_IBM_FORMAT_ALAW = $0102;  
  GST_RIFF_IBM_FORMAT_ADPCM = $0103;  
  GST_RIFF_WAVE_FORMAT_VIVO_G723 = $0111;  
  GST_RIFF_WAVE_FORMAT_VIVO_SIREN = $0112;  
  GST_RIFF_WAVE_FORMAT_DIGITAL_G723 = $0123;  
  GST_RIFF_WAVE_FORMAT_SANYO_LD_ADPCM = $0125;  
  GST_RIFF_WAVE_FORMAT_SIPROLAB_ACEPLNET = $0130;  
  GST_RIFF_WAVE_FORMAT_SIPROLAB_ACELP4800 = $0131;  
  GST_RIFF_WAVE_FORMAT_SIPROLAB_ACELP8V3 = $0132;  
  GST_RIFF_WAVE_FORMAT_SIPROLAB_G729 = $0133;  
  GST_RIFF_WAVE_FORMAT_SIPROLAB_G729A = $0134;  
  GST_RIFF_WAVE_FORMAT_SIPROLAB_KELVIN = $0135;  
  GST_RIFF_WAVE_FORMAT_G726ADPCM = $0140;  
  GST_RIFF_WAVE_FORMAT_QUALCOMM_PUREVOICE = $0150;  
  GST_RIFF_WAVE_FORMAT_QUALCOMM_HALFRATE = $0151;  
  GST_RIFF_WAVE_FORMAT_TUBGSM = $0155;  
  GST_RIFF_WAVE_FORMAT_WMAV1 = $0160;  
  GST_RIFF_WAVE_FORMAT_WMAV2 = $0161;  
  GST_RIFF_WAVE_FORMAT_WMAV3 = $0162;  
  GST_RIFF_WAVE_FORMAT_WMAV3_L = $0163;  
  GST_RIFF_WAVE_FORMAT_CREATIVE_ADPCM = $0200;  
  GST_RIFF_WAVE_FORMAT_CREATIVE_FASTSPEECH8 = $0202;  
  GST_RIFF_WAVE_FORMAT_CREATIVE_FASTSPEECH10 = $0203;  
  GST_RIFF_WAVE_FORMAT_UHER_ADPCM = $0210;  
  GST_RIFF_WAVE_FORMAT_QUARTERDECK = $0220;  
  GST_RIFF_WAVE_FORMAT_ILINK_VC = $0230;  
  GST_RIFF_WAVE_FORMAT_RAW_SPORT = $0240;  
  GST_RIFF_WAVE_FORMAT_IPI_HSX = $0250;  
  GST_RIFF_WAVE_FORMAT_IPI_RPELP = $0251;  
  GST_RIFF_WAVE_FORMAT_CS2 = $0260;  
  GST_RIFF_WAVE_FORMAT_SONY_ATRAC3 = $0270;  
  GST_RIFF_WAVE_FORMAT_SIREN = $028E;  
  GST_RIFF_WAVE_FORMAT_FM_TOWNS_SND = $0300;  
  GST_RIFF_WAVE_FORMAT_BTV_DIGITAL = $0400;  
  GST_RIFF_WAVE_FORMAT_IMC = $0401;  
  GST_RIFF_WAVE_FORMAT_QDESIGN_MUSIC = $0450;  
  GST_RIFF_WAVE_FORMAT_VME_VMPCM = $0680;  
  GST_RIFF_WAVE_FORMAT_TPC = $0681;  
  GST_RIFF_WAVE_FORMAT_OLIGSM = $1000;  
  GST_RIFF_WAVE_FORMAT_OLIADPCM = $1001;  
  GST_RIFF_WAVE_FORMAT_OLICELP = $1002;  
  GST_RIFF_WAVE_FORMAT_OLISBC = $1003;  
  GST_RIFF_WAVE_FORMAT_OLIOPR = $1004;  
  GST_RIFF_WAVE_FORMAT_LH_CODEC = $1100;  
  GST_RIFF_WAVE_FORMAT_NORRIS = $1400;  
  GST_RIFF_WAVE_FORMAT_SOUNDSPACE_MUSICOMPRESS = $1500;  
  GST_RIFF_WAVE_FORMAT_A52 = $2000;  
  GST_RIFF_WAVE_FORMAT_DTS = $2001;  
  GST_RIFF_WAVE_FORMAT_SONIC = $2048;  
  GST_RIFF_WAVE_FORMAT_SONIC_LS = $2048;  
  GST_RIFF_WAVE_FORMAT_AAC_AC = $4143;  
  GST_RIFF_WAVE_FORMAT_VORBIS1 = $674f;  
  GST_RIFF_WAVE_FORMAT_VORBIS2 = $6750;  
  GST_RIFF_WAVE_FORMAT_VORBIS3 = $6751;  
  GST_RIFF_WAVE_FORMAT_VORBIS1PLUS = $676f;  
  GST_RIFF_WAVE_FORMAT_VORBIS2PLUS = $6770;  
  GST_RIFF_WAVE_FORMAT_VORBIS3PLUS = $6771;  
  GST_RIFF_WAVE_FORMAT_AAC_pm = $706d;  
  GST_RIFF_WAVE_FORMAT_GSM_AMR_CBR = $7A21;  
  GST_RIFF_WAVE_FORMAT_GSM_AMR_VBR = $7A22;  
  GST_RIFF_WAVE_FORMAT_FLAC = $F1AC;  
  GST_RIFF_WAVE_FORMAT_EXTENSIBLE = $FFFE;  
type
  Pgst_riff_strf_iavs = ^Tgst_riff_strf_iavs;
  Tgst_riff_strf_iavs = record
      DVAAuxSrc : Tguint32;
      DVAAuxCtl : Tguint32;
      DVAAuxSrc1 : Tguint32;
      DVAAuxCtl1 : Tguint32;
      DVVAuxSrc : Tguint32;
      DVVAuxCtl : Tguint32;
      DVReserved1 : Tguint32;
      DVReserved2 : Tguint32;
    end;

  Pgst_riff_index_entry = ^Tgst_riff_index_entry;
  Tgst_riff_index_entry = record
      id : Tguint32;
      flags : Tguint32;
      offset : Tguint32;
      size : Tguint32;
    end;

const
  GST_RIFF_IF_LIST = $00000001;  
  GST_RIFF_IF_KEYFRAME = $00000010;  
  GST_RIFF_IF_NO_TIME = $00000100;  
  GST_RIFF_IF_COMPUSE = $0FFF0000;  
type
  Pgst_riff_dmlh = ^Tgst_riff_dmlh;
  Tgst_riff_dmlh = record
      totalframes : Tguint32;
    end;
{ taken from libsndfile/wav.c (LGPL)  }
{ 4 bytes (int)     type of file:
   *  this appears to be a bit mask,however some combinations
   *  are probably impossible and/or qualified as "errors"
   *
   *  0x01 On: One Shot         Off: Loop
   *  0x02 On: Root note is Set Off: No root
   *  0x04 On: Stretch is On,   Off: Stretch is OFF
   *  0x08 On: Disk Based       Off: Ram based
   *  0x10 On: ??????????       Off: ????????? (Acidizer puts that ON)
    }
{ 2 bytes (short)      root note
   *  if type 0x10 is OFF : [C,C#,(...),B] -> [0x30 to 0x3B]
   *  if type 0x10 is ON  : [C,C#,(...),B] -> [0x3C to 0x47]
   *  (both types fit on same MIDI pitch albeit different octaves, so who cares)
    }
{ 2 bytes (short)      ??? always set to 0x8000
   * 4 bytes (float)      ??? seems to be always 0
    }
{ 4 bytes (int)        number of beats
   * 2 bytes (short)      meter denominator   //always 4 in SF/ACID
   * 2 bytes (short)      meter numerator     //always 4 in SF/ACID
   *                      //are we sure about the order?? usually its num/denom
   * 4 bytes (float)      tempo
    }

  Pgst_riff_acid = ^Tgst_riff_acid;
  Tgst_riff_acid = record
      loop_type : Tguint32;
      root_note : Tguint16;
      unknown1 : Tguint16;
      unknown2 : Tgfloat;
      number_of_beats : Tguint32;
      meter_d : Tguint16;
      meter_n : Tguint16;
      tempo : Tgfloat;
    end;
{$endif}
{ __GST_RIFF_IDS_H__  }

// === Konventiert am: 27-7-26 13:25:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{ was #define dname def_expr }
function GST_RIFF_RIFF_WAVE : longint; { return type might be wrong }
  begin
    GST_RIFF_RIFF_WAVE:=GST_MAKE_FOURCC('W','A','V','E');
  end;

{ was #define dname def_expr }
function GST_RIFF_RIFF_AVI : longint; { return type might be wrong }
  begin
    GST_RIFF_RIFF_AVI:=GST_MAKE_FOURCC('A','V','I',' ');
  end;

{ was #define dname def_expr }
function GST_RIFF_RIFF_CDXA : longint; { return type might be wrong }
  begin
    GST_RIFF_RIFF_CDXA:=GST_MAKE_FOURCC('C','D','X','A');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_RIFF : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_RIFF:=GST_MAKE_FOURCC('R','I','F','F');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_AVF0 : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_AVF0:=GST_MAKE_FOURCC('A','V','F','0');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_RF64 : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_RF64:=GST_MAKE_FOURCC('R','F','6','4');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_RIFX : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_RIFX:=GST_MAKE_FOURCC('R','I','F','X');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_LIST : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_LIST:=GST_MAKE_FOURCC('L','I','S','T');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_avih : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_avih:=GST_MAKE_FOURCC('a','v','i','h');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_strd : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_strd:=GST_MAKE_FOURCC('s','t','r','d');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_strn : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_strn:=GST_MAKE_FOURCC('s','t','r','n');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_strh : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_strh:=GST_MAKE_FOURCC('s','t','r','h');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_strf : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_strf:=GST_MAKE_FOURCC('s','t','r','f');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_vedt : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_vedt:=GST_MAKE_FOURCC('v','e','d','t');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_JUNK : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_JUNK:=GST_MAKE_FOURCC('J','U','N','K');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_JUNQ : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_JUNQ:=GST_MAKE_FOURCC('J','U','N','Q');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_idx1 : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_idx1:=GST_MAKE_FOURCC('i','d','x','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_dmlh : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_dmlh:=GST_MAKE_FOURCC('d','m','l','h');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_ID32 : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_ID32:=GST_MAKE_FOURCC('I','D','3','2');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_id3 : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_id3:=GST_MAKE_FOURCC('i','d','3',' ');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_IDVX : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_IDVX:=GST_MAKE_FOURCC('I','D','V','X');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_fmt : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_fmt:=GST_MAKE_FOURCC('f','m','t',' ');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_data : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_data:=GST_MAKE_FOURCC('d','a','t','a');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_plst : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_plst:=GST_MAKE_FOURCC('p','l','s','t');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_cue : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_cue:=GST_MAKE_FOURCC('c','u','e',' ');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_bext : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_bext:=GST_MAKE_FOURCC('b','e','x','t');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_BEXT : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_BEXT:=GST_MAKE_FOURCC('B','E','X','T');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_fact : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_fact:=GST_MAKE_FOURCC('f','a','c','t');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_acid : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_acid:=GST_MAKE_FOURCC('a','c','i','d');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_labl : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_labl:=GST_MAKE_FOURCC('l','a','b','l');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_note : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_note:=GST_MAKE_FOURCC('n','o','t','e');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_smpl : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_smpl:=GST_MAKE_FOURCC('s','m','p','l');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_inst : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_inst:=GST_MAKE_FOURCC('i','n','s','t');
  end;

{ was #define dname def_expr }
function GST_RIFF_TAG_FLLR : longint; { return type might be wrong }
  begin
    GST_RIFF_TAG_FLLR:=GST_MAKE_FOURCC('F','L','L','R');
  end;

{ was #define dname def_expr }
function GST_RIFF_LIST_movi : longint; { return type might be wrong }
  begin
    GST_RIFF_LIST_movi:=GST_MAKE_FOURCC('m','o','v','i');
  end;

{ was #define dname def_expr }
function GST_RIFF_LIST_hdrl : longint; { return type might be wrong }
  begin
    GST_RIFF_LIST_hdrl:=GST_MAKE_FOURCC('h','d','r','l');
  end;

{ was #define dname def_expr }
function GST_RIFF_LIST_odml : longint; { return type might be wrong }
  begin
    GST_RIFF_LIST_odml:=GST_MAKE_FOURCC('o','d','m','l');
  end;

{ was #define dname def_expr }
function GST_RIFF_LIST_strl : longint; { return type might be wrong }
  begin
    GST_RIFF_LIST_strl:=GST_MAKE_FOURCC('s','t','r','l');
  end;

{ was #define dname def_expr }
function GST_RIFF_LIST_INFO : longint; { return type might be wrong }
  begin
    GST_RIFF_LIST_INFO:=GST_MAKE_FOURCC('I','N','F','O');
  end;

{ was #define dname def_expr }
function GST_RIFF_LIST_AVIX : longint; { return type might be wrong }
  begin
    GST_RIFF_LIST_AVIX:=GST_MAKE_FOURCC('A','V','I','X');
  end;

{ was #define dname def_expr }
function GST_RIFF_LIST_adtl : longint; { return type might be wrong }
  begin
    GST_RIFF_LIST_adtl:=GST_MAKE_FOURCC('a','d','t','l');
  end;

{ was #define dname def_expr }
function GST_RIFF_LIST_ncdt : longint; { return type might be wrong }
  begin
    GST_RIFF_LIST_ncdt:=GST_MAKE_FOURCC('n','c','d','t');
  end;

{ was #define dname def_expr }
function GST_RIFF_FCC_vids : longint; { return type might be wrong }
  begin
    GST_RIFF_FCC_vids:=GST_MAKE_FOURCC('v','i','d','s');
  end;

{ was #define dname def_expr }
function GST_RIFF_FCC_auds : longint; { return type might be wrong }
  begin
    GST_RIFF_FCC_auds:=GST_MAKE_FOURCC('a','u','d','s');
  end;

{ was #define dname def_expr }
function GST_RIFF_FCC_pads : longint; { return type might be wrong }
  begin
    GST_RIFF_FCC_pads:=GST_MAKE_FOURCC('p','a','d','s');
  end;

{ was #define dname def_expr }
function GST_RIFF_FCC_txts : longint; { return type might be wrong }
  begin
    GST_RIFF_FCC_txts:=GST_MAKE_FOURCC('t','x','t','s');
  end;

{ was #define dname def_expr }
function GST_RIFF_FCC_vidc : longint; { return type might be wrong }
  begin
    GST_RIFF_FCC_vidc:=GST_MAKE_FOURCC('v','i','d','c');
  end;

{ was #define dname def_expr }
function GST_RIFF_FCC_iavs : longint; { return type might be wrong }
  begin
    GST_RIFF_FCC_iavs:=GST_MAKE_FOURCC('i','a','v','s');
  end;

{ was #define dname def_expr }
function GST_RIFF_FCCH_RLE : longint; { return type might be wrong }
  begin
    GST_RIFF_FCCH_RLE:=GST_MAKE_FOURCC('R','L','E',' ');
  end;

{ was #define dname def_expr }
function GST_RIFF_FCCH_msvc : longint; { return type might be wrong }
  begin
    GST_RIFF_FCCH_msvc:=GST_MAKE_FOURCC('m','s','v','c');
  end;

{ was #define dname def_expr }
function GST_RIFF_FCCH_MSVC : longint; { return type might be wrong }
  begin
    GST_RIFF_FCCH_MSVC:=GST_MAKE_FOURCC('M','S','V','C');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_IARL : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_IARL:=GST_MAKE_FOURCC('I','A','R','L');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_IART : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_IART:=GST_MAKE_FOURCC('I','A','R','T');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ICMS : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ICMS:=GST_MAKE_FOURCC('I','C','M','S');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ICMT : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ICMT:=GST_MAKE_FOURCC('I','C','M','T');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ICOP : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ICOP:=GST_MAKE_FOURCC('I','C','O','P');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ICRD : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ICRD:=GST_MAKE_FOURCC('I','C','R','D');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ICRP : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ICRP:=GST_MAKE_FOURCC('I','C','R','P');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_IDIM : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_IDIM:=GST_MAKE_FOURCC('I','D','I','M');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_IDPI : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_IDPI:=GST_MAKE_FOURCC('I','D','P','I');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_IENG : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_IENG:=GST_MAKE_FOURCC('I','E','N','G');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_IGNR : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_IGNR:=GST_MAKE_FOURCC('I','G','N','R');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_IKEY : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_IKEY:=GST_MAKE_FOURCC('I','K','E','Y');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ILGT : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ILGT:=GST_MAKE_FOURCC('I','L','G','T');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_IMED : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_IMED:=GST_MAKE_FOURCC('I','M','E','D');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_INAM : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_INAM:=GST_MAKE_FOURCC('I','N','A','M');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_IPLT : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_IPLT:=GST_MAKE_FOURCC('I','P','L','T');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_IPRD : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_IPRD:=GST_MAKE_FOURCC('I','P','R','D');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ISBJ : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ISBJ:=GST_MAKE_FOURCC('I','S','B','J');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ISFT : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ISFT:=GST_MAKE_FOURCC('I','S','F','T');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ISHP : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ISHP:=GST_MAKE_FOURCC('I','S','H','P');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ISRC : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ISRC:=GST_MAKE_FOURCC('I','S','R','C');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ISRF : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ISRF:=GST_MAKE_FOURCC('I','S','R','F');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ITCH : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ITCH:=GST_MAKE_FOURCC('I','T','C','H');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_IAAR : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_IAAR:=GST_MAKE_FOURCC('I','A','A','R');
  end;

{ was #define dname def_expr }
function GST_RIFF_INFO_ITRK : longint; { return type might be wrong }
  begin
    GST_RIFF_INFO_ITRK:=GST_MAKE_FOURCC('I','T','R','K');
  end;

{ was #define dname def_expr }
function GST_RIFF_LIST_nctg : longint; { return type might be wrong }
  begin
    GST_RIFF_LIST_nctg:=GST_MAKE_FOURCC('n','c','t','g');
  end;

{ was #define dname def_expr }
function GST_RIFF_FF00 : longint; { return type might be wrong }
  begin
    GST_RIFF_FF00:=GST_MAKE_FOURCC($FF,$FF,$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_00 : longint; { return type might be wrong }
  begin
    GST_RIFF_00:=GST_MAKE_FOURCC('0','0',$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_01 : longint; { return type might be wrong }
  begin
    GST_RIFF_01:=GST_MAKE_FOURCC('0','1',$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_02 : longint; { return type might be wrong }
  begin
    GST_RIFF_02:=GST_MAKE_FOURCC('0','2',$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_03 : longint; { return type might be wrong }
  begin
    GST_RIFF_03:=GST_MAKE_FOURCC('0','3',$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_04 : longint; { return type might be wrong }
  begin
    GST_RIFF_04:=GST_MAKE_FOURCC('0','4',$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_05 : longint; { return type might be wrong }
  begin
    GST_RIFF_05:=GST_MAKE_FOURCC('0','5',$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_06 : longint; { return type might be wrong }
  begin
    GST_RIFF_06:=GST_MAKE_FOURCC('0','6',$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_07 : longint; { return type might be wrong }
  begin
    GST_RIFF_07:=GST_MAKE_FOURCC('0','7',$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_00pc : longint; { return type might be wrong }
  begin
    GST_RIFF_00pc:=GST_MAKE_FOURCC('0','0','p','c');
  end;

{ was #define dname def_expr }
function GST_RIFF_01pc : longint; { return type might be wrong }
  begin
    GST_RIFF_01pc:=GST_MAKE_FOURCC('0','1','p','c');
  end;

{ was #define dname def_expr }
function GST_RIFF_00dc : longint; { return type might be wrong }
  begin
    GST_RIFF_00dc:=GST_MAKE_FOURCC('0','0','d','c');
  end;

{ was #define dname def_expr }
function GST_RIFF_00dx : longint; { return type might be wrong }
  begin
    GST_RIFF_00dx:=GST_MAKE_FOURCC('0','0','d','x');
  end;

{ was #define dname def_expr }
function GST_RIFF_00db : longint; { return type might be wrong }
  begin
    GST_RIFF_00db:=GST_MAKE_FOURCC('0','0','d','b');
  end;

{ was #define dname def_expr }
function GST_RIFF_00xx : longint; { return type might be wrong }
  begin
    GST_RIFF_00xx:=GST_MAKE_FOURCC('0','0','x','x');
  end;

{ was #define dname def_expr }
function GST_RIFF_00id : longint; { return type might be wrong }
  begin
    GST_RIFF_00id:=GST_MAKE_FOURCC('0','0','i','d');
  end;

{ was #define dname def_expr }
function GST_RIFF_00rt : longint; { return type might be wrong }
  begin
    GST_RIFF_00rt:=GST_MAKE_FOURCC('0','0','r','t');
  end;

{ was #define dname def_expr }
function GST_RIFF_0021 : longint; { return type might be wrong }
  begin
    GST_RIFF_0021:=GST_MAKE_FOURCC('0','0','2','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_00iv : longint; { return type might be wrong }
  begin
    GST_RIFF_00iv:=GST_MAKE_FOURCC('0','0','i','v');
  end;

{ was #define dname def_expr }
function GST_RIFF_0031 : longint; { return type might be wrong }
  begin
    GST_RIFF_0031:=GST_MAKE_FOURCC('0','0','3','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_0032 : longint; { return type might be wrong }
  begin
    GST_RIFF_0032:=GST_MAKE_FOURCC('0','0','3','2');
  end;

{ was #define dname def_expr }
function GST_RIFF_00vc : longint; { return type might be wrong }
  begin
    GST_RIFF_00vc:=GST_MAKE_FOURCC('0','0','v','c');
  end;

{ was #define dname def_expr }
function GST_RIFF_00xm : longint; { return type might be wrong }
  begin
    GST_RIFF_00xm:=GST_MAKE_FOURCC('0','0','x','m');
  end;

{ was #define dname def_expr }
function GST_RIFF_01wb : longint; { return type might be wrong }
  begin
    GST_RIFF_01wb:=GST_MAKE_FOURCC('0','1','w','b');
  end;

{ was #define dname def_expr }
function GST_RIFF_01dc : longint; { return type might be wrong }
  begin
    GST_RIFF_01dc:=GST_MAKE_FOURCC('0','1','d','c');
  end;

{ was #define dname def_expr }
function GST_RIFF_00__ : longint; { return type might be wrong }
  begin
    GST_RIFF_00__:=GST_MAKE_FOURCC('0','0','_','_');
  end;

{ was #define dname def_expr }
function GST_RIFF_cram : longint; { return type might be wrong }
  begin
    GST_RIFF_cram:=GST_MAKE_FOURCC('c','r','a','m');
  end;

{ was #define dname def_expr }
function GST_RIFF_CRAM : longint; { return type might be wrong }
  begin
    GST_RIFF_CRAM:=GST_MAKE_FOURCC('C','R','A','M');
  end;

{ was #define dname def_expr }
function GST_RIFF_wham : longint; { return type might be wrong }
  begin
    GST_RIFF_wham:=GST_MAKE_FOURCC('w','h','a','m');
  end;

{ was #define dname def_expr }
function GST_RIFF_WHAM : longint; { return type might be wrong }
  begin
    GST_RIFF_WHAM:=GST_MAKE_FOURCC('W','H','A','M');
  end;

{ was #define dname def_expr }
function GST_RIFF_rgb : longint; { return type might be wrong }
  begin
    GST_RIFF_rgb:=GST_MAKE_FOURCC($00,$00,$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_RGB : longint; { return type might be wrong }
  begin
    GST_RIFF_RGB:=GST_MAKE_FOURCC('R','G','B',' ');
  end;

{ was #define dname def_expr }
function GST_RIFF_RAW : longint; { return type might be wrong }
  begin
    GST_RIFF_RAW:=GST_MAKE_FOURCC('R','A','W',' ');
  end;

{ was #define dname def_expr }
function GST_RIFF_DIB : longint; { return type might be wrong }
  begin
    GST_RIFF_DIB:=GST_MAKE_FOURCC('D','I','B',' ');
  end;

{ was #define dname def_expr }
function GST_RIFF_rle8 : longint; { return type might be wrong }
  begin
    GST_RIFF_rle8:=GST_MAKE_FOURCC($01,$00,$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_RLE8 : longint; { return type might be wrong }
  begin
    GST_RIFF_RLE8:=GST_MAKE_FOURCC('R','L','E','8');
  end;

{ was #define dname def_expr }
function GST_RIFF_rle4 : longint; { return type might be wrong }
  begin
    GST_RIFF_rle4:=GST_MAKE_FOURCC($02,$00,$00,$00);
  end;

{ was #define dname def_expr }
function GST_RIFF_RLE4 : longint; { return type might be wrong }
  begin
    GST_RIFF_RLE4:=GST_MAKE_FOURCC('R','L','E','4');
  end;

{ was #define dname def_expr }
function GST_RIFF_none : longint; { return type might be wrong }
  begin
    GST_RIFF_none:=GST_MAKE_FOURCC($00,$00,$FF,$FF);
  end;

{ was #define dname def_expr }
function GST_RIFF_NONE : longint; { return type might be wrong }
  begin
    GST_RIFF_NONE:=GST_MAKE_FOURCC('N','O','N','E');
  end;

{ was #define dname def_expr }
function GST_RIFF_pack : longint; { return type might be wrong }
  begin
    GST_RIFF_pack:=GST_MAKE_FOURCC($01,$00,$FF,$FF);
  end;

{ was #define dname def_expr }
function GST_RIFF_PACK : longint; { return type might be wrong }
  begin
    GST_RIFF_PACK:=GST_MAKE_FOURCC('P','A','C','K');
  end;

{ was #define dname def_expr }
function GST_RIFF_tran : longint; { return type might be wrong }
  begin
    GST_RIFF_tran:=GST_MAKE_FOURCC($02,$00,$FF,$FF);
  end;

{ was #define dname def_expr }
function GST_RIFF_TRAN : longint; { return type might be wrong }
  begin
    GST_RIFF_TRAN:=GST_MAKE_FOURCC('T','R','A','N');
  end;

{ was #define dname def_expr }
function GST_RIFF_ccc : longint; { return type might be wrong }
  begin
    GST_RIFF_ccc:=GST_MAKE_FOURCC($03,$00,$FF,$FF);
  end;

{ was #define dname def_expr }
function GST_RIFF_CCC : longint; { return type might be wrong }
  begin
    GST_RIFF_CCC:=GST_MAKE_FOURCC('C','C','C',' ');
  end;

{ was #define dname def_expr }
function GST_RIFF_cyuv : longint; { return type might be wrong }
  begin
    GST_RIFF_cyuv:=GST_MAKE_FOURCC('c','y','u','v');
  end;

{ was #define dname def_expr }
function GST_RIFF_CYUV : longint; { return type might be wrong }
  begin
    GST_RIFF_CYUV:=GST_MAKE_FOURCC('C','Y','U','V');
  end;

{ was #define dname def_expr }
function GST_RIFF_jpeg : longint; { return type might be wrong }
  begin
    GST_RIFF_jpeg:=GST_MAKE_FOURCC($04,$00,$FF,$FF);
  end;

{ was #define dname def_expr }
function GST_RIFF_JPEG : longint; { return type might be wrong }
  begin
    GST_RIFF_JPEG:=GST_MAKE_FOURCC('J','P','E','G');
  end;

{ was #define dname def_expr }
function GST_RIFF_MJPG : longint; { return type might be wrong }
  begin
    GST_RIFF_MJPG:=GST_MAKE_FOURCC('M','J','P','G');
  end;

{ was #define dname def_expr }
function GST_RIFF_mJPG : longint; { return type might be wrong }
  begin
    GST_RIFF_mJPG:=GST_MAKE_FOURCC('m','J','P','G');
  end;

{ was #define dname def_expr }
function GST_RIFF_IJPG : longint; { return type might be wrong }
  begin
    GST_RIFF_IJPG:=GST_MAKE_FOURCC('I','J','P','G');
  end;

{ was #define dname def_expr }
function GST_RIFF_rt21 : longint; { return type might be wrong }
  begin
    GST_RIFF_rt21:=GST_MAKE_FOURCC('r','t','2','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_RT21 : longint; { return type might be wrong }
  begin
    GST_RIFF_RT21:=GST_MAKE_FOURCC('R','T','2','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_iv31 : longint; { return type might be wrong }
  begin
    GST_RIFF_iv31:=GST_MAKE_FOURCC('i','v','3','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_IV31 : longint; { return type might be wrong }
  begin
    GST_RIFF_IV31:=GST_MAKE_FOURCC('I','V','3','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_iv32 : longint; { return type might be wrong }
  begin
    GST_RIFF_iv32:=GST_MAKE_FOURCC('i','v','3','2');
  end;

{ was #define dname def_expr }
function GST_RIFF_IV32 : longint; { return type might be wrong }
  begin
    GST_RIFF_IV32:=GST_MAKE_FOURCC('I','V','3','2');
  end;

{ was #define dname def_expr }
function GST_RIFF_iv41 : longint; { return type might be wrong }
  begin
    GST_RIFF_iv41:=GST_MAKE_FOURCC('i','v','4','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_IV41 : longint; { return type might be wrong }
  begin
    GST_RIFF_IV41:=GST_MAKE_FOURCC('I','V','4','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_iv50 : longint; { return type might be wrong }
  begin
    GST_RIFF_iv50:=GST_MAKE_FOURCC('i','v','5','0');
  end;

{ was #define dname def_expr }
function GST_RIFF_IV50 : longint; { return type might be wrong }
  begin
    GST_RIFF_IV50:=GST_MAKE_FOURCC('I','V','5','0');
  end;

{ was #define dname def_expr }
function GST_RIFF_cvid : longint; { return type might be wrong }
  begin
    GST_RIFF_cvid:=GST_MAKE_FOURCC('c','v','i','d');
  end;

{ was #define dname def_expr }
function GST_RIFF_CVID : longint; { return type might be wrong }
  begin
    GST_RIFF_CVID:=GST_MAKE_FOURCC('C','V','I','D');
  end;

{ was #define dname def_expr }
function GST_RIFF_ULTI : longint; { return type might be wrong }
  begin
    GST_RIFF_ULTI:=GST_MAKE_FOURCC('U','L','T','I');
  end;

{ was #define dname def_expr }
function GST_RIFF_ulti : longint; { return type might be wrong }
  begin
    GST_RIFF_ulti:=GST_MAKE_FOURCC('u','l','t','i');
  end;

{ was #define dname def_expr }
function GST_RIFF_YUV9 : longint; { return type might be wrong }
  begin
    GST_RIFF_YUV9:=GST_MAKE_FOURCC('Y','U','V','9');
  end;

{ was #define dname def_expr }
function GST_RIFF_YVU9 : longint; { return type might be wrong }
  begin
    GST_RIFF_YVU9:=GST_MAKE_FOURCC('Y','V','U','9');
  end;

{ was #define dname def_expr }
function GST_RIFF_XMPG : longint; { return type might be wrong }
  begin
    GST_RIFF_XMPG:=GST_MAKE_FOURCC('X','M','P','G');
  end;

{ was #define dname def_expr }
function GST_RIFF_xmpg : longint; { return type might be wrong }
  begin
    GST_RIFF_xmpg:=GST_MAKE_FOURCC('x','m','p','g');
  end;

{ was #define dname def_expr }
function GST_RIFF_VDOW : longint; { return type might be wrong }
  begin
    GST_RIFF_VDOW:=GST_MAKE_FOURCC('V','D','O','W');
  end;

{ was #define dname def_expr }
function GST_RIFF_MVI1 : longint; { return type might be wrong }
  begin
    GST_RIFF_MVI1:=GST_MAKE_FOURCC('M','V','I','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_v422 : longint; { return type might be wrong }
  begin
    GST_RIFF_v422:=GST_MAKE_FOURCC('v','4','2','2');
  end;

{ was #define dname def_expr }
function GST_RIFF_V422 : longint; { return type might be wrong }
  begin
    GST_RIFF_V422:=GST_MAKE_FOURCC('V','4','2','2');
  end;

{ was #define dname def_expr }
function GST_RIFF_mvi1 : longint; { return type might be wrong }
  begin
    GST_RIFF_mvi1:=GST_MAKE_FOURCC('m','v','i','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_MPIX : longint; { return type might be wrong }
  begin
    GST_RIFF_MPIX:=GST_MAKE_FOURCC($04,$00,'i','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_AURA : longint; { return type might be wrong }
  begin
    GST_RIFF_AURA:=GST_MAKE_FOURCC('A','U','R','A');
  end;

{ was #define dname def_expr }
function GST_RIFF_DMB1 : longint; { return type might be wrong }
  begin
    GST_RIFF_DMB1:=GST_MAKE_FOURCC('D','M','B','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_dmb1 : longint; { return type might be wrong }
  begin
    GST_RIFF_dmb1:=GST_MAKE_FOURCC('d','m','b','1');
  end;

{ was #define dname def_expr }
function GST_RIFF_BW10 : longint; { return type might be wrong }
  begin
    GST_RIFF_BW10:=GST_MAKE_FOURCC('B','W','1','0');
  end;

{ was #define dname def_expr }
function GST_RIFF_bw10 : longint; { return type might be wrong }
  begin
    GST_RIFF_bw10:=GST_MAKE_FOURCC('b','w','1','0');
  end;

{ was #define dname def_expr }
function GST_RIFF_yuy2 : longint; { return type might be wrong }
  begin
    GST_RIFF_yuy2:=GST_MAKE_FOURCC('y','u','y','2');
  end;

{ was #define dname def_expr }
function GST_RIFF_YUY2 : longint; { return type might be wrong }
  begin
    GST_RIFF_YUY2:=GST_MAKE_FOURCC('Y','U','Y','2');
  end;

{ was #define dname def_expr }
function GST_RIFF_YUV8 : longint; { return type might be wrong }
  begin
    GST_RIFF_YUV8:=GST_MAKE_FOURCC('Y','U','V','8');
  end;

{ was #define dname def_expr }
function GST_RIFF_WINX : longint; { return type might be wrong }
  begin
    GST_RIFF_WINX:=GST_MAKE_FOURCC('W','I','N','X');
  end;

{ was #define dname def_expr }
function GST_RIFF_WPY2 : longint; { return type might be wrong }
  begin
    GST_RIFF_WPY2:=GST_MAKE_FOURCC('W','P','Y','2');
  end;

{ was #define dname def_expr }
function GST_RIFF_m263 : longint; { return type might be wrong }
  begin
    GST_RIFF_m263:=GST_MAKE_FOURCC('m','2','6','3');
  end;

{ was #define dname def_expr }
function GST_RIFF_M263 : longint; { return type might be wrong }
  begin
    GST_RIFF_M263:=GST_MAKE_FOURCC('M','2','6','3');
  end;

{ was #define dname def_expr }
function GST_RIFF_H263 : longint; { return type might be wrong }
  begin
    GST_RIFF_H263:=GST_MAKE_FOURCC('H','2','6','3');
  end;

{ was #define dname def_expr }
function GST_RIFF_h263 : longint; { return type might be wrong }
  begin
    GST_RIFF_h263:=GST_MAKE_FOURCC('h','2','6','3');
  end;

{ was #define dname def_expr }
function GST_RIFF_i263 : longint; { return type might be wrong }
  begin
    GST_RIFF_i263:=GST_MAKE_FOURCC('i','2','6','3');
  end;

{ was #define dname def_expr }
function GST_RIFF_L263 : longint; { return type might be wrong }
  begin
    GST_RIFF_L263:=GST_MAKE_FOURCC('L','2','6','3');
  end;

{ was #define dname def_expr }
function GST_RIFF_x263 : longint; { return type might be wrong }
  begin
    GST_RIFF_x263:=GST_MAKE_FOURCC('x','2','6','3');
  end;

{ was #define dname def_expr }
function GST_RIFF_VSSH : longint; { return type might be wrong }
  begin
    GST_RIFF_VSSH:=GST_MAKE_FOURCC('V','S','S','H');
  end;

{ was #define dname def_expr }
function GST_RIFF_Q1_0 : longint; { return type might be wrong }
  begin
    GST_RIFF_Q1_0:=GST_MAKE_FOURCC('Q','1',$2e,'0');
  end;

{ was #define dname def_expr }
function GST_RIFF_SFMC : longint; { return type might be wrong }
  begin
    GST_RIFF_SFMC:=GST_MAKE_FOURCC('S','F','M','C');
  end;

{ was #define dname def_expr }
function GST_RIFF_y41p : longint; { return type might be wrong }
  begin
    GST_RIFF_y41p:=GST_MAKE_FOURCC('y','4','1','p');
  end;

{ was #define dname def_expr }
function GST_RIFF_Y41P : longint; { return type might be wrong }
  begin
    GST_RIFF_Y41P:=GST_MAKE_FOURCC('Y','4','1','P');
  end;

{ was #define dname def_expr }
function GST_RIFF_yv12 : longint; { return type might be wrong }
  begin
    GST_RIFF_yv12:=GST_MAKE_FOURCC('y','v','1','2');
  end;

{ was #define dname def_expr }
function GST_RIFF_YV12 : longint; { return type might be wrong }
  begin
    GST_RIFF_YV12:=GST_MAKE_FOURCC('Y','V','1','2');
  end;

{ was #define dname def_expr }
function GST_RIFF_vixl : longint; { return type might be wrong }
  begin
    GST_RIFF_vixl:=GST_MAKE_FOURCC('v','i','x','l');
  end;

{ was #define dname def_expr }
function GST_RIFF_VIXL : longint; { return type might be wrong }
  begin
    GST_RIFF_VIXL:=GST_MAKE_FOURCC('V','I','X','L');
  end;

{ was #define dname def_expr }
function GST_RIFF_iyuv : longint; { return type might be wrong }
  begin
    GST_RIFF_iyuv:=GST_MAKE_FOURCC('i','y','u','v');
  end;

{ was #define dname def_expr }
function GST_RIFF_IYUV : longint; { return type might be wrong }
  begin
    GST_RIFF_IYUV:=GST_MAKE_FOURCC('I','Y','U','V');
  end;

{ was #define dname def_expr }
function GST_RIFF_i420 : longint; { return type might be wrong }
  begin
    GST_RIFF_i420:=GST_MAKE_FOURCC('i','4','2','0');
  end;

{ was #define dname def_expr }
function GST_RIFF_I420 : longint; { return type might be wrong }
  begin
    GST_RIFF_I420:=GST_MAKE_FOURCC('I','4','2','0');
  end;

{ was #define dname def_expr }
function GST_RIFF_vyuy : longint; { return type might be wrong }
  begin
    GST_RIFF_vyuy:=GST_MAKE_FOURCC('v','y','u','y');
  end;

{ was #define dname def_expr }
function GST_RIFF_VYUY : longint; { return type might be wrong }
  begin
    GST_RIFF_VYUY:=GST_MAKE_FOURCC('V','Y','U','Y');
  end;

{ was #define dname def_expr }
function GST_RIFF_DIV3 : longint; { return type might be wrong }
  begin
    GST_RIFF_DIV3:=GST_MAKE_FOURCC('D','I','V','3');
  end;

{ was #define dname def_expr }
function GST_RIFF_rpza : longint; { return type might be wrong }
  begin
    GST_RIFF_rpza:=GST_MAKE_FOURCC('r','p','z','a');
  end;

{ was #define dname def_expr }
function GST_RIFF_azpr : longint; { return type might be wrong }
  begin
    GST_RIFF_azpr:=GST_MAKE_FOURCC('a','z','p','r');
  end;

{ was #define dname def_expr }
function GST_RIFF_ISFT : longint; { return type might be wrong }
  begin
    GST_RIFF_ISFT:=GST_MAKE_FOURCC('I','S','F','T');
  end;

{ was #define dname def_expr }
function GST_RIFF_IDIT : longint; { return type might be wrong }
  begin
    GST_RIFF_IDIT:=GST_MAKE_FOURCC('I','D','I','T');
  end;

{ was #define dname def_expr }
function GST_RIFF_00AM : longint; { return type might be wrong }
  begin
    GST_RIFF_00AM:=GST_MAKE_FOURCC('0','0','A','M');
  end;

{ was #define dname def_expr }
function GST_RIFF_DISP : longint; { return type might be wrong }
  begin
    GST_RIFF_DISP:=GST_MAKE_FOURCC('D','I','S','P');
  end;

{ was #define dname def_expr }
function GST_RIFF_ISBJ : longint; { return type might be wrong }
  begin
    GST_RIFF_ISBJ:=GST_MAKE_FOURCC('I','S','B','J');
  end;

{ was #define dname def_expr }
function GST_RIFF_rec : longint; { return type might be wrong }
  begin
    GST_RIFF_rec:=GST_MAKE_FOURCC('r','e','c',' ');
  end;


{$ENDIF read_implementation}
