
unit sndfile;
interface

{
  Automatically converted by H2Pas 1.0.0 from sndfile.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sndfile.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pdouble  = ^double;
Plongint  = ^longint;
PSF_CART_TIMER  = ^SF_CART_TIMER;
PSF_CHUNK_INFO  = ^SF_CHUNK_INFO;
PSF_CHUNK_ITERATOR  = ^SF_CHUNK_ITERATOR;
Psf_count_t  = ^sf_count_t;
PSF_CUE_POINT  = ^SF_CUE_POINT;
PSF_DITHER_INFO  = ^SF_DITHER_INFO;
PSF_EMBED_FILE_INFO  = ^SF_EMBED_FILE_INFO;
PSF_FORMAT_INFO  = ^SF_FORMAT_INFO;
PSF_INFO  = ^SF_INFO;
PSF_INSTRUMENT  = ^SF_INSTRUMENT;
PSF_LOOP_INFO  = ^SF_LOOP_INFO;
PSF_VIRTUAL_IO  = ^SF_VIRTUAL_IO;
Psingle  = ^single;
Psmallint  = ^smallint;
PSNDFILE  = ^SNDFILE;
Pwchar_t  = ^wchar_t;
Pxxxxx  = ^xxxxx;
Pxxxxxxx  = ^xxxxxxx;
Pxxxxxxxxx  = ^xxxxxxxxx;
Pxxxxxxxxxxx  = ^xxxxxxxxxxx;
Pxxxxxxxxxxxxx  = ^xxxxxxxxxxxxx;
Pxxxxxxxxxxxxxx  = ^xxxxxxxxxxxxxx;
Pxxxxxxxxxxxxxxx  = ^xxxxxxxxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
**
** This program is free software; you can redistribute it and/or modify
** it under the terms of the GNU Lesser General Public License as published by
** the Free Software Foundation; either version 2.1 of the License, or
** (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU Lesser General Public License for more details.
**
** You should have received a copy of the GNU Lesser General Public License
** along with this program; if not, write to the Free Software
** Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 }
{
** sndfile.h -- system-wide definitions
**
** API documentation is in the doc/ directory of the source code tarball
** and at http://libsndfile.github.io/libsndfile/api.html.
 }
{$ifndef SNDFILE_H}
{$define SNDFILE_H}
{ This is the version 1.0.X header file.  }
{$define SNDFILE_1}
{$include <stdio.h>}
{$include <stdint.h>}
{$include <sys/types.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{ The following file types can be read and written.
** A file type would consist of a major type (ie SF_FORMAT_WAV) bitwise
** ORed with a minor type (ie SF_FORMAT_PCM). SF_FORMAT_TYPEMASK and
** SF_FORMAT_SUBMASK can be used to separate the major and minor file
** types.
 }
{ Major formats.  }
{ Microsoft WAV format (little endian default).  }
{ Apple/SGI AIFF format (big endian).  }
{ Sun/NeXT AU format (big endian).  }
{ RAW PCM data.  }
{ Ensoniq PARIS file format.  }
{ Amiga IFF / SVX8 / SV16 format.  }
{ Sphere NIST format.  }
{ VOC files.  }
{ Berkeley/IRCAM/CARL  }
{ Sonic Foundry's 64 bit RIFF/WAV  }
{ Matlab (tm) V4.2 / GNU Octave 2.0  }
{ Matlab (tm) V5.0 / GNU Octave 2.1  }
{ Portable Voice Format  }
{ Fasttracker 2 Extended Instrument  }
{ HMM Tool Kit format  }
{ Midi Sample Dump Standard  }
{ Audio Visual Research  }
{ MS WAVE with WAVEFORMATEX  }
{ Sound Designer 2  }
{ FLAC lossless file format  }
{ Core Audio File format  }
{ Psion WVE format  }
{ Xiph OGG container  }
{ Akai MPC 2000 sampler  }
{ RF64 WAV file  }
{ MPEG-1/2 audio stream  }
{ Subtypes from here on.  }
{ Signed 8 bit data  }
{ Signed 16 bit data  }
{ Signed 24 bit data  }
{ Signed 32 bit data  }
{ Unsigned 8 bit data (WAV and RAW only)  }
{ 32 bit float data  }
{ 64 bit float data  }
{ U-Law encoded.  }
{ A-Law encoded.  }
{ IMA ADPCM.  }
{ Microsoft ADPCM.  }
{ GSM 6.10 encoding.  }
{ OKI / Dialogix ADPCM  }
{ 16kbs NMS G721-variant encoding.  }
{ 24kbs NMS G721-variant encoding.  }
{ 32kbs NMS G721-variant encoding.  }
{ 32kbs G721 ADPCM encoding.  }
{ 24kbs G723 ADPCM encoding.  }
{ 40kbs G723 ADPCM encoding.  }
{ 12 bit Delta Width Variable Word encoding.  }
{ 16 bit Delta Width Variable Word encoding.  }
{ 24 bit Delta Width Variable Word encoding.  }
{ N bit Delta Width Variable Word encoding.  }
{ 8 bit differential PCM (XI only)  }
{ 16 bit differential PCM (XI only)  }
{ Xiph Vorbis encoding.  }
{ Xiph/Skype Opus encoding.  }
{ Apple Lossless Audio Codec (16 bit).  }
{ Apple Lossless Audio Codec (20 bit).  }
{ Apple Lossless Audio Codec (24 bit).  }
{ Apple Lossless Audio Codec (32 bit).  }
{ MPEG-1 Audio Layer I  }
{ MPEG-1 Audio Layer II  }
{ MPEG-2 Audio Layer III  }
{ Endian-ness options.  }
{ Default file endian-ness.  }
{ Force little endian-ness.  }
{ Force big endian-ness.  }
{ Force CPU endian-ness.  }
type
  Txxxxxxx =  Longint;
  Const
    SF_FORMAT_WAV = $010000;
    SF_FORMAT_AIFF = $020000;
    SF_FORMAT_AU = $030000;
    SF_FORMAT_RAW = $040000;
    SF_FORMAT_PAF = $050000;
    SF_FORMAT_SVX = $060000;
    SF_FORMAT_NIST = $070000;
    SF_FORMAT_VOC = $080000;
    SF_FORMAT_IRCAM = $0A0000;
    SF_FORMAT_W64 = $0B0000;
    SF_FORMAT_MAT4 = $0C0000;
    SF_FORMAT_MAT5 = $0D0000;
    SF_FORMAT_PVF = $0E0000;
    SF_FORMAT_XI = $0F0000;
    SF_FORMAT_HTK = $100000;
    SF_FORMAT_SDS = $110000;
    SF_FORMAT_AVR = $120000;
    SF_FORMAT_WAVEX = $130000;
    SF_FORMAT_SD2 = $160000;
    SF_FORMAT_FLAC = $170000;
    SF_FORMAT_CAF = $180000;
    SF_FORMAT_WVE = $190000;
    SF_FORMAT_OGG = $200000;
    SF_FORMAT_MPC2K = $210000;
    SF_FORMAT_RF64 = $220000;
    SF_FORMAT_MPEG = $230000;
    SF_FORMAT_PCM_S8 = $0001;
    SF_FORMAT_PCM_16 = $0002;
    SF_FORMAT_PCM_24 = $0003;
    SF_FORMAT_PCM_32 = $0004;
    SF_FORMAT_PCM_U8 = $0005;
    SF_FORMAT_FLOAT = $0006;
    SF_FORMAT_DOUBLE = $0007;
    SF_FORMAT_ULAW = $0010;
    SF_FORMAT_ALAW = $0011;
    SF_FORMAT_IMA_ADPCM = $0012;
    SF_FORMAT_MS_ADPCM = $0013;
    SF_FORMAT_GSM610 = $0020;
    SF_FORMAT_VOX_ADPCM = $0021;
    SF_FORMAT_NMS_ADPCM_16 = $0022;
    SF_FORMAT_NMS_ADPCM_24 = $0023;
    SF_FORMAT_NMS_ADPCM_32 = $0024;
    SF_FORMAT_G721_32 = $0030;
    SF_FORMAT_G723_24 = $0031;
    SF_FORMAT_G723_40 = $0032;
    SF_FORMAT_DWVW_12 = $0040;
    SF_FORMAT_DWVW_16 = $0041;
    SF_FORMAT_DWVW_24 = $0042;
    SF_FORMAT_DWVW_N = $0043;
    SF_FORMAT_DPCM_8 = $0050;
    SF_FORMAT_DPCM_16 = $0051;
    SF_FORMAT_VORBIS = $0060;
    SF_FORMAT_OPUS = $0064;
    SF_FORMAT_ALAC_16 = $0070;
    SF_FORMAT_ALAC_20 = $0071;
    SF_FORMAT_ALAC_24 = $0072;
    SF_FORMAT_ALAC_32 = $0073;
    SF_FORMAT_MPEG_LAYER_I = $0080;
    SF_FORMAT_MPEG_LAYER_II = $0081;
    SF_FORMAT_MPEG_LAYER_III = $0082;
    SF_ENDIAN_FILE = $00000000;
    SF_ENDIAN_LITTLE = $10000000;
    SF_ENDIAN_BIG = $20000000;
    SF_ENDIAN_CPU = $30000000;
    SF_FORMAT_SUBMASK = $0000FFFF;
    SF_FORMAT_TYPEMASK = $0FFF0000;
    SF_FORMAT_ENDMASK = $30000000;

{
** The following are the valid command numbers for the sf_command()
** interface.  The use of these commands is documented in the file
** command.html in the doc directory of the source code distribution.
 }
{ Commands reserved for dithering, which is not implemented.  }
{ Support for Wavex Ambisonics Format  }
{
	** RF64 files can be set so that on-close, writable files that have less
	** than 4GB of data in them are converted to RIFF/WAV, as per EBU
	** recommendations.
	 }
{ Ogg format commands  }
{ Cart Chunk support  }
{ Opus files original samplerate metadata  }
{ Following commands for testing only.  }
{
	** These SFC_SET_ADD_* values are deprecated and will disappear at some
	** time in the future. They are guaranteed to be here up to and
	** including version 1.0.8 to avoid breakage of existing software.
	** They currently do nothing and will continue to do nothing.
	 }
type
  Txxxxxxxxx =  Longint;
  Const
    SFC_GET_LIB_VERSION = $1000;
    SFC_GET_LOG_INFO = $1001;
    SFC_GET_CURRENT_SF_INFO = $1002;
    SFC_GET_NORM_DOUBLE = $1010;
    SFC_GET_NORM_FLOAT = $1011;
    SFC_SET_NORM_DOUBLE = $1012;
    SFC_SET_NORM_FLOAT = $1013;
    SFC_SET_SCALE_FLOAT_INT_READ = $1014;
    SFC_SET_SCALE_INT_FLOAT_WRITE = $1015;
    SFC_GET_SIMPLE_FORMAT_COUNT = $1020;
    SFC_GET_SIMPLE_FORMAT = $1021;
    SFC_GET_FORMAT_INFO = $1028;
    SFC_GET_FORMAT_MAJOR_COUNT = $1030;
    SFC_GET_FORMAT_MAJOR = $1031;
    SFC_GET_FORMAT_SUBTYPE_COUNT = $1032;
    SFC_GET_FORMAT_SUBTYPE = $1033;
    SFC_CALC_SIGNAL_MAX = $1040;
    SFC_CALC_NORM_SIGNAL_MAX = $1041;
    SFC_CALC_MAX_ALL_CHANNELS = $1042;
    SFC_CALC_NORM_MAX_ALL_CHANNELS = $1043;
    SFC_GET_SIGNAL_MAX = $1044;
    SFC_GET_MAX_ALL_CHANNELS = $1045;
    SFC_SET_ADD_PEAK_CHUNK = $1050;
    SFC_UPDATE_HEADER_NOW = $1060;
    SFC_SET_UPDATE_HEADER_AUTO = $1061;
    SFC_FILE_TRUNCATE = $1080;
    SFC_SET_RAW_START_OFFSET = $1090;
    SFC_SET_DITHER_ON_WRITE = $10A0;
    SFC_SET_DITHER_ON_READ = $10A1;
    SFC_GET_DITHER_INFO_COUNT = $10A2;
    SFC_GET_DITHER_INFO = $10A3;
    SFC_GET_EMBED_FILE_INFO = $10B0;
    SFC_SET_CLIPPING = $10C0;
    SFC_GET_CLIPPING = $10C1;
    SFC_GET_CUE_COUNT = $10CD;
    SFC_GET_CUE = $10CE;
    SFC_SET_CUE = $10CF;
    SFC_GET_INSTRUMENT = $10D0;
    SFC_SET_INSTRUMENT = $10D1;
    SFC_GET_LOOP_INFO = $10E0;
    SFC_GET_BROADCAST_INFO = $10F0;
    SFC_SET_BROADCAST_INFO = $10F1;
    SFC_GET_CHANNEL_MAP_INFO = $1100;
    SFC_SET_CHANNEL_MAP_INFO = $1101;
    SFC_RAW_DATA_NEEDS_ENDSWAP = $1110;
    SFC_WAVEX_SET_AMBISONIC = $1200;
    SFC_WAVEX_GET_AMBISONIC = $1201;
    SFC_RF64_AUTO_DOWNGRADE = $1210;
    SFC_SET_VBR_ENCODING_QUALITY = $1300;
    SFC_SET_COMPRESSION_LEVEL = $1301;
    SFC_SET_OGG_PAGE_LATENCY_MS = $1302;
    SFC_SET_OGG_PAGE_LATENCY = $1303;
    SFC_GET_OGG_STREAM_SERIALNO = $1306;
    SFC_GET_BITRATE_MODE = $1304;
    SFC_SET_BITRATE_MODE = $1305;
    SFC_SET_CART_INFO = $1400;
    SFC_GET_CART_INFO = $1401;
    SFC_SET_ORIGINAL_SAMPLERATE = $1500;
    SFC_GET_ORIGINAL_SAMPLERATE = $1501;
    SFC_TEST_IEEE_FLOAT_REPLACE = $6001;
    SFC_SET_ADD_HEADER_PAD_CHUNK = $1051;
    SFC_SET_ADD_DITHER_ON_WRITE = $1070;
    SFC_SET_ADD_DITHER_ON_READ = $1071;

{
** String types that can be set and read from files. Not all file types
** support this and even the file types which support one, may not support
** all string types.
 }
type
  Txxxxxxxxx =  Longint;
  Const
    SF_STR_TITLE = $01;
    SF_STR_COPYRIGHT = $02;
    SF_STR_SOFTWARE = $03;
    SF_STR_ARTIST = $04;
    SF_STR_COMMENT = $05;
    SF_STR_DATE = $06;
    SF_STR_ALBUM = $07;
    SF_STR_LICENSE = $08;
    SF_STR_TRACKNUMBER = $09;
    SF_STR_GENRE = $10;

{
** Use the following as the start and end index when doing metadata
** transcoding.
 }
  SF_STR_FIRST = SF_STR_TITLE;  
  SF_STR_LAST = SF_STR_GENRE;  
{ True and false  }
{ Modes for opening files.  }
type
  Txxxxxxxxxxxxxxx =  Longint;
  Const
    SF_FALSE = 0;
    SF_TRUE = 1;
    SFM_READ = $10;
    SFM_WRITE = $20;
    SFM_RDWR = $30;
    SF_AMBISONIC_NONE = $40;
    SF_AMBISONIC_B_FORMAT = $41;

{ Public error values. These are guaranteed to remain unchanged for the duration
** of the library major version number.
** There are also a large number of private error numbers which are internal to
** the library which can change at any time.
 }
type
  Txxxxxxxxxxxxx =  Longint;
  Const
    SF_ERR_NO_ERROR = 0;
    SF_ERR_UNRECOGNISED_FORMAT = 1;
    SF_ERR_SYSTEM = 2;
    SF_ERR_MALFORMED_FILE = 3;
    SF_ERR_UNSUPPORTED_ENCODING = 4;

{ Channel map values (used with SFC_SET/GET_CHANNEL_MAP).
 }
{ Apple calls this 'Left'  }
{ Apple calls this 'Right'  }
{ Apple calls this 'Center'  }
{ Apple calls this 'Center Surround', Msft calls this 'Back Center'  }
{ Apple calls this 'Left Surround', Msft calls this 'Back Left'  }
{ Apple calls this 'Right Surround', Msft calls this 'Back Right'  }
{ Apple calls this 'LFEScreen', Msft calls this 'Low Frequency'   }
{ Apple calls this 'Left Center'  }
{ Apple calls this 'Right Center  }
{ Apple calls this 'Left Surround Direct'  }
{ Apple calls this 'Right Surround Direct'  }
{ Apple calls this 'Top Center Surround'  }
{ Apple calls this 'Vertical Height Left'  }
{ Apple calls this 'Vertical Height Right'  }
{ Apple calls this 'Vertical Height Center'  }
{ Apple and MS call this 'Top Back Left'  }
{ Apple and MS call this 'Top Back Right'  }
{ Apple and MS call this 'Top Back Center'  }
type
  Txxxxxxxxxxxxxx =  Longint;
  Const
    SF_CHANNEL_MAP_INVALID = 0;
    SF_CHANNEL_MAP_MONO = 1;
    SF_CHANNEL_MAP_LEFT = 2;
    SF_CHANNEL_MAP_RIGHT = 3;
    SF_CHANNEL_MAP_CENTER = 4;
    SF_CHANNEL_MAP_FRONT_LEFT = 5;
    SF_CHANNEL_MAP_FRONT_RIGHT = 6;
    SF_CHANNEL_MAP_FRONT_CENTER = 7;
    SF_CHANNEL_MAP_REAR_CENTER = 8;
    SF_CHANNEL_MAP_REAR_LEFT = 9;
    SF_CHANNEL_MAP_REAR_RIGHT = 10;
    SF_CHANNEL_MAP_LFE = 11;
    SF_CHANNEL_MAP_FRONT_LEFT_OF_CENTER = 12;
    SF_CHANNEL_MAP_FRONT_RIGHT_OF_CENTER = 13;
    SF_CHANNEL_MAP_SIDE_LEFT = 14;
    SF_CHANNEL_MAP_SIDE_RIGHT = 15;
    SF_CHANNEL_MAP_TOP_CENTER = 16;
    SF_CHANNEL_MAP_TOP_FRONT_LEFT = 17;
    SF_CHANNEL_MAP_TOP_FRONT_RIGHT = 18;
    SF_CHANNEL_MAP_TOP_FRONT_CENTER = 19;
    SF_CHANNEL_MAP_TOP_REAR_LEFT = 20;
    SF_CHANNEL_MAP_TOP_REAR_RIGHT = 21;
    SF_CHANNEL_MAP_TOP_REAR_CENTER = 22;
    SF_CHANNEL_MAP_AMBISONIC_B_W = 23;
    SF_CHANNEL_MAP_AMBISONIC_B_X = 24;
    SF_CHANNEL_MAP_AMBISONIC_B_Y = 25;
    SF_CHANNEL_MAP_AMBISONIC_B_Z = 26;
    SF_CHANNEL_MAP_MAX = 27;

{ Bitrate mode values (for use with SFC_GET/SET_BITRATE_MODE)
 }
type
  Txxxxxxxxxxxxxxx =  Longint;
  Const
    SF_BITRATE_MODE_CONSTANT = 0;
    SF_BITRATE_MODE_AVERAGE = 1;
    SF_BITRATE_MODE_VARIABLE = 2;

{ A SNDFILE* pointer can be passed around much like stdio.h's FILE* pointer.  }
type
  Tsf_private_tag = TSNDFILE;
{ The following typedef is system specific and is defined when libsndfile is
** compiled. sf_count_t will be a 64 bit value when the underlying OS allows
** 64 bit file offsets.
** On windows, we need to allow the same header file to be compiler by both GCC
** and the Microsoft compiler.
 }

  Psf_count_t = ^Tsf_count_t;
  Tsf_count_t = Tint64_t;
{$ifndef SF_COUNT_MAX}

const
  SF_COUNT_MAX = INT64_MAX;  
{$endif}
{ A pointer to a SF_INFO structure is passed to sf_open () and filled in.
** On write, the SF_INFO structure is filled in by the user and passed into
** sf_open ().
 }
{ Used to be called samples.  Changed to avoid confusion.  }
type
  PSF_INFO = ^TSF_INFO;
  TSF_INFO = record
      frames : Tsf_count_t;
      samplerate : longint;
      channels : longint;
      format : longint;
      sections : longint;
      seekable : longint;
    end;

{ The SF_FORMAT_INFO struct is used to retrieve information about the sound
** file formats libsndfile supports using the sf_command () interface.
**
** Using this interface will allow applications to support new file formats
** and encoding types when libsndfile is upgraded, without requiring
** re-compilation of the application.
**
** Please consult the libsndfile documentation (particularly the information
** on the sf_command () interface) for examples of its use.
 }
(* Const before type ignored *)
(* Const before type ignored *)

  PSF_FORMAT_INFO = ^TSF_FORMAT_INFO;
  TSF_FORMAT_INFO = record
      format : longint;
      name : Pchar;
      extension : Pchar;
    end;
{
** Enums and typedefs for adding dither on read and write.
** Reserved for future implementation.
 }
  Txxxxxxxxx =  Longint;
  Const
    SFD_DEFAULT_LEVEL = 0;
    SFD_CUSTOM_LEVEL = $40000000;
    SFD_NO_DITHER = 500;
    SFD_WHITE = 501;
    SFD_TRIANGULAR_PDF = 502;

(* Const before type ignored *)
type
  PSF_DITHER_INFO = ^TSF_DITHER_INFO;
  TSF_DITHER_INFO = record
      _type : longint;
      level : Tdouble;
      name : Pchar;
    end;
{ Struct used to retrieve information about a file embedded within a
** larger file. See SFC_GET_EMBED_FILE_INFO.
 }

  PSF_EMBED_FILE_INFO = ^TSF_EMBED_FILE_INFO;
  TSF_EMBED_FILE_INFO = record
      offset : Tsf_count_t;
      length : Tsf_count_t;
    end;
{
**	Struct used to retrieve cue marker information from a file
 }

  PSF_CUE_POINT = ^TSF_CUE_POINT;
  TSF_CUE_POINT = record
      indx : Tint32_t;
      position : Tuint32_t;
      fcc_chunk : Tint32_t;
      chunk_start : Tint32_t;
      block_start : Tint32_t;
      sample_offset : Tuint32_t;
      name : array[0..255] of char;
    end;
{ xxxxxxxxx }
{#define	SF_CUES_VAR(count) \ }
{	struct \ }
{		uint32_t cue_count ; \ }
{		SF_CUE_POINT cue_points [count] ; \ }
{	 }
{ typedef SF_CUES_VAR (100) SF_CUES ; }
{
**	Structs used to retrieve music sample information from a file.
 }
{
	**	The loop mode field in SF_INSTRUMENT will be one of the following.
	 }
  Txxxxxxxxxxx =  Longint;
  Const
    SF_LOOP_NONE = 800;
    SF_LOOP_FORWARD = 801;
    SF_LOOP_BACKWARD = 802;
    SF_LOOP_ALTERNATING = 803;

{ make variable in a sensible way  }
type
  PSF_INSTRUMENT = ^TSF_INSTRUMENT;
  TSF_INSTRUMENT = record
      gain : longint;
      basenote : char;
      detune : char;
      velocity_lo : char;
      velocity_hi : char;
      key_lo : char;
      key_hi : char;
      loop_count : longint;
      loops : array[0..15] of record
          mode : longint;
          start : Tuint32_t;
          end : Tuint32_t;
          count : Tuint32_t;
        end;
    end;
{ Struct used to retrieve loop information from a file. }
{ any positive integer    > 0   }
{ any positive power of 2 > 0   }
{ see SF_LOOP enum              }
{ this is NOT the amount of quarter notes !!! }
{ a full bar of 4/4 is 4 beats  }
{ a full bar of 7/8 is 7 beats  }
{ suggestion, as it can be calculated using other fields: }
{ file's length, file's sampleRate and our time_sig_den }
{ -> bpms are always the amount of _quarter notes_ per minute  }
{ MIDI note, or -1 for None  }

  PSF_LOOP_INFO = ^TSF_LOOP_INFO;
  TSF_LOOP_INFO = record
      time_sig_num : smallint;
      time_sig_den : smallint;
      loop_mode : longint;
      num_beats : longint;
      bpm : single;
      root_key : longint;
      future : array[0..5] of longint;
    end;
{	Struct used to retrieve broadcast (EBU) information from a file.
**	Strongly (!) based on EBU "bext" chunk format used in Broadcast WAVE.
 }
{ xxxxxxxxxx
#define	SF_BROADCAST_INFO_VAR(coding_hist_size) \
			struct \
				char		description [256] ; \
				char		originator [32] ; \
				char		originator_reference [32] ; \
				char		origination_date [10] ; \
				char		origination_time [8] ; \
				uint32_t	time_reference_low ; \
				uint32_t	time_reference_high ; \
				short		version ; \
				char		umid [64] ; \
				int16_t	loudness_value ; \
				int16_t	loudness_range ; \
				int16_t	max_true_peak_level ; \
				int16_t	max_momentary_loudness ; \
				int16_t	max_shortterm_loudness ; \
				char		reserved [180] ; \
				uint32_t	coding_history_size ; \
				char		coding_history [coding_hist_size] ; \
			

typedef SF_BROADCAST_INFO_VAR (256) SF_BROADCAST_INFO ;
 }
  PSF_CART_TIMER = ^TSF_CART_TIMER;
  TSF_CART_TIMER = record
      usage : array[0..3] of char;
      value : Tint32_t;
    end;

{ xxxxxxxxxx
#define	SF_CART_INFO_VAR(p_tag_text_size) \
			struct \
				char		version [4] ; \
				char		title [64] ; \
				char		artist [64] ; \
				char		cut_id [64] ; \
				char		client_id [64] ; \
				char		category [64] ; \
				char		classification [64] ; \
				char		out_cue [64] ; \
				char		start_date [10] ; \
				char		start_time [8] ; \
				char		end_date [10] ; \
				char		end_time [8] ; \
				char		producer_app_id [64] ; \
				char		producer_app_version [64] ; \
				char		user_def [64] ; \
				int32_t		level_reference ; \
				SF_CART_TIMER	post_timers [8] ; \
				char		reserved [276] ; \
				char		url [1024] ; \
				uint32_t	tag_text_size ; \
				char		tag_text [p_tag_text_size] ; \
			

typedef SF_CART_INFO_VAR (256) SF_CART_INFO ;
 }
{	Virtual I/O functionality.  }

  Tsf_vio_get_filelen = function (user_data:pointer):Tsf_count_t;cdecl;

  Tsf_vio_seek = function (offset:Tsf_count_t; whence:longint; user_data:pointer):Tsf_count_t;cdecl;

  Tsf_vio_read = function (ptr:pointer; count:Tsf_count_t; user_data:pointer):Tsf_count_t;cdecl;
(* Const before type ignored *)

  Tsf_vio_write = function (ptr:pointer; count:Tsf_count_t; user_data:pointer):Tsf_count_t;cdecl;

  Tsf_vio_tell = function (user_data:pointer):Tsf_count_t;cdecl;
  PSF_VIRTUAL_IO = ^TSF_VIRTUAL_IO;
  TSF_VIRTUAL_IO = record
      get_filelen : Tsf_vio_get_filelen;cdecl;
      seek : Tsf_vio_seek;
      read : Tsf_vio_read;
      write : Tsf_vio_write;
      tell : Tsf_vio_tell;
    end;

{ Open the specified file for read, write or both. On error, this will
** return a NULL pointer. To find the error number, pass a NULL SNDFILE
** to sf_strerror ().
** All calls to sf_open() should be matched with a call to sf_close().
 }
(* Const before type ignored *)

function sf_open(path:Pchar; mode:longint; sfinfo:PSF_INFO):PSNDFILE;cdecl;external;
{ Use the existing file descriptor to create a SNDFILE object. If close_desc
** is TRUE, the file descriptor will be closed when sf_close() is called. If
** it is FALSE, the descriptor will not be closed.
** When passed a descriptor like this, the library will assume that the start
** of file header is at the current file offset. This allows sound files within
** larger container files to be read and/or written.
** On error, this will return a NULL pointer. To find the error number, pass a
** NULL SNDFILE to sf_strerror ().
** All calls to sf_open_fd() should be matched with a call to sf_close().

 }
function sf_open_fd(fd:longint; mode:longint; sfinfo:PSF_INFO; close_desc:longint):PSNDFILE;cdecl;external;
function sf_open_virtual(sfvirtual:PSF_VIRTUAL_IO; mode:longint; sfinfo:PSF_INFO; user_data:pointer):PSNDFILE;cdecl;external;
{ sf_error () returns a error number which can be translated to a text
** string using sf_error_number().
 }
function sf_error(sndfile:PSNDFILE):longint;cdecl;external;
{ sf_strerror () returns to the caller a pointer to the current error message for
** the given SNDFILE.
 }
(* Const before type ignored *)
function sf_strerror(sndfile:PSNDFILE):Pchar;cdecl;external;
{ sf_error_number () allows the retrieval of the error string for each internal
** error number.
**
 }
(* Const before type ignored *)
function sf_error_number(errnum:longint):Pchar;cdecl;external;
{ The following two error functions are deprecated but they will remain in the
** library for the foreseeable future. The function sf_strerror() should be used
** in their place.
 }
function sf_perror(sndfile:PSNDFILE):longint;cdecl;external;
function sf_error_str(sndfile:PSNDFILE; str:Pchar; len:Tsize_t):longint;cdecl;external;
{ Allow the caller to retrieve information from or change aspects of the
** library behaviour.
 }
function sf_command(sndfile:PSNDFILE; command:longint; data:pointer; datasize:longint):longint;cdecl;external;
{ Return TRUE if fields of the SF_INFO struct are a valid combination of values.  }
(* Const before type ignored *)
function sf_format_check(info:PSF_INFO):longint;cdecl;external;
{ Seek within the waveform data chunk of the SNDFILE. sf_seek () uses
** the same values for whence (SEEK_SET, SEEK_CUR and SEEK_END) as
** stdio.h function fseek ().
** An offset of zero with whence set to SEEK_SET will position the
** read / write pointer to the first data sample.
** On success sf_seek returns the current position in (multi-channel)
** samples from the start of the file.
** Please see the libsndfile documentation for moving the read pointer
** separately from the write pointer on files open in mode SFM_RDWR.
** On error all of these functions return -1.
 }
type
  Txxxxx =  Longint;
  Const
    SF_SEEK_SET = SEEK_SET;
    SF_SEEK_CUR = SEEK_CUR;
    SF_SEEK_END = SEEK_END;


function sf_seek(sndfile:PSNDFILE; frames:Tsf_count_t; whence:longint):Tsf_count_t;cdecl;external;
{ Functions for retrieving and setting string data within sound files.
** Not all file types support this features; AIFF and WAV do. For both
** functions, the str_type parameter must be one of the SF_STR_* values
** defined above.
** On error, sf_set_string() returns non-zero while sf_get_string()
** returns NULL.
 }
(* Const before type ignored *)
function sf_set_string(sndfile:PSNDFILE; str_type:longint; str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function sf_get_string(sndfile:PSNDFILE; str_type:longint):Pchar;cdecl;external;
{ Return the library version string.  }
(* Const before type ignored *)
function sf_version_string:Pchar;cdecl;external;
{ Return the current byterate at this point in the file. The byte rate in this
** case is the number of bytes per second of audio data. For instance, for a
** stereo, 18 bit PCM encoded file with an 16kHz sample rate, the byte rate
** would be 2 (stereo) * 2 (two bytes per sample) * 16000 => 64000 bytes/sec.
** For some file formats the returned value will be accurate and exact, for some
** it will be a close approximation, for some it will be the average bitrate for
** the whole file and for some it will be a time varying value that was accurate
** when the file was most recently read or written.
** To get the bitrate, multiple this value by 8.
** Returns -1 for unknown.
 }
function sf_current_byterate(sndfile:PSNDFILE):longint;cdecl;external;
{ Functions for reading/writing the waveform data of a sound file.
 }
function sf_read_raw(sndfile:PSNDFILE; ptr:pointer; bytes:Tsf_count_t):Tsf_count_t;cdecl;external;
(* Const before type ignored *)
function sf_write_raw(sndfile:PSNDFILE; ptr:pointer; bytes:Tsf_count_t):Tsf_count_t;cdecl;external;
{ Functions for reading and writing the data chunk in terms of frames.
** The number of items actually read/written = frames * number of channels.
**     sf_xxxx_raw		read/writes the raw data bytes from/to the file
**     sf_xxxx_short	passes data in the native short format
**     sf_xxxx_int		passes data in the native int format
**     sf_xxxx_float	passes data in the native float format
**     sf_xxxx_double	passes data in the native double format
** All of these read/write function return number of frames read/written.
 }
function sf_readf_short(sndfile:PSNDFILE; ptr:Psmallint; frames:Tsf_count_t):Tsf_count_t;cdecl;external;
(* Const before type ignored *)
function sf_writef_short(sndfile:PSNDFILE; ptr:Psmallint; frames:Tsf_count_t):Tsf_count_t;cdecl;external;
function sf_readf_int(sndfile:PSNDFILE; ptr:Plongint; frames:Tsf_count_t):Tsf_count_t;cdecl;external;
(* Const before type ignored *)
function sf_writef_int(sndfile:PSNDFILE; ptr:Plongint; frames:Tsf_count_t):Tsf_count_t;cdecl;external;
function sf_readf_float(sndfile:PSNDFILE; ptr:Psingle; frames:Tsf_count_t):Tsf_count_t;cdecl;external;
(* Const before type ignored *)
function sf_writef_float(sndfile:PSNDFILE; ptr:Psingle; frames:Tsf_count_t):Tsf_count_t;cdecl;external;
function sf_readf_double(sndfile:PSNDFILE; ptr:Pdouble; frames:Tsf_count_t):Tsf_count_t;cdecl;external;
(* Const before type ignored *)
function sf_writef_double(sndfile:PSNDFILE; ptr:Pdouble; frames:Tsf_count_t):Tsf_count_t;cdecl;external;
{ Functions for reading and writing the data chunk in terms of items.
** Otherwise similar to above.
** All of these read/write function return number of items read/written.
 }
function sf_read_short(sndfile:PSNDFILE; ptr:Psmallint; items:Tsf_count_t):Tsf_count_t;cdecl;external;
(* Const before type ignored *)
function sf_write_short(sndfile:PSNDFILE; ptr:Psmallint; items:Tsf_count_t):Tsf_count_t;cdecl;external;
function sf_read_int(sndfile:PSNDFILE; ptr:Plongint; items:Tsf_count_t):Tsf_count_t;cdecl;external;
(* Const before type ignored *)
function sf_write_int(sndfile:PSNDFILE; ptr:Plongint; items:Tsf_count_t):Tsf_count_t;cdecl;external;
function sf_read_float(sndfile:PSNDFILE; ptr:Psingle; items:Tsf_count_t):Tsf_count_t;cdecl;external;
(* Const before type ignored *)
function sf_write_float(sndfile:PSNDFILE; ptr:Psingle; items:Tsf_count_t):Tsf_count_t;cdecl;external;
function sf_read_double(sndfile:PSNDFILE; ptr:Pdouble; items:Tsf_count_t):Tsf_count_t;cdecl;external;
(* Const before type ignored *)
function sf_write_double(sndfile:PSNDFILE; ptr:Pdouble; items:Tsf_count_t):Tsf_count_t;cdecl;external;
{ Close the SNDFILE and clean up all memory allocations associated with this
** file.
** Returns 0 on success, or an error number.
 }
function sf_close(sndfile:PSNDFILE):longint;cdecl;external;
{ If the file is opened SFM_WRITE or SFM_RDWR, call fsync() on the file
** to force the writing of data to disk. If the file is opened SFM_READ
** no action is taken.
 }
procedure sf_write_sync(sndfile:PSNDFILE);cdecl;external;
{ The function sf_wchar_open() is Windows Only!
** Open a file passing in a Windows Unicode filename. Otherwise, this is
** the same as sf_open().
 }
{$ifdef _WIN32}
(* Const before type ignored *)
function sf_wchar_open(wpath:Pwchar_t; mode:longint; sfinfo:PSF_INFO):PSNDFILE;cdecl;external;
{$endif}
{ Getting and setting of chunks from within a sound file.
**
** These functions allow the getting and setting of chunks within a sound file
** (for those formats which allow it).
**
** These functions fail safely. Specifically, they will not allow you to overwrite
** existing chunks or add extra versions of format specific reserved chunks but
** should allow you to retrieve any and all chunks (may not be implemented for
** all chunks or all file formats).
 }
{ The chunk identifier.  }
{ The size of the chunk identifier.  }
{ The size of that data.  }
{ Pointer to the data.  }
type
  PSF_CHUNK_INFO = ^TSF_CHUNK_INFO;
  TSF_CHUNK_INFO = record
      id : array[0..63] of char;
      id_size : dword;
      datalen : dword;
      data : pointer;
    end;

{ Set the specified chunk info (must be done before any audio data is written
** to the file). This will fail for format specific reserved chunks.
** The chunk_info->data pointer must be valid until the file is closed.
** Returns SF_ERR_NO_ERROR on success or non-zero on failure.
 }
(* Const before type ignored *)

function sf_set_chunk(sndfile:PSNDFILE; chunk_info:PSF_CHUNK_INFO):longint;cdecl;external;
{
** An opaque structure to an iterator over the all chunks of a given id
 }
type
{ Get an iterator for all chunks matching chunk_info.
** The iterator will point to the first chunk matching chunk_info.
** Chunks are matching, if (chunk_info->id) matches the first
**     (chunk_info->id_size) bytes of a chunk found in the SNDFILE* handle.
** If chunk_info is NULL, an iterator to all chunks in the SNDFILE* handle
**     is returned.
** The values of chunk_info->datalen and chunk_info->data are ignored.
** If no matching chunks are found in the sndfile, NULL is returned.
** The returned iterator will stay valid until one of the following occurs:
**     a) The sndfile is closed.
**     b) A new chunk is added using sf_set_chunk().
**     c) Another chunk iterator function is called on the same SNDFILE* handle
**        that causes the iterator to be modified.
** The memory for the iterator belongs to the SNDFILE* handle and is freed when
** sf_close() is called.
 }
(* Const before type ignored *)

function sf_get_chunk_iterator(sndfile:PSNDFILE; chunk_info:PSF_CHUNK_INFO):PSF_CHUNK_ITERATOR;cdecl;external;
{ Iterate through chunks by incrementing the iterator.
** Increments the iterator and returns a handle to the new one.
** After this call, iterator will no longer be valid, and you must use the
**      newly returned handle from now on.
** The returned handle can be used to access the next chunk matching
**      the criteria as defined in sf_get_chunk_iterator().
** If iterator points to the last chunk, this will free all resources
**      associated with iterator and return NULL.
** The returned iterator will stay valid until sf_get_chunk_iterator_next
**      is called again, the sndfile is closed or a new chunk us added.
 }
function sf_next_chunk_iterator(iterator:PSF_CHUNK_ITERATOR):PSF_CHUNK_ITERATOR;cdecl;external;
{ Get the size of the specified chunk.
** If the specified chunk exists, the size will be returned in the
**      datalen field of the SF_CHUNK_INFO struct.
**      Additionally, the id of the chunk will be copied to the id
**      field of the SF_CHUNK_INFO struct and it's id_size field will
**      be updated accordingly.
** If the chunk doesn't exist chunk_info->datalen will be zero, and the
**      id and id_size fields will be undefined.
** The function will return SF_ERR_NO_ERROR on success or non-zero on
** failure.
 }
(* Const before type ignored *)
function sf_get_chunk_size(it:PSF_CHUNK_ITERATOR; chunk_info:PSF_CHUNK_INFO):longint;cdecl;external;
{ Get the specified chunk data.
** If the specified chunk exists, up to chunk_info->datalen bytes of
**      the chunk data will be copied into the chunk_info->data buffer
**      (allocated by the caller) and the chunk_info->datalen field
**      updated to reflect the size of the data. The id and id_size
**      field will be updated according to the retrieved chunk
** If the chunk doesn't exist chunk_info->datalen will be zero, and the
**      id and id_size fields will be undefined.
** The function will return SF_ERR_NO_ERROR on success or non-zero on
** failure.
 }
(* Const before type ignored *)
function sf_get_chunk_data(it:PSF_CHUNK_ITERATOR; chunk_info:PSF_CHUNK_INFO):longint;cdecl;external;
{ __cplusplus  }
{$endif}
{ SNDFILE_H  }

implementation


end.
