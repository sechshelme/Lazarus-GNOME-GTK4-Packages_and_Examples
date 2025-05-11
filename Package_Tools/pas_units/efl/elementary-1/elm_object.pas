unit elm_object;

interface

uses
  ctypes, elf, Evas_Common, elm_general;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure elm_object_part_text_set(obj: PEvas_Object; part: pchar; text: pchar); cdecl; external libevas;
function elm_object_part_text_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libevas;
procedure elm_object_domain_translatable_part_text_set(obj: PEvas_Object; part: pchar; domain: pchar; text: pchar); cdecl; external libevas;

function elm_object_translatable_part_text_get(obj: PEvas_Object; part: pchar): pchar; cdecl; external libevas;
procedure elm_object_domain_part_text_translatable_set(obj: PEvas_Object; part: pchar; domain: pchar; translatable: TEina_Bool); cdecl; external libevas;
procedure elm_object_part_content_set(obj: PEvas_Object; part: pchar; content: PEvas_Object); cdecl; external libevas;
function elm_object_part_content_get(obj: PEvas_Object; part: pchar): PEvas_Object; cdecl; external libevas;
function elm_object_part_content_unset(obj: PEvas_Object; part: pchar): PEvas_Object; cdecl; external libevas;
procedure elm_object_access_info_set(obj: PEvas_Object; txt: pchar); cdecl; external libevas;
function elm_object_access_info_get(obj: PEvas_Object): pchar; cdecl; external libevas;
function elm_object_name_find(obj: PEvas_Object; name: pchar; recurse: longint): PEvas_Object; cdecl; external libevas;
function elm_object_style_set(obj: PEvas_Object; style: pchar): TEina_Bool; cdecl; external libevas;
function elm_object_style_get(obj: PEvas_Object): pchar; cdecl; external libevas;
procedure elm_object_disabled_set(obj: PEvas_Object; disabled: TEina_Bool); cdecl; external libevas;
function elm_object_disabled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
function elm_object_widget_check(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;
function elm_object_parent_widget_get(obj: PEvas_Object): PEvas_Object; cdecl; external libevas;
function elm_object_top_widget_get(obj: PEvas_Object): PEvas_Object; cdecl; external libevas;
function elm_object_widget_type_get(obj: PEvas_Object): pchar; cdecl; external libevas;
procedure elm_object_signal_emit(obj: PEvas_Object; emission: pchar; source: pchar); cdecl; external libevas;
procedure elm_object_signal_callback_add(obj: PEvas_Object; emission: pchar; source: pchar; func: TEdje_Signal_Cb; data: pointer); cdecl; external libevas;
function elm_object_signal_callback_del(obj: PEvas_Object; emission: pchar; source: pchar; func: TEdje_Signal_Cb): pointer; cdecl; external libevas;
procedure elm_object_event_callback_add(obj: PEvas_Object; func: TElm_Event_Cb; data: pointer); cdecl; external libevas;
function elm_object_event_callback_del(obj: PEvas_Object; func: TElm_Event_Cb; data: pointer): pointer; cdecl; external libevas;
procedure elm_object_orientation_mode_disabled_set(obj: PEvas_Object; disabled: TEina_Bool); cdecl; external libevas;
function elm_object_orientation_mode_disabled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libevas;

procedure elm_object_text_set(obj: PEvas_Object; text: pchar);
procedure elm_object_text_get(obj: PEvas_Object);
procedure elm_object_domain_translatable_text_set(obj: PEvas_Object; domain, text: pchar);
procedure elm_object_translatable_text_set(obj: PEvas_Object; text: pchar);
procedure elm_object_translatable_part_text_set(obj: PEvas_Object; part, text: pchar);
function elm_object_translatable_text_get(obj: PEvas_Object): pchar;
procedure elm_object_part_text_translatable_set(obj: PEvas_Object; part: pchar; translatable: TEina_Bool);
procedure elm_object_domain_text_translatable_set(obj: PEvas_Object; domain: pchar; translatable: TEina_Bool);
procedure elm_object_content_set(obj: PEvas_Object; content: PEvas_Object);
function elm_object_content_get(obj: PEvas_Object): PEvas_Object;
function elm_object_content_unset(obj: PEvas_Object): PEvas_Object;



// === Konventiert am: 11-5-25 17:07:14 ===


implementation


procedure elm_object_text_set(obj: PEvas_Object; text: pchar);
begin
  elm_object_part_text_set(obj, nil, text);
end;

procedure elm_object_text_get(obj: PEvas_Object);
begin
  elm_object_part_text_get(obj, nil);
end;

procedure elm_object_domain_translatable_text_set(obj: PEvas_Object; domain, text: pchar);
begin
  elm_object_domain_translatable_part_text_set(obj, nil, domain, text);
end;

procedure elm_object_translatable_text_set(obj: PEvas_Object; text: pchar);
begin
  elm_object_domain_translatable_part_text_set(obj, nil, nil, text);
end;

procedure elm_object_translatable_part_text_set(obj: PEvas_Object; part, text: pchar);
begin
  elm_object_domain_translatable_part_text_set(obj, part, nil, text);
end;

function elm_object_translatable_text_get(obj: PEvas_Object): pchar;
begin
  elm_object_translatable_text_get := elm_object_translatable_part_text_get(obj, nil);
end;

procedure elm_object_part_text_translatable_set(obj: PEvas_Object; part: pchar; translatable: TEina_Bool);
begin
  elm_object_domain_part_text_translatable_set(obj, part, nil, translatable);
end;

procedure elm_object_domain_text_translatable_set(obj: PEvas_Object; domain: pchar; translatable: TEina_Bool);
begin
  elm_object_domain_part_text_translatable_set(obj, nil, domain, translatable);
end;

procedure elm_object_content_set(obj: PEvas_Object; content: PEvas_Object);
begin
  elm_object_part_content_set(obj, nil, content);
end;

function elm_object_content_get(obj: PEvas_Object): PEvas_Object;
begin
  elm_object_content_get := elm_object_part_content_get(obj, nil);
end;

function elm_object_content_unset(obj: PEvas_Object): PEvas_Object;
begin
  elm_object_content_unset := elm_object_part_content_unset(obj, nil);
end;


end.
