
unit efl_access_text_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_text_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_text_eo.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PEfl_Access_Text  = ^Efl_Access_Text;
PEfl_Access_Text_Attribute  = ^Efl_Access_Text_Attribute;
PEfl_Access_Text_Change_Info  = ^Efl_Access_Text_Change_Info;
PEfl_Access_Text_Clip_Type  = ^Efl_Access_Text_Clip_Type;
PEfl_Access_Text_Granularity  = ^Efl_Access_Text_Granularity;
PEfl_Access_Text_Range  = ^Efl_Access_Text_Range;
PEfl_Class  = ^Efl_Class;
PEina_List  = ^Eina_List;
PEina_Rect  = ^Eina_Rect;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_ACCESS_TEXT_EO_H_}
{$define _EFL_ACCESS_TEXT_EO_H_}
{$ifndef _EFL_ACCESS_TEXT_EO_CLASS_TYPE}
{$define _EFL_ACCESS_TEXT_EO_CLASS_TYPE}
type
  PEfl_Access_Text = ^TEfl_Access_Text;
  TEfl_Access_Text = TEo;
{$endif}
{$ifndef _EFL_ACCESS_TEXT_EO_TYPES}
{$define _EFL_ACCESS_TEXT_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Text accessibility granularity
 *
 * @ingroup Efl_Access_Text_Granularity
  }
{*< Character granularity  }
{*< Word granularity  }
{*< Sentence granularity  }
{*< Line granularity  }
{*< Paragraph granularity  }
type
  PEfl_Access_Text_Granularity = ^TEfl_Access_Text_Granularity;
  TEfl_Access_Text_Granularity =  Longint;
  Const
    EFL_ACCESS_TEXT_GRANULARITY_CHAR = 0;
    EFL_ACCESS_TEXT_GRANULARITY_WORD = 1;
    EFL_ACCESS_TEXT_GRANULARITY_SENTENCE = 2;
    EFL_ACCESS_TEXT_GRANULARITY_LINE = 3;
    EFL_ACCESS_TEXT_GRANULARITY_PARAGRAPH = 4;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Text clip type
 *
 * @ingroup Efl_Access_Text_Clip_Type
  }
{*< No clip type  }
{*< Minimum clip type  }
{*< Maximum clip type  }
{*< Both clip types  }
type
  PEfl_Access_Text_Clip_Type = ^TEfl_Access_Text_Clip_Type;
  TEfl_Access_Text_Clip_Type =  Longint;
  Const
    EFL_ACCESS_TEXT_CLIP_TYPE_NONE = 0;
    EFL_ACCESS_TEXT_CLIP_TYPE_MIN = 1;
    EFL_ACCESS_TEXT_CLIP_TYPE_MAX = 2;
    EFL_ACCESS_TEXT_CLIP_TYPE_BOTH = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Text attribute
 *
 * @ingroup Efl_Access_Text_Attribute
  }
(* Const before type ignored *)
{*< Text attribute name  }
(* Const before type ignored *)
{*< Text attribute value  }
type
  PEfl_Access_Text_Attribute = ^TEfl_Access_Text_Attribute;
  TEfl_Access_Text_Attribute = record
      name : Pchar;
      value : Pchar;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Text range
 *
 * @ingroup Efl_Access_Text_Range
  }
{*< Range start offset  }
{*< Range end offset  }
(* Const before type ignored *)
{*< Range content  }
type
  PEfl_Access_Text_Range = ^TEfl_Access_Text_Range;
  TEfl_Access_Text_Range = record
      start_offset : longint;
      end_offset : longint;
      content : Pchar;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Text change information
 *
 * @ingroup Efl_Access_Text_Change_Info
  }
(* Const before type ignored *)
{*< Change content  }
{*< @c true if text got inserted  }
{*< Change position  }
{*< Change length  }
type
  PEfl_Access_Text_Change_Info = ^TEfl_Access_Text_Change_Info;
  TEfl_Access_Text_Change_Info = record
      content : Pchar;
      inserted : TEina_Bool;
      pos : Tsize_t;
      len : Tsize_t;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Elementary accessible text interface
 *
 * @ingroup Efl_Access_Text
  }

{ was #define dname def_expr }
function EFL_ACCESS_TEXT_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_access_text_interface_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Gets single character present in accessible widget's text at given
 * offset.
 *
 * @param[in] obj The object.
 * @param[in] offset Position in text.
 *
 * @return Character at offset. 0 when out-of bounds offset has been given.
 * Codepoints between DC80 and DCFF indicate that string includes invalid UTF8
 * chars.
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)
function efl_access_text_character_get(obj:PEo; offset:longint):TEina_Unicode;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Gets string, start and end offset in text according to given initial
 * offset and granularity.
 *
 * @param[in] obj The object.
 * @param[in] granularity Text granularity
 * @param[out] start_offset Offset indicating start of string according to
 * given granularity. -1 in case of error.
 * @param[out] end_offset Offset indicating end of string according to given
 * granularity. -1 in case of error.
 * @param[out] string Newly allocated UTF-8 encoded string. Must be free by a
 * user.
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

procedure efl_access_text_string_get(obj:PEo; granularity:TEfl_Access_Text_Granularity; start_offset:Plongint; end_offset:Plongint; _string:PPchar);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Gets text of accessible widget.
 *
 * @param[in] obj The object.
 * @param[in] start_offset Position in text.
 * @param[in] end_offset End offset of text.
 *
 * @return UTF-8 encoded text.
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

function efl_access_text_get(obj:PEo; start_offset:longint; end_offset:longint):Pchar;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Offset position of the caret (cursor).
 *
 * @param[in] obj The object.
 * @param[in] offset Offset
 *
 * @return @c true if caret was successfully moved, @c false otherwise.
 *
 * @ingroup Efl_Access_Text
  }

function efl_access_text_caret_offset_set(obj:PEo; offset:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Offset position of the caret (cursor).
 *
 * @param[in] obj The object.
 *
 * @return Offset
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

function efl_access_text_caret_offset_get(obj:PEo):longint;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Indicate if a text attribute with a given name is set
 *
 * @param[in] obj The object.
 * @param[in] name Text attribute name
 * @param[out] start_offset Position in text from which given attribute is set.
 * @param[out] end_offset Position in text to which given attribute is set.
 * @param[out] value Value of text attribute. Should be free()
 *
 * @return @c true if attribute name is set, @c false otherwise
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_access_text_attribute_get(obj:PEo; name:Pchar; start_offset:Plongint; end_offset:Plongint; value:PPchar):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Gets list of all text attributes.
 *
 * @param[in] obj The object.
 * @param[out] start_offset Start offset
 * @param[out] end_offset End offset
 * @param[out] attributes List of text attributes
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

procedure efl_access_text_attributes_get(obj:PEo; start_offset:Plongint; end_offset:Plongint; attributes:PPEina_List);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Default attributes
 *
 * @param[in] obj The object.
 *
 * @return List of default attributes
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

function efl_access_text_default_attributes_get(obj:PEo):PEina_List;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Character extents
 *
 * @param[in] obj The object.
 * @param[in] offset Offset
 * @param[in] screen_coords If @c true, x and y values will be relative to
 * screen origin, otherwise relative to canvas
 * @param[out] rect Extents rectangle
 *
 * @return @c true if character extents, @c false otherwise
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

function efl_access_text_character_extents_get(obj:PEo; offset:longint; screen_coords:TEina_Bool; rect:PEina_Rect):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Character count
 *
 * @param[in] obj The object.
 *
 * @return Character count
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

function efl_access_text_character_count_get(obj:PEo):longint;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Offset at given point
 *
 * @param[in] obj The object.
 * @param[in] screen_coords If @c true, x and y values will be relative to
 * screen origin, otherwise relative to canvas
 * @param[in] x X coordinate
 * @param[in] y Y coordinate
 *
 * @return Offset
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

function efl_access_text_offset_at_point_get(obj:PEo; screen_coords:TEina_Bool; x:longint; y:longint):longint;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Bounded ranges
 *
 * @param[in] obj The object.
 * @param[in] screen_coords If @c true, x and y values will be relative to
 * screen origin, otherwise relative to canvas
 * @param[in] rect Bounding box
 * @param[in] xclip xclip
 * @param[in] yclip yclip
 *
 * @return List of ranges
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

function efl_access_text_bounded_ranges_get(obj:PEo; screen_coords:TEina_Bool; rect:TEina_Rect; xclip:TEfl_Access_Text_Clip_Type; yclip:TEfl_Access_Text_Clip_Type):PEina_List;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Range extents
 *
 * @param[in] obj The object.
 * @param[in] screen_coords If @c true, x and y values will be relative to
 * screen origin, otherwise relative to canvas
 * @param[in] start_offset Start offset
 * @param[in] end_offset End offset
 * @param[out] rect Range rectangle
 *
 * @return @c true if range extents, @c false otherwise
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

function efl_access_text_range_extents_get(obj:PEo; screen_coords:TEina_Bool; start_offset:longint; end_offset:longint; rect:PEina_Rect):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Selection count property
 *
 * @param[in] obj The object.
 *
 * @return Selection counter
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

function efl_access_text_selections_count_get(obj:PEo):longint;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Selection property
 *
 * @param[in] obj The object.
 * @param[in] selection_number Selection number for identification
 * @param[in] start_offset Selection start offset
 * @param[in] end_offset Selection end offset
 *
 * @return @c true if selection was set, @c false otherwise
 *
 * @ingroup Efl_Access_Text
  }

function efl_access_text_access_selection_set(obj:PEo; selection_number:longint; start_offset:longint; end_offset:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Selection property
 *
 * @param[in] obj The object.
 * @param[in] selection_number Selection number for identification
 * @param[out] start_offset Selection start offset
 * @param[out] end_offset Selection end offset
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)

procedure efl_access_text_access_selection_get(obj:PEo; selection_number:longint; start_offset:Plongint; end_offset:Plongint);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Add selection
 *
 * @param[in] obj The object.
 * @param[in] start_offset Start selection from this offset
 * @param[in] end_offset End selection at this offset
 *
 * @return @c true if selection was added, @c false otherwise
 *
 * @ingroup Efl_Access_Text
  }

function efl_access_text_selection_add(obj:PEo; start_offset:longint; end_offset:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_TEXT_PROTECTED}
{*
 * @brief Remove selection
 *
 * @param[in] obj The object.
 * @param[in] selection_number Selection number to be removed
 *
 * @return @c true if selection was removed, @c false otherwise
 *
 * @ingroup Efl_Access_Text
  }

function efl_access_text_selection_remove(obj:PEo; selection_number:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
(* Const before type ignored *)
  var
    _EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_CARET_MOVED : TEfl_Event_Description;cvar;external;
{* Caret moved
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)
    _EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_INSERTED : TEfl_Event_Description;cvar;external;
{* Text was inserted
 * @return Efl_Access_Text_Change_Info
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)
    _EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_REMOVED : TEfl_Event_Description;cvar;external;
{* Text was removed
 * @return Efl_Access_Text_Change_Info
 *
 * @ingroup Efl_Access_Text
  }
(* Const before type ignored *)
    _EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_SELECTION_CHANGED : TEfl_Event_Description;cvar;external;
{* Text selection has changed
 *
 * @ingroup Efl_Access_Text
  }

{ was #define dname def_expr }
function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_CARET_MOVED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_INSERTED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_REMOVED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_SELECTION_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_ACCESS_TEXT_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_ACCESS_TEXT_INTERFACE:=efl_access_text_interface_get;
  end;

{ was #define dname def_expr }
function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_CARET_MOVED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_CARET_MOVED:=@(_EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_CARET_MOVED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_INSERTED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_INSERTED:=@(_EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_INSERTED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_REMOVED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_REMOVED:=@(_EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_REMOVED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_SELECTION_CHANGED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_SELECTION_CHANGED:=@(_EFL_ACCESS_TEXT_EVENT_ACCESS_TEXT_SELECTION_CHANGED);
  end;


end.
