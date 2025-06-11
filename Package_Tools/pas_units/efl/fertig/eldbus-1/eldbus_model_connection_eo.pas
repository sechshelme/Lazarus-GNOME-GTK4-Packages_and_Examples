unit eldbus_model_connection_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEldbus_Model_Connection = ^TEldbus_Model_Connection;
  TEldbus_Model_Connection = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_CONNECTION_CLASS: PEfl_Class;

function eldbus_model_connection_class_get: PEfl_Class; cdecl; external libeldbus;
{$endif}

// === Konventiert am: 10-6-25 19:48:22 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_CONNECTION_CLASS: PEfl_Class;
begin
  ELDBUS_MODEL_CONNECTION_CLASS := eldbus_model_connection_class_get;
end;
{$endif}


end.
