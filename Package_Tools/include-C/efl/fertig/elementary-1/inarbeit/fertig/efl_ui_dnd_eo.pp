
unit efl_ui_dnd_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_dnd_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_dnd_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Content  = ^Efl_Content;
PEfl_Ui_Dnd  = ^Efl_Ui_Dnd;
PEfl_Ui_Drag_Finished_Event  = ^Efl_Ui_Drag_Finished_Event;
PEfl_Ui_Drag_Started_Event  = ^Efl_Ui_Drag_Started_Event;
PEfl_Ui_Drop_Dropped_Event  = ^Efl_Ui_Drop_Dropped_Event;
PEfl_Ui_Drop_Event  = ^Efl_Ui_Drop_Event;
PEina_Accessor  = ^Eina_Accessor;
PEina_Content  = ^Eina_Content;
PEina_Future  = ^Eina_Future;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_DND_EO_H_}
{$define _EFL_UI_DND_EO_H_}
{$ifndef _EFL_UI_DND_EO_CLASS_TYPE}
{$define _EFL_UI_DND_EO_CLASS_TYPE}
type
  PEfl_Ui_Dnd = ^TEfl_Ui_Dnd;
  TEfl_Ui_Dnd = TEo;
{$endif}
{$ifndef _EFL_UI_DND_EO_TYPES}
{$define _EFL_UI_DND_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Information sent along with Drag & Drop events.
 *
 * @ingroup Efl_Ui_Drop_Event
  }
{*< The position where the drop event occurred, in
                             * window coordinates.  }
{*< Which seat triggered the event.  }
{*<
                                   * @brief Types with automatic conversion
                                   * available. Use one of them in the call to
                                   * @ref efl_ui_dnd_drop_data_get.
                                   *
                                   * Types are IANA MIME types:
                                   * https://www.iana.org/assignments/media-types/media-types.xhtml
                                    }
type
  PEfl_Ui_Drop_Event = ^TEfl_Ui_Drop_Event;
  TEfl_Ui_Drop_Event = record
      position : TEina_Position2D;
      seat : dword;
      available_types : PEina_Accessor;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Information sent along with Drop events.
 *
 * @ingroup Efl_Ui_Drop_Dropped_Event
  }
{*< Common information.  }
(* Const before type ignored *)
{*< Requested action to perform upon reception of this
                       * data.  }
type
  PEfl_Ui_Drop_Dropped_Event = ^TEfl_Ui_Drop_Dropped_Event;
  TEfl_Ui_Drop_Dropped_Event = record
      dnd : TEfl_Ui_Drop_Event;
      action : Pchar;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Information sent along with @ref Efl_Ui_Drag_Started_Event events.
 *
 * @ingroup Efl_Ui_Drag_Started_Event
  }
{*< Which seat triggered the event.  }
type
  PEfl_Ui_Drag_Started_Event = ^TEfl_Ui_Drag_Started_Event;
  TEfl_Ui_Drag_Started_Event = record
      seat : dword;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Information sent along with @ref Efl_Ui_Drag_Finished_Event events.
 *
 * @ingroup Efl_Ui_Drag_Finished_Event
  }
{*< Which seat triggered the event.  }
{*< @c true if the operation completed with a Drop, or
                       * @c false if it was cancelled.  }
type
  PEfl_Ui_Drag_Finished_Event = ^TEfl_Ui_Drag_Finished_Event;
  TEfl_Ui_Drag_Finished_Event = record
      seat : dword;
      accepted : TEina_Bool;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief This mixin provides the ability to interact with the system's Drag &
 * Drop facilities.
 *
 * Applications starting a Drag & Drop operation operation are said to perform
 * a "Drag" and use the methods prefixed "drag_". On the other hand,
 * applications receiving dragged content are said to perform a "Drop"
 * operation and use the methods prefixed "drop_".
 *
 * @ingroup Efl_Ui_Dnd
  }

{ was #define dname def_expr }
function EFL_UI_DND_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_dnd_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief Starts a drag from this client.
 *
 * @[Efl.Ui.Dnd.drag,started] is emitted each time a successful drag is
 * started. @[Efl.Ui.Dnd.drag,finished] is emitted every time a drag is
 * finished.
 *
 * @param[in] obj The object.
 * @param[in] content The content being dragged.
 * @param[in] action Requested action to perform by the receiver once content
 * is transferred.
 * @param[in] seat Seat starting the drag operation. When in doubt use 0.
 *
 * @return An Efl.Ui element which you can use to render a visual
 * representation of the content being dragged (like a thumbnail, for example).
 * Use @ref efl_content_set on it to do so.
 *
 * @ingroup Efl_Ui_Dnd
  }
(* Const before type ignored *)
function efl_ui_dnd_drag_start(obj:PEo; content:PEina_Content; action:Pchar; seat:dword):PEfl_Content;cdecl;external;
{*
 * @brief Set the offset during a drag that was initiated through drag_start
 *
 * @param[in] obj The object.
 * @param[in] seat Seat setting the offset on.
 * @param[in] offset The offset for which the window will be shifted. The upper
 * left of the window is calculated by adding this offset to the cursor
 * position
 *
 * @ingroup Efl_Ui_Dnd
  }
procedure efl_ui_dnd_drag_offset_set(obj:PEo; seat:dword; offset:TEina_Size2D);cdecl;external;
{*
 * @brief Cancels an on-going drag operation.
 *
 * @param[in] obj The object.
 * @param[in] seat Seat that started the drag operation. When in doubt use 0.
 *
 * @ingroup Efl_Ui_Dnd
  }
procedure efl_ui_dnd_drag_cancel(obj:PEo; seat:dword);cdecl;external;
{*
 * @brief Retrieves the dropped data.
 *
 * @param[in] obj The object.
 * @param[in] seat Seat that started the drag operation. When in doubt use 0.
 * @param[in] acceptable_types List of strings describing the type of content
 * the application can accept. Types are IANA MIME types:
 * https://www.iana.org/assignments/media-types/media-types.xhtml.
 *
 * @return This future is fulfilled when the content is received
 * (asynchronously) and ready to use. The Eina.Content specifies the type of
 * the data. If no matching type was found it returns an error.
 *
 * @ingroup Efl_Ui_Dnd
  }
function efl_ui_dnd_drop_data_get(obj:PEo; seat:dword; acceptable_types:PEina_Iterator):PEina_Future;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_DND_EVENT_DROP_ENTERED : TEfl_Event_Description;cvar;external;
{* Dragged content entered the window. Its type can already be checked with
 * @ref efl_ui_dnd_drop_data_get to react before it is dropped, for example.
 * @return Efl_Ui_Drop_Event
 *
 * @ingroup Efl_Ui_Dnd
  }
(* Const before type ignored *)
    _EFL_UI_DND_EVENT_DROP_LEFT : TEfl_Event_Description;cvar;external;
{* Dragged content left the window.
 * @return Efl_Ui_Drop_Event
 *
 * @ingroup Efl_Ui_Dnd
  }
(* Const before type ignored *)
    _EFL_UI_DND_EVENT_DROP_POSITION_CHANGED : TEfl_Event_Description;cvar;external;
{* Dragged content moved over the window. Its type can already be checked with
 * @ref efl_ui_dnd_drop_data_get to react before it is dropped, for example.
 * @return Efl_Ui_Drop_Event
 *
 * @ingroup Efl_Ui_Dnd
  }
(* Const before type ignored *)
    _EFL_UI_DND_EVENT_DROP_DROPPED : TEfl_Event_Description;cvar;external;
{* Dragged content was dropped over the window.
 * @return Efl_Ui_Drop_Dropped_Event
 *
 * @ingroup Efl_Ui_Dnd
  }
(* Const before type ignored *)
    _EFL_UI_DND_EVENT_DRAG_STARTED : TEfl_Event_Description;cvar;external;
{* A Drag operation started.
 * @return Efl_Ui_Drag_Started_Event
 *
 * @ingroup Efl_Ui_Dnd
  }
(* Const before type ignored *)
    _EFL_UI_DND_EVENT_DRAG_FINISHED : TEfl_Event_Description;cvar;external;
{* A Drag operation finished.
 * @return Efl_Ui_Drag_Finished_Event
 *
 * @ingroup Efl_Ui_Dnd
  }

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DROP_ENTERED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DROP_LEFT : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DROP_POSITION_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DROP_DROPPED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DRAG_STARTED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DRAG_FINISHED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_DND_MIXIN : longint; { return type might be wrong }
  begin
    EFL_UI_DND_MIXIN:=efl_ui_dnd_mixin_get;
  end;

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DROP_ENTERED : longint; { return type might be wrong }
  begin
    EFL_UI_DND_EVENT_DROP_ENTERED:=@(_EFL_UI_DND_EVENT_DROP_ENTERED);
  end;

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DROP_LEFT : longint; { return type might be wrong }
  begin
    EFL_UI_DND_EVENT_DROP_LEFT:=@(_EFL_UI_DND_EVENT_DROP_LEFT);
  end;

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DROP_POSITION_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_DND_EVENT_DROP_POSITION_CHANGED:=@(_EFL_UI_DND_EVENT_DROP_POSITION_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DROP_DROPPED : longint; { return type might be wrong }
  begin
    EFL_UI_DND_EVENT_DROP_DROPPED:=@(_EFL_UI_DND_EVENT_DROP_DROPPED);
  end;

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DRAG_STARTED : longint; { return type might be wrong }
  begin
    EFL_UI_DND_EVENT_DRAG_STARTED:=@(_EFL_UI_DND_EVENT_DRAG_STARTED);
  end;

{ was #define dname def_expr }
function EFL_UI_DND_EVENT_DRAG_FINISHED : longint; { return type might be wrong }
  begin
    EFL_UI_DND_EVENT_DRAG_FINISHED:=@(_EFL_UI_DND_EVENT_DRAG_FINISHED);
  end;


end.
