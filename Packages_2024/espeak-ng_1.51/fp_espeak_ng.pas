unit fp_espeak_ng;

interface

const
  {$IFDEF Linux}
  libespeak_ng = 'espeak-ng';
  {$ENDIF}

  {$IFDEF Windows}
  libespeak_ng = 'espeak-ng.dll';  // ????????'
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  Twchar_t = uint32;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int64;
  Twchar_t = uint16;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;
  Pwchar_t = ^Twchar_t;

  Tsize_t = SizeUInt;

  PFILE = type Pointer;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  //  ============= speak_lib.h

const
  extern_REVISION = 12;

  espeakRATE_MINIMUM = 80;
  espeakRATE_MAXIMUM = 450;
  espeakRATE_NORMAL = 175;

type
  Pespeak_EVENT_TYPE = ^Tespeak_EVENT_TYPE;
  Tespeak_EVENT_TYPE = longint;

const
  espeakEVENT_LIST_TERMINATED = 0;
  espeakEVENT_WORD = 1;
  espeakEVENT_SENTENCE = 2;
  espeakEVENT_MARK = 3;
  espeakEVENT_PLAY = 4;
  espeakEVENT_END = 5;
  espeakEVENT_MSG_TERMINATED = 6;
  espeakEVENT_PHONEME = 7;
  espeakEVENT_SAMPLERATE = 8;

type
  Tespeak_EVENT = record
    _type: Tespeak_EVENT_TYPE;
    unique_identifier: dword;
    text_position: longint;
    length: longint;
    audio_position: longint;
    sample: longint;
    user_data: pointer;
    id: record
      case longint of
        0: (number: longint);
        1: (name: pchar);
        2: (_string: array[0..7] of char);
      end;
  end;
  Pespeak_EVENT = ^Tespeak_EVENT;

type
  Pespeak_POSITION_TYPE = ^Tespeak_POSITION_TYPE;
  Tespeak_POSITION_TYPE = longint;

const
  POS_CHARACTER = 1;
  POS_WORD = 2;
  POS_SENTENCE = 3;

type
  Pespeak_AUDIO_OUTPUT = ^Tespeak_AUDIO_OUTPUT;
  Tespeak_AUDIO_OUTPUT = longint;

const
  AUDIO_OUTPUT_PLAYBACK = 0;
  AUDIO_OUTPUT_RETRIEVAL = 1;
  AUDIO_OUTPUT_SYNCHRONOUS = 2;
  AUDIO_OUTPUT_SYNCH_PLAYBACK = 3;

type
  Pespeak_ERROR = ^Tespeak_ERROR;
  Tespeak_ERROR = longint;

const
  EE_OK = 0;
  EE_INTERNAL_ERROR = -(1);
  EE_BUFFER_FULL = 1;
  EE_NOT_FOUND = 2;

const
  espeakINITIALIZE_PHONEME_EVENTS = $0001;
  espeakINITIALIZE_PHONEME_IPA = $0002;
  espeakINITIALIZE_DONT_EXIT = $8000;

function espeak_Initialize(output: Tespeak_AUDIO_OUTPUT; buflength: longint; path: pchar; options: longint): longint; cdecl; external libespeak_ng;

type
  Tespeak_callback = function(wav: PInt16; numsamples: longint; event: Pespeak_EVENT): integer; cdecl;

procedure espeak_SetSynthCallback(SynthCallback: Tespeak_callback); cdecl; external libespeak_ng;

type
  TespeakUri_call = function(para1: longint; para2: pchar; para3: pchar): longint;
  TespaePhone_call = function(para1: pchar): longint;

procedure espeak_SetUriCallback(UriCallback: TespeakUri_call); cdecl; external libespeak_ng;
procedure espeak_SetPhonemeCallback(PhonemeCallback: TespaePhone_call); cdecl; external libespeak_ng;

const
  espeakCHARS_AUTO = 0;
  espeakCHARS_UTF8 = 1;
  espeakCHARS_8BIT = 2;
  espeakCHARS_WCHAR = 3;
  espeakCHARS_16BIT = 4;
  espeakSSML = $10;
  espeakPHONEMES = $100;
  espeakENDPAUSE = $1000;
  espeakKEEP_NAMEDATA = $2000;

function espeak_Synth(text: pointer; size: Tsize_t; position: dword; position_type: Tespeak_POSITION_TYPE; end_position: dword;
  flags: dword; unique_identifier: Pdword; user_data: pointer): Tespeak_ERROR; cdecl; external libespeak_ng;
function espeak_Synth_Mark(text: pointer; size: Tsize_t; index_mark: pchar; end_position: dword; flags: dword;
  unique_identifier: Pdword; user_data: pointer): Tespeak_ERROR; cdecl; external libespeak_ng;
function espeak_Key(key_name: pchar): Tespeak_ERROR; cdecl; external libespeak_ng;
function espeak_Char(character: Twchar_t): Tespeak_ERROR; cdecl; external libespeak_ng;

type
  Pespeak_PARAMETER = ^Tespeak_PARAMETER;
  Tespeak_PARAMETER = longint;

const
  espeakSILENCE = 0;
  espeakRATE = 1;
  espeakVOLUME = 2;
  espeakPITCH = 3;
  espeakRANGE = 4;
  espeakPUNCTUATION = 5;
  espeakCAPITALS = 6;
  espeakWORDGAP = 7;
  espeakOPTIONS = 8;
  espeakINTONATION = 9;
  espeakRESERVED1 = 10;
  espeakRESERVED2 = 11;
  espeakEMPHASIS = 12;
  espeakLINELENGTH = 13;
  espeakVOICETYPE = 14;
  N_SPEECH_PARAM = 15;

type
  Pespeak_PUNCT_TYPE = ^Tespeak_PUNCT_TYPE;
  Tespeak_PUNCT_TYPE = longint;

const
  espeakPUNCT_NONE = 0;
  espeakPUNCT_ALL = 1;
  espeakPUNCT_SOME = 2;

function espeak_SetParameter(parameter: Tespeak_PARAMETER; value: longint; relative: longint): Tespeak_ERROR; cdecl; external libespeak_ng;
function espeak_GetParameter(parameter: Tespeak_PARAMETER; current: longint): longint; cdecl; external libespeak_ng;
function espeak_SetPunctuationList(punctlist: Pwchar_t): Tespeak_ERROR; cdecl; external libespeak_ng;

const
  espeakPHONEMES_SHOW = $01;
  espeakPHONEMES_IPA = $02;
  espeakPHONEMES_TRACE = $08;
  espeakPHONEMES_MBROLA = $10;
  espeakPHONEMES_TIE = $80;

procedure espeak_SetPhonemeTrace(phonememode: longint; stream: PFILE); cdecl; external libespeak_ng;
function espeak_TextToPhonemes(textptr: Ppointer; textmode: longint; phonememode: longint): pchar; cdecl; external libespeak_ng;
procedure espeak_CompileDictionary(path: pchar; log: PFILE; flags: longint); cdecl; external libespeak_ng;

type
  Tespeak_VOICE = record
    name: pchar;
    languages: pchar;
    identifier: pchar;
    gender: byte;
    age: byte;
    variant: byte;
    xx1: byte;
    score: longint;
    spare: pointer;
  end;
  Pespeak_VOICE = ^Tespeak_VOICE;
  PPespeak_VOICE = ^Pespeak_VOICE;

function espeak_ListVoices(voice_spec: Pespeak_VOICE): PPespeak_VOICE; cdecl; external libespeak_ng;
function espeak_SetVoiceByFile(filename: pchar): Tespeak_ERROR; cdecl; external libespeak_ng;
function espeak_SetVoiceByName(name: pchar): Tespeak_ERROR; cdecl; external libespeak_ng;
function espeak_SetVoiceByProperties(voice_spec: Pespeak_VOICE): Tespeak_ERROR; cdecl; external libespeak_ng;
function espeak_GetCurrentVoice: Pespeak_VOICE; cdecl; external libespeak_ng;
function espeak_Cancel: Tespeak_ERROR; cdecl; external libespeak_ng;
function espeak_IsPlaying: longint; cdecl; external libespeak_ng;
function espeak_Synchronize: Tespeak_ERROR; cdecl; external libespeak_ng;
function espeak_Terminate: Tespeak_ERROR; cdecl; external libespeak_ng;
function espeak_Info(path_data: PPchar): pchar; cdecl; external libespeak_ng;


//  ============= espeak-ng.h

const
  ESPEAKNG_DEFAULT_VOICE = 'en';

type
  Pespeak_ng_STATUS = ^Tespeak_ng_STATUS;
  Tespeak_ng_STATUS = longint;

const
  ENS_GROUP_MASK = $70000000;
  ENS_GROUP_ERRNO = $00000000;
  ENS_GROUP_ESPEAK_NG = $10000000;
  ENS_OK = 0;
  ENS_COMPILE_ERROR = $100001FF;
  ENS_VERSION_MISMATCH = $100002FF;
  ENS_FIFO_BUFFER_FULL = $100003FF;
  ENS_NOT_INITIALIZED = $100004FF;
  ENS_AUDIO_ERROR = $100005FF;
  ENS_VOICE_NOT_FOUND = $100006FF;
  ENS_MBROLA_NOT_FOUND = $100007FF;
  ENS_MBROLA_VOICE_NOT_FOUND = $100008FF;
  ENS_EVENT_BUFFER_FULL = $100009FF;
  ENS_NOT_SUPPORTED = $10000AFF;
  ENS_UNSUPPORTED_PHON_FORMAT = $10000BFF;
  ENS_NO_SPECT_FRAMES = $10000CFF;
  ENS_EMPTY_PHONEME_MANIFEST = $10000DFF;
  ENS_SPEECH_STOPPED = $10000EFF;
  ENS_UNKNOWN_PHONEME_FEATURE = $10000FFF;
  ENS_UNKNOWN_TEXT_ENCODING = $100010FF;

type
  Pespeak_ng_OUTPUT_MODE = ^Tespeak_ng_OUTPUT_MODE;
  Tespeak_ng_OUTPUT_MODE = longint;

const
  ENOUTPUT_MODE_SYNCHRONOUS = $0001;
  ENOUTPUT_MODE_SPEAK_AUDIO = $0002;

type
  Pespeak_ng_VOICE_GENDER = ^Tespeak_ng_VOICE_GENDER;
  Tespeak_ng_VOICE_GENDER = longint;

const
  ENGENDER_UNKNOWN = 0;
  ENGENDER_MALE = 1;
  ENGENDER_FEMALE = 2;
  ENGENDER_NEUTRAL = 3;

type
  Tespeak_ng_OUTPUT_HOOKS = record
    outputPhoSymbol: procedure(pho_code: pchar; pho_type: longint); cdecl;
    outputSilence: procedure(echo_tail: smallint); cdecl;
    outputVoiced: procedure(sample: smallint); cdecl;
    outputUnvoiced: procedure(sample: smallint); cdecl;
  end;
  Pespeak_ng_OUTPUT_HOOKS = ^Tespeak_ng_OUTPUT_HOOKS;

  Pespeak_ng_ERROR_CONTEXT = ^Tespeak_ng_ERROR_CONTEXT;
  Tespeak_ng_ERROR_CONTEXT = type Pointer;

procedure espeak_ng_ClearErrorContext(context: Pespeak_ng_ERROR_CONTEXT); cdecl; external libespeak_ng;
procedure espeak_ng_GetStatusCodeMessage(status: Tespeak_ng_STATUS; buffer: pchar; length: Tsize_t); cdecl; external libespeak_ng;
procedure espeak_ng_PrintStatusCodeMessage(status: Tespeak_ng_STATUS; out_: PFILE; context: Tespeak_ng_ERROR_CONTEXT); cdecl; external libespeak_ng;
procedure espeak_ng_InitializePath(path: pchar); cdecl; external libespeak_ng;
function espeak_ng_Initialize(context: Pespeak_ng_ERROR_CONTEXT): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_InitializeOutput(output_mode: Tespeak_ng_OUTPUT_MODE; buffer_length: longint; device: pchar): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_GetSampleRate: longint; cdecl; external libespeak_ng;
function espeak_ng_SetParameter(parameter: Tespeak_PARAMETER; value: longint; relative: longint): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_SetPunctuationList(punctlist: Pwchar_t): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_SetVoiceByName(name: pchar): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_SetVoiceByFile(filename: pchar): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_SetVoiceByProperties(voice_selector: Pespeak_VOICE): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_Synthesize(text: pointer; size: Tsize_t; position: dword; position_type: Tespeak_POSITION_TYPE; end_position: dword;
  flags: dword; unique_identifier: Pdword; user_data: pointer): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_SynthesizeMark(text: pointer; size: Tsize_t; index_mark: pchar; end_position: dword; flags: dword;
  unique_identifier: Pdword; user_data: pointer): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_SpeakKeyName(key_name: pchar): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_SpeakCharacter(character: Twchar_t): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_Cancel: Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_Synchronize: Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_Terminate: Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_CompileDictionary(dsource: pchar; dict_name: pchar; log: PFILE; flags: longint; context: Pespeak_ng_ERROR_CONTEXT): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_CompileMbrolaVoice(path: pchar; log: PFILE; context: Pespeak_ng_ERROR_CONTEXT): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_CompilePhonemeData(rate: Tclong; log: PFILE; context: Pespeak_ng_ERROR_CONTEXT): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_CompileIntonation(log: PFILE; context: Pespeak_ng_ERROR_CONTEXT): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_CompilePhonemeDataPath(rate: Tclong; source_path: pchar; destination_path: pchar; log: PFILE; context: Pespeak_ng_ERROR_CONTEXT): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_SetOutputHooks(hooks: Pespeak_ng_OUTPUT_HOOKS): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function espeak_ng_SetConstF0(f0: longint): Tespeak_ng_STATUS; cdecl; external libespeak_ng;


//  ============= encoding.h

type
  Pespeak_ng_ENCODING = ^Tespeak_ng_ENCODING;
  Tespeak_ng_ENCODING = longint;

const
  ESPEAKNG_ENCODING_UNKNOWN = 0;
  ESPEAKNG_ENCODING_US_ASCII = 1;
  ESPEAKNG_ENCODING_ISO_8859_1 = 2;
  ESPEAKNG_ENCODING_ISO_8859_2 = 3;
  ESPEAKNG_ENCODING_ISO_8859_3 = 4;
  ESPEAKNG_ENCODING_ISO_8859_4 = 5;
  ESPEAKNG_ENCODING_ISO_8859_5 = 6;
  ESPEAKNG_ENCODING_ISO_8859_6 = 7;
  ESPEAKNG_ENCODING_ISO_8859_7 = 8;
  ESPEAKNG_ENCODING_ISO_8859_8 = 9;
  ESPEAKNG_ENCODING_ISO_8859_9 = 10;
  ESPEAKNG_ENCODING_ISO_8859_10 = 11;
  ESPEAKNG_ENCODING_ISO_8859_11 = 12;
  ESPEAKNG_ENCODING_ISO_8859_13 = 13;
  ESPEAKNG_ENCODING_ISO_8859_14 = 14;
  ESPEAKNG_ENCODING_ISO_8859_15 = 15;
  ESPEAKNG_ENCODING_ISO_8859_16 = 16;
  ESPEAKNG_ENCODING_KOI8_R = 17;
  ESPEAKNG_ENCODING_ISCII = 18;
  ESPEAKNG_ENCODING_UTF_8 = 19;
  ESPEAKNG_ENCODING_ISO_10646_UCS_2 = 20;


function espeak_ng_EncodingFromName(encoding: pchar): Tespeak_ng_ENCODING; cdecl; external libespeak_ng;

type
  Pespeak_ng_TEXT_DECODER = type Pointer;

function create_text_decoder: Pespeak_ng_TEXT_DECODER; cdecl; external libespeak_ng;
procedure destroy_text_decoder(decoder: Pespeak_ng_TEXT_DECODER); cdecl; external libespeak_ng;
function text_decoder_decode_string(decoder: Pespeak_ng_TEXT_DECODER; _string: pchar; length: longint; encoding: Tespeak_ng_ENCODING): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function text_decoder_decode_string_auto(decoder: Pespeak_ng_TEXT_DECODER; _string: pchar; length: longint; encoding: Tespeak_ng_ENCODING): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function text_decoder_decode_wstring(decoder: Pespeak_ng_TEXT_DECODER; _string: Pwchar_t; length: longint): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function text_decoder_decode_string_multibyte(decoder: Pespeak_ng_TEXT_DECODER; input: pointer; encoding: Tespeak_ng_ENCODING; flags: longint): Tespeak_ng_STATUS; cdecl; external libespeak_ng;
function text_decoder_eof(decoder: Pespeak_ng_TEXT_DECODER): longint; cdecl; external libespeak_ng;
function text_decoder_getc(decoder: Pespeak_ng_TEXT_DECODER): uint32; cdecl; external libespeak_ng;
function text_decoder_peekc(decoder: Pespeak_ng_TEXT_DECODER): uint32; cdecl; external libespeak_ng;
function text_decoder_get_buffer(decoder: Pespeak_ng_TEXT_DECODER): pointer; cdecl; external libespeak_ng;




// === Konventiert am: 7-11-25 17:27:51 ===


implementation



end.
