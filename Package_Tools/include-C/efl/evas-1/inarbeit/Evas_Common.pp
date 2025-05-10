
unit Evas_Common;
interface

{
  Automatically converted by H2Pas 1.0.0 from Evas_Common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Evas_Common.h
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
Pdword  = ^dword;
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEfl_Input_Device  = ^Efl_Input_Device;
PEfl_Input_Device_Type  = ^Efl_Input_Device_Type;
PEfl_VG  = ^Efl_VG;
PEina_List  = ^Eina_List;
PEvas  = ^Evas;
PEvas_Alloc_Error  = ^Evas_Alloc_Error;
PEvas_Angle  = ^Evas_Angle;
PEvas_Aspect_Control  = ^Evas_Aspect_Control;
PEvas_BiDi_Direction  = ^Evas_BiDi_Direction;
PEvas_Button_Flags  = ^Evas_Button_Flags;
PEvas_Callback_Priority  = ^Evas_Callback_Priority;
PEvas_Callback_Type  = ^Evas_Callback_Type;
PEvas_Coord  = ^Evas_Coord;
PEvas_Coord_Point  = ^Evas_Coord_Point;
PEvas_Coord_Precision_Point  = ^Evas_Coord_Precision_Point;
PEvas_Coord_Precision_Size  = ^Evas_Coord_Precision_Size;
PEvas_Coord_Rectangle  = ^Evas_Coord_Rectangle;
PEvas_Coord_Size  = ^Evas_Coord_Size;
PEvas_Cserve_Config  = ^Evas_Cserve_Config;
PEvas_Cserve_Image  = ^Evas_Cserve_Image;
PEvas_Cserve_Image_Cache  = ^Evas_Cserve_Image_Cache;
PEvas_Cserve_Stats  = ^Evas_Cserve_Stats;
PEvas_Device  = ^Evas_Device;
PEvas_Device_Class  = ^Evas_Device_Class;
PEvas_Device_Subclass  = ^Evas_Device_Subclass;
PEvas_Engine_Render_Mode  = ^Evas_Engine_Render_Mode;
PEvas_Event_Flags  = ^Evas_Event_Flags;
PEvas_Event_Render_Post  = ^Evas_Event_Render_Post;
PEvas_Font_Data_Cache  = ^Evas_Font_Data_Cache;
PEvas_Font_Size  = ^Evas_Font_Size;
PEvas_Image_Content_Hint  = ^Evas_Image_Content_Hint;
PEvas_Object  = ^Evas_Object;
PEvas_Object_Box_Api  = ^Evas_Object_Box_Api;
PEvas_Object_Box_Data  = ^Evas_Object_Box_Data;
PEvas_Object_Box_Option  = ^Evas_Object_Box_Option;
PEvas_Object_Pointer_Mode  = ^Evas_Object_Pointer_Mode;
PEvas_Object_Smart_Clipped_Data  = ^Evas_Object_Smart_Clipped_Data;
PEvas_Performance  = ^Evas_Performance;
PEvas_Pixel_Import_Pixel_Format  = ^Evas_Pixel_Import_Pixel_Format;
PEvas_Pixel_Import_Source  = ^Evas_Pixel_Import_Source;
PEvas_Point  = ^Evas_Point;
PEvas_Position  = ^Evas_Position;
PEvas_Precision_Position  = ^Evas_Precision_Position;
PEvas_Smart  = ^Evas_Smart;
PEvas_Smart_Cb_Description  = ^Evas_Smart_Cb_Description;
PEvas_Smart_Class  = ^Evas_Smart_Class;
PEvas_Smart_Interface  = ^Evas_Smart_Interface;
PEvas_Textgrid_Cell  = ^Evas_Textgrid_Cell;
PEvas_Version  = ^Evas_Version;
Plongint  = ^longint;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_H}
{$error You shall not include this header directly}
{$endif}
{*
 * @def EVAS_VERSION_MAJOR
 * The major number of evas version
  }

const
  EVAS_VERSION_MAJOR = EFL_VERSION_MAJOR;  
{*
 * @def EVAS_VERSION_MINOR
 * The minor number of evas version
  }
  EVAS_VERSION_MINOR = EFL_VERSION_MINOR;  
{*
 * @typedef Evas_Version
 *
 * This is the Evas version information structure that can be used at
 * runtime to detect which version of evas is being used and adapt
 * appropriately as follows for example:
 *
 * @code
 * #if defined(EVAS_VERSION_MAJOR) && (EVAS_VERSION_MAJOR >= 1) && defined(EVAS_VERSION_MINOR) && (EVAS_VERSION_MINOR > 0)
 * printf("Evas version: %i.%i.%i\n",
 *        evas_version->major,
 *        evas_version->minor,
 *        evas_version->micro);
 * if (evas_version->revision > 0)
 *   
 *     printf("  Built from Git revision # %i\n", evas_version->revision);
 *   
 * #endif
 * @endcode
 *
  }
{*< major (binary or source incompatible changes)  }
{*< minor (new features, bugfixes, major improvements version)  }
{*< micro (bugfix, internal improvements, no new features version)  }
{*< git revision (0 if a proper release or the git revision number Evas is built from)  }
type
  PEvas_Version = ^TEvas_Version;
  TEvas_Version = record
      major : longint;
      minor : longint;
      micro : longint;
      revision : longint;
    end;
{*
 * Evas Version Information
 * @ingroup Evas_Main_Group
  }
  var
    evas_version : PEvas_Version;cvar;external;
{*
 * @file
 * @brief These routines are used for Evas library interaction.
 *
 * @todo check boolean return values and convert to Eina_Bool
 * @todo change all api to use EINA_SAFETY_*
 * @todo finish api documentation
  }
{*
 * @def EVAS_CALLBACK_PRIORITY_BEFORE
 * Slightly more prioritized than default.
 * @since 1.1
  }

const
  EVAS_CALLBACK_PRIORITY_BEFORE = -(100);  
{*
 * @def EVAS_CALLBACK_PRIORITY_DEFAULT
 * Default callback priority level
 * @since 1.1
  }
  EVAS_CALLBACK_PRIORITY_DEFAULT = 0;  
{*
 * @def EVAS_CALLBACK_PRIORITY_AFTER
 * Slightly less prioritized than default.
 * @since 1.1
  }
  EVAS_CALLBACK_PRIORITY_AFTER = 100;  
{*
 * @typedef Evas_Callback_Priority
 *
 * Callback priority value. Range is -32k - 32k. The lower the number, the
 * bigger the priority.
 *
 * @see EVAS_CALLBACK_PRIORITY_AFTER
 * @see EVAS_CALLBACK_PRIORITY_BEFORE
 * @see EVAS_CALLBACK_PRIORITY_DEFAULT
 *
 * @since 1.1
  }
{ Support not having eo available }
{$ifdef EFL_BETA_API_SUPPORT}
type
  PEvas_Callback_Priority = ^TEvas_Callback_Priority;
  TEvas_Callback_Priority = TEfl_Callback_Priority;
{$else}
type
  PEvas_Callback_Priority = ^TEvas_Callback_Priority;
  TEvas_Callback_Priority = smallint;
{$endif}
{ TODO: Mark as /*xxxxxxxxxx    EINA_DEPRECATED*/ }
type
{*< A generic rectangle handle. @deprecated Use Eina_Rectangle instead  }
{*< integer point  }
{*< Evas_Coord point  }
{*< Evas_Coord point with sub-pixel precision  }
{*< Evas_Coord size @since 1.8  }
{*< Evas_Coord size with sub-pixel precision @since 1.8  }
{*< associates given point in Canvas and Output  }
{*< associates given point in Canvas and Output, with sub-pixel precision  }

  PEvas_Coord = ^TEvas_Coord;
  TEvas_Coord = longint;
{*< Type used for coordinates (in pixels, int).  }

  PEvas_Font_Size = ^TEvas_Font_Size;
  TEvas_Font_Size = longint;
{*< Type used for font sizes (int).  }
{*
 * @typedef Evas_Smart_Class
 *
 * A smart object's @b base class definition
 *
 * @ingroup Evas_Smart_Group
  }
{*
 * @typedef Evas_Smart_Interface
 *
 * A smart object's @b base interface definition
 *
 * An Evas interface is exactly like the OO-concept: a 'contract' or
 * API a given object is declared to support. A smart object may have
 * more than one interface, thus extending the behavior it gets from
 * sub-classing.
 *
 * @since 1.7
 *
 * @ingroup Evas_Smart_Group
  }
{*
 * @typedef Evas_Smart_Cb_Description
 *
 * A smart object callback description, used to provide introspection
 *
 * @ingroup Evas_Smart_Group
  }
{*
 * @typedef Evas
 *
 * An opaque handle to an Evas canvas.
 *
 * @see evas_new()
 * @see evas_free()
 *
 * @ingroup Evas_Canvas
  }

  PEvas = ^TEvas;
  TEvas = TEo;
{*
 * @typedef Evas_Public_Data
 * Public data for an Evas.
 * @ingroup Evas_Canvas
  }
{*
 * @typedef Efl_Canvas_Object
 * An Evas Object handle
 * @see Evas_Object
 * @ingroup Evas_Object_Group
  }

  PEfl_Canvas_Object = ^TEfl_Canvas_Object;
  TEfl_Canvas_Object = TEo;
{*
 * @typedef Evas_Object
 * An Evas Object handle.
 * @ingroup Evas_Object_Group
  }

  PEvas_Object = ^TEvas_Object;
  TEvas_Object = TEfl_Canvas_Object;
{ These defines are used in H files generated by Eolian to avoid
 * redefinition of types  }
{$define _EFL_CANVAS_OBJECT_EO_CLASS_TYPE}
{*
 * Type of abstract VG node
  }

  PEfl_VG = ^TEfl_VG;
  TEfl_VG = TEo;

  PEvas_Performance = ^TEvas_Performance;
  TEvas_Performance = pointer;
{*< An Evas Performance handle  }
{*< An Evas Smart Object handle  }

  PEvas_Angle = ^TEvas_Angle;
  TEvas_Angle = longint;
{*< A type for angle  }
{ FIXME: This can be a simple alias to Eina_Rectangle instead. }
{* A rectangle in Evas_Coord  }
{*< top-left x co-ordinate of rectangle  }
{*< top-left y co-ordinate of rectangle  }
{*< width of rectangle  }
{*< height of rectangle  }
  PEvas_Coord_Rectangle = ^TEvas_Coord_Rectangle;
  TEvas_Coord_Rectangle = record
      x : TEvas_Coord;
      y : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
    end;

{* A Point in Evas_Coord  }
{*< x co-ordinate  }
{*< y co-ordinate  }
  PEvas_Coord_Point = ^TEvas_Coord_Point;
  TEvas_Coord_Point = record
      x : TEvas_Coord;
      y : TEvas_Coord;
    end;

{* A size in Evas_Coord  }
{*< width  }
{*< height  }
  PEvas_Coord_Size = ^TEvas_Coord_Size;
  TEvas_Coord_Size = record
      w : TEvas_Coord;
      h : TEvas_Coord;
    end;

{* A size in Evas_Coord with subpixel precision }
{*< width  }
{*< height  }
{*< subpixel precision for width  }
{*< subpixel precision for height  }
  PEvas_Coord_Precision_Size = ^TEvas_Coord_Precision_Size;
  TEvas_Coord_Precision_Size = record
      w : TEvas_Coord;
      h : TEvas_Coord;
      wsub : Tdouble;
      ysub : Tdouble;
    end;

{* A point in Evas_Coord with subpixel precision }
{*< x co-ordinate  }
{*< y co-ordinate  }
{*< subpixel precision for x  }
{*< subpixel precision for y  }
  PEvas_Coord_Precision_Point = ^TEvas_Coord_Precision_Point;
  TEvas_Coord_Precision_Point = record
      x : TEvas_Coord;
      y : TEvas_Coord;
      xsub : Tdouble;
      ysub : Tdouble;
    end;

{* A point  }
{*< x co-ordinate  }
{*< y co-ordinate  }
  PEvas_Point = ^TEvas_Point;
  TEvas_Point = record
      x : longint;
      y : longint;
    end;

{* A position  }
{*< position on the output  }
{*< position on the canvas  }
  PEvas_Position = ^TEvas_Position;
  TEvas_Position = record
      output : TEvas_Point;
      canvas : TEvas_Coord_Point;
    end;

{* A position with precision }
{*< position on the output  }
{*< position on the canvas  }
  PEvas_Precision_Position = ^TEvas_Precision_Position;
  TEvas_Precision_Position = record
      output : TEvas_Point;
      canvas : TEvas_Coord_Precision_Point;
    end;

{*< A source description of pixels for importing pixels  }
{ Opaque types  }

  PEvas_Device = ^TEvas_Device;
  TEvas_Device = TEo;
{*< A source device handle - where the event came from  }
{*< No hint at all  }
{*< The contents will change over time  }
{*< The contents won't change over time  }

  PEvas_Image_Content_Hint = ^TEvas_Image_Content_Hint;
  TEvas_Image_Content_Hint =  Longint;
  Const
    EVAS_IMAGE_CONTENT_HINT_NONE = 0;
    EVAS_IMAGE_CONTENT_HINT_DYNAMIC = 1;
    EVAS_IMAGE_CONTENT_HINT_STATIC = 2;
;
{*< How an image's data is to be treated by Evas, for optimization  }
{*< No allocation error  }
{*< Allocation failed despite attempts to free up memory  }
{*< Allocation succeeded after freeing up speculative resource memory  }
type
  PEvas_Alloc_Error = ^TEvas_Alloc_Error;
  TEvas_Alloc_Error =  Longint;
  Const
    EVAS_ALLOC_ERROR_NONE = 0;
    EVAS_ALLOC_ERROR_FATAL = 1;
    EVAS_ALLOC_ERROR_RECOVERED = 2;
;
{*< Possible allocation errors returned by evas_alloc_error()  }
{*< No pixel format  }
{*< ARGB 32bit pixel format with A in the high byte per 32bit pixel word  }
{*< YUV 420 Planar format with CCIR 601 color encoding with contiguous planes in the order Y, U and V  }
type
  PEvas_Pixel_Import_Pixel_Format = ^TEvas_Pixel_Import_Pixel_Format;
  TEvas_Pixel_Import_Pixel_Format =  Longint;
  Const
    EVAS_PIXEL_FORMAT_NONE = 0;
    EVAS_PIXEL_FORMAT_ARGB32 = 1;
    EVAS_PIXEL_FORMAT_YUV420P_601 = 2;
;
{*< Pixel format for import call. See evas_object_image_pixels_import()  }
{*< pixel format type ie ARGB32, YUV420P_601 etc.  }
{*< width and height of source in pixels  }
{*< an array of pointers (size depends on format) pointing to left edge of each scanline  }
type
  PEvas_Pixel_Import_Source = ^TEvas_Pixel_Import_Source;
  TEvas_Pixel_Import_Source = record
      format : TEvas_Pixel_Import_Pixel_Format;
      w : longint;
      h : longint;
      rows : ^pointer;
    end;

{*< bottom-most layer number  }

const
  EVAS_LAYER_MIN = -(32768);  
{*< top-most layer number  }
  EVAS_LAYER_MAX = 32767;  
{*< Not used for anything  }
  EVAS_COLOR_SPACE_ARGB = 0;  
{*< Not used for anything  }
  EVAS_COLOR_SPACE_AHSV = 1;  
{*< Not used for anything  }
  EVAS_TEXT_INVALID = -(1);  
{*< Not used for anything  }
  EVAS_TEXT_SPECIAL = -(2);  
{*< Use with evas_object_size_hint_weight_set(), evas_object_size_hint_weight_get(), evas_object_size_hint_expand_set(), evas_object_size_hint_expand_get()  }
  EVAS_HINT_EXPAND = 1.0;  
{*< Use with evas_object_size_hint_align_set(), evas_object_size_hint_align_get(), evas_object_size_hint_fill_set(), evas_object_size_hint_fill_get()  }
  EVAS_HINT_FILL = -(1.0);  
{*< Convenience macro to make it easier to understand that align is also used for fill properties (as fill is mutually exclusive to align)  }
  evas_object_size_hint_fill_set = evas_object_size_hint_align_set;  
{*< Convenience macro to make it easier to understand that align is also used for fill properties (as fill is mutually exclusive to align)  }
  evas_object_size_hint_fill_get = evas_object_size_hint_align_get;  
{*< Convenience macro to make it easier to understand that weight is also used for expand properties  }
  evas_object_size_hint_expand_set = evas_object_size_hint_weight_set;  
{*< Convenience macro to make it easier to understand that weight is also used for expand properties  }
  evas_object_size_hint_expand_get = evas_object_size_hint_weight_get;  
{*< The rendering is blocking mode }
{*< The rendering is non blocking mode }
type
  PEvas_Engine_Render_Mode = ^TEvas_Engine_Render_Mode;
  TEvas_Engine_Render_Mode =  Longint;
  Const
    EVAS_RENDER_MODE_BLOCKING = 0;
    EVAS_RENDER_MODE_NONBLOCKING = 1;
;
{*< behaviour of the renderer }
type
{*< Event info sent after a frame was rendered. @since 1.18  }
{*< A list of rectangles that were updated in the
                             * canvas.  }
  PEvas_Event_Render_Post = ^TEvas_Event_Render_Post;
  TEvas_Event_Render_Post = record
      updated_area : PEina_List;
    end;

{*< Not a device @since 1.8  }
{*< The user/seat (the user themselves) @since 1.8  }
{*< A regular keyboard, numberpad or attached buttons @since 1.8  }
{*< A mouse, trackball or touchpad relative motion device @since 1.8  }
{*< A touchscreen with fingers or stylus @since 1.8  }
{*< A special pen device @since 1.8  }
{*< A laser pointer, wii-style or "minority report" pointing device @since 1.8  }
{*<  A gamepad controller or joystick @since 1.8  }

  PEvas_Device_Class = ^TEvas_Device_Class;
  TEvas_Device_Class =  Longint;
  Const
    EVAS_DEVICE_CLASS_NONE = 0;
    EVAS_DEVICE_CLASS_SEAT = 1;
    EVAS_DEVICE_CLASS_KEYBOARD = 2;
    EVAS_DEVICE_CLASS_MOUSE = 3;
    EVAS_DEVICE_CLASS_TOUCH = 4;
    EVAS_DEVICE_CLASS_PEN = 5;
    EVAS_DEVICE_CLASS_POINTER = 6;
    EVAS_DEVICE_CLASS_GAMEPAD = 7;
;
{*< A general class of device @since 1.8  }
  EVAS_DEVICE_CLASS_WAND = EVAS_DEVICE_CLASS_POINTER;  
{*
 * @brief Specific type of input device.
 *
 * Note: Currently not used inside EFL.
 *
 * @since 1.8
  }
{*< Not a device.  }
{*< The normal flat of your finger.  }
{*< A fingernail.  }
{*< A Knuckle.  }
{*< The palm of a users hand.  }
{*< The side of your hand.  }
{*< The flat of your hand.  }
{*< The tip of a pen.  }
{*< A trackpad style mouse.  }
{*< A trackpoint style mouse.  }
{*< A trackball style mouse.  }
type
  PEvas_Device_Subclass = ^TEvas_Device_Subclass;
  TEvas_Device_Subclass =  Longint;
  Const
    EVAS_DEVICE_SUBCLASS_NONE = 0;
    EVAS_DEVICE_SUBCLASS_FINGER = 1;
    EVAS_DEVICE_SUBCLASS_FINGERNAIL = 2;
    EVAS_DEVICE_SUBCLASS_KNUCKLE = 3;
    EVAS_DEVICE_SUBCLASS_PALM = 4;
    EVAS_DEVICE_SUBCLASS_HAND_SIZE = 5;
    EVAS_DEVICE_SUBCLASS_HAND_FLAT = 6;
    EVAS_DEVICE_SUBCLASS_PEN_TIP = 7;
    EVAS_DEVICE_SUBCLASS_TRACKPAD = 8;
    EVAS_DEVICE_SUBCLASS_TRACKPOINT = 9;
    EVAS_DEVICE_SUBCLASS_TRACKBALL = 10;
;
{*
 * Flags for Mouse Button events
  }
{*< No extra mouse button data  }
{*< This mouse button press was the 2nd press of a double click  }
{*< This mouse button press was the 3rd press of a triple click  }
type
  PEvas_Button_Flags = ^TEvas_Button_Flags;
  TEvas_Button_Flags =  Longint;
  Const
    EVAS_BUTTON_NONE = 0;
    EVAS_BUTTON_DOUBLE_CLICK = 1 shl 0;
    EVAS_BUTTON_TRIPLE_CLICK = 1 shl 1;
;
{*< Flags for Mouse Button events  }
{*
 * Flags for Events
  }
{*< No fancy flags set  }
{*< This event is being delivered but should be put "on hold" until the on hold flag is unset. The event should be used for informational purposes and maybe some indications visually, but not actually perform anything  }
{*< This event flag indicates the event occurs while scrolling; for example, DOWN event occurs during scrolling; the event should be used for informational purposes and maybe some indications visually, but not actually perform anything  }
type
  PEvas_Event_Flags = ^TEvas_Event_Flags;
  TEvas_Event_Flags =  Longint;
  Const
    EVAS_EVENT_FLAG_NONE = 0;
    EVAS_EVENT_FLAG_ON_HOLD = 1 shl 0;
    EVAS_EVENT_FLAG_ON_SCROLL = 1 shl 1;
;
{*< Flags for Events  }
{*< Preference on scaling unset  }
{*< Same effect as unset preference on scaling  }
{*< Use all horizontal container space to place an object, using the given aspect  }
{*< Use all vertical container space to place an object, using the given aspect  }
{*< Use all horizontal @b and vertical container spaces to place an object (never growing it out of those bounds), using the given aspect  }
type
  PEvas_Aspect_Control = ^TEvas_Aspect_Control;
  TEvas_Aspect_Control =  Longint;
  Const
    EVAS_ASPECT_CONTROL_NONE = 0;
    EVAS_ASPECT_CONTROL_NEITHER = 1;
    EVAS_ASPECT_CONTROL_HORIZONTAL = 2;
    EVAS_ASPECT_CONTROL_VERTICAL = 3;
    EVAS_ASPECT_CONTROL_BOTH = 4;
;
{*< Aspect types/policies for scaling size hints, used for evas_object_size_hint_aspect_set()  }
type
  PEvas_BiDi_Direction = ^TEvas_BiDi_Direction;
  TEvas_BiDi_Direction = TEfl_Text_Bidirectional_Type;

const
  EVAS_BIDI_DIRECTION_NEUTRAL = EFL_TEXT_BIDIRECTIONAL_TYPE_NEUTRAL;  
  EVAS_BIDI_DIRECTION_NATURAL = EFL_TEXT_BIDIRECTIONAL_TYPE_NATURAL;  
  EVAS_BIDI_DIRECTION_LTR = EFL_TEXT_BIDIRECTIONAL_TYPE_LTR;  
  EVAS_BIDI_DIRECTION_RTL = EFL_TEXT_BIDIRECTIONAL_TYPE_RTL;  
  EVAS_BIDI_DIRECTION_INHERIT = EFL_TEXT_BIDIRECTIONAL_TYPE_INHERIT;  
{*< Texture caching (in case of accelerated rendering)  }
type
  PEvas_Font_Data_Cache = ^TEvas_Font_Data_Cache;
  TEvas_Font_Data_Cache =  Longint;
  Const
    EVAS_FONT_DATA_CACHE_TEXTURE = $01;
;
{*< font caching options, used for evas_font_data_cache_set()/evas_font_data_cache_get() }
{*
 * How the mouse pointer should be handled by Evas.
 *
 * In the mode #EVAS_OBJECT_POINTER_MODE_AUTOGRAB, when a mouse button
 * is pressed down over an object and held, with the mouse pointer
 * being moved outside of it, the pointer still behaves as being bound
 * to that object, albeit out of its drawing region. When the button
 * is released, the event will be fed to the object, that may check if
 * the final position is over it or not and do something about it.
 *
 * In the mode #EVAS_OBJECT_POINTER_MODE_NOGRAB, the pointer will
 * always be bound to the object right below it.
 *
 * @ingroup Evas_Object_Group_Extras
  }
{*< default, X11-like  }
{*< pointer always bound to the object right below it  }
{*< useful on object with "repeat events" enabled, where mouse/touch up and down events WONT be repeated to objects and these objects wont be auto-grabbed. @since 1.2  }
type
  PEvas_Object_Pointer_Mode = ^TEvas_Object_Pointer_Mode;
  TEvas_Object_Pointer_Mode =  Longint;
  Const
    EVAS_OBJECT_POINTER_MODE_AUTOGRAB = 0;
    EVAS_OBJECT_POINTER_MODE_NOGRAB = 1;
    EVAS_OBJECT_POINTER_MODE_NOGRAB_NO_REPEAT_UPDOWN = 2;
;
{*< How the mouse pointer should be handled by Evas.  }
{ FIXME: Move to Evas_Legacy.h }
{* Identifier of callbacks to be set for Evas canvases or Evas objects.  }
{*< Mouse In Event  }
{*< Mouse Out Event  }
{*< Mouse Button Down Event  }
{*< Mouse Button Up Event  }
{*< Mouse Move Event  }
{*< Mouse Wheel Event  }
{*< Multi-touch Down Event  }
{*< Multi-touch Up Event  }
{*< Multi-touch Move Event  }
{*< Object Being Freed (Called after Del)  }
{*< Key Press Event  }
{*< Key Release Event  }
{*< Focus In Event  }
{*< Focus Out Event  }
{*< Show Event  }
{*< Hide Event  }
{*< Move Event  }
{*< Resize Event  }
{*< Restack Event  }
{*< Object Being Deleted (called before Free)  }
{*< Events go on/off hold  }
{*< Size hints changed event  }
{*< Image has been preloaded  }
{*< Canvas got focus as a whole  }
{*< Canvas lost focus as a whole  }
{*< Called after render update regions have
                                   * been calculated, but only if update regions exist  }
{*< Called after render update regions have
                                    * been sent to the display server, but only
                                    * if update regions existed for the most recent frame  }
{*< Canvas object got focus  }
{*< Canvas object lost focus  }
{*< Image data has been unloaded (by some mechanism in Evas that throw out original image data)  }
{*< Called just before rendering starts on the canvas target. @since 1.2  }
{*< Called just after rendering stops on the canvas target. @since 1.2  }
{*< Image size is changed. @since 1.8  }
{*< Devices added, removed or changed on canvas. @since 1.8  }
{*< Input device changed value on some axis. @since 1.13  }
{*< Canvas viewport resized. @since 1.15  }
{*< Sentinel value to indicate last enum field during
                      * iteration  }
type
  PEvas_Callback_Type = ^TEvas_Callback_Type;
  TEvas_Callback_Type =  Longint;
  Const
    EVAS_CALLBACK_MOUSE_IN = 0;
    EVAS_CALLBACK_MOUSE_OUT = 1;
    EVAS_CALLBACK_MOUSE_DOWN = 2;
    EVAS_CALLBACK_MOUSE_UP = 3;
    EVAS_CALLBACK_MOUSE_MOVE = 4;
    EVAS_CALLBACK_MOUSE_WHEEL = 5;
    EVAS_CALLBACK_MULTI_DOWN = 6;
    EVAS_CALLBACK_MULTI_UP = 7;
    EVAS_CALLBACK_MULTI_MOVE = 8;
    EVAS_CALLBACK_FREE = 9;
    EVAS_CALLBACK_KEY_DOWN = 10;
    EVAS_CALLBACK_KEY_UP = 11;
    EVAS_CALLBACK_FOCUS_IN = 12;
    EVAS_CALLBACK_FOCUS_OUT = 13;
    EVAS_CALLBACK_SHOW = 14;
    EVAS_CALLBACK_HIDE = 15;
    EVAS_CALLBACK_MOVE = 16;
    EVAS_CALLBACK_RESIZE = 17;
    EVAS_CALLBACK_RESTACK = 18;
    EVAS_CALLBACK_DEL = 19;
    EVAS_CALLBACK_HOLD = 20;
    EVAS_CALLBACK_CHANGED_SIZE_HINTS = 21;
    EVAS_CALLBACK_IMAGE_PRELOADED = 22;
    EVAS_CALLBACK_CANVAS_FOCUS_IN = 23;
    EVAS_CALLBACK_CANVAS_FOCUS_OUT = 24;
    EVAS_CALLBACK_RENDER_FLUSH_PRE = 25;
    EVAS_CALLBACK_RENDER_FLUSH_POST = 26;
    EVAS_CALLBACK_CANVAS_OBJECT_FOCUS_IN = 27;
    EVAS_CALLBACK_CANVAS_OBJECT_FOCUS_OUT = 28;
    EVAS_CALLBACK_IMAGE_UNLOADED = 29;
    EVAS_CALLBACK_RENDER_PRE = 30;
    EVAS_CALLBACK_RENDER_POST = 31;
    EVAS_CALLBACK_IMAGE_RESIZE = 32;
    EVAS_CALLBACK_DEVICE_CHANGED = 33;
    EVAS_CALLBACK_AXIS_UPDATE = 34;
    EVAS_CALLBACK_CANVAS_VIEWPORT_RESIZE = 35;
    EVAS_CALLBACK_LAST = 36;
;
type

  TEvas_Smart_Cb = procedure (data:pointer; obj:PEvas_Object; event_info:pointer);cdecl;
{*< Evas smart objects' "smart callback" function signature  }

  TEvas_Event_Cb = procedure (data:pointer; e:PEvas; event_info:pointer);cdecl;
{*< Evas event callback function signature  }

  TEvas_Object_Event_Post_Cb = function (data:pointer; e:PEvas):TEina_Bool;cdecl;
{*< Evas object event (post) callback function signature  }

  TEvas_Object_Event_Cb = procedure (data:pointer; e:PEvas; obj:PEvas_Object; event_info:pointer);cdecl;
{*< Evas object event callback function signature  }

  TEvas_Async_Events_Put_Cb = procedure (target:pointer; _type:TEvas_Callback_Type; event_info:pointer);cdecl;
{*< Evas async callback function signature  }
{*
 * @defgroup Evas_Main_Group Top Level Functions
 * @ingroup Evas
 *
 * Functions that affect Evas as a whole.
  }
{*
 * @deprecated This function now returns NULL as cserve2 support has been removed
 *
 * Get the path for the cserve binary to execute
 *
 * There is little need for anyone except a desktop environment to call this.
 * This can be called before evas_init() has been called. It will try and find
 * the full path to the to the cserve binary to run to provide cserve image
 * and font caching services for evas.
 *
 * @return NULL if error, or a string with the full path to the cserve binary.
 *
 * @since 1.8
  }
{ /*xxxxxxxxxx    EINA_DEPRECATED*/ }
(* Const before type ignored *)

function evas_cserve_path_get:Pchar;cdecl;external;
{*
 * @brief Directly initialize Evas and its required dependencies.
 *
 * @return The number of times evas_init() has been called.
 *
 * Permits use of Evas independently from @ref Ecore.  This can be
 * useful in certain types of examples and test programs, as well as by
 * Ecore-Evas' @c ecore_evas_init() itself (which is what most EFL
 * applications will be using instead).
 *
 * The @ref Example_Evas_Buffer_Simple "evas-buffer-simple.c" example
 * demonstrates use of evas_init(), and then manually setting up the
 * canvas:
 *
 * @dontinclude evas-buffer-simple.c
 * @skip int main
 * @until return -1;
 *
 * The canvas is set up using the example's create_canvas() routine,
 * which forces selection of Evas' "buffer" rendering engine.  The
 * buffer engine simply renders to a memory buffer with no hardware
 * acceleration.
 *
 * @skip static Evas *create_canvas
 * @until    evas_output_viewport_set(canvas,
 *
 * @see evas_shutdown().
 *
 * @ingroup Evas_Main_Group
  }
function evas_init:longint;cdecl;external;
{*
 * @brief Directly shutdown Evas.
 *
 * @return The (decremented) init reference counter.
 *
 * Low level routine to finalize Evas.  Decrements a counter of the
 * number of times evas_init() has been called, and, if appropriate,
 * shuts down associated dependency modules and libraries.  A return
 * value of 0 indicates that everything has been properly shut down.
 *
 * Ecore-Evas applications will typically use ecore_evas_shutdown()
 * instead, as described in evas_init().
 *
 * The @ref Example_Evas_Buffer_Simple "evas-buffer-simple.c" example
 * shows use of evas_shutdown() in its destroy_canvas() routine:
 *
 * @dontinclude evas-buffer-simple.c
 * @skip static void destroy_canvas
 * @until   evas_free(canvas)
 *
 * @see evas_init().
 *
 * @ingroup Evas_Main_Group
  }
function evas_shutdown:longint;cdecl;external;
{*
 * @brief Get the error status of the most recent memory allocation call
 *
 * @return Allocation error codes EVAS_ALLOC_ERROR_NONE,
 * EVAS_ALLOC_ERROR_FATAL or EVAS_ALLOC_ERROR_RECOVERED.
 *
 * Accesses the current error status for memory allocation, or
 * EVAS_ALLOC_ERROR_NONE if allocation succeeded with no errors.
 *
 * EVAS_ALLOC_ERROR_FATAL means that no memory allocation was possible, but
 * the function call exited as cleanly as possible.  This is a sign of very low
 * memory, and indicates the caller should attempt a safe recovery and possibly
 * re-try after freeing up additional memory.
 *
 * EVAS_ALLOC_ERROR_RECOVERED indicates that Evas was able to free up
 * sufficient memory internally to perform the requested memory
 * allocation and the program will continue to function normally, but
 * memory is in a low state and the program should strive to free memory
 * itself.  Evas' approach to free memory internally may reduce the
 * resolution of images, free cached fonts or images, throw out
 * pre-rendered data, or reduce the complexity of change lists.
 *
 * Example:
 * @code
 * extern Evas_Object *object;
 * void callback (void *data, Evas *e, Evas_Object *obj, void *event_info);
 *
 * evas_object_event_callback_add(object, EVAS_CALLBACK_MOUSE_DOWN, callback, NULL);
 * if (evas_alloc_error() == EVAS_ALLOC_ERROR_FATAL)
 *   
 *     fprintf(stderr, "ERROR: Failed to attach callback.  Out of memory.\n");
 *     fprintf(stderr, "       Must destroy object now as it cannot be used.\n");
 *     evas_object_del(object);
 *     object = NULL;
 *     fprintf(stderr, "WARNING: Cleaning out RAM.\n");
 *     my_memory_cleanup();
 *   
 * if (evas_alloc_error() == EVAS_ALLOC_ERROR_RECOVERED)
 *   
 *     fprintf(stderr, "WARNING: Memory is really low. Cleaning out RAM.\n");
 *     my_memory_cleanup();
 *   
 * @endcode
 *
 * @ingroup Evas_Main_Group
  }
function evas_alloc_error:TEvas_Alloc_Error;cdecl;external;
{*
 * @brief Access the canvas' asynchronous event queue.
 *
 * @return A file descriptor to the asynchronous events.
 *
 * Normally, Evas handles asynchronous events internally, particularly
 * in Evas-using modules that are part of the EFL infrastructure.
 * Notably, ecore-evas takes care of processing these events for
 * canvases instantiated through it.
 *
 * However, when asynchronous calculations need to be done outside the
 * main thread (in some other mainloop) with some followup action, this
 * function permits accessing the events.  An example would be
 * asynchronous image preloading.
 *
 * @ingroup Evas_Main_Group
  }
function evas_async_events_fd_get:longint;cdecl;external;
{*
 * @brief Process the asynchronous event queue.
 *
 * @return The number of events processed.
 *
 * Triggers the callback functions for asynchronous events that were
 * queued up by evas_async_events_put().  The callbacks are called in
 * the same order that they were queued.
 *
 * @ingroup Evas_Main_Group
  }
function evas_async_events_process:longint;cdecl;external;
{*
 * @brief Insert asynchronous events on the canvas.
 *
 * @param target The target to be affected by the events.
 * @param type The type of callback function.
 * @param event_info Information about the event.
 * @param func The callback function pointer.
 *
 * @return EINA_FALSE if an error occurred, EINA_TRUE otherwise.
 *
 * Allows routines running outside Evas' main thread to report an
 * asynchronous event.  The target, type, and event info will be passed
 * to the callback function when evas_async_events_process() is called.
 *
 * @ingroup Evas_Main_Group
  }
(* Const before type ignored *)
function evas_async_events_put(target:pointer; _type:TEvas_Callback_Type; event_info:pointer; func:TEvas_Async_Events_Put_Cb):TEina_Bool;cdecl;external;
{*
 * @defgroup Evas_Canvas Canvas Functions
 * @ingroup Evas
 *
 * Low level Evas canvas functions. Sub groups will present more high
 * level ones, though.
 *
 * Most of these functions deal with low level Evas actions, like:
 * @li create/destroy raw canvases, not bound to any displaying engine
 * @li tell a canvas i got focused (in a windowing context, for example)
 * @li tell a canvas a region should not be calculated anymore in rendering
 * @li tell a canvas to render its contents, immediately
 *
 * Most users will be using Evas by means of the @c Ecore_Evas
 * wrapper, which deals with all the above mentioned issues
 * automatically for them. Thus, you'll be looking at this section
 * only if you're building low level stuff.
 *
 * The groups within present you functions that deal with the canvas
 * directly, too, and not yet with its @b objects. They are the
 * functions you need to use at a minimum to get a working canvas.
 *
 * Some of the functions in this group are exemplified @ref
 * Example_Evas_Events "here".
  }
{*
 * @
  }
{*
 * @defgroup Evas_Output_Method Render Engine Functions
 *
 * Functions that are used to set the render engine for a given
 * function, and then get that engine working.
 *
 * The following code snippet shows how they can be used to
 * initialise an evas that uses the X11 software engine:
 * @code
 * Evas *evas;
 * Evas_Engine_Info_Software_X11 *einfo;
 * extern Display *display;
 * extern Window win;
 *
 * evas_init();
 *
 * evas = evas_new();
 * evas_output_method_set(evas, evas_render_method_lookup("software_x11"));
 * evas_output_size_set(evas, 640, 480);
 * evas_output_viewport_set(evas, 0, 0, 640, 480);
 * einfo = (Evas_Engine_Info_Software_X11 *)evas_engine_info_get(evas);
 * einfo->info.display = display;
 * einfo->info.visual = DefaultVisual(display, DefaultScreen(display));
 * einfo->info.colormap = DefaultColormap(display, DefaultScreen(display));
 * einfo->info.drawable = win;
 * einfo->info.depth = DefaultDepth(display, DefaultScreen(display));
 * evas_engine_info_set(evas, (Evas_Engine_Info *)einfo);
 * @endcode
 *
 * @ingroup Evas_Canvas
  }
{*
 * Look up a numeric ID from a string name of a rendering engine.
 *
 * @param name the name string of an engine
 * @return A numeric (opaque) ID for the rendering engine
 * @ingroup Evas_Output_Method
 *
 * This function looks up a numeric return value for the named engine
 * in the string @p name. This is a normal C string, NUL byte
 * terminated. The name is case sensitive. If the rendering engine is
 * available, a numeric ID for that engine is returned that is not
 * 0. If the engine is not available, 0 is returned, indicating an
 * invalid engine.
 *
 * The programmer should NEVER rely on the numeric ID of an engine
 * unless it is returned by this function. Programs should NOT be
 * written accessing render method ID's directly, without first
 * obtaining it from this function.
 *
 * @attention it is mandatory that one calls evas_init() before
 *       looking up the render method.
 *
 * Example:
 * @code
 * int engine_id;
 * Evas *evas;
 *
 * evas_init();
 *
 * evas = evas_new();
 * if (!evas)
 *   
 *     fprintf(stderr, "ERROR: Canvas creation failed. Fatal error.\n");
 *     exit(-1);
 *   
 * engine_id = evas_render_method_lookup("software_x11");
 * if (!engine_id)
 *   
 *     fprintf(stderr, "ERROR: Requested rendering engine is absent.\n");
 *     exit(-1);
 *   
 * evas_output_method_set(evas, engine_id);
 * @endcode
  }
(* Const before type ignored *)
function evas_render_method_lookup(name:Pchar):longint;cdecl;external;
{*
 * List all the rendering engines compiled into the copy of the Evas library
 *
 * @return A linked list whose data members are C strings of engine names
 * @ingroup Evas_Output_Method
 *
 * Calling this will return a handle (pointer) to an Evas linked
 * list. Each node in the linked list will have the data pointer be a
 * (char *) pointer to the name string of the rendering engine
 * available. The strings should never be modified, neither should the
 * list be modified. This list should be cleaned up as soon as the
 * program no longer needs it using evas_render_method_list_free(). If
 * no engines are available from Evas, @c NULL will be returned.
 *
 * Example:
 * @code
 * Eina_List *engine_list, *l;
 * char *engine_name;
 *
 * engine_list = evas_render_method_list();
 * if (!engine_list)
 *   
 *     fprintf(stderr, "ERROR: Evas supports no engines! Exit.\n");
 *     exit(-1);
 *   
 * printf("Available Evas Engines:\n");
 * EINA_LIST_FOREACH(engine_list, l, engine_name)
 *   printf("%s\n", engine_name);
 * evas_render_method_list_free(engine_list);
 * @endcode
  }
function evas_render_method_list:PEina_List;cdecl;external;
{*
 * This function should be called to free a list of engine names
 *
 * @param list The Eina_List base pointer for the engine list to be freed
 * @ingroup Evas_Output_Method
 *
 * When this function is called it will free the engine list passed in
 * as @p list. The list should only be a list of engines generated by
 * calling evas_render_method_list(). If @p list is NULL, nothing will
 * happen.
 *
 * Example:
 * @code
 * Eina_List *engine_list, *l;
 * char *engine_name;
 *
 * engine_list = evas_render_method_list();
 * if (!engine_list)
 *   
 *     fprintf(stderr, "ERROR: Evas supports no engines! Exit.\n");
 *     exit(-1);
 *   
 * printf("Available Evas Engines:\n");
 * EINA_LIST_FOREACH(engine_list, l, engine_name)
 *   printf("%s\n", engine_name);
 * evas_render_method_list_free(engine_list);
 * @endcode
  }
procedure evas_render_method_list_free(list:PEina_List);cdecl;external;
{*
 * @
  }
{*
 * @defgroup Evas_Coord_Mapping_Group Coordinate Mapping Functions
 *
 * Functions that are used to map coordinates from the canvas to the
 * screen or the screen to the canvas.
 *
 * @ingroup Evas_Canvas
  }
{*
 * @defgroup Evas_Output_Size Output and Viewport Resizing Functions
 *
 * Functions that set and retrieve the output and viewport size of an
 * evas.
 *
 * @ingroup Evas_Canvas
  }
{*
 * @defgroup Evas_Canvas_Events Canvas Events
 *
 * Functions relating to canvas events that report on changes of
 * its internal states (an object got focused, the rendering
 * is updated, etc).
 *
 * Some of the functions in this group are exemplified @ref
 * Example_Evas_Events "here".
 *
 * @ingroup Evas_Canvas
  }
{*
 * Free the rectangles returned by evas_render_updates().
 *
 * @param updates The list of updated rectangles of the canvas.
 *
 * This function removes the region from the render updates list. It
 * makes the region doesn't be render updated anymore.
 *
 * @see evas_render_updates() for an example
 *
 * @ingroup Evas_Canvas
  }
procedure evas_render_updates_free(updates:PEina_List);cdecl;external;
{*
 * @defgroup Evas_Event_Freezing_Group Input Events Freezing Functions
 *
 * Functions that deal with the freezing of input event processing of
 * an Evas canvas.
 *
 * There might be scenarios during a graphical user interface
 * program's use when the developer wishes the users wouldn't be able
 * to deliver input events to this application. It may, for example,
 * be the time for it to populate a view or to change some
 * layout. Assuming proper behavior with user interaction during this
 * exact time would be hard, as things are in a changing state. The
 * programmer can then tell the canvas to ignore input events,
 * bringing it back to normal behavior when he/she wants.
 *
 * Most of the time use of freezing events is done like this:
 * @code
 * evas_event_freeze(my_evas_canvas);
 * function_that_does_work_that_cant_be_interrupted_by_events();
 * evas_event_thaw(my_evas_canvas);
 * @endcode
 *
 * Some of the functions in this group are exemplified @ref
 * Example_Evas_Events "here".
 *
 * @ingroup Evas_Canvas_Events
  }
{*
 * @defgroup Evas_Event_Feeding_Group Input Events Feeding Functions
 *
 * Functions to tell Evas that input events happened and should be
 * processed.
 *
 * @warning Most of the time these functions are @b not what you're looking for.
 * These functions should only be used if you're not working with ecore evas (or
 * another input handling system). If you're not using ecore evas please
 * consider using it, in most situation it will make life a lot easier.
 *
 * As explained in @ref intro_not_evas, Evas does not know how to poll
 * for input events, so the developer should do it and then feed such
 * events to the canvas to be processed. This is only required if
 * operating Evas directly. Modules such as Ecore_Evas do that for
 * you.
 *
 * Some of the functions in this group are exemplified @ref
 * Example_Evas_Events "here".
 *
 * @ingroup Evas_Canvas_Events
  }
{*
 * @addtogroup Evas_Event_Feeding_Group
 * @
  }
{*
 * Add a new device type
 *
 * @param e The canvas to create the device node for.
 *
 * Adds a new device node to the given canvas @p e. All devices created as
 * part of the canvas @p e will automatically be deleted when the canvas
 * is freed.
 *
 * @return the device node created or NULL if an error occurred.
 *
 * @see evas_device_del
 * @see evas_device_add_full
 * @since 1.8
  }
function evas_device_add(e:PEvas):PEvas_Device;cdecl;external;
{*
 * Add a new device type
 *
 * @param e The canvas to create the device node for.
 * @param name The name of the device.
 * @param desc The description of the device.
 * @param parent_dev The parent device.
 * @param emulation_dev The source device.
 * @param clas The device class.
 * @param sub_class  The device subclass.
 *
 * Adds a new device node to the given canvas @p e. All devices created as
 * part of the canvas @p e will automatically be deleted when the canvas
 * is freed.
 *
 * @return the device node created or NULL if an error occurred.
 *
 * @see evas_device_del
 * @since 1.19
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evas_device_add_full(e:PEvas; name:Pchar; desc:Pchar; parent_dev:PEvas_Device; emulation_dev:PEvas_Device; 
           clas:TEvas_Device_Class; sub_class:TEvas_Device_Subclass):PEvas_Device;cdecl;external;
{*
 * Delete a new device type
 *
 * @param dev The device node you want to delete.
 *
 * @see evas_device_add
 * @see evas_device_push
 * @see evas_device_pop
 * @since 1.8
  }
procedure evas_device_del(dev:PEvas_Device);cdecl;external;
{*
 * Push the current context device onto the device stack
 *
 * @param e The canvas to push the device on to
 * @param dev The device to push.
 *
 * This pushes the given device @p dev onto the stack for the canvas @p e
 * resulting in the dev pointer in all events that get fed to the canvas
 * being the device at the top of the device stack for that canvas.
 *
 * If a device is pushed onto the device stack, it will not be deleted
 * until a canvas free OR until it has been popped from the stack even if
 * evas_device_del() is called.
 *
 * The device @p dev must have been created as a device for the canvas it
 * is pushed onto (and not another canvas).
 *
 * Example:
 * @code
 * evas_device_push(canvas, dev);
 * evas_event_feed_mouse_move(canvas, 20, 30, 0, NULL);
 * evas_device_pop(canvas);
 * @endcode
 *
 * @see evas_device_pop
 * @since 1.8
  }
procedure evas_device_push(e:PEvas; dev:PEvas_Device);cdecl;external;
{*
 * This pops the top of the device stack for the canvas
 *
 * @param e The canvas to pop the device stack from
 *
 * This pops the top of the device stack making the current device context
 * used for device events being what is now at the top of the stack after
 * popping.
 *
 * @see evas_device_push
 * @since 1.8
  }
procedure evas_device_pop(e:PEvas);cdecl;external;
{*
 * List all current devices attached to the given canvas and/or device
 *
 * @param e The canvas to query for a device list
 * @param dev A specific device inside the canvas to query for child devices or NULL if just querying the base canvas devices
 * @return An internal list of Evas_Device pointers, or NULL if no devices are found
 *
 * This will list all devices belonging to a specific evas canvas @p e, at the
 * top-level in the device tree if @p dev passed in is NULL. If @p dev is
 * a valid device for the given canvas @p e, then a list of child devices
 * of @p dev will be returned, allowing you to walk the device tree.
 *
 * The list returned is only valid so long as no changes are made to the
 * device tree in the given canvas @p e. If there are no devices or children
 * then NULL is returned.
 *
 * @see evas_device_parent_get
 * @see evas_device_name_get
 * @see evas_device_description_get
 * @see evas_device_class_get
 * @see evas_device_subclass_get
 * @see evas_device_emulation_source_get
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evas_device_list(e:PEvas; dev:PEvas_Device):PEina_List;cdecl;external;
{*
 * Get a device by its name
 *
 * @param e The canvas to find the device on
 * @param name The name of the device.
 *
 * Gets the first occurrence of a device named as @p name
 * on Evas @p e list of devices.
 *
 * @return the device or NULL if an error occurred, no name was provided,
 * or no device with a matching name was found.
 *
 * @since 1.19
  }
(* Const before type ignored *)
function evas_device_get(e:PEvas; name:Pchar):PEvas_Device;cdecl;external;
{*
 * Get a device by its seat id
 *
 * @param eo_e The canvas to find the device on
 * @param id The seat id of the device.
 *
 * Gets the device with id @p id on Evas @p e list of devices.
 *
 * @return the device or NULL if no device with a matching id was found.
 *
 * @since 1.20
  }
function evas_device_get_by_seat_id(eo_e:PEvas; id:dword):PEvas_Device;cdecl;external;
{*
 * Set the name of a device as a string
 *
 * @p dev The device to set the name of
 * @p name The name string as a readable C UTF8 string
 *
 * @since 1.8
  }
(* Const before type ignored *)
procedure evas_device_name_set(dev:PEvas_Device; name:Pchar);cdecl;external;
{*
 * Get the name of a device
 *
 * @p dev The device to query
 * @return The device name string or NULL if none is set
 *
 * This gets the name set by evas_device_name_set(). This is a readable UTF8
 * C string, or NULL if no name is set.
 *
 * The name should be a short name like "Wireless Mouse", "Joystick",
 * "Finger", "Keyboard" or "Numberpad" etc.
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evas_device_name_get(dev:PEvas_Device):Pchar;cdecl;external;
{*
 * Set the seat id of a device
 *
 * @p dev The device to set the seat id of
 * @p name The seat id
 *
 * @since 1.20
  }
procedure evas_device_seat_id_set(dev:PEvas_Device; id:dword);cdecl;external;
{*
 * Get the seat id of a device
 *
 * @p dev The device to query
 * @return The device seat id or 0 if none is set
 *
 * This gets the seat id set by evas_device_seat id_set().
 *
 * A seat id is the hardware id of the seat.
 *
 * @since 1.20
  }
(* Const before type ignored *)
function evas_device_seat_id_get(dev:PEvas_Device):dword;cdecl;external;
{*
 * Set the description of a device as a string
 *
 * @p dev The device to set the description of
 * @p name The description string as a readable C UTF8 string
 *
 * @since 1.8
  }
(* Const before type ignored *)
procedure evas_device_description_set(dev:PEvas_Device; desc:Pchar);cdecl;external;
{*
 * Get the description of a device
 *
 * @p dev The device to query
 * @return The device description string or NULL if none is set
 *
 * This gets the description set by evas_device_description_set(). This is
 * a readable UTF8 C string, or NULL if no description is set.
 *
 * A description is meant to be a longer string describing the device so a
 * human may make sense of it. For example "Wireless 6 button mouse in Black
 * with red buttons" would be a good description, so a user may identify
 * precisely which device is being talked about.
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evas_device_description_get(dev:PEvas_Device):Pchar;cdecl;external;
{*
 * Set the parent of a device
 *
 * @p dev The device to set the parent of
 * @p parent The new parent device
 *
 * This sets the parent of a device @p dev to the parent given by @p parent.
 * If the device already has a parent, it is removed from that parent's list.
 * If @p parent is NULL then the device is unparented and placed back as a
 * root device in the canvas.
 *
 * When a device is deleted with evas_device_del(), all children are also
 * deleted along with it.
 *
 * @see evas_device_del
 * @see evas_device_parent_get
 * @see evas_device_list
 *
 * @since 1.8
  }
{xxxxxxxxxx    EINA_DEPRECATED }procedure evas_device_parent_set(dev:PEvas_Device; parent:PEvas_Device);cdecl;external;
{*
 * Get the parent of a device
 *
 * @param dev The device to query
 * @return The parent device or NULL if it is a toplevel
 *
 * This returns the parent device of any given device entry, or NULL if no
 * parent device exists (is a toplevel device).
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evas_device_parent_get(dev:PEvas_Device):PEvas_Device;cdecl;external;
{*
 * Set the major class of device
 *
 * @param dev The device whose class to set
 * @param clas The class to set it to
 *
 * This sets the "primary" class of device (a broad thing like mouse, keyboard,
 * touch, pen etc.).
 *
 * @deprecated The class of a device can not be changed after creation.
 *
 * @since 1.8
  }
{xxxxxxxxxx    EINA_DEPRECATED }procedure evas_device_class_set(dev:PEvas_Device; clas:TEvas_Device_Class);cdecl;external;
{*
 * Get the major class of a device
 *
 * @param dev The devise to query
 * @return The device class to set
 *
 * This gets the device class set by evas_device_class_set().
 *
 * @since 1.8
  }
(* Const before type ignored *)
function evas_device_class_get(dev:PEvas_Device):TEvas_Device_Class;cdecl;external;
{*
 * Set the sub-class of a device
 *
 * @param dev The device to modify
 * @param clas The sub-class to set
 *
 * This sets the sub-class of a device, giving much more detailed usage
 * within a broader category.
 *
 * @since 1.8
  }
procedure evas_device_subclass_set(dev:PEvas_Device; clas:TEvas_Device_Subclass);cdecl;external;
{*
 * Get the device sub-class
 *
 * @param dev The device to query
 * @return The device sub-class set by evas_device_subclass_set().
 *
 * @since 1.8
  }
(* Const before type ignored *)
function evas_device_subclass_get(dev:PEvas_Device):TEvas_Device_Subclass;cdecl;external;
{*
 * Set the emulation source device
 *
 * @param dev The device being emulated
 * @param src The primary source device producing events in the emulated device
 *
 * Devices may not be real, but may be emulated by listening to input on other
 * devices and modifying or interpeting it to generate output on an emulated
 * device (example a finger on a touchscreen will often emulate a mouse when
 * it presses). This allows you to set which device primarily emulates @p dev
 * so the user can choose to ignore events from emulated devices if they also
 * pay attention to source device events for example.
 *
 * @since 1.8
  }
procedure evas_device_emulation_source_set(dev:PEvas_Device; src:PEvas_Device);cdecl;external;
{*
 * Get the emulation source device
 *
 * @param dev The device to query
 * @return The source emulation device set by evas_device_emulation_source_set().
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evas_device_emulation_source_get(dev:PEvas_Device):PEvas_Device;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Evas_Image Image Functions
 *
 * Functions that deal with images at canvas level. Compare with
 * @ref Evas_Object_Image functions which deal with images at the object level.
 *
 * @ingroup Evas_Canvas
  }
{*
 * @defgroup Evas_Font_Group Font Functions
 *
 * Functions that deal with fonts.
 *
 * @ingroup Evas_Canvas
  }
{*
 * @defgroup Evas_Object_Group Generic Object Functions
 * @ingroup Evas
 *
 * Functions that manipulate generic Evas objects.
 *
 * All Evas displaying units are Evas objects. One handles them all by
 * means of the handle ::Evas_Object. Besides Evas treats their
 * objects equally, they have @b types that define their specific
 * behavior (and individual API).
 *
 * Evas comes with a set of built-in object types:
 *   - rectangle,
 *   - line,
 *   - polygon,
 *   - text,
 *   - textblock,
 *   - textgrid and
 *   - image.
 *
 * These functions apply to @b any Evas object, whatever type they
 * may have.
 *
 * @note The built-in types that are most used are rectangles, text
 * and images. In fact, with these one can create 2D interfaces
 * of arbitrary complexity and EFL makes it easy.
  }
{*
 * @defgroup Evas_Object_Group_Basic Basic Object Manipulation
 *
 * Almost every evas object created will have some generic function used to
 * manipulate it. That's because there are a number of basic actions to be done
 * to objects that are irrespective of the object's type, things like:
 * @li Showing/Hiding
 * @li Setting (and getting) geometry
 * @li Bring up or down a layer
 * @li Color management
 * @li Handling focus
 * @li Clipping
 * @li Reference counting
 *
 * All of these issues are handled through the functions grouped here. Examples
 * of these function can be seen in @ref Example_Evas_Object_Manipulation(which
 * deals with the most common ones) and in @ref Example_Evas_Stacking (which
 * deals with stacking functions).
 *
 * @ingroup Evas_Object_Group
  }
{*
 * @defgroup Evas_Object_Group_Events Object Events
 *
 * Objects generate events when they are moved, resized, when their
 * visibility change, when they are deleted and so on. These methods
 * allow one to be notified about and to handle such events.
 *
 * Objects also generate events on input (keyboard and mouse), if they
 * accept them (are visible, focused, etc).
 *
 * For each of those events, Evas provides a way for one to register
 * callback functions to be issued just after they happen.
 *
 * The following figure illustrates some Evas (event) callbacks:
 *
 * @image html evas-callbacks.png
 * @image rtf evas-callbacks.png
 * @image latex evas-callbacks.eps
 *
 * These events have their values in the #Evas_Callback_Type
 * enumeration, which has also ones happening on the canvas level (see
 * @ref Evas_Canvas_Events ).
 *
 * Examples on this group of functions can be found @ref
 * Example_Evas_Stacking "here" and @ref Example_Evas_Events "here".
 *
 * @ingroup Evas_Object_Group
  }
{*
 * @defgroup Evas_Object_Group_Size_Hints Size Hints
 *
 * Objects may carry hints, so that another object that acts as a
 * manager (see @ref Evas_Smart_Object_Group) may know how to properly
 * position and resize its subordinate objects. The Size Hints provide
 * a common interface that is recommended as the protocol for such
 * information.
 *
 * For example, box objects use alignment hints to align its
 * lines/columns inside its container, padding hints to set the
 * padding between each individual child, etc.
 *
 * Examples on their usage:
 * - @ref Example_Evas_Size_Hints "evas-hints.c"
 * - @ref Example_Evas_Aspect_Hints "evas-aspect-hints.c"
 *
 * @ingroup Evas_Object_Group
  }
{*
 * @defgroup Evas_Object_Group_Extras Extra Object Manipulation
 *
 * Miscellaneous functions that also apply to any object, but are less
 * used or not implemented by all objects.
 *
 * Examples of this group of functions can be found @ref
 * Example_Evas_Stacking "here" and @ref Example_Evas_Events "here".
 *
 * @ingroup Evas_Object_Group
  }
{*
 * @defgroup Evas_Object_Group_Find Finding Objects
 *
 * Functions that allows finding objects by their position, name or
 * other properties.
 *
 * @ingroup Evas_Object_Group
  }
{*
 * @defgroup Evas_Object_Specific Specific Object Functions
 * @ingroup Evas
 *
 * Functions that work on specific objects.
 *
  }
{*
 * @defgroup Evas_Object_Rectangle Rectangle Object Functions
 *
 * @brief Function to create evas rectangle objects.
 *
 * There is only one function to deal with rectangle objects, this may make this
 * function seem useless given there are no functions to manipulate the created
 * rectangle, however the rectangle is actually very useful and should be
 * manipulated using the generic @ref Evas_Object_Group "evas object functions".
 *
 * The evas rectangle serves a number of key functions when working on evas
 * programs:
 * @li Background
 * @li Debugging
 * @li Clipper
 *
 * @section Background
 *
 * One extremely common requirement of evas programs is to have a solid color
 * background, this can be accomplished with the following very simple code:
 * @code
 * Evas_Object *bg = evas_object_rectangle_add(evas_canvas);
 * //Here we set the rectangles red, green, blue and opacity levels
 * evas_object_color_set(bg, 255, 255, 255, 255); // opaque white background
 * evas_object_resize(bg, WIDTH, HEIGHT); // covers full canvas
 * evas_object_show(bg);
 * @endcode
 *
 * This will have issues if the @c evas_canvas is resized, however most
 * windows are created using ecore evas and that has a solution to using the
 * rectangle as a background:
 * @code
 * Evas_Object *bg = evas_object_rectangle_add(ecore_evas_get(ee));
 * //Here we set the rectangles red, green, blue and opacity levels
 * evas_object_color_set(bg, 255, 255, 255, 255); // opaque white background
 * evas_object_resize(bg, WIDTH, HEIGHT); // covers full canvas
 * evas_object_show(bg);
 * ecore_evas_object_associate(ee, bg, ECORE_EVAS_OBJECT_ASSOCIATE_BASE);
 * @endcode
 * So this gives us a white background to our window that will be resized
 * together with it.
 *
 * @section Debugging
 *
 * Debugging is a major part of any programmers task and when debugging visual
 * issues with evas programs the rectangle is an extremely useful tool. The
 * rectangle's simplicity means that it's easier to pinpoint issues with it than
 * with more complex objects. Therefore a common technique to use when writing
 * an evas program and not getting the desired visual result is to replace the
 * misbehaving object for a solid color rectangle and seeing how it interacts
 * with the other elements, this often allows us to notice clipping, parenting
 * or positioning issues. Once the issues have been identified and corrected the
 * rectangle can be replaced for the original part and in all likelihood any
 * remaining issues will be specific to that object's type.
 *
 * @section clipping Clipping
 *
 * Clipping serves two main functions:
 * @li Limiting visibility(i.e. hiding portions of an object).
 * @li Applying a layer of color to an object.
 *
 * @subsection hiding Limiting visibility
 *
 * It is often necessary to show only parts of an object, while it may be
 * possible to create an object that corresponds only to the part that must be
 * shown(and it isn't always possible) it's usually easier to use a a clipper. A
 * clipper is a rectangle that defines what's visible and what is not. The way
 * to do this is to create a solid white rectangle(which is the default, no need
 * to call evas_object_color_set()) and give it a position and size of what
 * should be visible. The following code exemplifies showing the center half of
 * @c my_evas_object:
 * @code
 * Evas_Object *clipper = evas_object_rectangle_add(evas_canvas);
 * evas_object_move(clipper, my_evas_object_x / 4, my_evas_object_y / 4);
 * evas_object_resize(clipper, my_evas_object_width / 2, my_evas_object_height / 2);
 * evas_object_clip_set(my_evas_object, clipper);
 * evas_object_show(clipper);
 * @endcode
 *
 * @subsection color Layer of color
 *
 * In the @ref clipping section we used a solid white clipper that produced no
 * change in the color of the clipped object, it just hid what was outside the
 * clippers area. It is however sometimes desirable to change the color of an
 * object, this can be accomplished using a clipper that has a non-white color.
 * Clippers with color work by multiplying the colors of clipped object. The
 * following code will show how to remove all the red from an object:
 * @code
 * Evas_Object *clipper = evas_object_rectangle_add(evas);
 * evas_object_move(clipper, my_evas_object_x, my_evas_object_y);
 * evas_object_resize(clipper, my_evas_object_width, my_evas_object_height);
 * evas_object_color_set(clipper, 0, 255, 255, 255);
 * evas_object_clip_set(obj, clipper);
 * evas_object_show(clipper);
 * @endcode
 *
 * @warning We don't guarantee any proper results if you create a Rectangle
 * object without setting the evas engine.
 *
 * For an example that more fully exercise the use of an evas object rectangle
 * see @ref Example_Evas_Object_Manipulation.
 *
 * @ingroup Evas_Object_Specific
  }
{*
 * @defgroup Evas_Object_Image Image Object Functions
 *
 * Here are grouped together functions used to create and manipulate
 * image objects. They are available to whichever occasion one needs
 * complex imagery on a GUI that could not be achieved by the other
 * Evas' primitive object types, or to make image manipulations.
 *
 * Evas will support whatever image file types it was compiled with
 * support to (its image loaders) -- check your software packager for
 * that information and see
 * evas_object_image_extension_can_load_get().
 *
 * @section Evas_Object_Image_Basics Image object basics
 *
 * The most common use of image objects -- to display an image on the
 * canvas -- is achieved by a common function triplet:
 * @code
 * img = evas_object_image_add(canvas);
 * evas_object_image_file_set(img, "path/to/img", NULL);
 * evas_object_image_fill_set(img, 0, 0, w, h);
 * @endcode
 * The first function, naturally, is creating the image object. Then,
 * one must set a source file on it, so that it knows where to fetch
 * image data from. Next, one must set <b>how to fill the image
 * object's area</b> with that given pixel data. One could use just a
 * sub-region of the original image or even have it tiled repeatedly
 * on the image object. For the common case of having the whole source
 * image to be displayed on the image object, stretched to the
 * destination's size, there's also a function helper, to be used
 * instead of evas_object_image_fill_set():
 * @code
 * evas_object_image_filled_set(img, EINA_TRUE);
 * @endcode
 * See those functions' documentation for more details.
 *
 * @section Evas_Object_Image_Scale Scale and resizing
 *
 * Resizing of image objects will scale their respective source images
 * to their areas, if they are set to "fill" the object's area
 * (evas_object_image_filled_set()). If the user wants any control on
 * the aspect ratio of an image for different sizes, he/she has to
 * take care of that themselves. There are functions to make images to
 * get loaded scaled (up or down) in memory, already, if the user is
 * going to use them at pre-determined sizes and wants to save
 * computations.
 *
 * Evas has even a scale cache that will take care of caching scaled
 * versions of images with more often usage/hits. Finally, one can
 * have images being rescaled @b smoothly by Evas (more
 * computationally expensive) or not.
 *
 * @section Evas_Object_Image_Performance Performance hints
 *
 * When dealing with image objects, there are some tricks to boost the
 * performance of your application, if it does intense image loading
 * and/or manipulations, as in animations on a UI.
 *
 * @subsection Evas_Object_Image_Load Load hints
 *
 * In image viewer applications, for example, the user will be looking
 * at a given image, at full size, and will desire that the navigation
 * to the adjacent images on his/her album be fluid and fast. Thus,
 * while displaying a given image, the program can be in the
 * background loading the next and previous images already, so that
 * displaying them in sequence is just a matter of repainting the
 * screen (and not decoding image data).
 *
 * Evas addresses this issue with <b>image pre-loading</b>. The code
 * for the situation above would be something like the following:
 * @code
 * prev = evas_object_image_filled_add(canvas);
 * evas_object_image_file_set(prev, "/path/to/prev", NULL);
 * evas_object_image_preload(prev, EINA_TRUE);
 *
 * next = evas_object_image_filled_add(canvas);
 * evas_object_image_file_set(next, "/path/to/next", NULL);
 * evas_object_image_preload(next, EINA_TRUE);
 * @endcode
 *
 * If you're loading images that are too big, consider setting
 * previously it's loading size to something smaller, in case you
 * won't expose them in real size. It may speed up the loading
 * considerably:
 * @code
 * //to load a scaled down version of the image in memory, if that's
 * //the size you'll be displaying it anyway
 * evas_object_image_load_scale_down_set(img, zoom);
 *
 * //optional: if you know you'll be showing a sub-set of the image's
 * //pixels, you can avoid loading the complementary data
 * evas_object_image_load_region_set(img, x, y, w, h);
 * @endcode
 * Refer to Elementary's Photocam widget for a high level (smart)
 * object that does lots of loading speed-ups for you.
 *
 * @subsection Evas_Object_Image_Animation Animation hints
 *
 * If you want to animate image objects on a UI (what you'd get by
 * concomitant usage of other libraries, like Ecore and Edje), there
 * are also some tips on how to boost the performance of your
 * application. If the animation involves resizing of an image (thus,
 * re-scaling), you'd better turn off smooth scaling on it @b during
 * the animation, turning it back on afterwards, for less
 * computations. Also, in this case you'd better flag the image object
 * in question not to cache scaled versions of it:
 * @code
 * evas_object_image_scale_hint_set(wd->img, EVAS_IMAGE_SCALE_HINT_DYNAMIC);
 *
 * // resizing takes place in between
 *
 * evas_object_image_scale_hint_set(wd->img, EVAS_IMAGE_SCALE_HINT_STATIC);
 * @endcode
 *
 * Finally, movement of opaque images through the canvas is less
 * expensive than of translucid ones, because of blending
 * computations.
 *
 * @section Evas_Object_Image_Borders Borders
 *
 * Evas provides facilities for one to specify an image's region to be
 * treated specially -- as "borders". This will make those regions be
 * treated specially on resizing scales, by keeping their aspect. This
 * makes setting frames around other objects on UIs easy.
 * See the following figures for a visual explanation:\n
 * @image rtf image-borders.png
 * @image html image-borders.png
 * @image latex image-borders.eps width=\textwidth
 * @image rtf border-effect.png
 * @image html border-effect.png
 * @image latex border-effect.eps width=\textwidth
 *
 * @section Evas_Object_Image_Manipulation Manipulating pixels
 *
 * Evas image objects can be used to manipulate raw pixels in many
 * ways.  The meaning of the data in the pixel arrays will depend on
 * the image's color space, be warned (see next section). You can set
 * your own data as an image's pixel data, fetch an image's pixel data
 * for saving/altering, convert images between different color spaces
 * and even advanced operations like setting a native surface as image
 * objects' data.
 *
 * @section Evas_Object_Image_Color_Spaces Color spaces
 *
 * Image objects may return or accept "image data" in multiple
 * formats. This is based on the color space of an object. Here is a
 * rundown on formats:
 *
 * - #EVAS_COLORSPACE_ARGB8888:
 *   This pixel format is a linear block of pixels, starting at the
 *   top-left row by row until the bottom right of the image or pixel
 *   region. All pixels are 32-bit unsigned int's with the high-byte
 *   being alpha and the low byte being blue in the format ARGB. Alpha
 *   may or may not be used by evas depending on the alpha flag of the
 *   image, but if not used, should be set to 0xff anyway.
 *   \n\n
 *   This colorspace uses premultiplied alpha. That means that R, G
 *   and B cannot exceed A in value. The conversion from
 *   non-premultiplied colorspace is:
 *   \n\n
 *   R = (r * a) / 255; G = (g * a) / 255; B = (b * a) / 255;
 *   \n\n
 *   So 50% transparent blue will be: 0x80000080. This will not be
 *   "dark" - just 50% transparent. Values are 0 == black, 255 ==
 *   solid or full red, green or blue.
 * .
 * - #EVAS_COLORSPACE_YCBCR422P601_PL:
 *   This is a pointer-list indirected set of YUV (YCbCr) pixel
 *   data. This means that the data returned or set is not actual
 *   pixel data, but pointers TO lines of pixel data. The list of
 *   pointers will first be N rows of pointers to the Y plane -
 *   pointing to the first pixel at the start of each row in the Y
 *   plane. N is the height of the image data in pixels. Each pixel in
 *   the Y, U and V planes is 1 byte exactly, packed. The next N / 2
 *   pointers will point to rows in the U plane, and the next N / 2
 *   pointers will point to the V plane rows. U and V planes are half
 *   the horizontal and vertical resolution of the Y plane.
 *   \n\n
 *   Row order is top to bottom and row pixels are stored left to
 *   right.
 *   \n\n
 *   There is a limitation that these images MUST be a multiple of 2
 *   pixels in size horizontally or vertically. This is due to the U
 *   and V planes being half resolution. Also note that this assumes
 *   the itu601 YUV colorspace specification. This is defined for
 *   standard television and mpeg streams. HDTV may use the itu709
 *   specification.
 *   \n\n
 *   Values are 0 to 255, indicating full or no signal in that plane
 *   respectively.
 * .
 * - #EVAS_COLORSPACE_YCBCR422P709_PL:
 *   Not implemented yet.
 * .
 * - #EVAS_COLORSPACE_RGB565_A5P:
 *   In the process of being implemented in 1 engine only. This may
 *   change.
 *   \n\n
 *   This is a pointer to image data for 16-bit half-word pixel data
 *   in 16bpp RGB 565 format (5 bits red, 6 bits green, 5 bits blue),
 *   with the high-byte containing red and the low byte containing
 *   blue, per pixel. This data is packed row by row from the top-left
 *   to the bottom right.
 *   \n\n
 *   If the image has an alpha channel enabled there will be an extra
 *   alpha plane after the color pixel plane. If not, then this data
 *   will not exist and should not be accessed in any way. This plane
 *   is a set of pixels with 1 byte per pixel defining the alpha
 *   values of all pixels in the image from the top-left to the bottom
 *   right of the image, row by row. Even though the values of the
 *   alpha pixels can be 0 to 255, only values 0 through to 32 are
 *   used, 32 being solid and 0 being transparent.
 *   \n\n
 *   RGB values can be 0 to 31 for red and blue and 0 to 63 for green,
 *   with 0 being black and 31 or 63 being full red, green or blue
 *   respectively. This colorspace is also pre-multiplied like
 *   EVAS_COLORSPACE_ARGB8888 so:
 *   \n\n
 *   R = (r * a) / 32; G = (g * a) / 32; B = (b * a) / 32;
 * .
 * - #EVAS_COLORSPACE_GRY8:
 *   The image is just an alpha mask (8 bit's per pixel). This is used
 *   for alpha masking.
 *
 * @warning We don't guarantee any proper results if you create an Image object
 * without setting the evas engine.
 *
 * Some examples of this group of functions can be found @ref
 * Example_Evas_Images "here".
 *
 * @ingroup Evas_Object_Specific
 * @
  }
{*
 * Function signature for the evas object pixels get callback function
 * @see evas_object_image_pixels_get()
 *
 * By @a data it will be passed the private data. By @a o it will be passed the
 * Evas_Object image on which the pixels are requested.
 *
  }
type

  TEvas_Object_Image_Pixels_Get_Cb = procedure (data:pointer; o:PEvas_Object);cdecl;
{*
 * Check if a file extension may be supported by @ref Evas_Object_Image.
 *
 * @param file The file to check
 * @return @c EINA_TRUE if we may be able to open it, @c EINA_FALSE if it's
 * unlikely.
 * @since 1.1
 *
 * If file is an Eina_Stringshare, use directly @ref evas_object_image_extension_can_load_fast_get.
 *
 * This functions is threadsafe.
  }
(* Const before type ignored *)

function evas_object_image_extension_can_load_get(file:Pchar):TEina_Bool;cdecl;external;
{*
 * Check if a file extension may be supported by @ref Evas_Object_Image.
 *
 * @param file The file to check, it should be an Eina_Stringshare.
 * @return @c EINA_TRUE if we may be able to open it, @c EINA_FALSE if it's
 * unlikely.
 * @since 1.1
 *
 * This functions is threadsafe.
  }
(* Const before type ignored *)
function evas_object_image_extension_can_load_fast_get(file:Pchar):TEina_Bool;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Evas_Object_Text_Group Text Object Functions
 *
 * Functions that operate on single line, single style text objects.
 *
 * For multiline and multiple style text, see @ref Evas_Object_Textblock_Group.
 *
 * See some @ref Example_Evas_Text "examples" on this group of functions.
 *
 * @warning We don't guarantee any proper results if you create a Text object
 * without setting the evas engine.
 *
 * @ingroup Evas_Object_Specific
 * @
  }
{ basic styles (4 bits allocated use 0->10 now, 5 left)  }
const
  EVAS_TEXT_STYLE_MASK_BASIC = $f;  
{*
 * Text style type creation macro. Use style types on the 's'
 * arguments, being 'x' your style variable.
  }
{#define EVAS_TEXT_STYLE_BASIC_SET(x, s) \ }
{  do  x = ((x) & ~EVAS_TEXT_STYLE_MASK_BASIC) | (s);  while (0) }
  EVAS_TEXT_STYLE_MASK_SHADOW_DIRECTION = $7 shl 4;  
{*
 * Text style type creation macro. This one will impose shadow
 * directions on the style type variable -- use the @c
 * EVAS_TEXT_STYLE_SHADOW_DIRECTION_* values on 's', incrementally.
  }
{#define EVAS_TEXT_STYLE_SHADOW_DIRECTION_SET(x, s) \ }
{  do  x = ((x) & ~EVAS_TEXT_STYLE_MASK_SHADOW_DIRECTION) | (s);  while (0) }
{*
 * @
  }
{*
 * @defgroup Evas_Object_Textgrid_Group Textgrid Object Functions
 *
 * Textgrid objects manage chunks of text as a 2D grid of cells, each of
 * which contains a single unicode character with color and style
 * formatting information.  The object's text can be interacted with
 * character-by-character or by row.
 *
 * @todo put here some usage examples
 *
 * @since 1.7
 *
 * @ingroup Evas_Object_Specific
 *
 * @
  }
{*
 * @struct _Evas_Textgrid_Cell
 *
 * A cell contains a single unicode character, with associated formatting
 * data including style, color, and color palette.  Double-wide characters
 * are flagged to permit visually merging the cell to the right.
 *
 * @since 1.7
  }
{*< the UNICODE value of the character  }
{*< the index of the palette for the foreground color  }
{*< the index of the palette for the background color  }
{*< whether the character is bold  }
{*< whether the character is oblique  }
{*< whether the character is underlined  }
{*< whether the character is strikethrough'ed  }
{*< whether the extended palette is used for the foreground color  }
{*< whether the extended palette is used for the background color  }
{*< if the codepoint is merged with the following cell to the right visually (cells must be in pairs with 2nd cell being a duplicate in all ways except codepoint is 0)  }
type
  PEvas_Textgrid_Cell = ^TEvas_Textgrid_Cell;
  TEvas_Textgrid_Cell = record
      codepoint : TEina_Unicode;cdecl;
      fg : byte;
      bg : byte;
      flag0 : word;
    end;


const
  bm_TEvas_Textgrid_Cell_bold = $1;
  bp_TEvas_Textgrid_Cell_bold = 0;
  bm_TEvas_Textgrid_Cell_italic = $2;
  bp_TEvas_Textgrid_Cell_italic = 1;
  bm_TEvas_Textgrid_Cell_underline = $4;
  bp_TEvas_Textgrid_Cell_underline = 2;
  bm_TEvas_Textgrid_Cell_strikethrough = $8;
  bp_TEvas_Textgrid_Cell_strikethrough = 3;
  bm_TEvas_Textgrid_Cell_fg_extended = $10;
  bp_TEvas_Textgrid_Cell_fg_extended = 4;
  bm_TEvas_Textgrid_Cell_bg_extended = $20;
  bp_TEvas_Textgrid_Cell_bg_extended = 5;
  bm_TEvas_Textgrid_Cell_double_width = $40;
  bp_TEvas_Textgrid_Cell_double_width = 6;

function bold(var a : TEvas_Textgrid_Cell) : word;
procedure set_bold(var a : TEvas_Textgrid_Cell; __bold : word);
function italic(var a : TEvas_Textgrid_Cell) : word;
procedure set_italic(var a : TEvas_Textgrid_Cell; __italic : word);
function underline(var a : TEvas_Textgrid_Cell) : word;
procedure set_underline(var a : TEvas_Textgrid_Cell; __underline : word);
function strikethrough(var a : TEvas_Textgrid_Cell) : word;
procedure set_strikethrough(var a : TEvas_Textgrid_Cell; __strikethrough : word);
function fg_extended(var a : TEvas_Textgrid_Cell) : word;
procedure set_fg_extended(var a : TEvas_Textgrid_Cell; __fg_extended : word);
function bg_extended(var a : TEvas_Textgrid_Cell) : word;
procedure set_bg_extended(var a : TEvas_Textgrid_Cell; __bg_extended : word);
function double_width(var a : TEvas_Textgrid_Cell) : word;
procedure set_double_width(var a : TEvas_Textgrid_Cell; __double_width : word);
{*
 * @
  }
{*
 * @defgroup Evas_Object_Line_Group Line Object Functions
 *
 * Functions used to deal with evas line objects.
 *
 * @warning We don't guarantee any proper results if you create a Line object
 * without setting the evas engine.
 *
 * @ingroup Evas_Object_Specific
 *
  }
{*
 * @defgroup Evas_Object_Polygon Polygon Object Functions
 *
 * Functions that operate on evas polygon objects.
 *
 * Hint: as evas does not provide ellipse, smooth paths or circle, one
 * can calculate points and convert these to a polygon.
 *
 * @warning We don't guarantee any proper results if you create a Polygon
 * object without setting the evas engine.
 *
 * @ingroup Evas_Object_Specific
 *
  }
{*
 * @defgroup Evas_Smart_Group Smart Functions
 * @ingroup Evas
 *
 * Functions that deal with #Evas_Smart structs, creating definition
 * (classes) of objects that will have customized behavior for methods
 * like evas_object_move(), evas_object_resize(),
 * evas_object_clip_set() and others.
 *
 * These objects will accept the generic methods defined in @ref
 * Evas_Object_Group and the extensions defined in @ref
 * Evas_Smart_Object_Group. There are a couple of existent smart
 * objects in Evas itself (see @ref Evas_Object_Box, @ref
 * Evas_Object_Table_Group and @ref Evas_Smart_Object_Clipped).
 *
 * See also some @ref Example_Evas_Smart_Objects "examples" of this
 * group of functions.
 *
 * @
  }
{*
 * @def EVAS_SMART_CLASS_VERSION
 *
 * The version you have to put into the version field in the
 * #Evas_Smart_Class struct. Used to safeguard from binaries with old
 * smart object intefaces running with newer ones.
 *
 * @ingroup Evas_Smart_Group
  }

const
  EVAS_SMART_CLASS_VERSION = 4;  
{*
 * @struct _Evas_Smart_Class
 *
 * A smart object's @b base class definition
 *
 * @ingroup Evas_Smart_Group
  }
(* Const before type ignored *)
{*< the name string of the class  }
{*< code to be run when adding object to a canvas  }
{*< code to be run when removing object from a canvas  }
{*< code to be run when moving object on a canvas. @a x and @a y will be new coordinates one applied to the object. use evas_object_geometry_get() if you need the old values, during this call. after that, the old values will be lost.  }
{*< code to be run when resizing object on a canvas. @a w and @a h will be new dimensions one applied to the object. use evas_object_geometry_get() if you need the old values, during this call. after that, the old values will be lost.  }
{*< code to be run when showing object on a canvas  }
{*< code to be run when hiding object on a canvas  }
{*< code to be run when setting color of object on a canvas. @a r, @a g, @a b and @a a will be new color components one applied to the object. use evas_object_color_get() if you need the old values, during this call. after that, the old values will be lost.  }
{*< code to be run when setting clipper of object on a canvas. @a clip will be new clipper one applied to the object. use evas_object_clip_get() if you need the old one, during this call. after that, the old (object pointer) value will be lost.  }
{*< code to be run when unsetting clipper of object on a canvas. if you need the pointer to a previous set clipper, during this call, use evas_object_clip_get(). after that, the old (object pointer) value will be lost.  }
{*< code to be run when object has rendering updates on a canvas  }
{*< code to be run when a child member is added to object  }
{*< code to be run when a child member is removed from object  }
(* Const before type ignored *)
{*< this class inherits from this parent  }
(* Const before type ignored *)
{*< callbacks at this level, @c NULL terminated  }
(* Const before type ignored *)
{*< #Evas_Smart_Interface pointers array, @c NULL terminated. These will be the interfaces supported at this level for an object (parents may have others) @since 1.7  }
(* Const before type ignored *)
type
  PEvas_Smart_Class = ^TEvas_Smart_Class;
  TEvas_Smart_Class = record
      name : Pchar;
      version : longint;
      add : procedure (o:PEvas_Object);cdecl;
      del : procedure (o:PEvas_Object);cdecl;
      move : procedure (o:PEvas_Object; x:TEvas_Coord; y:TEvas_Coord);cdecl;
      resize : procedure (o:PEvas_Object; w:TEvas_Coord; h:TEvas_Coord);cdecl;
      show : procedure (o:PEvas_Object);cdecl;
      hide : procedure (o:PEvas_Object);cdecl;
      color_set : procedure (o:PEvas_Object; r:longint; g:longint; b:longint; a:longint);cdecl;
      clip_set : procedure (o:PEvas_Object; clip:PEvas_Object);cdecl;
      clip_unset : procedure (o:PEvas_Object);cdecl;
      calculate : procedure (o:PEvas_Object);cdecl;
      member_add : procedure (o:PEvas_Object; child:PEvas_Object);cdecl;
      member_del : procedure (o:PEvas_Object; child:PEvas_Object);cdecl;
      parent : PEvas_Smart_Class;
      callbacks : PEvas_Smart_Cb_Description;
      interfaces : ^PEvas_Smart_Interface;
      data : pointer;
    end;

{*
 * @struct _Evas_Smart_Interface
 *
 * A smart object's @b base interface definition
 *
 * Every Evas interface must have a name field, pointing to a global,
 * constant string variable. This string pointer will be the only way
 * of retrieving back a given interface from a smart object. Two
 * function pointers must be defined, too, which will be called at
 * object creation and deletion times.
 *
 * See also some @ref Example_Evas_Smart_Interfaces "examples" on
 * smart interfaces.
 *
 * @since 1.7
 *
 * @ingroup Evas_Smart_Group
  }
(* Const before type ignored *)
{*< Name of the given interface  }
{*< Size, in bytes, of the interface's private dada blob. This will be allocated and freed automatically for you. Get it with evas_object_smart_interface_data_get().  }
{*< Function to be called at object creation time. This will take place @b before the object's smart @c add() function.  }
{*< Function to be called at object deletion time. This will take place @b after the object's smart @c del() function.  }
  PEvas_Smart_Interface = ^TEvas_Smart_Interface;
  TEvas_Smart_Interface = record
      name : Pchar;
      private_size : dword;
      add : function (obj:PEvas_Object):TEina_Bool;cdecl;
      del : procedure (obj:PEvas_Object);cdecl;
    end;

{*
 * @struct _Evas_Smart_Cb_Description
 *
 * Describes a callback issued by a smart object
 * (evas_object_smart_callback_call()), as defined in its smart object
 * class. This is particularly useful to explain to end users and
 * their code (i.e., introspection) what the parameter @c event_info
 * will point to.
 *
 * @ingroup Evas_Smart_Group
  }
(* Const before type ignored *)
{*< callback name ("changed", for example)  }
{*
    * @brief Hint on the type of @c event_info parameter's contents on
    * a #Evas_Smart_Cb callback.
    *
    * The type string uses the pattern similar to
    * http://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-signatures,
    * but extended to optionally include variable names within
    * brackets preceding types. Example:
    *
    * @li Structure with two integers:
    *     @c "(ii)"
    *
    * @li Structure called 'x' with two integers named 'a' and 'b':
    *     @c "[x]([a]i[b]i)"
    *
    * @li Array of integers:
    *     @c "ai"
    *
    * @li Array called 'x' of struct with two integers:
    *     @c "[x]a(ii)"
    *
    * @note This type string is used as a hint and is @b not validated
    *       or enforced in any way. Implementors should make the best
    *       use of it to help bindings, documentation and other users
    *       of introspection features.
     }
(* Const before type ignored *)
  PEvas_Smart_Cb_Description = ^TEvas_Smart_Cb_Description;
  TEvas_Smart_Cb_Description = record
      name : Pchar;
      _type : Pchar;
    end;

{*
 * @def EVAS_SMART_CLASS_INIT_NULL
 * Initialize to zero a whole Evas_Smart_Class structure.
 *
 * @see EVAS_SMART_CLASS_INIT_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS
 * @ingroup Evas_Smart_Group
  }
{ xxxxxxxxxxxxx }
{#define EVAS_SMART_CLASS_INIT_NULL    NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL }
{*
 * @def EVAS_SMART_CLASS_INIT_VERSION
 * Initialize to zero a whole Evas_Smart_Class structure and set version.
 *
 * Similar to EVAS_SMART_CLASS_INIT_NULL, but will set version field to
 * latest EVAS_SMART_CLASS_VERSION.
 *
 * @see EVAS_SMART_CLASS_INIT_NULL
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS
 * @ingroup Evas_Smart_Group
  }
{ xxxxxxxxxxxxxxxxxxxxxxxxx }
{#define EVAS_SMART_CLASS_INIT_VERSION NULL, EVAS_SMART_CLASS_VERSION, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL }
{*
 * @def EVAS_SMART_CLASS_INIT_NAME_VERSION
 * Initialize to zero a whole Evas_Smart_Class structure and set name
 * and version.
 *
 * Similar to EVAS_SMART_CLASS_INIT_NULL, but will set version field to
 * latest EVAS_SMART_CLASS_VERSION and name to the specified value.
 *
 * It will keep a reference to name field as a "const char *", that is,
 * name must be available while the structure is used (hint: static or global!)
 * and will not be modified.
 *
 * @see EVAS_SMART_CLASS_INIT_NULL
 * @see EVAS_SMART_CLASS_INIT_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS
 * @ingroup Evas_Smart_Group
  }
{ xxxxxxxxxxxxxxx }
{#define EVAS_SMART_CLASS_INIT_NAME_VERSION(name)                                     name, EVAS_SMART_CLASS_VERSION, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL }
{*
 * @def EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT
 * Initialize to zero a whole Evas_Smart_Class structure and set name,
 * version and parent class.
 *
 * Similar to EVAS_SMART_CLASS_INIT_NULL, but will set version field to
 * latest EVAS_SMART_CLASS_VERSION, name to the specified value and
 * parent class.
 *
 * It will keep a reference to name field as a "const char *", that is,
 * name must be available while the structure is used (hint: static or global!)
 * and will not be modified. Similarly, parent reference will be kept.
 *
 * @see EVAS_SMART_CLASS_INIT_NULL
 * @see EVAS_SMART_CLASS_INIT_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS
 * @ingroup Evas_Smart_Group
  }
{xxxxxxxxxxxxxxxx }
{#define EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT(name, parent)                      name, EVAS_SMART_CLASS_VERSION, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, parent, NULL, NULL }
{*
 * @def EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS
 * Initialize to zero a whole Evas_Smart_Class structure and set name,
 * version, parent class and callbacks definition.
 *
 * Similar to EVAS_SMART_CLASS_INIT_NULL, but will set version field to
 * latest EVAS_SMART_CLASS_VERSION, name to the specified value, parent
 * class and callbacks at this level.
 *
 * It will keep a reference to name field as a "const char *", that is,
 * name must be available while the structure is used (hint: static or global!)
 * and will not be modified. Similarly, parent and callbacks reference
 * will be kept.
 *
 * @see EVAS_SMART_CLASS_INIT_NULL
 * @see EVAS_SMART_CLASS_INIT_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT
 * @ingroup Evas_Smart_Group
  }
{ xxxxxxxxxxxxxxxxx }
{#define EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS(name, parent, callbacks) name, EVAS_SMART_CLASS_VERSION, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, parent, callbacks, NULL }
{*
 * @def EVAS_SMART_SUBCLASS_NEW
 *
 * Convenience macro to subclass a given Evas smart class.
 *
 * @param smart_name The name used for the smart class. e.g:
 * @c "Evas_Object_Box".
 * @param prefix Prefix used for all variables and functions defined
 * and referenced by this macro.
 * @param api_type Type of the structure used as API for the smart
 * class. Either #Evas_Smart_Class or something derived from it.
 * @param parent_type Type of the parent class API.
 * @param parent_func Function that gets the parent class. e.g:
 * evas_object_box_smart_class_get().
 * @param cb_desc Array of callback descriptions for this smart class.
 *
 * This macro saves some typing when writing a smart class derived
 * from another one. In order for this to work, the user @b must provide some
 * functions adhering to the following guidelines:
 *  - @<prefix@>_smart_set_user(): the @b internal @c _smart_set
 *    function (defined by this macro) will call this one, provided by
 *    the user, after inheriting everything from the parent, which
 *    should <b>take care of setting the right member functions for
 *    the class</b>, both overrides and extensions, if any.
 *  - If this new class should be subclassable as well, a @b public
 *    @c _smart_set() function is desirable to fill in the class used as
 *    parent by the children. It's up to the user to provide this
 *    interface, which will most likely call @<prefix@>_smart_set() to
 *    get the job done.
 *
 * After the macro's usage, the following will be defined for use:
 *  - @<prefix@>_parent_sc: A pointer to the @b parent smart
 *    class. When calling parent functions from overloaded ones, use
 *    this global variable.
 *  - @<prefix@>_smart_class_new(): this function returns the
 *    #Evas_Smart needed to create smart objects with this class,
 *    which should be passed to evas_object_smart_add().
 *
 * @warning @p smart_name has to be a pointer to a globally available
 * string! The smart class created here will just have a pointer set
 * to that, and all object instances will depend on it for smart class
 * name lookup.
 *
 * @ingroup Evas_Smart_Group
  }
{*
 * @def EVAS_SMART_SUBCLASS_IFACE_NEW
 *
 * @since 1.7
 *
 * Convenience macro to subclass a given Evas smart class. This is the
 * same as #EVAS_SMART_SUBCLASS_NEW, but now <b>declaring smart
 * interfaces</b> besides the smart callbacks.
 *
 * @param smart_name The name used for the smart class. e.g:
 *                   @c "Evas_Object_Box".
 * @param prefix Prefix used for all variables and functions defined
 *               and referenced by this macro.
 * @param api_type Type of the structure used as API for the smart
 *                 class. Either #Evas_Smart_Class or something
 *                 derived from it.
 * @param parent_type Type of the parent class API.
 * @param parent_func Function that gets the parent class. e.g:
 *                    evas_object_box_smart_class_get().
 * @param cb_desc Array of smart callback descriptions for this smart
 *                class.
 * @param ifaces Array of Evas smart interafaces for this smart
 *               class.
 *
 * This macro saves some typing when writing a smart class derived
 * from another one. In order for this to work, the user @b must provide some
 * functions adhering to the following guidelines:
 *  - @<prefix@>_smart_set_user(): the @b internal @c _smart_set
 *    function (defined by this macro) will call this one, provided by
 *    the user, after inheriting everything from the parent, which
 *    should <b>take care of setting the right member functions for
 *    the class</b>, both overrides and extensions, if any.
 *  - If this new class should be subclassable as well, a @b public
 *    @c _smart_set() function is desirable to fill in the class used as
 *    parent by the children. It's up to the user to provide this
 *    interface, which will most likely call @<prefix@>_smart_set() to
 *    get the job done.
 *
 * After the macro's usage, the following will be defined for use:
 *  - @<prefix@>_parent_sc: A pointer to the @b parent smart
 *    class. When calling parent functions from overloaded ones, use
 *    this global variable.
 *  - @<prefix@>_smart_class_new(): this function returns the
 *    #Evas_Smart needed to create smart objects with this class,
 *    which should be passed to evas_object_smart_add().
 *
 * @warning @p smart_name has to be a pointer to a globally available
 * string! The smart class created here will just have a pointer set
 * to that, and all object instances will depend on it for smart class
 * name lookup.
 *
 * @ingroup Evas_Smart_Group
  }
{*
 * Free an #Evas_Smart struct
 *
 * @param s the #Evas_Smart struct to free
 *
 * @warning If this smart handle was created using
 * evas_smart_class_new(), the associated #Evas_Smart_Class will not
 * be freed.
 *
 * @note If you're using the #EVAS_SMART_SUBCLASS_NEW schema to create your
 * smart object, note that an #Evas_Smart handle will be shared amongst all
 * instances of the given smart class, through a static variable.
 * Evas will internally count references on #Evas_Smart handles and free them
 * when they are not referenced anymore. Thus, this function is of no use
 * for Evas users, most probably.
  }

procedure evas_smart_free(s:PEvas_Smart);cdecl;external;
{*
 * Creates a new #Evas_Smart from a given #Evas_Smart_Class struct
 *
 * @param sc the smart class definition
 * @return a new #Evas_Smart pointer
 *
 * #Evas_Smart handles are necessary to create new @b instances of
 * smart objects belonging to the class described by @p sc. That
 * handle will contain, besides the smart class interface definition,
 * all its smart callbacks infrastructure set, too.
 *
 * @note If you are willing to subclass a given smart class to
 * construct yours, consider using the #EVAS_SMART_SUBCLASS_NEW macro,
 * which will make use of this function automatically for you.
  }
(* Const before type ignored *)
function evas_smart_class_new(sc:PEvas_Smart_Class):PEvas_Smart;cdecl;external;
{*
 * Get the #Evas_Smart_Class handle of an #Evas_Smart struct
 *
 * @param s a valid #Evas_Smart pointer
 * @return the #Evas_Smart_Class in it
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evas_smart_class_get(s:PEvas_Smart):PEvas_Smart_Class;cdecl;external;
{*
 * @brief Get the data pointer set on an #Evas_Smart struct
 *
 * @param s a valid #Evas_Smart handle
 *
 * This data pointer is set as the data field in the #Evas_Smart_Class
 * passed in to evas_smart_class_new().
  }
(* Const before type ignored *)
function evas_smart_data_get(s:PEvas_Smart):pointer;cdecl;external;
{*
 * Get the smart callbacks known by this #Evas_Smart handle's smart
 * class hierarchy.
 *
 * @param s A valid #Evas_Smart handle.
 * @param[out] count Returns the number of elements in the returned
 * array.
 *
 * @return The array with callback descriptions known by this smart
 *         class, with its size returned in @a count parameter. It
 *         should not be modified in any way. If no callbacks are
 *         known, @c NULL is returned. The array is sorted by event
 *         names and elements refer to the original values given to
 *         evas_smart_class_new()'s Evas_Smart_Class::callbacks
 *         (pointer to them).
 *
 * This is likely different from
 * evas_object_smart_callbacks_descriptions_get() as it will contain
 * the callbacks of @b all this class hierarchy sorted, while the
 * direct smart class member refers only to that specific class and
 * should not include parent's.
 *
 * If no callbacks are known, this function returns @c NULL.
 *
 * The array elements and thus their contents will be @b references to
 * original values given to evas_smart_class_new() as
 * Evas_Smart_Class::callbacks.
 *
 * The array is sorted by Evas_Smart_Cb_Description::name. The last
 * array element is a @c NULL pointer and is not accounted for in @a
 * count. Loop iterations can check any of these size indicators.
 *
 * @note objects may provide per-instance callbacks, use
 *       evas_object_smart_callbacks_descriptions_get() to get those
 *       as well.
 * @see evas_object_smart_callbacks_descriptions_get()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evas_smart_callbacks_descriptions_get(s:PEvas_Smart; count:Pdword):^PEvas_Smart_Cb_Description;cdecl;external;
{*
 * Find a callback description for the callback named @a name.
 *
 * @param s The #Evas_Smart where to search for class registered smart
 * event callbacks.
 * @param name Name of the desired callback, which must @b not be @c
 *        NULL. The search has a special case for @a name being the
 *        same pointer as registered with #Evas_Smart_Cb_Description.
 *        One can use it to avoid excessive use of strcmp().
 * @return A reference to the description if found, or @c NULL, otherwise
 *
 * @see evas_smart_callbacks_descriptions_get()
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function evas_smart_callback_description_find(s:PEvas_Smart; name:Pchar):PEvas_Smart_Cb_Description;cdecl;external;
{*
 * Sets one class to inherit from the other.
 *
 * Copy all function pointers, set @c parent to @a parent_sc and copy
 * everything after sizeof(Evas_Smart_Class) present in @a parent_sc,
 * using @a parent_sc_size as reference.
 *
 * This is recommended instead of a single memcpy() since it will take
 * care to not modify @a sc name, version, callbacks and possible
 * other members.
 *
 * @param sc child class.
 * @param parent_sc parent class, will provide attributes.
 * @param parent_sc_size size of parent_sc structure, child should be at least
 *        this size. Everything after @c Evas_Smart_Class size is copied
 *        using regular memcpy().
  }
(* Const before type ignored *)
function evas_smart_class_inherit_full(sc:PEvas_Smart_Class; parent_sc:PEvas_Smart_Class; parent_sc_size:dword):TEina_Bool;cdecl;external;
{*
 * Get the number of uses of the smart instance
 *
 * @param s The Evas_Smart to get the usage count of
 * @return The number of uses of the smart instance
 *
 * This function tells you how many more uses of the smart instance are in
 * existence. This should be used before freeing/clearing any of the
 * Evas_Smart_Class that was used to create the smart instance. The smart
 * instance will refer to data in the Evas_Smart_Class used to create it and
 * thus you cannot remove the original data until all users of it are gone.
 * When the usage count goes to 0, you can evas_smart_free() the smart
 * instance @p s and remove from memory any of the Evas_Smart_Class that
 * was used to create the smart instance, if you desire. Removing it from
 * memory without doing this will cause problems (crashes, undefined
 * behavior, etc.), so either never remove the original
 * Evas_Smart_Class data from memory (have it be a constant structure and
 * data), or use this API call and be very careful.
  }
(* Const before type ignored *)
function evas_smart_usage_get(s:PEvas_Smart):longint;cdecl;external;
{*
 * @def evas_smart_class_inherit
 * Easy to use version of evas_smart_class_inherit_full().
 *
 * This version will use sizeof(parent_sc), copying everything.
 *
 * @param sc child class, will have methods copied from @a parent_sc
 * @param parent_sc parent class, will provide contents to be copied.
 * @return 1 on success, 0 on failure.
 * @ingroup Evas_Smart_Group
  }
{#define evas_smart_class_inherit(sc, parent_sc) evas_smart_class_inherit_full(sc, (Evas_Smart_Class *)parent_sc, sizeof(*parent_sc)) }
{*
 * @
  }
{*
 * @defgroup Evas_Smart_Object_Group Smart Object Functions
 * @ingroup Evas
 *
 * Functions dealing with Evas smart objects (instances).
 *
 * Smart objects are groupings of primitive Evas objects that behave
 * as a cohesive group. For instance, a file manager icon may be a
 * smart object composed of an image object, a text label and two
 * rectangles that appear behind the image and text when the icon is
 * selected. As a smart object, the normal Evas object API could be
 * used on the icon object.
 *
 * Besides that, generally smart objects implement a <b>specific
 * API</b>, so that users interact with its own custom features. The
 * API takes form of explicit exported functions one may call and
 * <b>smart callbacks</b>.
 *
 * @section Evas_Smart_Object_Group_Callbacks Smart events and callbacks
 *
 * Smart objects can elect events (smart events, from now on) occurring
 * inside of them to be reported back to their users via callback
 * functions (smart callbacks). This way, you can extend Evas' own
 * object events. They are defined by an <b>event string</b> that
 * identifies them uniquely. There's also a function prototype
 * definition for the callback functions: #Evas_Smart_Cb.
 *
 * When defining an #Evas_Smart_Class, smart object implementors are
 * strongly encouraged to properly set the Evas_Smart_Class::callbacks
 * callbacks description array, so that the users of the smart object
 * can have introspection on its events API <b>at run time</b>.
 *
 * See some @ref Example_Evas_Smart_Objects "examples" of this group
 * of functions.
 *
 * @see @ref Evas_Smart_Group for class definitions.
  }
{*
 * @addtogroup Evas_Smart_Object_Group
 * @
  }
{*
 * Registers an object type and its associated class. LEGACY MECHANISM SUPPORT.
 *
 * This function is invoked in the class constructor of smart classes. It will
 * add the type and the class into a hash table that will then be used to check
 * the type of an object.
 * This function has been implemented to support legacy mechanism that checks
 * objects types by name.
 * USE IT ONLY FOR LEGACY SUPPORT.
 * Otherwise, it is HIGHLY recommended to use efl_isa.
 *
 * @param type The type (name string) to add.
 * @param klass The class to associate to the type.
 *
 * @see efl_isa
 *
 * @ingroup Evas_Smart_Object_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure evas_smart_legacy_type_register(_type:Pchar; klass:PEfl_Class);cdecl;external;
{*
 * @
  }
{*
 * @defgroup Evas_Smart_Object_Clipped Clipped Smart Object
 *
 * Clipped smart object is a base to construct other smart objects
 * based on the concept of having an internal clipper that is applied
 * to all children objects. This clipper will control the visibility,
 * clipping and color of sibling objects (remember that the clipping
 * is recursive, and clipper color modulates the color of its
 * clippees). By default, this base will also move children relative
 * to the parent, and delete them when parent is deleted. In other
 * words, it is the base for simple object grouping.
 *
 * See some @ref Example_Evas_Smart_Objects "examples" of this group
 * of functions.
 *
 * @see evas_object_smart_clipped_smart_set()
 *
 * @ingroup Evas_Smart_Object_Group
 *
 * @
  }
{*
 * Every subclass should provide this at the beginning of their own
 * data set with evas_object_smart_data_set().
  }
type
  PEvas_Object_Smart_Clipped_Data = ^TEvas_Object_Smart_Clipped_Data;
  TEvas_Object_Smart_Clipped_Data = record
      clipper : PEvas_Object;
      evas : PEvas;
    end;

{*
 * Set a given smart class' callbacks so it implements the <b>clipped smart
 * object"</b>'s interface.
 *
 * @param sc The smart class handle to operate on
 *
 * This call will assign all the required methods of the @p sc
 * #Evas_Smart_Class instance to the implementations set for clipped
 * smart objects. If one wants to "subclass" it, call this function
 * and then override desired values. If one wants to call any original
 * method, save it somewhere. Example:
 *
 * @code
 * static Evas_Smart_Class parent_sc = EVAS_SMART_CLASS_INIT_NULL;
 *
 * static void my_class_smart_add(Evas_Object *o)
 * 
 *    parent_sc.add(o);
 *    evas_object_color_set(evas_object_smart_clipped_clipper_get(o),
 *                          255, 0, 0, 255);
 * 
 *
 * Evas_Smart_Class *my_class_new(void)
 * 
 *    static Evas_Smart_Class sc = EVAS_SMART_CLASS_INIT_NAME_VERSION("MyClass");
 *    if (!parent_sc.name)
 *      
 *         evas_object_smart_clipped_smart_set(&sc);
 *         parent_sc = sc;
 *         sc.add = my_class_smart_add;
 *      
 *    return &sc;
 * 
 * @endcode
 *
 * Default behavior for each of #Evas_Smart_Class functions on a
 * clipped smart object are:
 * - @c add: creates a hidden clipper with "infinite" size, to clip
 *    any incoming members;
 * - @c del: delete all children objects;
 * - @c move: move all objects relative relatively;
 * - @c resize: <b>not defined</b>;
 * - @c show: if there are children objects, show clipper;
 * - @c hide: hides clipper;
 * - @c color_set: set the color of clipper;
 * - @c clip_set: set clipper of clipper;
 * - @c clip_unset: unset the clipper of clipper;
 *
 * @note There are other means of assigning parent smart classes to
 * child ones, like the #EVAS_SMART_SUBCLASS_NEW macro or the
 * evas_smart_class_inherit_full() function.
  }

procedure evas_object_smart_clipped_smart_set(sc:PEvas_Smart_Class);cdecl;external;
{*
 * Get a pointer to the <b>clipped smart object's</b> class, to use
 * for proper inheritance
 *
 * @see #Evas_Smart_Object_Clipped for more information on this smart
 * class
  }
(* Const before type ignored *)
function evas_object_smart_clipped_class_get:PEvas_Smart_Class;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Evas_Object_Box_Group Box Smart Object
 *
 * A box is a convenience smart object that packs children inside it
 * in @b sequence, using a layouting function specified by the
 * user. There are a couple of pre-made layouting functions <b>built-in
 * in Evas</b>, all of them using children size hints to define their
 * size and alignment inside their cell space.
 *
 * Examples on this smart object's usage:
 * - @ref Example_Evas_Box
 * - @ref Example_Evas_Size_Hints
 *
 * @see @ref Evas_Object_Group_Size_Hints
 *
 * @ingroup Evas_Smart_Object_Group
 *
 * @
  }
{*
 * @typedef Evas_Object_Box_Api
 *
 * Smart class extension, providing extra box object requirements.
 *
 * @ingroup Evas_Object_Box_Group
  }
type
{*
 * @typedef Evas_Object_Box_Data
 *
 * Smart object instance data, providing box object requirements.
 *
 * @ingroup Evas_Object_Box_Group
  }
{*
 * @typedef Evas_Object_Box_Option
 *
 * The base structure for a box option. Box options are a way of
 * extending box items properties, which will be taken into account
 * for layouting decisions. The box layouting functions provided by
 * Evas will only rely on objects' canonical size hints to layout
 * them, so the basic box option has @b no (custom) property set.
 *
 * Users creating their own layouts, but not depending on extra child
 * items' properties, would be fine just using
 * evas_object_box_layout_set(). But if one desires a layout depending
 * on extra child properties, he/she has to @b subclass the box smart
 * object. Thus, by using evas_object_box_smart_class_get() and
 * evas_object_box_smart_set(), the @c option_new() and @c
 * option_free() smart class functions should be properly
 * redefined/extended.
 *
 * Object properties are bound to an integer identifier and must have
 * a name string. Their values are open to any data. See the API on
 * option properties for more details.
 *
 * @ingroup Evas_Object_Box_Group
  }
{*
 * @typedef Evas_Object_Box_Layout
 *
 * Function signature for an Evas box object layouting routine. By
 * @a o it will be passed the box object in question, by @a priv it will
 * be passed the box's internal data and, by @a user_data, it will be
 * passed any custom data one could have set to a given box layouting
 * function, with evas_object_box_layout_set().
 *
 * @ingroup Evas_Object_Box_Group
  }

  TEvas_Object_Box_Layout = procedure (o:PEvas_Object; priv:PEvas_Object_Box_Data; user_data:pointer);cdecl;
{*
 * @def EVAS_OBJECT_BOX_API_VERSION
 *
 * Current version for Evas box object smart class, a value that goes
 * to _Evas_Object_Box_Api::version.
 *
 * @ingroup Evas_Object_Box_Group
  }

const
  EVAS_OBJECT_BOX_API_VERSION = 1;  
{*
 * @struct _Evas_Object_Box_Api
 *
 * This structure should be used by any smart class inheriting from
 * the box's one, to provide custom box behavior that could not be
 * achieved only by providing a layout function, with
 * evas_object_box_layout_set().
 *
 * @extends Evas_Smart_Class
 * @ingroup Evas_Object_Box_Group
  }
{*< Base smart class struct, need for all smart objects  }
{*< Version of this smart class definition  }
{*< Smart function to append child elements in boxes  }
{*< Smart function to prepend child elements in boxes  }
(* Const before type ignored *)
{*< Smart function to insert a child element before another in boxes  }
(* Const before type ignored *)
{*< Smart function to insert a child element after another in boxes  }
{*< Smart function to insert a child element at a given position on boxes  }
{*< Smart function to remove a child element from boxes  }
{*< Smart function to remove a child element from boxes, by its position  }
{*< Smart function to set a custom property on a box child  }
(* Const before type ignored *)
{*< Smart function to retrieve a custom property from a box child  }
(* Const before type ignored *)
(* Const before type ignored *)
{*< Smart function to get the name of a custom property of box children  }
(* Const before type ignored *)
(* Const before type ignored *)
{*< Smart function to get the numerical ID of a custom property of box children  }
{*< Smart function to create a new box option struct  }
{*< Smart function to delete a box option struct  }
type
  PEvas_Object_Box_Api = ^TEvas_Object_Box_Api;
  TEvas_Object_Box_Api = record
      base : TEvas_Smart_Class;cdecl;
      version : longint;
      append : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object):PEvas_Object_Box_Option;cdecl;
      prepend : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object):PEvas_Object_Box_Option;cdecl;
      insert_before : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object; reference:PEvas_Object):PEvas_Object_Box_Option;cdecl;
      insert_after : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object; reference:PEvas_Object):PEvas_Object_Box_Option;cdecl;
      insert_at : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object; pos:dword):PEvas_Object_Box_Option;cdecl;
      remove : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object):PEvas_Object;cdecl;
      remove_at : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; pos:dword):PEvas_Object;cdecl;
      property_set : function (o:PEvas_Object; opt:PEvas_Object_Box_Option; _property:longint; args:Tva_list):TEina_Bool;cdecl;
      property_get : function (o:PEvas_Object; opt:PEvas_Object_Box_Option; _property:longint; args:Tva_list):TEina_Bool;cdecl;
      property_name_get : function (o:PEvas_Object; _property:longint):Pchar;cdecl;
      property_id_get : function (o:PEvas_Object; name:Pchar):longint;cdecl;
      option_new : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object):PEvas_Object_Box_Option;cdecl;
      option_free : procedure (o:PEvas_Object; priv:PEvas_Object_Box_Data; opt:PEvas_Object_Box_Option);cdecl;
    end;

{*
 * @def EVAS_OBJECT_BOX_API_INIT
 *
 * Initializer for a whole #Evas_Object_Box_Api structure, with
 * @c NULL values on its specific fields.
 *
 * @param smart_class_init initializer to use for the "base" field
 * (#Evas_Smart_Class).
 *
 * @see EVAS_SMART_CLASS_INIT_NULL
 * @see EVAS_SMART_CLASS_INIT_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT_NULL
 * @see EVAS_OBJECT_BOX_API_INIT_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT_NAME_VERSION
 * @ingroup Evas_Object_Box_Group
  }
{ xxxxxxxxxxxxx }
{#define EVAS_OBJECT_BOX_API_INIT(smart_class_init) smart_class_init, EVAS_OBJECT_BOX_API_VERSION, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL }
{*
 * @def EVAS_OBJECT_BOX_API_INIT_NULL
 *
 * Initialize to zero out a whole #Evas_Object_Box_Api structure.
 *
 * @see EVAS_OBJECT_BOX_API_INIT_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT_NAME_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT
 * @ingroup Evas_Object_Box_Group
  }

{ was #define dname def_expr }
function EVAS_OBJECT_BOX_API_INIT_NULL : longint; { return type might be wrong }

{*
 * @def EVAS_OBJECT_BOX_API_INIT_VERSION
 *
 * Initialize to zero out a whole #Evas_Object_Box_Api structure and
 * set a specific version on it.
 *
 * This is similar to #EVAS_OBJECT_BOX_API_INIT_NULL, but it will set
 * the version field of #Evas_Smart_Class (base field) to the latest
 * #EVAS_SMART_CLASS_VERSION.
 *
 * @see EVAS_OBJECT_BOX_API_INIT_NULL
 * @see EVAS_OBJECT_BOX_API_INIT_NAME_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT
 * @ingroup Evas_Object_Box_Group
  }
{ was #define dname def_expr }
function EVAS_OBJECT_BOX_API_INIT_VERSION : longint; { return type might be wrong }

{*
 * @def EVAS_OBJECT_BOX_API_INIT_NAME_VERSION
 *
 * Initialize to zero out a whole #Evas_Object_Box_Api structure and
 * set its name and version.
 *
 * This is similar to #EVAS_OBJECT_BOX_API_INIT_NULL, but it will also
 * set the version field of #Evas_Smart_Class (base field) to the
 * latest #EVAS_SMART_CLASS_VERSION and name it to the specific value.
 *
 * It will keep a reference to the name field as a <c>"const char *"</c>,
 * i.e., the name must be available while the structure is
 * used (hint: static or global variable!) and must not be modified.
 *
 * @see EVAS_OBJECT_BOX_API_INIT_NULL
 * @see EVAS_OBJECT_BOX_API_INIT_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT
 * @ingroup Evas_Object_Box_Group
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVAS_OBJECT_BOX_API_INIT_NAME_VERSION(name : longint) : longint;

{*
 * @struct _Evas_Object_Box_Data
 *
 * This structure augments clipped smart object's instance data,
 * providing extra members required by generic box implementation. If
 * a subclass inherits from #Evas_Object_Box_Api, then it may augment
 * #Evas_Object_Box_Data to fit its own needs.
 *
 * @extends Evas_Object_Smart_Clipped_Data
 * @ingroup Evas_Object_Box_Group
  }
(* Const before type ignored *)
type
  PEvas_Object_Box_Data = ^TEvas_Object_Box_Data;
  TEvas_Object_Box_Data = record
      base : TEvas_Object_Smart_Clipped_Data;
      api : PEvas_Object_Box_Api;
      align : record
          h : Tdouble;
          v : Tdouble;
        end;
      pad : record
          h : TEvas_Coord;
          v : TEvas_Coord;
        end;
      children : PEina_List;
      layout : record
          cb : TEvas_Object_Box_Layout;
          data : pointer;
          free_data : procedure (data:pointer);cdecl;
        end;
      flag0 : word;
    end;


const
  bm_TEvas_Object_Box_Data_layouting = $1;
  bp_TEvas_Object_Box_Data_layouting = 0;
  bm_TEvas_Object_Box_Data_children_changed = $2;
  bp_TEvas_Object_Box_Data_children_changed = 1;

function layouting(var a : TEvas_Object_Box_Data) : TEina_Bool;
procedure set_layouting(var a : TEvas_Object_Box_Data; __layouting : TEina_Bool);
function children_changed(var a : TEvas_Object_Box_Data) : TEina_Bool;
procedure set_children_changed(var a : TEvas_Object_Box_Data; __children_changed : TEina_Bool);
{*< Pointer to the box child object, itself  }
type
  PEvas_Object_Box_Option = ^TEvas_Object_Box_Option;
  TEvas_Object_Box_Option = record
      obj : PEvas_Object;
      flag0 : word;
      alloc_size : TEvas_Coord;
    end;


const
  bm_TEvas_Object_Box_Option_max_reached = $1;
  bp_TEvas_Object_Box_Option_max_reached = 0;
  bm_TEvas_Object_Box_Option_min_reached = $2;
  bp_TEvas_Object_Box_Option_min_reached = 1;

function max_reached(var a : TEvas_Object_Box_Option) : TEina_Bool;
procedure set_max_reached(var a : TEvas_Object_Box_Option; __max_reached : TEina_Bool);
function min_reached(var a : TEvas_Object_Box_Option) : TEina_Bool;
procedure set_min_reached(var a : TEvas_Object_Box_Option; __min_reached : TEina_Bool);
{*< #Evas_Object_Box_Option struct fields  }
{*
 * Set the default box @a api struct (Evas_Object_Box_Api)
 * with the default values. May be used to extend that API.
 *
 * @param api The box API struct to set back, most probably with
 * overridden fields (on class extensions scenarios)
  }

procedure evas_object_box_smart_set(api:PEvas_Object_Box_Api);cdecl;external;
{*
 * Get the Evas box smart class, for inheritance purposes.
 *
 * @return the (canonical) Evas box smart class.
 *
 * The returned value is @b not to be modified, just use it as your
 * parent class.
  }
(* Const before type ignored *)
function evas_object_box_smart_class_get:PEvas_Object_Box_Api;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Evas_Object_Table_Group Table Smart Object.
 *
 * Convenience smart object that packs children using a tabular
 * layout using children size hints to define their size and
 * alignment inside their cell space.
 *
 * @ref tutorial_table shows how to use this Evas_Object.
 *
 * @see @ref Evas_Object_Group_Size_Hints
 *
 * @ingroup Evas_Smart_Object_Group
 *
  }
{*
 * @defgroup Evas_Object_Grid_Group Grid Smart Object.
 *
 * Convenience smart object that packs children under a regular grid
 * layout, using their virtual grid location and size to determine
 * children's positions inside the grid object's area.
 *
 * @ingroup Evas_Smart_Object_Group
 * @since 1.1
  }
{*
 * @defgroup Evas_Cserve Shared Image Cache Server
 * @ingroup Evas
 *
 * Evas has an (optional) module that provides client-server
 * infrastructure to <b>share bitmaps across multiple processes</b>,
 * saving data and processing power.
 *
 * Be warned that it @b doesn't work when <b>threaded image
 * preloading</b> is enabled for Evas, though.
  }
type
{*
 * Statistics about the server that shares cached bitmaps.
 * @ingroup Evas_Cserve
  }
{*< current amount of saved memory, in bytes  }
{*< current amount of wasted memory, in bytes  }
{*< peak amount of saved memory, in bytes  }
{*< peak amount of wasted memory, in bytes  }
{*< time, in seconds, saved in header loads by sharing cached loads instead  }
{*< time, in seconds, saved in data loads by sharing cached loads instead  }
  PEvas_Cserve_Stats = ^TEvas_Cserve_Stats;
  TEvas_Cserve_Stats = record
      saved_memory : longint;
      wasted_memory : longint;
      saved_memory_peak : longint;
      wasted_memory_peak : longint;
      saved_time_image_header_load : Tdouble;
      saved_time_image_data_load : Tdouble;
    end;

{*
 * A handle of a cache of images shared by a server.
 * @ingroup Evas_Cserve
  }
  PEvas_Cserve_Image_Cache = ^TEvas_Cserve_Image_Cache;
  TEvas_Cserve_Image_Cache = record
      active : record
          mem_total : longint;
          count : longint;
        end;
      cached : record
          mem_total : longint;
          count : longint;
        end;
      images : PEina_List;
    end;

{*
 * A handle to an image shared by a server.
 * @ingroup Evas_Cserve
  }
(* Const before type ignored *)
  PEvas_Cserve_Image = ^TEvas_Cserve_Image;
  TEvas_Cserve_Image = record
      file : Pchar;
      key : Pchar;
      w : longint;
      h : longint;
      file_mod_time : Ttime_t;
      file_checked_time : Ttime_t;
      cached_time : Ttime_t;
      refcount : longint;
      data_refcount : longint;
      memory_footprint : longint;
      head_load_time : Tdouble;
      data_load_time : Tdouble;
      flag0 : word;
    end;


const
  bm_TEvas_Cserve_Image_alpha = $1;
  bp_TEvas_Cserve_Image_alpha = 0;
  bm_TEvas_Cserve_Image_data_loaded = $2;
  bp_TEvas_Cserve_Image_data_loaded = 1;
  bm_TEvas_Cserve_Image_active = $4;
  bp_TEvas_Cserve_Image_active = 2;
  bm_TEvas_Cserve_Image_dead = $8;
  bp_TEvas_Cserve_Image_dead = 3;
  bm_TEvas_Cserve_Image_useless = $10;
  bp_TEvas_Cserve_Image_useless = 4;

function alpha(var a : TEvas_Cserve_Image) : TEina_Bool;
procedure set_alpha(var a : TEvas_Cserve_Image; __alpha : TEina_Bool);
function data_loaded(var a : TEvas_Cserve_Image) : TEina_Bool;
procedure set_data_loaded(var a : TEvas_Cserve_Image; __data_loaded : TEina_Bool);
function active(var a : TEvas_Cserve_Image) : TEina_Bool;
procedure set_active(var a : TEvas_Cserve_Image; __active : TEina_Bool);
function dead(var a : TEvas_Cserve_Image) : TEina_Bool;
procedure set_dead(var a : TEvas_Cserve_Image; __dead : TEina_Bool);
function useless(var a : TEvas_Cserve_Image) : TEina_Bool;
procedure set_useless(var a : TEvas_Cserve_Image; __useless : TEina_Bool);
{*
 * Configuration that controls the server that shares cached bitmaps.
 * @ingroup Evas_Cserve
  }
type
  PEvas_Cserve_Config = ^TEvas_Cserve_Config;
  TEvas_Cserve_Config = record
      cache_max_usage : longint;
      cache_item_timeout : longint;
      cache_item_timeout_check : longint;
    end;

{*
 * Retrieves if the system wants to share bitmaps using the server.
 * @return @c EINA_TRUE if it wants, @c EINA_FALSE otherwise.
 * @ingroup Evas_Cserve
  }

function evas_cserve_want_get:TEina_Bool;cdecl;external;
{*
 * Retrieves if the system is connected to the server used to share
 * bitmaps.
 *
 * @return @c EINA_TRUE if it's connected, @c EINA_FALSE otherwise.
 * @ingroup Evas_Cserve
  }
function evas_cserve_connected_get:TEina_Bool;cdecl;external;
{*
 * Retrieves statistics from a running bitmap sharing server.
 * @param stats pointer to structure to fill with statistics about the
 *        bitmap cache server.
 *
 * @return @c EINA_TRUE if @p stats were filled with data,
 *         @c EINA_FALSE otherwise (when @p stats is untouched)
 * @ingroup Evas_Cserve
  }
function evas_cserve_stats_get(stats:PEvas_Cserve_Stats):TEina_Bool;cdecl;external;
{*
 * Completely discard/clean a given images cache, thus re-setting it.
 *
 * @param cache A handle to the given images cache.
  }
procedure evas_cserve_image_cache_contents_clean(cache:PEvas_Cserve_Image_Cache);cdecl;external;
{*
 * Retrieves the current configuration of the Evas image caching
 * server.
 *
 * @param config where to store current image caching server's
 * configuration.
 *
 * @return @c EINA_TRUE if @p config was filled with data,
 *         @c EINA_FALSE otherwise (when @p config is untouched)
 *
 * The fields of @p config will be altered to reflect the current
 * configuration's values.
 *
 * @see evas_cserve_config_set()
 *
 * @ingroup Evas_Cserve
  }
function evas_cserve_config_get(config:PEvas_Cserve_Config):TEina_Bool;cdecl;external;
{*
 * Changes the configurations of the Evas image caching server.
 *
 * @param config A bitmap cache configuration handle with fields set
 * to desired configuration values.
 * @return @c EINA_TRUE if @p config was successfully applied,
 *         @c EINA_FALSE otherwise.
 *
 * @see evas_cserve_config_get()
 *
 * @ingroup Evas_Cserve
  }
(* Const before type ignored *)
function evas_cserve_config_set(config:PEvas_Cserve_Config):TEina_Bool;cdecl;external;
{*
 * Force the system to disconnect from the bitmap caching server.
 *
 * @ingroup Evas_Cserve
  }
procedure evas_cserve_disconnect;cdecl;external;
{*
 * @defgroup Evas_Utils General Utilities
 * @ingroup Evas
 *
 * Some functions that are handy but are not specific of canvas or
 * objects.
  }
{*
 * Converts the given Evas image load error code into a string
 * describing it in human-readable text.
 *
 * @param error the error code, a value in ::Evas_Load_Error.
 * @return Always returns a valid string. If the given @p error is not
 *         supported, <code>"Unknown error"</code> is returned.
 *
 * Mostly evas_object_image_file_set() would be the function setting
 * that error value afterwards, but also evas_object_image_load(),
 * evas_object_image_save(), evas_object_image_data_get(),
 * evas_object_image_data_convert(), evas_object_image_pixels_import()
 * and evas_object_image_is_inside(). This function is meant to be
 * used in conjunction with evas_object_image_load_error_get(), as in:
 *
 * Example code:
 * @dontinclude evas-images.c
 * @skip img1 =
 * @until ecore_main_loop_begin(
 *
 * Here, being @c valid_path the path to a valid image and @c
 * bogus_path a path to a file that does not exist, the two outputs
 * of evas_load_error_str() would be (if no other errors occur):
 * <code>"No error on load"</code> and <code>"File (or file path) does
 * not exist"</code>, respectively. See the full @ref
 * Example_Evas_Images "example".
 *
 * @ingroup Evas_Utils
  }
(* Const before type ignored *)
function evas_load_error_str(error:TEvas_Load_Error):Pchar;cdecl;external;
{ Evas utility routines for color space conversions  }
{ hsv color space has h in the range 0.0 to 360.0, and s,v in the range 0.0 to 1.0  }
{ rgb color space has r,g,b in the range 0 to 255  }
{*
 * Convert a given color from HSV to RGB format.
 *
 * @param h The Hue component of the color.
 * @param s The Saturation component of the color.
 * @param v The Value component of the color.
 * @param r The Red component of the color.
 * @param g The Green component of the color.
 * @param b The Blue component of the color.
 *
 * This function converts a given color in HSV color format to RGB
 * color format.
 *
 * @ingroup Evas_Utils
 * }
procedure evas_color_hsv_to_rgb(h:single; s:single; v:single; r:Plongint; g:Plongint; 
            b:Plongint);cdecl;external;
{*
 * Convert a given color from RGB to HSV format.
 *
 * @param r The Red component of the color.
 * @param g The Green component of the color.
 * @param b The Blue component of the color.
 * @param h The Hue component of the color.
 * @param s The Saturation component of the color.
 * @param v The Value component of the color.
 *
 * This function converts a given color in RGB color format to HSV
 * color format.
 *
 * @ingroup Evas_Utils
 * }
procedure evas_color_rgb_to_hsv(r:longint; g:longint; b:longint; h:Psingle; s:Psingle; 
            v:Psingle);cdecl;external;
{ argb color space has a,r,g,b in the range 0 to 255  }
{*
 * Pre-multiplies a rgb triplet by an alpha factor.
 *
 * @param a The alpha factor.
 * @param r The Red component of the color.
 * @param g The Green component of the color.
 * @param b The Blue component of the color.
 *
 * This function pre-multiplies a given rgb triplet by an alpha
 * factor. Alpha factor is used to define transparency.
 *
 * @ingroup Evas_Utils
 * }
procedure evas_color_argb_premul(a:longint; r:Plongint; g:Plongint; b:Plongint);cdecl;external;
{*
 * Undo pre-multiplication of a rgb triplet by an alpha factor.
 *
 * @param a The alpha factor.
 * @param r The Red component of the color.
 * @param g The Green component of the color.
 * @param b The Blue component of the color.
 *
 * This function undoes pre-multiplication a given rbg triplet by an
 * alpha factor. Alpha factor is used to define transparency.
 *
 * @see evas_color_argb_premul().
 *
 * @ingroup Evas_Utils
 * }
procedure evas_color_argb_unpremul(a:longint; r:Plongint; g:Plongint; b:Plongint);cdecl;external;
{*
 * Pre-multiplies data by an alpha factor.
 *
 * @param data The data value.
 * @param len  The length value.
 *
 * This function pre-multiplies a given data by an alpha
 * factor. Alpha factor is used to define transparency.
 *
 * @ingroup Evas_Utils
 * }
procedure evas_data_argb_premul(data:Pdword; len:dword);cdecl;external;
{*
 * Undo pre-multiplication data by an alpha factor.
 *
 * @param data The data value.
 * @param len  The length value.
 *
 * This function undoes pre-multiplication of a given data by an alpha
 * factor. Alpha factor is used to define transparency.
 *
 * @ingroup Evas_Utils
 * }
procedure evas_data_argb_unpremul(data:Pdword; len:dword);cdecl;external;
{ string and font handling  }
{*
 * Gets the next character in the string
 *
 * Given the UTF-8 string in @p str, and starting byte position in @p pos,
 * this function will place in @p decoded the decoded code point at @p pos
 * and return the byte index for the next character in the string.
 *
 * The only boundary check done is that @p pos must be >= 0. Other than that,
 * no checks are performed, so passing an index value that's not within the
 * length of the string will result in undefined behavior.
 *
 * @param str The UTF-8 string
 * @param pos The byte index where to start
 * @param decoded Address where to store the decoded code point. Optional.
 *
 * @return The byte index of the next character
 *
 * @ingroup Evas_Utils
  }
(* Const before type ignored *)
function evas_string_char_next_get(str:Pchar; pos:longint; decoded:Plongint):longint;cdecl;external;
{*
 * Gets the previous character in the string
 *
 * Given the UTF-8 string in @p str, and starting byte position in @p pos,
 * this function will place in @p decoded the decoded code point at @p pos
 * and return the byte index for the previous character in the string.
 *
 * The only boundary check done is that @p pos must be >= 1. Other than that,
 * no checks are performed, so passing an index value that's not within the
 * length of the string will result in undefined behavior.
 *
 * @param str The UTF-8 string
 * @param pos The byte index where to start
 * @param decoded Address where to store the decoded code point. Optional.
 *
 * @return The byte index of the previous character
 *
 * @ingroup Evas_Utils
  }
(* Const before type ignored *)
function evas_string_char_prev_get(str:Pchar; pos:longint; decoded:Plongint):longint;cdecl;external;
{*
 * Get the length in characters of the string.
 *
 * @param  str The string to get the length of.
 * @return The length in characters (not bytes)
 *
 * @ingroup Evas_Utils
  }
(* Const before type ignored *)
function evas_string_char_len_get(str:Pchar):longint;cdecl;external;
{*
 * Get language direction.
 *
 * @ingroup Evas_Utils
 * @since 1.20
  }
function evas_language_direction_get:TEvas_BiDi_Direction;cdecl;external;
{*
 * Reinitialize language from the environment.
 *
 * The locale can change while a process is running. This call tells evas to
 * reload the locale from the environment like it does on start.
 *
 * @ingroup Evas_Utils
 * @since 1.18
  }
procedure evas_language_reinit;cdecl;external;
{*
 * @defgroup Evas_Keys Key Input Functions
 *
 * Functions that feed key events to the canvas.
 *
 * As explained in @ref intro_not_evas, Evas is @b not aware of input
 * systems at all. Then, the user, if using it crudely (evas_new()),
 * will have to feed it with input events, so that it can react
 * somehow. If, however, the user creates a canvas by means of the
 * Ecore_Evas wrapper, it will automatically bind the chosen display
 * engine's input events to the canvas, for you.
 *
 * This group presents the functions dealing with the feeding of key
 * events to the canvas. On most of them, one has to reference a given
 * key by a name (<code>keyname</code> argument). Those are
 * <b>platform dependent</b> symbolic names for the keys. Sometimes
 * you'll get the right <code>keyname</code> by simply using an ASCII
 * value of the key name, but it won't be like that always.
 *
 * Typical platforms are Linux frame buffer (Ecore_FB) and X server
 * (Ecore_X) when using Evas with Ecore and Ecore_Evas. Please refer
 * to your display engine's documentation when using evas through an
 * Ecore helper wrapper when you need the <code>keyname</code>s.
 *
 * Example:
 * @dontinclude evas-events.c
 * @skip mods = evas_key_modifier_get(evas);
 * @until 
 *
 * All the other @c evas_key functions behave on the same manner. See
 * the full @ref Example_Evas_Events "example".
 *
 * @ingroup Evas_Canvas
  }
{*
 * @addtogroup Evas_Font_Group
 *
 * @
  }
{*
 * @defgroup Evas_Font_Path_Group Font Path Functions
 *
 * Functions that edit the paths being used to load fonts.
 *
 * @
  }
{*
 * Removes all font paths loaded into memory by evas_font_path_app_* APIs
 * for the application.
 * @since 1.9
  }
procedure evas_font_path_global_clear;cdecl;external;
{*
 * Appends a font path to the list of font paths used by the application.
 * @param   path The new font path.
 * @since 1.9
  }
(* Const before type ignored *)
procedure evas_font_path_global_append(path:Pchar);cdecl;external;
{*
 * Prepends a font path to the list of font paths used by the application.
 * @param   path The new font path.
 * @since 1.9
  }
(* Const before type ignored *)
procedure evas_font_path_global_prepend(path:Pchar);cdecl;external;
{*
 * Retrieves the list of font paths used by the application.
 * @return  The list of font paths used.
 * @since 1.9
  }
(* Const before type ignored *)
function evas_font_path_global_list:PEina_List;cdecl;external;
{*
 * @
  }
{*
 * Reinitialize FontConfig. If FontConfig has to be reinitialized
 * according to changes of system environments (e.g. Changing font config files), it will be useful.
 *
 * @since 1.14
  }
procedure evas_font_reinit;cdecl;external;
{*
 * @
  }
{*
 * Set the limit in bytes for memory allocated by font glyphs in evas.
 * @param[in] options for caching.
 * @param[in] bytes cache size in bytes, pass negative value to ignore the limit.
 *
 * @since 1.24
  }
procedure evas_font_data_cache_set(options:TEvas_Font_Data_Cache; byte:longint);cdecl;external;
{*
 * @
  }
{*
 * Get the limit in bytes for memory allocated by font glyphs in evas.
 * @param[in] options for caching.
 * @return Returns font allocated memory cache limit, if value is negative this means no limit.
 * @since 1.24
  }
function evas_font_data_cache_get(options:TEvas_Font_Data_Cache):longint;cdecl;external;
{*
 * @
  }
{ The below type are necessary for legacy API and need to be manually kept in sync with .eo file. }
{$ifndef _EFL_INPUT_DEVICE_EO_CLASS_TYPE}
{$define _EFL_INPUT_DEVICE_EO_CLASS_TYPE}
type
  PEfl_Input_Device = ^TEfl_Input_Device;
  TEfl_Input_Device = TEo;
{$endif}
{$ifndef _EFL_INPUT_DEVICE_EO_TYPES}
{$define _EFL_INPUT_DEVICE_EO_TYPES}
type
  PEfl_Input_Device_Type = ^TEfl_Input_Device_Type;
  TEfl_Input_Device_Type =  Longint;
  Const
    EFL_INPUT_DEVICE_TYPE_NONE = 0;
    EFL_INPUT_DEVICE_TYPE_SEAT = 1;
    EFL_INPUT_DEVICE_TYPE_KEYBOARD = 2;
    EFL_INPUT_DEVICE_TYPE_MOUSE = 3;
    EFL_INPUT_DEVICE_TYPE_TOUCH = 4;
    EFL_INPUT_DEVICE_TYPE_PEN = 5;
    EFL_INPUT_DEVICE_TYPE_WAND = 6;
    EFL_INPUT_DEVICE_TYPE_GAMEPAD = 7;
;
{$endif}
{$ifndef _EFL_GFX_ENTITY_EO_H_}
{$define _EFL_GFX_ENTITY_EO_H_}
{$ifndef _EFL_GFX_ENTITY_EO_CLASS_TYPE}
{$define _EFL_GFX_ENTITY_EO_CLASS_TYPE}
type
  PEfl_Gfx_Entity = ^TEfl_Gfx_Entity;
  TEfl_Gfx_Entity = TEo;
{$endif}
{$endif}

implementation

function bold(var a : TEvas_Textgrid_Cell) : word;
begin
  bold:=(a.flag0 and bm_TEvas_Textgrid_Cell_bold) shr bp_TEvas_Textgrid_Cell_bold;
end;

procedure set_bold(var a : TEvas_Textgrid_Cell; __bold : word);
begin
  a.flag0:=a.flag0 or ((__bold shl bp_TEvas_Textgrid_Cell_bold) and bm_TEvas_Textgrid_Cell_bold);
end;

function italic(var a : TEvas_Textgrid_Cell) : word;
begin
  italic:=(a.flag0 and bm_TEvas_Textgrid_Cell_italic) shr bp_TEvas_Textgrid_Cell_italic;
end;

procedure set_italic(var a : TEvas_Textgrid_Cell; __italic : word);
begin
  a.flag0:=a.flag0 or ((__italic shl bp_TEvas_Textgrid_Cell_italic) and bm_TEvas_Textgrid_Cell_italic);
end;

function underline(var a : TEvas_Textgrid_Cell) : word;
begin
  underline:=(a.flag0 and bm_TEvas_Textgrid_Cell_underline) shr bp_TEvas_Textgrid_Cell_underline;
end;

procedure set_underline(var a : TEvas_Textgrid_Cell; __underline : word);
begin
  a.flag0:=a.flag0 or ((__underline shl bp_TEvas_Textgrid_Cell_underline) and bm_TEvas_Textgrid_Cell_underline);
end;

function strikethrough(var a : TEvas_Textgrid_Cell) : word;
begin
  strikethrough:=(a.flag0 and bm_TEvas_Textgrid_Cell_strikethrough) shr bp_TEvas_Textgrid_Cell_strikethrough;
end;

procedure set_strikethrough(var a : TEvas_Textgrid_Cell; __strikethrough : word);
begin
  a.flag0:=a.flag0 or ((__strikethrough shl bp_TEvas_Textgrid_Cell_strikethrough) and bm_TEvas_Textgrid_Cell_strikethrough);
end;

function fg_extended(var a : TEvas_Textgrid_Cell) : word;
begin
  fg_extended:=(a.flag0 and bm_TEvas_Textgrid_Cell_fg_extended) shr bp_TEvas_Textgrid_Cell_fg_extended;
end;

procedure set_fg_extended(var a : TEvas_Textgrid_Cell; __fg_extended : word);
begin
  a.flag0:=a.flag0 or ((__fg_extended shl bp_TEvas_Textgrid_Cell_fg_extended) and bm_TEvas_Textgrid_Cell_fg_extended);
end;

function bg_extended(var a : TEvas_Textgrid_Cell) : word;
begin
  bg_extended:=(a.flag0 and bm_TEvas_Textgrid_Cell_bg_extended) shr bp_TEvas_Textgrid_Cell_bg_extended;
end;

procedure set_bg_extended(var a : TEvas_Textgrid_Cell; __bg_extended : word);
begin
  a.flag0:=a.flag0 or ((__bg_extended shl bp_TEvas_Textgrid_Cell_bg_extended) and bm_TEvas_Textgrid_Cell_bg_extended);
end;

function double_width(var a : TEvas_Textgrid_Cell) : word;
begin
  double_width:=(a.flag0 and bm_TEvas_Textgrid_Cell_double_width) shr bp_TEvas_Textgrid_Cell_double_width;
end;

procedure set_double_width(var a : TEvas_Textgrid_Cell; __double_width : word);
begin
  a.flag0:=a.flag0 or ((__double_width shl bp_TEvas_Textgrid_Cell_double_width) and bm_TEvas_Textgrid_Cell_double_width);
end;

{ was #define dname def_expr }
function EVAS_OBJECT_BOX_API_INIT_NULL : longint; { return type might be wrong }
  begin
    EVAS_OBJECT_BOX_API_INIT_NULL:=EVAS_OBJECT_BOX_API_INIT(EVAS_SMART_CLASS_INIT_NULL);
  end;

{ was #define dname def_expr }
function EVAS_OBJECT_BOX_API_INIT_VERSION : longint; { return type might be wrong }
  begin
    EVAS_OBJECT_BOX_API_INIT_VERSION:=EVAS_OBJECT_BOX_API_INIT(EVAS_SMART_CLASS_INIT_VERSION);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVAS_OBJECT_BOX_API_INIT_NAME_VERSION(name : longint) : longint;
begin
  EVAS_OBJECT_BOX_API_INIT_NAME_VERSION:=EVAS_OBJECT_BOX_API_INIT(EVAS_SMART_CLASS_INIT_NAME_VERSION(name));
end;

function layouting(var a : TEvas_Object_Box_Data) : TEina_Bool;
begin
  layouting:=(a.flag0 and bm_TEvas_Object_Box_Data_layouting) shr bp_TEvas_Object_Box_Data_layouting;
end;

procedure set_layouting(var a : TEvas_Object_Box_Data; __layouting : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__layouting shl bp_TEvas_Object_Box_Data_layouting) and bm_TEvas_Object_Box_Data_layouting);
end;

function children_changed(var a : TEvas_Object_Box_Data) : TEina_Bool;
begin
  children_changed:=(a.flag0 and bm_TEvas_Object_Box_Data_children_changed) shr bp_TEvas_Object_Box_Data_children_changed;
end;

procedure set_children_changed(var a : TEvas_Object_Box_Data; __children_changed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__children_changed shl bp_TEvas_Object_Box_Data_children_changed) and bm_TEvas_Object_Box_Data_children_changed);
end;

function max_reached(var a : TEvas_Object_Box_Option) : TEina_Bool;
begin
  max_reached:=(a.flag0 and bm_TEvas_Object_Box_Option_max_reached) shr bp_TEvas_Object_Box_Option_max_reached;
end;

procedure set_max_reached(var a : TEvas_Object_Box_Option; __max_reached : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__max_reached shl bp_TEvas_Object_Box_Option_max_reached) and bm_TEvas_Object_Box_Option_max_reached);
end;

function min_reached(var a : TEvas_Object_Box_Option) : TEina_Bool;
begin
  min_reached:=(a.flag0 and bm_TEvas_Object_Box_Option_min_reached) shr bp_TEvas_Object_Box_Option_min_reached;
end;

procedure set_min_reached(var a : TEvas_Object_Box_Option; __min_reached : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__min_reached shl bp_TEvas_Object_Box_Option_min_reached) and bm_TEvas_Object_Box_Option_min_reached);
end;

function alpha(var a : TEvas_Cserve_Image) : TEina_Bool;
begin
  alpha:=(a.flag0 and bm_TEvas_Cserve_Image_alpha) shr bp_TEvas_Cserve_Image_alpha;
end;

procedure set_alpha(var a : TEvas_Cserve_Image; __alpha : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__alpha shl bp_TEvas_Cserve_Image_alpha) and bm_TEvas_Cserve_Image_alpha);
end;

function data_loaded(var a : TEvas_Cserve_Image) : TEina_Bool;
begin
  data_loaded:=(a.flag0 and bm_TEvas_Cserve_Image_data_loaded) shr bp_TEvas_Cserve_Image_data_loaded;
end;

procedure set_data_loaded(var a : TEvas_Cserve_Image; __data_loaded : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__data_loaded shl bp_TEvas_Cserve_Image_data_loaded) and bm_TEvas_Cserve_Image_data_loaded);
end;

function active(var a : TEvas_Cserve_Image) : TEina_Bool;
begin
  active:=(a.flag0 and bm_TEvas_Cserve_Image_active) shr bp_TEvas_Cserve_Image_active;
end;

procedure set_active(var a : TEvas_Cserve_Image; __active : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__active shl bp_TEvas_Cserve_Image_active) and bm_TEvas_Cserve_Image_active);
end;

function dead(var a : TEvas_Cserve_Image) : TEina_Bool;
begin
  dead:=(a.flag0 and bm_TEvas_Cserve_Image_dead) shr bp_TEvas_Cserve_Image_dead;
end;

procedure set_dead(var a : TEvas_Cserve_Image; __dead : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__dead shl bp_TEvas_Cserve_Image_dead) and bm_TEvas_Cserve_Image_dead);
end;

function useless(var a : TEvas_Cserve_Image) : TEina_Bool;
begin
  useless:=(a.flag0 and bm_TEvas_Cserve_Image_useless) shr bp_TEvas_Cserve_Image_useless;
end;

procedure set_useless(var a : TEvas_Cserve_Image; __useless : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__useless shl bp_TEvas_Cserve_Image_useless) and bm_TEvas_Cserve_Image_useless);
end;


end.
