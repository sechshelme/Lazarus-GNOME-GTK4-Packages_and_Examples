{$IFDEF read_interface}


function GET_DATA_BIT(pdata: Pointer; n: longint): longint;
procedure SET_DATA_BIT(pdata: Pointer; n: longint);
procedure CLEAR_DATA_BIT(pdata: Pointer; n: longint);
procedure SET_DATA_BIT_VAL(pdata: Pointer; n, val: longint);
function GET_DATA_DIBIT(pdata: Pointer; n: longint): longint;
procedure SET_DATA_DIBIT(pdata: Pointer; n, val: longint);
procedure CLEAR_DATA_DIBIT(pdata: Pointer; n: longint);
function GET_DATA_QBIT(pdata: Pointer; n: longint): longint;
procedure SET_DATA_QBIT(pdata: Pointer; n, val: longint);
procedure CLEAR_DATA_QBIT(pdata: Pointer; n: longint);
function GET_DATA_BYTE(pdata: Pointer; n: longint): longint;
procedure SET_DATA_BYTE(pdata: Pointer; n, val: longint);
function GET_DATA_TWO_BYTES(pdata: Pointer; n: longint): longint;
procedure SET_DATA_TWO_BYTES(pdata: Pointer; n, val: longint);
function GET_DATA_FOUR_BYTES(pdata: Pointer; n: longint): longint;
procedure SET_DATA_FOUR_BYTES(pdata: Pointer; n, val: longint);


// === Konventiert am: 17-8-25 13:39:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GET_DATA_BIT(pdata: Pointer; n: longint): longint;
begin
  GET_DATA_BIT := l_getDataBit(pdata, n);
end;

procedure SET_DATA_BIT(pdata: Pointer; n: longint);
begin
  l_setDataBit(pdata, n);
end;

procedure CLEAR_DATA_BIT(pdata: Pointer; n: longint);
begin
  l_clearDataBit(pdata, n);
end;

procedure SET_DATA_BIT_VAL(pdata: Pointer; n, val: longint);
begin
  l_setDataBitVal(pdata, n, val);
end;

function GET_DATA_DIBIT(pdata: Pointer; n: longint): longint;
begin
  GET_DATA_DIBIT := l_getDataDibit(pdata, n);
end;

procedure SET_DATA_DIBIT(pdata: Pointer; n, val: longint);
begin
  l_setDataDibit(pdata, n, val);
end;

procedure CLEAR_DATA_DIBIT(pdata: Pointer; n: longint);
begin
  l_clearDataDibit(pdata, n);
end;

function GET_DATA_QBIT(pdata: Pointer; n: longint): longint;
begin
  GET_DATA_QBIT := l_getDataQbit(pdata, n);
end;

procedure SET_DATA_QBIT(pdata: Pointer; n, val: longint);
begin
  l_setDataQbit(pdata, n, val);
end;

procedure CLEAR_DATA_QBIT(pdata: Pointer; n: longint);
begin
  l_clearDataQbit(pdata, n);
end;

function GET_DATA_BYTE(pdata: Pointer; n: longint): longint;
begin
  GET_DATA_BYTE := l_getDataByte(pdata, n);
end;

procedure SET_DATA_BYTE(pdata: Pointer; n, val: longint);
begin
  l_setDataByte(pdata, n, val);
end;

function GET_DATA_TWO_BYTES(pdata: Pointer; n: longint): longint;
begin
  GET_DATA_TWO_BYTES := l_getDataTwoBytes(pdata, n);
end;

procedure SET_DATA_TWO_BYTES(pdata: Pointer; n, val: longint);
begin
  l_setDataTwoBytes(pdata, n, val);
end;

function GET_DATA_FOUR_BYTES(pdata: Pointer; n: longint): longint;
begin
  GET_DATA_FOUR_BYTES := l_getDataFourBytes(pdata, n);
end;

procedure SET_DATA_FOUR_BYTES(pdata: Pointer; n, val: longint);
begin
  l_setDataFourBytes(pdata, n, val);
end;


{$ENDIF read_implementation}
