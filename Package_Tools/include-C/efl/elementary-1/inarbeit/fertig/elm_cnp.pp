
unit elm_cnp;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_cnp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_cnp.h
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
PEina_List  = ^Eina_List;
PElm_Cnp_Event_Selection_Changed  = ^Elm_Cnp_Event_Selection_Changed;
PElm_Drag_Icon_Create_Cb  = ^Elm_Drag_Icon_Create_Cb;
PElm_Drag_User_Info  = ^Elm_Drag_User_Info;
PElm_Object_Item  = ^Elm_Object_Item;
PElm_Sel_Format  = ^Elm_Sel_Format;
PElm_Sel_Type  = ^Elm_Sel_Type;
PElm_Selection_Data  = ^Elm_Selection_Data;
PElm_Xdnd_Action  = ^Elm_Xdnd_Action;
PElm_Xy_Item_Get_Cb  = ^Elm_Xy_Item_Get_Cb;
PEvas_Coord  = ^Evas_Coord;
PEvas_Object  = ^Evas_Object;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup CopyPaste CopyPaste
 * @ingroup Elementary
 *
 * Copy and paste feature implementations.
 *
 * Implements the following functionality
 * a. select, copy/cut and paste
 * b. clipboard
 * c. drag and drop
 * in order to share data across application windows.
 *
 * Contains functions to select text or a portion of data,
 * send it to a buffer, and paste the data into a target.
 *
 * elm_cnp provides a generic copy and paste facility based on its windowing system.
 * It is not necessary to know the details of each windowing system,
 * but some terms and behavior are common.
 * Currently the X11 window system is widely used, and only X11 functionality is implemented.
 *
 * In X11R6 window system, CopyPaste works like a peer-to-peer communication.
 * Copying is an operation on an object in an X server.
 * X11 calls those objects 'selections' which have names.
 * Generally, two selection types are needed for copy and paste:
 * The Primary selection and the Clipboard selection.
 * Primary selection is for selecting text (that means highlighted text).
 * Clipboard selection is for explicit copying behavior
 * (such as ctrl+c, or 'copy' in a menu).
 * Thus, in applications most cases only use the clipboard selection.
 * As stated before, taking ownership of a selection doesn't move any actual data.
 * Copying and Pasting is described as follows:
 *  1. Copy text in Program A : Program A takes ownership of the selection
 *  2. Paste text in Program B : Program B notes that Program A owns the selection
 *  3. Program B asks A for the text
 *  4. Program A responds and sends the text to program B
 *  5. Program B pastes the response
 * More information is on
 *  - http://www.jwz.org/doc/x-cut-and-paste.html
 *  - X11R6 Inter-Client Communication Conventions Manual, section 2
 *
 * TODO: add for other window system.
 *
 * @
  }
{*
 * Event notifying that the selection has changed
 * @see Elm_Cnp_Event_Selection_Changed
 * @since 1.20
  }
  var
    ELM_CNP_EVENT_SELECTION_CHANGED : longint;cvar;external;
{*
 * Defines the types of selection property names.
 * @see http://www.x.org/docs/X11/xlib.pdf
 * for more details.
  }
{*< Primary text selection (highlighted or
                                      * selected text)  }
{*< Used when primary selection is in use  }
{*< Drag and Drop  }
{*< Clipboard selection (ctrl+C)  }
type
  PElm_Sel_Type = ^TElm_Sel_Type;
  TElm_Sel_Type =  Longint;
  Const
    ELM_SEL_TYPE_PRIMARY = 0;
    ELM_SEL_TYPE_SECONDARY = 1;
    ELM_SEL_TYPE_XDND = 2;
    ELM_SEL_TYPE_CLIPBOARD = 3;
;
{*
 * Defines the types of content.
  }
{ +1  }{*< For matching every
                                                  * possible atom  }
{*< Content is from outside of Elementary
                                      }
{*< Plain unformatted text: Used for things
                                     * that don't want rich markup  }
{*< Edje textblock markup, including
                                       * inline images  }
{*< Images  }
{*< Vcards  }
{*< Raw HTML-like data (eg. webkit)  }
{*< URI List for file DND @since 1.27  }
type
  PElm_Sel_Format = ^TElm_Sel_Format;
  TElm_Sel_Format =  Longint;
  Const
    ELM_SEL_FORMAT_TARGETS = -(1);
    ELM_SEL_FORMAT_NONE = 0;
    ELM_SEL_FORMAT_TEXT = 1;
    ELM_SEL_FORMAT_MARKUP = 2;
    ELM_SEL_FORMAT_IMAGE = 4;
    ELM_SEL_FORMAT_VCARD = 8;
    ELM_SEL_FORMAT_HTML = 16;
    ELM_SEL_FORMAT_URILIST = 32;
;
{*
 * Defines the kind of action associated with the drop data if for XDND
 * @since 1.8
  }
{*< Action type is unknown  }
{*< Copy the data  }
{*< Move the data  }
{*< Private action type  }
{*< Ask the user what to do  }
{*< List the data  }
{*< Link the data  }
{*< Describe the data  }
type
  PElm_Xdnd_Action = ^TElm_Xdnd_Action;
  TElm_Xdnd_Action =  Longint;
  Const
    ELM_XDND_ACTION_UNKNOWN = 0;
    ELM_XDND_ACTION_COPY = 1;
    ELM_XDND_ACTION_MOVE = 2;
    ELM_XDND_ACTION_PRIVATE = 3;
    ELM_XDND_ACTION_ASK = 4;
    ELM_XDND_ACTION_LIST = 5;
    ELM_XDND_ACTION_LINK = 6;
    ELM_XDND_ACTION_DESCRIPTION = 7;
;
{*
 * Structure holding the info about selected data.
  }
{*< The coordinates of the drop (DND operations only)  }
{*< The format of the selection  }
{*< The selection data, type determined by format member  }
{*< The length of the selection data  }
{*< The action to perform with the data @since 1.8  }
type
  PElm_Selection_Data = ^TElm_Selection_Data;
  TElm_Selection_Data = record
      x : TEvas_Coord;
      y : TEvas_Coord;
      format : TElm_Sel_Format;
      data : pointer;
      len : Tsize_t;
      action : TElm_Xdnd_Action;
    end;

{* Event to notify when a display server's selection has changed
 * Only sent for PRIMARY and CLIPBOARD selections
 * @since 1.20
  }
{*< The selection type  }
{*< The seat on which the selection changed, or @c NULL for "default"  }
{*< The display connection object, @c NULL under X11  }
{*< @c EINA_TRUE if the selection has an owner  }

  PElm_Cnp_Event_Selection_Changed = ^TElm_Cnp_Event_Selection_Changed;
  TElm_Cnp_Event_Selection_Changed = record
      _type : TElm_Sel_Type;
      seat_id : dword;
      display : pointer;
      exists : TEina_Bool;
    end;
{*
 * Callback invoked in when the selected data is 'dropped' at its destination.
 *
 * @param data Application specific data
 * @param obj The evas object where selected data is 'dropped'.
 * @param ev struct holding information about selected data
 * FIXME: this should probably be a smart callback
  }

  TElm_Drop_Cb = function (data:pointer; obj:PEvas_Object; ev:PElm_Selection_Data):TEina_Bool;cdecl;
{*
 * Callback invoked to find out what object is under (x,y) coords
 *
 * @param obj The container object
 * @param x cord to check
 * @param y cord to check
 * @param xposret Position relative to item (left (-1), middle (0), right (1)
 * @param yposret Position relative to item (upper (-1), middle (0), bottom (1)
 * @return object under x,y cords or NULL if not found.
  }

  PElm_Xy_Item_Get_Cb = ^TElm_Xy_Item_Get_Cb;
  TElm_Xy_Item_Get_Cb = function (obj:PEvas_Object; x:TEvas_Coord; y:TEvas_Coord; xposret:Plongint; yposret:Plongint):PElm_Object_Item;cdecl;
{*
 * Callback invoked in when the selection ownership for a given selection is lost.
 *
 * @param data Application specific data
 * @param selection The selection that is lost
 * @since 1.7
  }

  TElm_Selection_Loss_Cb = procedure (data:pointer; selection:TElm_Sel_Type);cdecl;
{*
 * Callback called to create a drag icon object
 *
 * @param data Application specific data
 * @param win The window to create the objects relative to
 * @param xoff A return coordinate for the X offset at which to place the drag icon object relative to the source drag object
 * @param yoff A return coordinate for the Y offset at which to place the drag icon object relative to the source drag object
 * @return An object to fill the drag window with or NULL if not needed
 * @since 1.8
  }

  PElm_Drag_Icon_Create_Cb = ^TElm_Drag_Icon_Create_Cb;
  TElm_Drag_Icon_Create_Cb = function (data:pointer; win:PEvas_Object; xoff:PEvas_Coord; yoff:PEvas_Coord):PEvas_Object;cdecl;
{*
 * Callback called when a drag is finished, enters, or leaves an object
 *
 * @param data Application specific data
 * @param obj The object where the drag started
 * @since 1.8
  }

  TElm_Drag_State = procedure (data:pointer; obj:PEvas_Object);cdecl;
{*
 * Callback called when a drag is finished.
 *
 * @param data Application specific data
 * @param obj The object where the drag started
 * @param accepted TRUE if the dropped data is accepted on drop
 * @since 1.8
  }

  TElm_Drag_Done = procedure (data:pointer; obj:PEvas_Object; accepted:TEina_Bool);cdecl;
{*
 * Callback called when a drag is responded to with an accept or deny
 *
 * @param data Application specific data
 * @param obj The object where the drag started
 * @param doaccept A boolean as to if the target accepts the drag or not
 * @since 1.8
  }

  TElm_Drag_Accept = procedure (data:pointer; obj:PEvas_Object; doaccept:TEina_Bool);cdecl;
{*
 * Callback called when a drag is over an object, and gives object-relative coordinates
 *
 * @param data Application specific data
 * @param obj The object where the drag started
 * @param x The X coordinate relative to the top-left of the object
 * @param y The Y coordinate relative to the top-left of the object
 * @since 1.8
  }

  TElm_Drag_Pos = procedure (data:pointer; obj:PEvas_Object; x:TEvas_Coord; y:TEvas_Coord; action:TElm_Xdnd_Action);cdecl;
{*
 * Callback called when a drag starts from an item container
 *
 * @param data Application specific data
 * @param obj The object where the drag started
 * @since 1.8
  }

  TElm_Drag_Start = procedure (data:pointer; obj:PEvas_Object);cdecl;
{*
 * @brief Set copy data for a widget.
 *
 * Set copy data and take ownership of selection. Format is used for specifying the selection type,
 * and this is used during pasting.
 *
 * @param selection Selection type for copying and pasting
 * @param obj The source widget pointer
 * @param format Selection format
 * @param buf The data selected
 * @param buflen The size of @p buf
 * @return If @c EINA_TRUE, setting data was successful.
 *
 * @ingroup CopyPaste
 *
  }
(* Const before type ignored *)

function elm_cnp_selection_set(obj:PEvas_Object; selection:TElm_Sel_Type; format:TElm_Sel_Format; buf:pointer; buflen:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @brief Get data from a widget that has a selection.
 *
 * Get the current selection data from a widget.
 * The widget input here will usually be elm_entry,
 * in which case @p datacb and @p udata can be NULL.
 * If a different widget is passed, @p datacb and @p udata are used for retrieving data.
 *
 * @see also elm_cnp_selection_set()
 *
 * @param selection Selection type for copying and pasting
 * @param format Selection format
 * @param obj The source widget
 * @param datacb The user data callback if the target widget isn't elm_entry
 * @param udata The user data pointer for @p datacb
 * @return If @c EINA_TRUE, getting selection data was successful.
 *
 * @ingroup CopyPaste
  }
(* Const before type ignored *)
function elm_cnp_selection_get(obj:PEvas_Object; selection:TElm_Sel_Type; format:TElm_Sel_Format; datacb:TElm_Drop_Cb; udata:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Clear the selection data of a widget.
 *
 * Clear all data from the selection which is owned by a widget.
 *
 * @see also elm_cnp_selection_set()
 *
 * @param obj The source widget
 * @param selection Selection type for copying and pasting
 * @return If @c EINA_TRUE, clearing data was successful.
 *
 * @ingroup CopyPaste
 *
  }
function elm_object_cnp_selection_clear(obj:PEvas_Object; selection:TElm_Sel_Type):TEina_Bool;cdecl;external;
{*
 * @brief Set a function to be called when a selection is lost
 *
 * The function @p func is set of be called when selection @p selection is lost
 * to another process or when elm_cnp_selection_set() is called. If @p func
 * is NULL then it is not called. @p data is passed as the data parameter to
 * the callback functions and selection is passed in as the selection that
 * has been lost.
 *
 * elm_cnp_selection_set() and elm_object_cnp_selection_clear() automatically
 * set this los callback to NULL when called. If you wish to take the selection
 * and then be notified of loss please do this (for example):
 *
 * @code
 * elm_cnp_selection_set(obj, ELM_SEL_TYPE_PRIMARY, ELM_SEL_FORMAT_TEXT, "hello", strlen(hello));
 * elm_cnp_selection_loss_callback_set(obj, ELM_SEL_TYPE_PRIMARY, loss_cb, NULL);
 * @endcode
 *
 * @see also elm_cnp_selection_set()
 *
 * @param obj The object to indicate the window target/display system.
 * @param selection Selection to be notified of for loss
 * @param func The function to call
 * @param data The data pointer passed to the function.
 *
 * @ingroup CopyPaste
 *
 * @since 1.7
  }
(* Const before type ignored *)
procedure elm_cnp_selection_loss_callback_set(obj:PEvas_Object; selection:TElm_Sel_Type; func:TElm_Selection_Loss_Cb; data:pointer);cdecl;external;
{*
 * @brief Determine whether the clipboard selection has an owner
 *
 * @param win The window object to check for
 * @return @c EINA_TRUE if the clipboard has a selection
 * @ingroup CopyPaste
 * @since 1.20
  }
function elm_cnp_clipboard_selection_has_owner(win:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set the given object as a target for drops for drag-and-drop
 *
 * @param obj The target object
 * @param format The formats supported for dropping
 * @param entercb The function to call when the object is entered with a drag
 * @param enterdata The application data to pass to enterdata
 * @param leavecb The function to call when the object is left with a drag
 * @param leavedata The application data to pass to leavedata
 * @param poscb The function to call when the object has a drag over it
 * @param posdata The application data to pass to posdata
 * @param dropcb The function to call when a drop has occurred
 * @param dropdata The application data to pass to dropcb
 * @return Returns @c EINA_TRUE, if successful, or @c EINA_FALSE if not.
 *
 * @ingroup CopyPaste
 *
 * @since 1.8
  }
function elm_drop_target_add(obj:PEvas_Object; format:TElm_Sel_Format; entercb:TElm_Drag_State; enterdata:pointer; leavecb:TElm_Drag_State; 
           leavedata:pointer; poscb:TElm_Drag_Pos; posdata:pointer; dropcb:TElm_Drop_Cb; dropdata:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the drop target status of an object
 *
 * @param obj The target object
 * @param format The formats supported for dropping
 * @param entercb The function to call when the object is entered with a drag
 * @param enterdata The application data to pass to enterdata
 * @param leavecb The function to call when the object is left with a drag
 * @param leavedata The application data to pass to leavedata
 * @param poscb The function to call when the object has a drag over it
 * @param posdata The application data to pass to posdata
 * @param dropcb The function to call when a drop has occurred
 * @param dropdata The application data to pass to dropcb
 * @return Returns @c EINA_TRUE, if successful, or @c EINA_FALSE if not.
 *
 * @ingroup CopyPaste
 *
 * @since 1.8
  }
function elm_drop_target_del(obj:PEvas_Object; format:TElm_Sel_Format; entercb:TElm_Drag_State; enterdata:pointer; leavecb:TElm_Drag_State; 
           leavedata:pointer; poscb:TElm_Drag_Pos; posdata:pointer; dropcb:TElm_Drop_Cb; dropdata:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Begins a drag given a source object
 *
 * @param obj The source object
 * @param format The drag formats supported by the data
 * @param data The drag data itself (a string)
 * @param action The drag action to be done
 * @param createicon Function to call to create a drag object, or NULL if not wanted
 * @param createdata Application data passed to @p createicon
 * @param dragpos Function called with each position of the drag, x, y being screen coordinates if possible, and action being the current action.
 * @param dragdata Application data passed to @p dragpos
 * @param acceptcb Function called indicating if drop target accepts (or does not) the drop data while dragging
 *
 * @param acceptdata Application data passed to @p acceptcb
 * @param dragdone Function to call when drag is done
 * @param donecbdata Application data to pass to @p dragdone
 * @return Returns @c EINA_TRUE, if successful, or @c EINA_FALSE if not.
 *
 * @ingroup CopyPaste
 *
 * @since 1.8
  }
(* Const before type ignored *)
function elm_drag_start(obj:PEvas_Object; format:TElm_Sel_Format; data:Pchar; action:TElm_Xdnd_Action; createicon:TElm_Drag_Icon_Create_Cb; 
           createdata:pointer; dragpos:TElm_Drag_Pos; dragdata:pointer; acceptcb:TElm_Drag_Accept; acceptdata:pointer; 
           dragdone:TElm_Drag_State; donecbdata:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Cancels the current drag operation
 *
 * It can only be initiated from the source window.
 *
 * @param obj The source of the current drag.
 * @return Returns @c EINA_TRUE, if successful, or @c EINA_FALSE if not.
 *
 * @ingroup CopyPaste
 *
 * @since 1.9
  }
function elm_drag_cancel(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Changes the current drag action
 *
 * @param obj The source of a drag if a drag is underway
 * @param action The drag action to be done
 * @return Returns @c EINA_TRUE, if successful, or @c EINA_FALSE if not.
 *
 * @ingroup CopyPaste
 *
 * @since 1.8
  }
function elm_drag_action_set(obj:PEvas_Object; action:TElm_Xdnd_Action):TEina_Bool;cdecl;external;
{*
 * Callback called when a drag is over an object
 *
 * @param data Application specific data
 * @param cont The container object where the drag started
 * @param it The object item in container where mouse-over
 * @param x The X coordinate relative to the top-left of the object
 * @param y The Y coordinate relative to the top-left of the object
 * @param xposret Position relative to item (left (-1), middle (0), right (1)
 * @param yposret Position relative to item (upper (-1), middle (0), bottom (1)
 * @param action The drag action to be done
 * @since 1.8
  }
type

  TElm_Drag_Item_Container_Pos = procedure (data:pointer; cont:PEvas_Object; it:PElm_Object_Item; x:TEvas_Coord; y:TEvas_Coord; 
                xposret:longint; yposret:longint; action:TElm_Xdnd_Action);cdecl;
{*
 * Callback invoked in when the selected data is 'dropped' on container.
 *
 * @param data Application specific data
 * @param obj The evas object where selected data is 'dropped'.
 * @param it The item in container where drop-cords
 * @param ev struct holding information about selected data
 * @param xposret Position relative to item (left (-1), middle (0), right (1)
 * @param yposret Position relative to item (upper (-1), middle (0), bottom (1)
  }

  TElm_Drop_Item_Container_Cb = function (data:pointer; obj:PEvas_Object; it:PElm_Object_Item; ev:PElm_Selection_Data; xposret:longint; 
               yposret:longint):TEina_Bool;cdecl;
{*
 * Structure describing user information for the drag process.
 *
 * @param format The drag formats supported by the data (output)
 * @param data The drag data itself (a string) (output)
 * @param icons if value not NULL, play default anim (output)
 * @param action The drag action to be done (output)
 * @param createicon Function to call to create a drag object, or NULL if not wanted (output)
 * @param createdata Application data passed to @p createicon (output)
 * @param dragpos Function called with each position of the drag, x, y being screen coordinates if possible, and action being the current action. (output)
 * @param dragdata Application data passed to @p dragpos (output)
 * @param acceptcb Function called indicating if drop target accepts (or does not) the drop data while dragging (output)
 * @param acceptdata Application data passed to @p acceptcb (output)
 * @param dragdone Function to call when drag is done (output)
 * @param donecbdata Application data to pass to @p dragdone (output)
  }
(* Const before type ignored *)
  PElm_Drag_User_Info = ^TElm_Drag_User_Info;
  TElm_Drag_User_Info = record
      format : TElm_Sel_Format;cdecl;
      data : Pchar;
      icons : PEina_List;
      action : TElm_Xdnd_Action;
      createicon : TElm_Drag_Icon_Create_Cb;
      createdata : pointer;
      dragstart : TElm_Drag_Start;
      startcbdata : pointer;
      dragpos : TElm_Drag_Pos;
      dragdata : pointer;
      acceptcb : TElm_Drag_Accept;
      acceptdata : pointer;
      dragdone : TElm_Drag_Done;
      donecbdata : pointer;
    end;

{*
 * Callback invoked when starting to drag for a container.
 *
 * @param obj The container object
 * @param it The Elm_Object_Item pointer where drag-start
 * @return Returns @c EINA_TRUE, if successful, or @c EINA_FALSE if not.
  }

  TElm_Item_Container_Data_Get_Cb = function (obj:PEvas_Object; it:PElm_Object_Item; info:PElm_Drag_User_Info):TEina_Bool;cdecl;
{*
 * @brief Set a item container (list, genlist, grid) as source of drag
 *
 * @param obj The container object.
 * @param tm_to_anim Time period to wait before start animation.
 * @param tm_to_drag Time period to wait before start dragging.
 * @param itemgetcb Callback to get Evas_Object pointer for item at (x,y)
 * @param data_get  Callback to get drag info
 * @return Returns @c EINA_TRUE, if successful, or @c EINA_FALSE if not.
 *
 * @ingroup CopyPaste
 *
 * @since 1.8
  }

function elm_drag_item_container_add(obj:PEvas_Object; tm_to_anim:Tdouble; tm_to_drag:Tdouble; itemgetcb:TElm_Xy_Item_Get_Cb; data_get:TElm_Item_Container_Data_Get_Cb):TEina_Bool;cdecl;external;
{*
 * @brief Deletes a item container from drag-source list
 *
 * @param obj The target object
 * @return Returns @c EINA_TRUE, if successful, or @c EINA_FALSE if not.
 *
 * @ingroup CopyPaste
 *
 * @since 1.8
  }
function elm_drag_item_container_del(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set a item container (list, genlist, grid) as target for drop.
 *
 * @param obj The container object.
 * @param format The formats supported for dropping
 * @param itemgetcb Callback to get Evas_Object pointer for item at (x,y)
 * @param entercb The function to call when the object is entered with a drag
 * @param enterdata The application data to pass to enterdata
 * @param leavecb The function to call when the object is left with a drag
 * @param leavedata The application data to pass to leavedata
 * @param poscb The function to call when the object has a drag over it
 * @param posdata The application data to pass to posdata
 * @param dropcb The function to call when a drop has occurred
 * @param dropdata The application data to pass to dropcb
 * @return Returns @c EINA_TRUE, if successful, or @c EINA_FALSE if not.
 *
 * @ingroup CopyPaste
 *
 * @since 1.8
  }
function elm_drop_item_container_add(obj:PEvas_Object; format:TElm_Sel_Format; itemgetcb:TElm_Xy_Item_Get_Cb; entercb:TElm_Drag_State; enterdata:pointer; 
           leavecb:TElm_Drag_State; leavedata:pointer; poscb:TElm_Drag_Item_Container_Pos; posdata:pointer; dropcb:TElm_Drop_Item_Container_Cb; 
           dropdata:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Removes a container from list of drop targets.
 *
 * @param obj The container object
 * @return Returns EINA_TRUE, if successful, or @c EINA_FALSE if not.
 *
 * @ingroup CopyPaste
 *
 * @since 1.8
  }
function elm_drop_item_container_del(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @
  }

implementation


end.
