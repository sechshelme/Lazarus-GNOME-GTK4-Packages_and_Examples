unit eina_inline_util;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function eina_dbl_exact(a, b: double): TEina_Bool;
function eina_flt_exact(a, b: single): TEina_Bool;

implementation

function eina_dbl_exact(a, b: double): TEina_Bool;
begin
  Result := TEina_Bool(memcmp(@a, @b, SizeOf(double)));
end;

function eina_flt_exact(a, b: single): TEina_Bool;
begin
  Result := TEina_Bool(memcmp(@a, @b, SizeOf(single)));
end;

end.
