unit avc1394;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * libavc1394 - GNU/Linux 1394 AV/C Library
 *
 * Originally written by Andreas Micklei <andreas.micklei@ivistar.de>
 * Currently maintained by Dan Dennedy <dan@dennedy.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  }
{$ifndef AVC1394_H}

const
  AVC1394_H = 1;  
{$include <libraw1394/raw1394.h>}
{ AV/C response codes  }

const
  AVC1394_RESPONSE_NOT_IMPLEMENTED = $08000000;  
  AVC1394_RESPONSE_ACCEPTED = $09000000;  
  AVC1394_RESPONSE_REJECTED = $0A000000;  
  AVC1394_RESPONSE_IN_TRANSITION = $0B000000;  
  AVC1394_RESPONSE_IMPLEMENTED = $0C000000;  
  AVC1394_RESPONSE_STABLE = $0C000000;  
  AVC1394_RESPONSE_CHANGED = $0D000000;  
  AVC1394_RESPONSE_INTERIM = $0F000000;  
{ variants  }
  AVC1394_RESP_NOT_IMPLEMENTED = $08;  
  AVC1394_RESP_ACCEPTED = $09;  
  AVC1394_RESP_REJECTED = $0A;  
  AVC1394_RESP_IN_TRANSITION = $0B;  
  AVC1394_RESP_IMPLEMENTED = $0C;  
  AVC1394_RESP_STABLE = $0C;  
  AVC1394_RESP_CHANGED = $0D;  
  AVC1394_RESP_INTERIM = $0F;  
{ AV/C Mask macros  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function AVC1394_MASK_START(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_CTYPE(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_RESPONSE(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_SUBUNIT_TYPE(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_SUBUNIT_ID(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_OPCODE(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_OPERAND0(x : longint) : Tx;

{#define AVC1394_MASK_OPERAND(x, n) ((x) & (0xFF000000 >> ((((n)-1)%4)*8))) }
{#define AVC1394_MASK_RESPONSE_OPERAND(x, n) ((x) & (0xFF000000 >> (((n)%4)*8))) }
{ AV/C Mask and shift macros  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVC1394_GET_CTYPE(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVC1394_GET_RESPONSE(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVC1394_GET_SUBUNIT_TYPE(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVC1394_GET_SUBUNIT_ID(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVC1394_GET_OPCODE(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_GET_OPERAND0(x : longint) : Tx;

{#define AVC1394_GET_OPERAND(x, n) (((x) & (0xFF000000 >> ((((n)-1)%4)*8))) >> ((((n)-1)%4)*8)) }
{#define AVC1394_GET_RESPONSE_OPERAND(x, n) (((x) & (0xFF000000 >> (((n)%4)*8))) >> (((3-(n))%4)*8)) }
{ AV/C command types  }
const
  AVC1394_CTYPE_CONTROL = $00000000;  
  AVC1394_CTYPE_STATUS = $01000000;  
  AVC1394_CTYPE_SPECIFIC_INQUIRY = $02000000;  
  AVC1394_CTYPE_NOTIFY = $03000000;  
  AVC1394_CTYPE_GENERAL_INQUIRY = $04000000;  
  AVC1394_CTYP_CONTROL = 0;  
  AVC1394_CTYP_STATUS = 1;  
  AVC1394_CTYP_SPECIFIC_INQUIRY = 2;  
  AVC1394_CTYP_NOTIFY = 3;  
  AVC1394_CTYP_GENERAL_INQUIRY = 4;  
{ AV/C subunit types  }
  AVC1394_SUBUNIT_TYPE_VIDEO_MONITOR = 0 shl 19;  
  AVC1394_SUBUNIT_TYPE_AUDIO = 1 shl 19;  
  AVC1394_SUBUNIT_TYPE_PRINTER = 2 shl 19;  
  AVC1394_SUBUNIT_TYPE_DISC_RECORDER = 3 shl 19;  
  AVC1394_SUBUNIT_TYPE_TAPE_RECORDER = 4 shl 19;  
  AVC1394_SUBUNIT_TYPE_VCR = 4 shl 19;  
  AVC1394_SUBUNIT_TYPE_TUNER = 5 shl 19;  
  AVC1394_SUBUNIT_TYPE_CA = 6 shl 19;  
  AVC1394_SUBUNIT_TYPE_VIDEO_CAMERA = 7 shl 19;  
  AVC1394_SUBUNIT_TYPE_PANEL = 9 shl 19;  
  AVC1394_SUBUNIT_TYPE_BULLETIN_BOARD = $A shl 19;  
  AVC1394_SUBUNIT_TYPE_CAMERA_STORAGE = $B shl 19;  
  AVC1394_SUBUNIT_TYPE_MUSIC = $C shl 19;  
  AVC1394_SUBUNIT_TYPE_VENDOR_UNIQUE = $1C shl 19;  
{ Not implemented  }
  AVC1394_SUBUNIT_TYPE_EXTENDED = $1E shl 19;  
  AVC1394_SUBUNIT_TYPE_UNIT = $1F shl 19;  
{ variants  }
  AVC1394_SUBUNIT_VIDEO_MONITOR = 0;  
  AVC1394_SUBUNIT_DISC_RECORDER = 3;  
  AVC1394_SUBUNIT_TAPE_RECORDER = 4;  
  AVC1394_SUBUNIT_VCR = 4;  
  AVC1394_SUBUNIT_TUNER = 5;  
  AVC1394_SUBUNIT_VIDEO_CAMERA = 7;  
  AVC1394_SUBUNIT_VENDOR_UNIQUE = $1C;  
{ Not implemented  }
  AVC1394_SUBUNIT_EXTENDED = $1E;  
  AVC1394_SUBUNIT_UNIT = $1F;  
{ AV/C subunit IDs  }
  AVC1394_SUBUNIT_ID_0 = 0 shl 16;  
  AVC1394_SUBUNIT_ID_1 = 1 shl 16;  
  AVC1394_SUBUNIT_ID_2 = 2 shl 16;  
  AVC1394_SUBUNIT_ID_3 = 3 shl 16;  
  AVC1394_SUBUNIT_ID_4 = 4 shl 16;  
{ Not implemented  }
  AVC1394_SUBUNIT_ID_EXTENDED = 5 shl 16;  
  AVC1394_SUBUNIT_ID_IGNORE = 7 shl 16;  
{ AV/C subunit capabilities  }
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_GENERAL = 1 shl 0;  
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_AUDIO = 1 shl 1;  
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_MIDI = 1 shl 2;  
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_SMPTE = 1 shl 3;  
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_SAMPLECOUNT = 1 shl 4;  
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_AUDIOSYNC = 1 shl 5;  
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_RESERVED = 1 shl 6;  
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_MORE = 1 shl 7;  
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_NONBLOCKING = 1 shl 0;  
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_BLOCKING = 1 shl 1;  
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_AUDIOSYNC_BUS = 1 shl 0;  
  AVC1394_SUBUNIT_MUSIC_CAPABILITY_AUDIOSYNC_EXTERNAL = 1 shl 0;  
{ AV/C Unit commands  }
  AVC1394_COMMAND_CHANNEL_USAGE = $00001200;  
  AVC1394_COMMAND_CONNECT = $00002400;  
  AVC1394_COMMAND_CONNECT_AV = $00002000;  
  AVC1394_COMMAND_CONNECTIONS = $00002200;  
  AVC1394_COMMAND_DIGITAL_INPUT = $00001100;  
  AVC1394_COMMAND_DIGITAL_OUTPUT = $00001000;  
  AVC1394_COMMAND_DISCONNECT = $00002500;  
  AVC1394_COMMAND_DISCONNECT_AV = $00002100;  
  AVC1394_COMMAND_INPUT_PLUG_SIGNAL_FORMAT = $00001900;  
  AVC1394_COMMAND_OUTPUT_PLUG_SIGNAL_FORMAT = $00001800;  
  AVC1394_COMMAND_SUBUNIT_INFO = $00003100;  
  AVC1394_COMMAND_UNIT_INFO = $00003000;  
{ variants  }
  AVC1394_CMD_CHANNEL_USAGE = $12;  
  AVC1394_CMD_CONNECT = $24;  
  AVC1394_CMD_CONNECT_AV = $20;  
  AVC1394_CMD_CONNECTIONS = $22;  
  AVC1394_CMD_DIGITAL_INPUT = $11;  
  AVC1394_CMD_DIGITAL_OUTPUT = $10;  
  AVC1394_CMD_DISCONNECT = $25;  
  AVC1394_CMD_DISCONNECT_AV = $21;  
  AVC1394_CMD_INPUT_PLUG_SIGNAL_FORMAT = $19;  
  AVC1394_CMD_OUTPUT_PLUG_SIGNAL_FORMAT = $18;  
  AVC1394_CMD_SUBUNIT_INFO = $31;  
  AVC1394_CMD_UNIT_INFO = $30;  
{ AV/C Common unit and subunit commands  }
  AVC1394_COMMAND_OPEN_DESCRIPTOR = $00000800;  
  AVC1394_COMMAND_READ_DESCRIPTOR = $00000900;  
  AVC1394_COMMAND_WRITE_DESCRIPTOR = $00000A00;  
  AVC1394_COMMAND_SEARCH_DESCRIPTOR = $00000B00;  
  AVC1394_COMMAND_OBJECT_NUMBER_SELECT = $00000D00;  
  AVC1394_COMMAND_POWER = $0000B200;  
  AVC1394_COMMAND_RESERVE = $00000100;  
  AVC1394_COMMAND_PLUG_INFO = $00000200;  
  AVC1394_COMMAND_VENDOR_DEPENDENT = $00000000;  
{ variants  }
  AVC1394_CMD_OPEN_DESCRIPTOR = $08;  
  AVC1394_CMD_READ_DESCRIPTOR = $09;  
  AVC1394_CMD_WRITE_DESCRIPTOR = $0A;  
  AVC1394_CMD_SEARCH_DESCRIPTOR = $0B;  
  AVC1394_CMD_OBJECT_NUMBER_SELECT = $0D;  
  AVC1394_CMD_POWER = $B2;  
  AVC1394_CMD_RESERVE = $01;  
  AVC1394_CMD_PLUG_INFO = $02;  
  AVC1394_CMD_VENDOR_DEPENDENT = $00;  
{ power operands  }
  AVC1394_CMD_OPERAND_POWER_ON = $70;  
  AVC1394_CMD_OPERAND_POWER_OFF = $60;  
  AVC1394_OPERAND_UNIT_INFO_EXTENSION_CODE = 7;  
{ AV/C Common unit and subunit command operands  }
  AVC1394_OPERAND_DESCRIPTOR_TYPE_SUBUNIT_IDENTIFIER_DESCRIPTOR = $00;  
  AVC1394_OPERAND_DESCRIPTOR_TYPE_OBJECT_LIST_DESCRIPTOR_ID = $10;  
  AVC1394_OPERAND_DESCRIPTOR_TYPE_OBJECT_LIST_DESCRIPTOR_TYPE = $11;  
  AVC1394_OPERAND_DESCRIPTOR_TYPE_OBJECT_ENTRY_DESCRIPTOR_POSITION = $20;  
  AVC1394_OPERAND_DESCRIPTOR_TYPE_OBJECT_ENTRY_DESCRIPTOR_ID = $21;  
  AVC1394_OPERAND_DESCRIPTOR_SUBFUNCTION_CLOSE = $00;  
  AVC1394_OPERAND_DESCRIPTOR_SUBFUNCTION_READ_OPEN = $01;  
  AVC1394_OPERAND_DESCRIPTOR_SUBFUNCTION_WRITE_OPEN = $03;  
{ VCR subunit commands (Alphabetically)  }
  AVC1394_VCR_COMMAND_ANALOG_AUDIO_OUTPUT_MODE = $000007000;  
  AVC1394_VCR_COMMAND_AREA_MODE = $000007200;  
  AVC1394_VCR_COMMAND_ABSOLUTE_TRACK_NUMBER = $000005200;  
  AVC1394_VCR_COMMAND_AUDIO_MODE = $000007100;  
  AVC1394_VCR_COMMAND_BACKWARD = $000005600;  
  AVC1394_VCR_COMMAND_BINARY_GROUP = $000005A00;  
  AVC1394_VCR_COMMAND_EDIT_MODE = $000004000;  
  AVC1394_VCR_COMMAND_FORWARD = $000005500;  
  AVC1394_VCR_COMMAND_INPUT_SIGNAL_MODE = $000007900;  
  AVC1394_VCR_COMMAND_LOAD_MEDIUM = $00000C100;  
  AVC1394_VCR_COMMAND_MARKER = $00000CA00;  
  AVC1394_VCR_COMMAND_MEDIUM_INFO = $00000DA00;  
  AVC1394_VCR_COMMAND_OPEN_MIC = $000006000;  
  AVC1394_VCR_COMMAND_OUTPUT_SIGNAL_MODE = $000007800;  
  AVC1394_VCR_COMMAND_PLAY = $00000C300;  
  AVC1394_VCR_COMMAND_PRESET = $000004500;  
  AVC1394_VCR_COMMAND_READ_MIC = $000006100;  
  AVC1394_VCR_COMMAND_RECORD = $00000C200;  
  AVC1394_VCR_COMMAND_RECORDING_DATE = $000005300;  
  AVC1394_VCR_COMMAND_RECORDING_SPEED = $00000DB00;  
  AVC1394_VCR_COMMAND_RECORDING_TIME = $000005400;  
  AVC1394_VCR_COMMAND_RELATIVE_TIME_COUNTER = $000005700;  
  AVC1394_VCR_COMMAND_SEARCH_MODE = $000005000;  
  AVC1394_VCR_COMMAND_SMPTE_EBU_RECORDING_TIME = $000005C00;  
  AVC1394_VCR_COMMAND_SMPTE_EBU_TIME_CODE = $000005900;  
  AVC1394_VCR_COMMAND_TAPE_PLAYBACK_FORMAT = $00000D300;  
  AVC1394_VCR_COMMAND_TAPE_RECORDING_FORMAT = $00000D200;  
  AVC1394_VCR_COMMAND_TIME_CODE = $000005100;  
  AVC1394_VCR_COMMAND_TRANSPORT_STATE = $00000D000;  
  AVC1394_VCR_COMMAND_WIND = $00000C400;  
  AVC1394_VCR_COMMAND_WRITE_MIC = $000006200;  
{ variants  }
  AVC1394_VCR_CMD_ANALOG_AUDIO_OUTPUT_MODE = $70;  
  AVC1394_VCR_CMD_AREA_MODE = $72;  
  AVC1394_VCR_CMD_ABSOLUTE_TRACK_NUMBER = $52;  
  AVC1394_VCR_CMD_AUDIO_MODE = $71;  
  AVC1394_VCR_CMD_BACKWARD = $56;  
  AVC1394_VCR_CMD_BINARY_GROUP = $5A;  
  AVC1394_VCR_CMD_EDIT_MODE = $40;  
  AVC1394_VCR_CMD_FORWARD = $55;  
  AVC1394_VCR_CMD_INPUT_SIGNAL_MODE = $79;  
  AVC1394_VCR_CMD_LOAD_MEDIUM = $C1;  
  AVC1394_VCR_CMD_MARKER = $CA;  
  AVC1394_VCR_CMD_MEDIUM_INFO = $DA;  
  AVC1394_VCR_CMD_OPEN_MIC = $60;  
  AVC1394_VCR_CMD_OUTPUT_SIGNAL_MODE = $78;  
  AVC1394_VCR_CMD_PLAY = $C3;  
  AVC1394_VCR_CMD_PRESET = $45;  
  AVC1394_VCR_CMD_READ_MIC = $61;  
  AVC1394_VCR_CMD_RECORD = $C2;  
  AVC1394_VCR_CMD_RECORDING_DATE = $53;  
  AVC1394_VCR_CMD_RECORDING_SPEED = $DB;  
  AVC1394_VCR_CMD_RECORDING_TIME = $54;  
  AVC1394_VCR_CMD_RELATIVE_TIME_COUNTER = $57;  
  AVC1394_VCR_CMD_SEARCH_MODE = $50;  
  AVC1394_VCR_CMD_SMPTE_EBU_RECORDING_TIME = $5C;  
  AVC1394_VCR_CMD_SMPTE_EBU_TIME_CODE = $59;  
  AVC1394_VCR_CMD_TAPE_PLAYBACK_FORMAT = $D3;  
  AVC1394_VCR_CMD_TAPE_RECORDING_FORMAT = $D2;  
  AVC1394_VCR_CMD_TIME_CODE = $51;  
  AVC1394_VCR_CMD_TRANSPORT_STATE = $D0;  
  AVC1394_VCR_CMD_WIND = $C4;  
  AVC1394_VCR_CMD_WRITE_MIC = $62;  
{ VCR subunit command operands  }
  AVC1394_VCR_OPERAND_LOAD_MEDIUM_EJECT = $60;  
  AVC1394_VCR_OPERAND_LOAD_MEDIUM_OPEN_TRAY = $31;  
  AVC1394_VCR_OPERAND_LOAD_MEDIUM_CLOSE_TRAY = $32;  
  AVC1394_VCR_OPERAND_PLAY_NEXT_FRAME = $30;  
  AVC1394_VCR_OPERAND_PLAY_SLOWEST_FORWARD = $31;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_FORWARD_6 = $32;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_FORWARD_5 = $33;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_FORWARD_4 = $34;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_FORWARD_3 = $35;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_FORWARD_2 = $36;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_FORWARD_1 = $37;  
  AVC1394_VCR_OPERAND_PLAY_X1_FORWARD = $38;  
  AVC1394_VCR_OPERAND_PLAY_FAST_FORWARD_1 = $39;  
  AVC1394_VCR_OPERAND_PLAY_FAST_FORWARD_2 = $3A;  
  AVC1394_VCR_OPERAND_PLAY_FAST_FORWARD_3 = $3B;  
  AVC1394_VCR_OPERAND_PLAY_FAST_FORWARD_4 = $3C;  
  AVC1394_VCR_OPERAND_PLAY_FAST_FORWARD_5 = $3D;  
  AVC1394_VCR_OPERAND_PLAY_FAST_FORWARD_6 = $3E;  
  AVC1394_VCR_OPERAND_PLAY_FASTEST_FORWARD = $3F;  
  AVC1394_VCR_OPERAND_PLAY_PREVIOUS_FRAME = $40;  
  AVC1394_VCR_OPERAND_PLAY_SLOWEST_REVERSE = $41;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_REVERSE_6 = $42;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_REVERSE_5 = $43;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_REVERSE_4 = $44;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_REVERSE_3 = $45;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_REVERSE_2 = $46;  
  AVC1394_VCR_OPERAND_PLAY_SLOW_REVERSE_1 = $47;  
  AVC1394_VCR_OPERAND_PLAY_X1_REVERSE = $48;  
  AVC1394_VCR_OPERAND_PLAY_FAST_REVERSE_1 = $49;  
  AVC1394_VCR_OPERAND_PLAY_FAST_REVERSE_2 = $4A;  
  AVC1394_VCR_OPERAND_PLAY_FAST_REVERSE_3 = $4B;  
  AVC1394_VCR_OPERAND_PLAY_FAST_REVERSE_4 = $4C;  
  AVC1394_VCR_OPERAND_PLAY_FAST_REVERSE_5 = $4D;  
  AVC1394_VCR_OPERAND_PLAY_FAST_REVERSE_6 = $4E;  
  AVC1394_VCR_OPERAND_PLAY_FASTEST_REVERSE = $4F;  
  AVC1394_VCR_OPERAND_PLAY_REVERSE = $65;  
  AVC1394_VCR_OPERAND_PLAY_REVERSE_PAUSE = $6D;  
  AVC1394_VCR_OPERAND_PLAY_FORWARD = $75;  
  AVC1394_VCR_OPERAND_PLAY_FORWARD_PAUSE = $7D;  
  AVC1394_VCR_OPERAND_RECORD_UNSPEC_INSERTED = $30;  
  AVC1394_VCR_OPERAND_RECORD_AREA_23_INSERTED = $31;  
  AVC1394_VCR_OPERAND_RECORD_AREA_1_INSERTED = $32;  
  AVC1394_VCR_OPERAND_RECORD_AREA_123_INSERTED = $33;  
  AVC1394_VCR_OPERAND_RECORD_UNSPEC_INSERTED_PAUSE = $40;  
  AVC1394_VCR_OPERAND_RECORD_AREA_23_INSERTED_PAUSE = $41;  
  AVC1394_VCR_OPERAND_RECORD_AREA_1_INSERTED_PAUSE = $42;  
  AVC1394_VCR_OPERAND_RECORD_AREA_123_INSERTED_PAUSE = $43;  
  AVC1394_VCR_OPERAND_RECORD_RECORD = $75;  
  AVC1394_VCR_OPERAND_RECORD_PAUSE = $7D;  
  AVC1394_VCR_OPERAND_TRANSPORT_STATE = $7F;  
  AVC1394_VCR_OPERAND_WIND_HIGH_SPEED_REWIND = $45;  
  AVC1394_VCR_OPERAND_WIND_STOP = $60;  
  AVC1394_VCR_OPERAND_WIND_REWIND = $65;  
  AVC1394_VCR_OPERAND_WIND_FAST_FORWARD = $75;  
  AVC1394_VCR_OPERAND_TIME_CODE_CONTROL = $20;  
  AVC1394_VCR_OPERAND_TIME_CODE_STATUS = $71;  
  AVC1394_VCR_OPERAND_RELATIVE_TIME_COUNTER_CONTROL = $20;  
  AVC1394_VCR_OPERAND_RELATIVE_TIME_COUNTER_STATUS = $71;  
  AVC1394_VCR_OPERAND_TRANSPORT_STATE = $7F;  
  AVC1394_VCR_OPERAND_RECORDING_TIME_STATUS = $71;  
{ recording speed  }
  AVC1394_VCR_OPERAND_RECORDING_SPEED_STANDARD = $6F;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_DVCR_STD = $31;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_DVCR_SMALL = $32;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_DVCR_MEDIUM = $33;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_VHS = $22;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_VHSC = $23;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_8MM = $12;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_MICROMV = $41;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_NONE = $60;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_UNKNOWN = $7E;  
{ tape grade and write protect status  }
  AVC1394_VCR_OPERAND_MEDIUM_INFO_VHS_OK = $30;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_VHS_WP = $31;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_SVHS_OK = $40;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_SVHS_WP = $41;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_DVHS_OK = $50;  
  AVC1394_VCR_OPERAND_MEDIUM_INFO_DVHS_WP = $51;  
  AVC1394_VCR_RESPONSE_TRANSPORT_STATE_LOAD_MEDIUM = $0000C100;  
  AVC1394_VCR_RESPONSE_TRANSPORT_STATE_RECORD = $0000C200;  
  AVC1394_VCR_RESPONSE_TRANSPORT_STATE_PLAY = $0000C300;  
  AVC1394_VCR_RESPONSE_TRANSPORT_STATE_WIND = $0000C400;  
{ Tuner subunit commands (Alphabetically)  }
  AVC1394_TUNER_COMMAND_DIRECT_SELECT_INFORMATION_TYPE = $C8;  
  AVC1394_TUNER_COMMAND_DIRECT_SELECT_DATA = $CB;  
  AVC1394_TUNER_COMMAND_CA_ENABLE = $CC;  
  AVC1394_TUNER_COMMAND_AVC1394_TUNER_STATUS = $CD;  
{ Tuner subunit commands operands (Alphabetically)  }
  AVC1394_TUNER_COMMAND_DIRECT_SELECT_INFORMATION_TYPE = $C8;  
  AVC1394_TUNER_COMMAND_DIRECT_SELECT_DATA = $CB;  
  AVC1394_TUNER_COMMAND_CA_ENABLE = $CC;  
  AVC1394_TUNER_COMMAND_AVC1394_TUNER_STATUS = $CD;  
{ Panel subunit indirect mode commands and operands  }
  AVC1394_PANEL_COMMAND_PASS_THROUGH = $000007C00;  
  AVC1394_PANEL_CMD_PASS_THROUGH = $7C;  
  AVC1394_PANEL_OPERAND_PRESS = $00;  
  AVC1394_PANEL_OPERAND_RELEASE = $80;  
  AVC1394_PANEL_OPERATION_SELECT = $00;  
  AVC1394_PANEL_OPERATION_UP = $01;  
  AVC1394_PANEL_OPERATION_DOWN = $02;  
  AVC1394_PANEL_OPERATION_LEFT = $03;  
  AVC1394_PANEL_OPERATION_RIGHT = $04;  
  AVC1394_PANEL_OPERATION_RIGHT_UP = $05;  
  AVC1394_PANEL_OPERATION_RIGHT_DOWN = $06;  
  AVC1394_PANEL_OPERATION_LEFT_UP = $07;  
  AVC1394_PANEL_OPERATION_LEFT_DOWN = $08;  
  AVC1394_PANEL_OPERATION_ROOT_MENU = $09;  
  AVC1394_PANEL_OPERATION_SETUP_MENU = $0A;  
  AVC1394_PANEL_OPERATION_CONTENTS_MENU = $0B;  
  AVC1394_PANEL_OPERATION_FAVORITE_MENU = $0C;  
  AVC1394_PANEL_OPERATION_EXIT = $0D;  
  AVC1394_PANEL_OPERATION_0 = $20;  
  AVC1394_PANEL_OPERATION_1 = $21;  
  AVC1394_PANEL_OPERATION_2 = $22;  
  AVC1394_PANEL_OPERATION_3 = $23;  
  AVC1394_PANEL_OPERATION_4 = $24;  
  AVC1394_PANEL_OPERATION_5 = $25;  
  AVC1394_PANEL_OPERATION_6 = $26;  
  AVC1394_PANEL_OPERATION_7 = $27;  
  AVC1394_PANEL_OPERATION_8 = $28;  
  AVC1394_PANEL_OPERATION_9 = $29;  
  AVC1394_PANEL_OPERATION_DOT = $2A;  
  AVC1394_PANEL_OPERATION_ENTER = $2B;  
  AVC1394_PANEL_OPERATION_CLEAR = $2C;  
  AVC1394_PANEL_OPERATION_CHANNEL_UP = $30;  
  AVC1394_PANEL_OPERATION_CHANNEL_DOWN = $31;  
  AVC1394_PANEL_OPERATION_PREVIOUS_CHANNEL = $32;  
  AVC1394_PANEL_OPERATION_SOUND_SELECT = $33;  
  AVC1394_PANEL_OPERATION_INPUT_SELECT = $34;  
  AVC1394_PANEL_OPERATION_DISPLAY_INFO = $35;  
  AVC1394_PANEL_OPERATION_HELP = $36;  
  AVC1394_PANEL_OPERATION_PAGE_UP = $37;  
  AVC1394_PANEL_OPERATION_PAGE_DOWN = $38;  
  AVC1394_PANEL_OPERATION_POWER = $40;  
  AVC1394_PANEL_OPERATION_VOLUME_UP = $41;  
  AVC1394_PANEL_OPERATION_VOLUME_DOWN = $42;  
  AVC1394_PANEL_OPERATION_MUTE = $43;  
  AVC1394_PANEL_OPERATION_PLAY = $44;  
  AVC1394_PANEL_OPERATION_STOP = $45;  
  AVC1394_PANEL_OPERATION_PAUSE = $46;  
  AVC1394_PANEL_OPERATION_RECORD = $47;  
  AVC1394_PANEL_OPERATION_REWIND = $48;  
  AVC1394_PANEL_OPERATION_FASTFORWARD = $49;  
  AVC1394_PANEL_OPERATION_EJECT = $4A;  
  AVC1394_PANEL_OPERATION_FORWARD = $4B;  
  AVC1394_PANEL_OPERATION_BACKWARD = $49;  
  AVC1394_PANEL_OPERATION_ANGLE = $50;  
  AVC1394_PANEL_OPERATION_SUBPICTURE = $51;  
type
  Tavc1394_measurement_unit =  Longint;
  Const
    AVC1394_VCR_MEASUREMENT_VIDEO_FRAME = 0;
    AVC1394_VCR_MEASUREMENT_VIDEO_SCENE = 1;
    AVC1394_VCR_MEASUREMENT_VISS = 2;
    AVC1394_VCR_MEASUREMENT_GOP = 3;
    AVC1394_VCR_MEASUREMENT_INDEX = 4;
    AVC1394_VCR_MEASUREMENT_SKIP = 5;
    AVC1394_VCR_MEASUREMENT_PHOTO = 6;

{ C++ extern C conditionnal removed }

function avc1394_send_command(handle:Traw1394handle_t; node:Tnodeid_t; command:Tquadlet_t):longint;cdecl;external libavc1394;
function avc1394_send_command_block(handle:Traw1394handle_t; node:Tnodeid_t; command:Pquadlet_t; command_len:longint):longint;cdecl;external libavc1394;
function avc1394_transaction(handle:Traw1394handle_t; node:Tnodeid_t; quadlet:Tquadlet_t; retry:longint):Tquadlet_t;cdecl;external libavc1394;
function avc1394_transaction_block2(handle:Traw1394handle_t; node:Tnodeid_t; request:Pquadlet_t; len:longint; response_len:Pdword; 
           retry:longint):Pquadlet_t;cdecl;external libavc1394;
function avc1394_transaction_block(handle:Traw1394handle_t; node:Tnodeid_t; request:Pquadlet_t; len:longint; retry:longint):Pquadlet_t;cdecl;external libavc1394;
procedure avc1394_transaction_block_close(handle:Traw1394handle_t);cdecl;external libavc1394;
function avc1394_open_descriptor(handle:Traw1394handle_t; node:Tnodeid_t; ctype:Tquadlet_t; subunit:Tquadlet_t; descriptor_identifier:Pbyte; 
           len_descriptor_identifier:longint; readwrite:byte):longint;cdecl;external libavc1394;
function avc1394_close_descriptor(handle:Traw1394handle_t; node:Tnodeid_t; ctype:Tquadlet_t; subunit:Tquadlet_t; descriptor_identifier:Pbyte; 
           len_descriptor_identifier:longint):longint;cdecl;external libavc1394;
function avc1394_subunit_info(handle:Traw1394handle_t; node:Tnodeid_t; table:Pquadlet_t):longint;cdecl;external libavc1394;
{ supply one of the AVC1394_SUBUNIT_TYPE_... to see of node supports that 
   subunit type. Returns 1 for true, 0 for false.  }
function avc1394_check_subunit_type(handle:Traw1394handle_t; node:Tnodeid_t; subunit_type:longint):longint;cdecl;external libavc1394;
function avc1394_unit_info(handle:Traw1394handle_t; node:Tnodeid_t):Pquadlet_t;cdecl;external libavc1394;
{*********************** TARGET STUFF **************************************** }
{ your callback will receive this struct  }
type
  Pavc1394_command_response = ^Tavc1394_command_response;
  Tavc1394_command_response = record
      flag0 : longint;
      operand : array[0..8] of Tbyte_t;
    end;


const
  bm_Tavc1394_command_response_status = $F;
  bp_Tavc1394_command_response_status = 0;
  bm_Tavc1394_command_response_reserved = $F0;
  bp_Tavc1394_command_response_reserved = 4;
  bm_Tavc1394_command_response_subunit_id = $700;
  bp_Tavc1394_command_response_subunit_id = 8;
  bm_Tavc1394_command_response_subunit_type = $F800;
  bp_Tavc1394_command_response_subunit_type = 11;
  bm_Tavc1394_command_response_opcode = $FF0000;
  bp_Tavc1394_command_response_opcode = 16;

function status(var a : Tavc1394_command_response) : Tbyte_t;
procedure set_status(var a : Tavc1394_command_response; __status : Tbyte_t);
function reserved(var a : Tavc1394_command_response) : Tbyte_t;
procedure set_reserved(var a : Tavc1394_command_response; __reserved : Tbyte_t);
function subunit_id(var a : Tavc1394_command_response) : Tbyte_t;
procedure set_subunit_id(var a : Tavc1394_command_response; __subunit_id : Tbyte_t);
function subunit_type(var a : Tavc1394_command_response) : Tbyte_t;
procedure set_subunit_type(var a : Tavc1394_command_response; __subunit_type : Tbyte_t);
function opcode(var a : Tavc1394_command_response) : Tbyte_t;
procedure set_opcode(var a : Tavc1394_command_response; __opcode : Tbyte_t);
type
  Tavc1394_command_response = Tavc1394_cmd_rsp;
{ command callback prototype  }

  Tavc1394_command_handler_t = function (para1:Pavc1394_command_response):longint;cdecl;
{ set the handler using this function  }

function avc1394_init_target(handle:Traw1394handle_t; para2:Tavc1394_command_handler_t):longint;cdecl;external libavc1394;
function avc1394_close_target(handle:Traw1394handle_t):longint;cdecl;external libavc1394;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 22-12-25 19:15:54 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_START(x : longint) : Tx;
begin
  AVC1394_MASK_START:=Tx(@($F0000000));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_CTYPE(x : longint) : Tx;
begin
  AVC1394_MASK_CTYPE:=Tx(@($0F000000));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_RESPONSE(x : longint) : Tx;
begin
  AVC1394_MASK_RESPONSE:=Tx(@($0F000000));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_SUBUNIT_TYPE(x : longint) : Tx;
begin
  AVC1394_MASK_SUBUNIT_TYPE:=Tx(@($00F80000));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_SUBUNIT_ID(x : longint) : Tx;
begin
  AVC1394_MASK_SUBUNIT_ID:=Tx(@($00070000));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_OPCODE(x : longint) : Tx;
begin
  AVC1394_MASK_OPCODE:=Tx(@($0000FF00));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_MASK_OPERAND0(x : longint) : Tx;
begin
  AVC1394_MASK_OPERAND0:=Tx(@($000000FF));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVC1394_GET_CTYPE(x : longint) : longint;
begin
  AVC1394_GET_CTYPE:=(Tx(@($0F000000))) shr 24;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVC1394_GET_RESPONSE(x : longint) : longint;
begin
  AVC1394_GET_RESPONSE:=(Tx(@($0F000000))) shr 24;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVC1394_GET_SUBUNIT_TYPE(x : longint) : longint;
begin
  AVC1394_GET_SUBUNIT_TYPE:=(Tx(@($00F80000))) shr 19;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVC1394_GET_SUBUNIT_ID(x : longint) : longint;
begin
  AVC1394_GET_SUBUNIT_ID:=(Tx(@($00070000))) shr 16;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVC1394_GET_OPCODE(x : longint) : longint;
begin
  AVC1394_GET_OPCODE:=(Tx(@($0000FF00))) shr 8;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function AVC1394_GET_OPERAND0(x : longint) : Tx;
begin
  AVC1394_GET_OPERAND0:=Tx(@($000000FF));
end;

function status(var a : Tavc1394_command_response) : Tbyte_t;
begin
  status:=(a.flag0 and bm_Tavc1394_command_response_status) shr bp_Tavc1394_command_response_status;
end;

procedure set_status(var a : Tavc1394_command_response; __status : Tbyte_t);
begin
  a.flag0:=a.flag0 or ((__status shl bp_Tavc1394_command_response_status) and bm_Tavc1394_command_response_status);
end;

function reserved(var a : Tavc1394_command_response) : Tbyte_t;
begin
  reserved:=(a.flag0 and bm_Tavc1394_command_response_reserved) shr bp_Tavc1394_command_response_reserved;
end;

procedure set_reserved(var a : Tavc1394_command_response; __reserved : Tbyte_t);
begin
  a.flag0:=a.flag0 or ((__reserved shl bp_Tavc1394_command_response_reserved) and bm_Tavc1394_command_response_reserved);
end;

function subunit_id(var a : Tavc1394_command_response) : Tbyte_t;
begin
  subunit_id:=(a.flag0 and bm_Tavc1394_command_response_subunit_id) shr bp_Tavc1394_command_response_subunit_id;
end;

procedure set_subunit_id(var a : Tavc1394_command_response; __subunit_id : Tbyte_t);
begin
  a.flag0:=a.flag0 or ((__subunit_id shl bp_Tavc1394_command_response_subunit_id) and bm_Tavc1394_command_response_subunit_id);
end;

function subunit_type(var a : Tavc1394_command_response) : Tbyte_t;
begin
  subunit_type:=(a.flag0 and bm_Tavc1394_command_response_subunit_type) shr bp_Tavc1394_command_response_subunit_type;
end;

procedure set_subunit_type(var a : Tavc1394_command_response; __subunit_type : Tbyte_t);
begin
  a.flag0:=a.flag0 or ((__subunit_type shl bp_Tavc1394_command_response_subunit_type) and bm_Tavc1394_command_response_subunit_type);
end;

function opcode(var a : Tavc1394_command_response) : Tbyte_t;
begin
  opcode:=(a.flag0 and bm_Tavc1394_command_response_opcode) shr bp_Tavc1394_command_response_opcode;
end;

procedure set_opcode(var a : Tavc1394_command_response; __opcode : Tbyte_t);
begin
  a.flag0:=a.flag0 or ((__opcode shl bp_Tavc1394_command_response_opcode) and bm_Tavc1394_command_response_opcode);
end;


end.
