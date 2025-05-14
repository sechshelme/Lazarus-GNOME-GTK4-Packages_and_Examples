unit eina_types;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEina_Bool = ^TEina_Bool;
  TEina_Bool = Boolean8;

const
  EINA_FALSE = TEina_Bool(0);
  EINA_TRUE = TEina_Bool(1);

type
  TEina_Compare_Cb = function(data1: pointer; data2: pointer): longint; cdecl;
  TEina_Random_Cb = function(min: longint; max: longint): longint; cdecl;

  PEina_Process_Cb = ^TEina_Process_Cb;
  TEina_Process_Cb = function(container: pointer; data: pointer; fdata: pointer): pointer; cdecl;

  TEina_Each_Cb = function(container: pointer; data: pointer; fdata: pointer): TEina_Bool; cdecl;
  TEina_Free_Cb = procedure(data: pointer); cdecl;

function EINA_COMPARE_CB(_function: Pointer): TEina_Compare_Cb;
function EINA_RANDOM_CB(_function: Pointer): TEina_Random_Cb;
function EINA_PROCESS_CB(_Function: Pointer): TEina_Process_Cb;
function EINA_EACH_CB(_Function: Pointer): TEina_Each_Cb;
function EINA_FREE_CB(_Function: Pointer): TEina_Free_Cb;

//  #define EINA_C_ARRAY_LENGTH(arr) (sizeof(arr) / sizeof((arr)[0]))

function EINA_DOUBLE_EQUAL(x, y: double): boolean;


// === Konventiert am: 14-5-25 19:24:22 ===


implementation



function EINA_COMPARE_CB(_function: Pointer): TEina_Compare_Cb;
begin
  EINA_COMPARE_CB := TEina_Compare_Cb(_function);
end;

function EINA_RANDOM_CB(_function: Pointer): TEina_Random_Cb;
begin
  EINA_RANDOM_CB := TEina_Random_Cb(_function);
end;

function EINA_PROCESS_CB(_Function: Pointer): TEina_Process_Cb;
begin
  EINA_PROCESS_CB := TEina_Process_Cb(_Function);
end;

function EINA_EACH_CB(_Function: Pointer): TEina_Each_Cb;
begin
  EINA_EACH_CB := TEina_Each_Cb(_Function);
end;

function EINA_FREE_CB(_Function: Pointer): TEina_Free_Cb;
begin
  EINA_FREE_CB := TEina_Free_Cb(_Function);
end;

function EINA_DOUBLE_EQUAL(x, y: double): boolean;
const
  EPSILON = 2.2204460492503131e-16;
begin
  Result := Abs(x - y) <= EPSILON * Abs(x);
end;


end.
