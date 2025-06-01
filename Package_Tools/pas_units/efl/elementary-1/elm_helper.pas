unit elm_helper;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Validate_Content = record
    text: pchar;
    signal: PEina_Tmpstr;
  end;
  PElm_Validate_Content = ^TElm_Validate_Content;

  TElm_Validator_Regexp = record
  end;
  PElm_Validator_Regexp = ^TElm_Validator_Regexp;

  PElm_Regexp_Status = ^TElm_Regexp_Status;
  TElm_Regexp_Status = longint;

const
  ELM_REG_NOERROR = 0;
  ELM_REG_NOMATCH = 1;
  ELM_REG_BADPAT = 2;

function elm_validator_regexp_new(pattern: pchar; signal: pchar): PElm_Validator_Regexp; cdecl; external libelementary;
procedure elm_validator_regexp_free(validator: PElm_Validator_Regexp); cdecl; external libelementary;
function elm_validator_regexp_status_get(validator: PElm_Validator_Regexp): TElm_Regexp_Status; cdecl; external libelementary;

{$if defined(EFL_BETA_API_SUPPORT)}
procedure elm_validator_regexp_helper(data: pointer; event: PEfl_Event); cdecl; external libelementary;
{$endif}

// === Konventiert am: 1-6-25 13:32:07 ===


implementation



end.
