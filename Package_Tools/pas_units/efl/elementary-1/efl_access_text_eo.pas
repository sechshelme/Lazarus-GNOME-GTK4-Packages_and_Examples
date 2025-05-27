unit efl_access_text_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Access_Text = ^TEfl_Access_Text;
  TEfl_Access_Text = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Access_Text_Granularity = ^TEfl_Access_Text_Granularity;
  TEfl_Access_Text_Granularity = longint;

const
  EFL_ACCESS_TEXT_GRANULARITY_CHAR = 0;
  EFL_ACCESS_TEXT_GRANULARITY_WORD = 1;
  EFL_ACCESS_TEXT_GRANULARITY_SENTENCE = 2;
  EFL_ACCESS_TEXT_GRANULARITY_LINE = 3;
  EFL_ACCESS_TEXT_GRANULARITY_PARAGRAPH = 4;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Access_Text_Clip_Type = ^TEfl_Access_Text_Clip_Type;
  TEfl_Access_Text_Clip_Type = longint;

const
  EFL_ACCESS_TEXT_CLIP_TYPE_NONE = 0;
  EFL_ACCESS_TEXT_CLIP_TYPE_MIN = 1;
  EFL_ACCESS_TEXT_CLIP_TYPE_MAX = 2;
  EFL_ACCESS_TEXT_CLIP_TYPE_BOTH = 3;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Access_Text_Attribute = record
    name: pchar;
    value: pchar;
  end;
  PEfl_Access_Text_Attribute = ^TEfl_Access_Text_Attribute;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Access_Text_Range = record
    start_offset: longint;
    end_offset: longint;
    content: pchar;
  end;
  PEfl_Access_Text_Range = ^TEfl_Access_Text_Range;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Access_Text_Change_Info = record
    content: pchar;
    inserted: TEina_Bool;
    pos: Tsize_t;
    len: Tsize_t;
  end;
  PEfl_Access_Text_Change_Info = ^TEfl_Access_Text_Change_Info;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_TEXT_INTERFACE: PEfl_Class;

function efl_access_text_interface_get: PEfl_Class; cdecl; external libelementary;
function efl_access_text_character_get(obj: PEo; offset: longint): TEina_Unicode; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_text_string_get(obj: PEo; granularity: TEfl_Access_Text_Granularity; start_offset: Plongint; end_offset: Plongint; _string: PPchar); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_get(obj: PEo; start_offset: longint; end_offset: longint): pchar; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_caret_offset_set(obj: PEo; offset: longint): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_caret_offset_get(obj: PEo): longint; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_attribute_get(obj: PEo; name: pchar; start_offset: Plongint; end_offset: Plongint; value: PPchar): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_text_attributes_get(obj: PEo; start_offset: Plongint; end_offset: Plongint; attributes: PPEina_List); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_default_attributes_get(obj: PEo): PEina_List; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_character_extents_get(obj: PEo; offset: longint; screen_coords: TEina_Bool; rect: PEina_Rect): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_character_count_get(obj: PEo): longint; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_offset_at_point_get(obj: PEo; screen_coords: TEina_Bool; x: longint; y: longint): longint; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_bounded_ranges_get(obj: PEo; screen_coords: TEina_Bool; rect: TEina_Rect; xclip: TEfl_Access_Text_Clip_Type; yclip: TEfl_Access_Text_Clip_Type): PEina_List; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_range_extents_get(obj: PEo; screen_coords: TEina_Bool; start_offset: longint; end_offset: longint; rect: PEina_Rect): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_selections_count_get(obj: PEo): longint; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_access_selection_set(obj: PEo; selection_number: longint; start_offset: longint; end_offset: longint): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_text_access_selection_get(obj: PEo; selection_number: longint; start_offset: Plongint; end_offset: Plongint); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_selection_add(obj: PEo; start_offset: longint; end_offset: longint): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_text_selection_remove(obj: PEo; selection_number: longint): TEina_Bool; cdecl; external libelementary;

var
  _EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_CARET_MOVED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_INSERTED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_REMOVED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_SELECTION_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_CARET_MOVED: PEfl_Event_Description;
function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_INSERTED: PEfl_Event_Description;
function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_REMOVED: PEfl_Event_Description;
function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_SELECTION_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 27-5-25 17:44:24 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_TEXT_INTERFACE: PEfl_Class;
begin
  EFL_ACCESS_TEXT_INTERFACE := efl_access_text_interface_get;
end;

function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_CARET_MOVED: PEfl_Event_Description;
begin
  EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_CARET_MOVED := @(_EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_CARET_MOVED);
end;

function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_INSERTED: PEfl_Event_Description;
begin
  EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_INSERTED := @(_EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_INSERTED);
end;

function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_REMOVED: PEfl_Event_Description;
begin
  EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_REMOVED := @(_EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_REMOVED);
end;

function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_SELECTION_CHANGED: PEfl_Event_Description;
begin
  EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_SELECTION_CHANGED := @(_EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_SELECTION_CHANGED);
end;
{$endif}


end.
