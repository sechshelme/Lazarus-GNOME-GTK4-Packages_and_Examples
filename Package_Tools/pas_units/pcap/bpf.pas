unit bpf;

interface

uses
  fp_pcap;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  BPF_RELEASE = 199606;

type
  Tbpf_int32 = int32;
  Pbpf_int32 = ^Tbpf_int32;

  Tbpf_u_int32 = uint32;
  Pbpf_u_int32 = ^Tbpf_u_int32;
  PPbpf_u_int32 = ^Pbpf_u_int32;

const
  BPF_ALIGNMENT = sizeof(Tbpf_int32);

function BPF_WORDALIGN(x: DWord): DWord;

type
  Tbpf_insn = record
    code: Tu_short;
    jt: Tu_char;
    jf: Tu_char;
    k: Tbpf_u_int32;
  end;
  Pbpf_insn = ^Tbpf_insn;

type
  Tbpf_program = record
    bf_len: Tu_int;
    bf_insns: Pbpf_insn;
  end;
  Pbpf_program = ^Tbpf_program;

function BPF_CLASS(code: byte): byte;

const
  BPF_LD = $00;
  BPF_LDX = $01;
  BPF_ST = $02;
  BPF_STX = $03;
  BPF_ALU = $04;
  BPF_JMP = $05;
  BPF_RET = $06;
  BPF_MISC = $07;

function BPF_SIZE(code: byte): byte;

const
  BPF_W = $00;
  BPF_H = $08;
  BPF_B = $10;

function BPF_MODE(code: byte): byte;

const
  BPF_IMM = $00;
  BPF_ABS = $20;
  BPF_IND = $40;
  BPF_MEM = $60;
  BPF_LEN = $80;
  BPF_MSH = $a0;

function BPF_OP(code: byte): byte;

const
  BPF_ADD = $00;
  BPF_SUB = $10;
  BPF_MUL = $20;
  BPF_DIV = $30;
  BPF_OR = $40;
  BPF_AND = $50;
  BPF_LSH = $60;
  BPF_RSH = $70;
  BPF_NEG = $80;
  BPF_MOD = $90;
  BPF_XOR = $a0;
  BPF_JA = $00;
  BPF_JEQ = $10;
  BPF_JGT = $20;
  BPF_JGE = $30;
  BPF_JSET = $40;

function BPF_SRC(code: byte): byte;

const
  BPF_K = $00;
  BPF_X = $08;

function BPF_RVAL(code: byte): byte;

const
  BPF_A = $10;

function BPF_MISCOP(code: byte): byte;

const
  BPF_TAX = $00;
  BPF_TXA = $80;

function bpf_filter(para1: Pbpf_insn; para2: Pu_char; para3: Tu_int; para4: Tu_int): Tu_int; cdecl; external libpcap;
function bpf_validate(f: Pbpf_insn; len: DWord): DWord; cdecl; external libpcap;
function bpf_image(para1: Pbpf_insn; para2: DWord): pchar; cdecl; external libpcap;
procedure bpf_dump(para1: Pbpf_program; para2: DWord); cdecl; external libpcap;

const
  BPF_MEMWORDS = 16;

  // === Konventiert am: 30-8-25 19:13:56 ===


implementation




function BPF_WORDALIGN(x: DWord): DWord;
begin
  BPF_WORDALIGN := (x + (BPF_ALIGNMENT - 1)) and not (BPF_ALIGNMENT - 1);
end;

function BPF_CLASS(code: byte): byte;
begin
  BPF_CLASS := code and $07;
end;

function BPF_SIZE(code: byte): byte;
begin
  BPF_SIZE := code and $18;
end;

function BPF_MODE(code: byte): byte;
begin
  BPF_MODE := code and $e0;
end;

function BPF_OP(code: byte): byte;
begin
  BPF_OP := code and $f0;
end;

function BPF_SRC(code: byte): byte;
begin
  BPF_SRC := code and $08;
end;

function BPF_RVAL(code: byte): byte;
begin
  BPF_RVAL := code and $18;
end;

function BPF_MISCOP(code: byte): byte;
begin
  BPF_MISCOP := code and $f8;
end;


end.
