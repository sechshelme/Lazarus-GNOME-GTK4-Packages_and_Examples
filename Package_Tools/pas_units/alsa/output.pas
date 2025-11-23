unit output;

interface

uses
  fp_asound;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Psnd_output_t = type Pointer;
  PPsnd_output_t = ^Psnd_output_t;

type
  Psnd_output_type_t = ^Tsnd_output_type_t;
  Tsnd_output_type_t = longint;

const
  SND_OUTPUT_STDIO = 0;
  SND_OUTPUT_BUFFER = 1;

function snd_output_stdio_open(outputp: PPsnd_output_t; file_: pchar; mode: pchar): longint; cdecl; external libasound;
function snd_output_stdio_attach(outputp: PPsnd_output_t; fp: PFILE; _close: longint): longint; cdecl; external libasound;
function snd_output_buffer_open(outputp: PPsnd_output_t): longint; cdecl; external libasound;
function snd_output_buffer_string(output: Psnd_output_t; buf: PPchar): Tsize_t; cdecl; external libasound;
function snd_output_buffer_steal(output: Psnd_output_t; buf: PPchar): Tsize_t; cdecl; external libasound;
function snd_output_close(output: Psnd_output_t): longint; cdecl; external libasound;
function snd_output_printf(output: Psnd_output_t; format: pchar): longint; cdecl; varargs; external libasound;
function snd_output_vprintf(output: Psnd_output_t; format: pchar; args: Tva_list): longint; cdecl; external libasound;
function snd_output_puts(output: Psnd_output_t; str: pchar): longint; cdecl; external libasound;
function snd_output_putc(output: Psnd_output_t; c: longint): longint; cdecl; external libasound;
function snd_output_flush(output: Psnd_output_t): longint; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:12:11 ===


implementation



end.
