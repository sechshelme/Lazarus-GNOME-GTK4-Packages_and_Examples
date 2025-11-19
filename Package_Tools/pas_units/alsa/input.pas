unit input;

interface

uses
  fp_asound;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Psnd_input_t = type Pointer;
  PPsnd_input_t = Psnd_input_t;

type
  Psnd_input_type = ^Tsnd_input_type;
  Tsnd_input_type = longint;

const
  SND_INPUT_STDIO = 0;
  SND_INPUT_BUFFER = 1;

type
  Tsnd_input_type_t = Tsnd_input_type;
  Psnd_input_type_t = ^Tsnd_input_type_t;

function snd_input_stdio_open(inputp: PPsnd_input_t; file_: pchar; mode: pchar): longint; cdecl; external libasound;
function snd_input_stdio_attach(inputp: PPsnd_input_t; fp: PFILE; _close: longint): longint; cdecl; external libasound;
function snd_input_buffer_open(inputp: PPsnd_input_t; buffer: pchar; size: Tssize_t): longint; cdecl; external libasound;
function snd_input_close(input: Psnd_input_t): longint; cdecl; external libasound;
function snd_input_scanf(input: Psnd_input_t; format: pchar): longint; cdecl; varargs; external libasound;
function snd_input_gets(input: Psnd_input_t; str: pchar; size: Tsize_t): pchar; cdecl; external libasound;
function snd_input_getc(input: Psnd_input_t): longint; cdecl; external libasound;
function snd_input_ungetc(input: Psnd_input_t; c: longint): longint; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:12:20 ===


implementation



end.
