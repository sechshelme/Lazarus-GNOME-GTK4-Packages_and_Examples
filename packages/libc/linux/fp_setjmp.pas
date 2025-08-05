unit fp_setjmp;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // /usr/include/x86_64-linux-gnu/bits/types/struct___jmp_buf_tag.h

type
  Tjmp_buf_tag = record
    jmpbuf: array[0..7] of int64;
    mask_was_saved: integer;
    saved_mask: Tsigset_t;
  end;


  // /usr/include/setjmp.h

type
  Tjmp_buf = array[0..0] of Tjmp_buf_tag;
  Pjmp_buf = ^Tjmp_buf;

function setjmp(__env: Tjmp_buf): longint; cdecl; external libc;
procedure longjmp(__env: Tjmp_buf; __val: longint); cdecl; external libc;

type
  Tsigjmp_buf = array[0..0] of Tjmp_buf_tag;
  Psigjmp_buf = ^Tsigjmp_buf;

function sigsetjmp(env: jmp_buf; savemask: integer): integer; cdecl; external libc name '__sigsetjmp';
procedure siglongjmp(__env: Tsigjmp_buf; __val: longint); cdecl; external libc;

// === Konventiert am: 5-8-25 16:42:14 ===


implementation


end.
