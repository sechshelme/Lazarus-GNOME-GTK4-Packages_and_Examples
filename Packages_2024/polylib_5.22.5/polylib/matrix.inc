{$IFDEF read_interface}


function Matrix_Alloc(NbRows: dword; NbColumns: dword): PMatrix; cdecl; external libpolylib;
procedure Matrix_Free(Mat: PMatrix); cdecl; external libpolylib;
procedure Matrix_Extend(Mat: PMatrix; NbRows: dword); cdecl; external libpolylib;
procedure Matrix_Print(Dst: PFILE; Format: pchar; Mat: PMatrix); cdecl; external libpolylib;
procedure Matrix_Read_Input(Mat: PMatrix); cdecl; external libpolylib;
function Matrix_Read: PMatrix; cdecl; external libpolylib;
procedure right_hermite(A: PMatrix; Hp: PPMatrix; Up: PPMatrix; Qp: PPMatrix); cdecl; external libpolylib;
procedure left_hermite(A: PMatrix; Hp: PPMatrix; Qp: PPMatrix; Up: PPMatrix); cdecl; external libpolylib;
function MatInverse(M: PMatrix; MInv: PMatrix): longint; cdecl; external libpolylib;
procedure rat_prodmat(S: PMatrix; X: PMatrix; P: PMatrix); cdecl; external libpolylib;
procedure Matrix_Vector_Product(mat: PMatrix; p1: PValue; p2: PValue); cdecl; external libpolylib;
procedure Vector_Matrix_Product(p1: PValue; mat: PMatrix; p2: PValue); cdecl; external libpolylib;
procedure Matrix_Product(mat1: PMatrix; mat2: PMatrix; mat3: PMatrix); cdecl; external libpolylib;
function Matrix_Inverse(Mat: PMatrix; MatInv: PMatrix): longint; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
