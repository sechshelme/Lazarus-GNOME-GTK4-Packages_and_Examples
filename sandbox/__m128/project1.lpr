program project1;

uses
  fp_stdio;

  {$asmmode intel}


type
  TVector4f = array[0..3] of single;
  PVector4f = ^TVector4f;

  procedure PrintTXM128(v: TVector4f);
  begin
    WriteLn('[', v[0]: 4: 2, ', ', v[1]: 4: 2, ', ', v[2]: 4: 2, ', ', v[3]: 4: 2, ']');
  end;

  procedure AddXMM(const A, B: TVector4f; C: PVector4f); assembler;
  asm
           Movdqu  Xmm0, [Rdi]
           Movdqu  Xmm1, [Rsi]
           Addps   Xmm0, Xmm1
           Movdqu  [Rdx], Xmm0
  end;

  procedure SubXMM(const A, B: TVector4f; C: PVector4f); assembler;
  asm
           Movdqu  Xmm0, [Rdi]
           Movdqu  Xmm1, [Rsi]
           Subps   Xmm0, Xmm1
           Movdqu  [Rdx], Xmm0
  end;

var
  v1: TVector4f = (5.5, 6.6, 7.7, 8.8);
  v2: TVector4f = (1.1, 2.2, 3.3, 4.4);
  vo: TVector4f;

begin
  AddXMM(v1, v2, @vo);
  PrintTXM128(vo);
  SubXMM(v1, v2, @vo);
  PrintTXM128(vo);
end.
