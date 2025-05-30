{$IFDEF read_interface}


type
  PEfl_Access_Editable_Text = ^TEfl_Access_Editable_Text;
  TEfl_Access_Editable_Text = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_EDITABLE_TEXT_INTERFACE: PEfl_Config;

function efl_access_editable_text_interface_get: PEfl_Class; cdecl; external libelementary;
function efl_access_editable_text_content_set(obj: PEo; _string: pchar): TEina_Bool; cdecl; external libelementary;
function efl_access_editable_text_insert(obj: PEo; _string: pchar; position: longint): TEina_Bool; cdecl; external libelementary;
function efl_access_editable_text_copy(obj: PEo; start: longint; end_: longint): TEina_Bool; cdecl; external libelementary;
function efl_access_editable_text_cut(obj: PEo; start: longint; end_: longint): TEina_Bool; cdecl; external libelementary;
function efl_access_editable_text_delete(obj: PEo; start: longint; end_: longint): TEina_Bool; cdecl; external libelementary;
function efl_access_editable_text_paste(obj: PEo; position: longint): TEina_Bool; cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 17:16:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_EDITABLE_TEXT_INTERFACE: PEfl_Config;
begin
  EFL_ACCESS_EDITABLE_TEXT_INTERFACE := efl_access_editable_text_interface_get;
end;
{$endif}


{$ENDIF read_implementation}
