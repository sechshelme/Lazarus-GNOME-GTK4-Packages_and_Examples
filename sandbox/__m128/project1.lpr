program project1;

  {$asmmode intel}

type
  TVector4f = array[0..3] of single;
  PVector4f = ^TVector4f;

  procedure PrintTXM128(v: TVector4f);
  begin
    WriteLn('[', v[0]: 4: 2, ', ', v[1]: 4: 2, ', ', v[2]: 4: 2, ', ', v[3]: 4: 2, ']');
  end;

  function AddXMM(A, B: PVector4f): TVector4f assembler nostackframe register;
  asm
           Movaps  Xmm0, xmmword ptr [A]
           Movaps  Xmm1, xmmword ptr [B]
           Addps   Xmm0, Xmm1
           Movdqu  [result], Xmm0
  end;

  function SubXMM(const A, B: TVector4f): TVector4f; assembler; nostackframe; register;
  asm
           Movaps  Xmm0, xmmword ptr [A]
           Movaps  Xmm1, xmmword ptr [B]
           Subps   Xmm0, Xmm1
           Movdqu  [Result], Xmm0
  end;

  function ScalarXMM(const A: TVector4f; factor: single): TVector4f; assembler;
  asm
           Movaps  Xmm1,xmmword ptr [factor]
           Shufps  Xmm1, Xmm1, $00
           Movdqu  Xmm0, [A]
           Mulps   Xmm0, Xmm1
           Movdqu  [Result], Xmm0
  end;


var
  v1: TVector4f = (5.5, 6.6, 7.7, 8.8);
  v2: TVector4f = (1.1, 2.2, 3.3, 4.4);
  vo: TVector4f;

begin
  vo := AddXMM(@v1, @v2);
  PrintTXM128(vo);
  vo := SubXMM(v1, v2);
  PrintTXM128(vo);
  vo := ScalarXMM(v2, 0.5);
  PrintTXM128(vo);
end.
