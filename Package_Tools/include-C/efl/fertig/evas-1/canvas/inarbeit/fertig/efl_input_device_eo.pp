
unit efl_input_device_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_input_device_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_input_device_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Input_Device  = ^Efl_Input_Device;
PEfl_Input_Device_Type  = ^Efl_Input_Device_Type;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_INPUT_DEVICE_EO_H_}
{$define _EFL_INPUT_DEVICE_EO_H_}
{$ifndef _EFL_INPUT_DEVICE_EO_CLASS_TYPE}
{$define _EFL_INPUT_DEVICE_EO_CLASS_TYPE}
type
  PEfl_Input_Device = ^TEfl_Input_Device;
  TEfl_Input_Device = TEo;
{$endif}
{$ifndef _EFL_INPUT_DEVICE_EO_TYPES}
{$define _EFL_INPUT_DEVICE_EO_TYPES}
{*
 * @brief General type of input device.
 *
 * Legacy support since 1.8 as @c Evas_Device_Class.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device_Type
  }
{*< Not a device.
                                   *
                                   * @since 1.23  }
{*< The user/seat (the user themselves).
                               *
                               * @since 1.23  }
{*< A regular keyboard, numberpad or attached
                                   * buttons.
                                   *
                                   * @since 1.23  }
{*< A mouse, trackball or touchpad relative
                                * motion device.
                                *
                                * @since 1.23  }
{*< A touchscreen with fingers or stylus.
                                *
                                * @since 1.23  }
{*< A special pen device.
                              *
                              * @since 1.23  }
{*< A laser pointer, wii-style or "Minority
                               * Report" pointing device.
                               *
                               * @since 1.23  }
{*< A gamepad controller or joystick.
                                 *
                                 * @since 1.23  }
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
{* Represents a pointing device such as a touch finger, pen or mouse.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device
  }

{ was #define dname def_expr }
function EFL_INPUT_DEVICE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_input_device_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Device type property
 *
 * @param[in] obj The object.
 * @param[in] klass Input device class
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device
  }
procedure efl_input_device_type_set(obj:PEo; klass:TEfl_Input_Device_Type);cdecl;external;
{*
 * @brief Device type property
 *
 * @param[in] obj The object.
 *
 * @return Input device class
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device
  }
(* Const before type ignored *)
function efl_input_device_type_get(obj:PEo):TEfl_Input_Device_Type;cdecl;external;
{*
 * @brief Device source property
 *
 * @param[in] obj The object.
 * @param[in] src Input device
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device
  }
procedure efl_input_device_source_set(obj:PEo; src:PEfl_Input_Device);cdecl;external;
{*
 * @brief Device source property
 *
 * @param[in] obj The object.
 *
 * @return Input device
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device
  }
(* Const before type ignored *)
function efl_input_device_source_get(obj:PEo):PEfl_Input_Device;cdecl;external;
{*
 * @brief Get the @ref Efl_Input_Device that represents a seat.
 *
 * This method will find the seat the device belongs to.
 *
 * For this, it walk through device's parents looking for a device with
 * @ref EFL_INPUT_DEVICE_TYPE_SEAT. It may be the device itself.
 *
 * In case no seat is found, @c null is returned.
 *
 * @param[in] obj The object.
 *
 * @return The seat this device belongs to.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device
  }
(* Const before type ignored *)
function efl_input_device_seat_get(obj:PEo):PEfl_Input_Device;cdecl;external;
{*
 * @brief Seat id number
 *
 * @param[in] obj The object.
 * @param[in] id The id of the seat
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device
  }
procedure efl_input_device_seat_id_set(obj:PEo; id:dword);cdecl;external;
{*
 * @brief Seat id number
 *
 * @param[in] obj The object.
 *
 * @return The id of the seat
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device
  }
(* Const before type ignored *)
function efl_input_device_seat_id_get(obj:PEo):dword;cdecl;external;
{*
 * @brief Lists the children attached to this device.
 *
 * This is only meaningful with seat devices, as they are groups of real input
 * devices.
 *
 * @param[in] obj The object.
 *
 * @return List of device children
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device
  }
function efl_input_device_children_iterate(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief The number of pointer devices in this seat.
 *
 * Pointer devices are the ones whose @ref efl_input_device_type_get is
 * @c mouse, @c pen, @c touch or @c wand. In case this device is not of the
 * type @c seat, -1 is returned.
 *
 * @param[in] obj The object.
 *
 * @return The number of pointer devices.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device
  }
(* Const before type ignored *)
function efl_input_device_pointer_device_count_get(obj:PEo):longint;cdecl;external;
{*
 * @brief @c true if @ref efl_input_device_type_get is @c mouse, @c pen,
 * @c touch or @c wand.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the device has pointing capabilities.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Device
  }
(* Const before type ignored *)
function efl_input_device_is_pointer_type_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_INPUT_DEVICE_CLASS : longint; { return type might be wrong }
  begin
    EFL_INPUT_DEVICE_CLASS:=efl_input_device_class_get;
  end;


end.
