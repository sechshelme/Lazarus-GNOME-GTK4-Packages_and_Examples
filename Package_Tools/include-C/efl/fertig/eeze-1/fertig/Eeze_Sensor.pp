
unit Eeze_Sensor;
interface

{
  Automatically converted by H2Pas 1.0.0 from Eeze_Sensor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Eeze_Sensor.h
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
Pdouble  = ^double;
PEeze_Sensor_Obj  = ^Eeze_Sensor_Obj;
PEeze_Sensor_Type  = ^Eeze_Sensor_Type;
Plongint  = ^longint;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EEZE_SENSOR_H}
{$define EEZE_SENSOR_H}
{$ifdef extern}
{$undef extern}
{$endif}
{$include <Eina.h>}
{*
 * @file Eeze_Sensor.h
 * @brief Sensor information subsystem
 *
 * Eeze sensor functions allow you to gather sensor information from different
 * sensor sources available on your hardware. It supports a plugin architecture
 * to support different hardware platforms and devices. These plugins can be
 * loaded at runtime.
 *
 * Right now we have support for the Tizen sensor framework as well as a simple
 * fake plugin to be used as a test harness for development. Plugins for other
 * sensor frameworks or platforms are always welcome.
 *
 * Synchronous as well as asynchronous reads are possible. As reading the
 * physical sensor might be bound to a high latency and thus cost the value of
 * the last read is cached within Eeze_Sensor together with a timestamp of the
 * actual read out. This can speed up the value access for application while the
 * values are still getting updating asynchronously in the background. The
 * timestamp should be checked if the specific time requirements are needed.
 *
 * As an alternative the sensor could be read synchronously. With the
 * disadvantage that the function call will block until the data is read from
 * the sensor.
 *
 * @since 1.8
 *
 * @addtogroup Eeze_Sensor Sensor
 * Gather sensor information from different sources. Works based on plugins,
 * with a Tizen plugin being available.
 *
 * @ingroup Eeze
 * @
  }
{*
 * @enum Eeze_Sensor_Type
 *
 * All sensor types known by Eeze Sensor. This list of types include real
 * physical types like proximity or light as well as "aggregated" types like
 * facedown or doubletap. All types with MOTION in their name can be used as
 * real events coming from the underlying system. This is not supported on all
 * systems.
 *
 * @since 1.8
  }
{*< Accelerometer sensor  }
{*< Gravity sensor  }
{*<   }
{*<   }
{*< Magnetic sensor  }
{*< Orientation sensor  }
{*< Gyroscope sensor  }
{*< Light sensor  }
{*< Proximity sensor  }
{*< Snap motion sensor  }
{*< Shake motion sensor  }
{*< Doubletap motion sensor  }
{*< Panning motion sensor  }
{*<  }
{*<  }
{*< Facedown motion sensor  }
{*<  }
{*<  }
{*<  }
{ Non-Tizen from here  }
{*< Barometer sensor  }
{*< Temperature sensor  }
{*< Last item to mark end of enum  }
type
  PEeze_Sensor_Type = ^TEeze_Sensor_Type;
  TEeze_Sensor_Type =  Longint;
  Const
    EEZE_SENSOR_TYPE_ACCELEROMETER = 0;
    EEZE_SENSOR_TYPE_GRAVITY = 1;
    EEZE_SENSOR_TYPE_LINEAR_ACCELERATION = 2;
    EEZE_SENSOR_TYPE_DEVICE_ORIENTATION = 3;
    EEZE_SENSOR_TYPE_MAGNETIC = 4;
    EEZE_SENSOR_TYPE_ORIENTATION = 5;
    EEZE_SENSOR_TYPE_GYROSCOPE = 6;
    EEZE_SENSOR_TYPE_LIGHT = 7;
    EEZE_SENSOR_TYPE_PROXIMITY = 8;
    EEZE_SENSOR_TYPE_MOTION_SNAP = 9;
    EEZE_SENSOR_TYPE_MOTION_SHAKE = 10;
    EEZE_SENSOR_TYPE_MOTION_DOUBLETAP = 11;
    EEZE_SENSOR_TYPE_MOTION_PANNING = 12;
    EEZE_SENSOR_TYPE_MOTION_PANNING_BROWSE = 13;
    EEZE_SENSOR_TYPE_MOTION_TILT = 14;
    EEZE_SENSOR_TYPE_MOTION_FACEDOWN = 15;
    EEZE_SENSOR_TYPE_MOTION_DIRECT_CALL = 16;
    EEZE_SENSOR_TYPE_MOTION_SMART_ALERT = 17;
    EEZE_SENSOR_TYPE_MOTION_NO_MOVE = 18;
    EEZE_SENSOR_TYPE_BAROMETER = 19;
    EEZE_SENSOR_TYPE_TEMPERATURE = 20;
    EEZE_SENSOR_TYPE_LAST = $FF;
;
{*
 * @defgroup Eeze_Sensor_Events Available eeze sensor events
 * @brief Sensor events that are emitted from the library as ecore events
 * @ingroup Eeze
 *
 * Event types used to register ecore_event_handler on. These events are used
 * for #eeze_sensor_async_read to deliver read out data. It is also used for
 * generated events like facedown or shake. Subscribing to these events in your
 * application allowsyou to react on these changes in an efficient way without
 * polling for new updates and wasting power and computing cycles.
 *
 * @since 1.8
 * @
  }
  var
    EEZE_SENSOR_EVENT_ACCELEROMETER : longint;cvar;external;
    EEZE_SENSOR_EVENT_GRAVITY : longint;cvar;external;
    EEZE_SENSOR_EVENT_LINEAR_ACCELERATION : longint;cvar;external;
    EEZE_SENSOR_EVENT_DEVICE_ORIENTATION : longint;cvar;external;
    EEZE_SENSOR_EVENT_MAGNETIC : longint;cvar;external;
    EEZE_SENSOR_EVENT_ORIENTATION : longint;cvar;external;
    EEZE_SENSOR_EVENT_GYROSCOPE : longint;cvar;external;
    EEZE_SENSOR_EVENT_LIGHT : longint;cvar;external;
    EEZE_SENSOR_EVENT_PROXIMITY : longint;cvar;external;
    EEZE_SENSOR_EVENT_SNAP : longint;cvar;external;
    EEZE_SENSOR_EVENT_SHAKE : longint;cvar;external;
    EEZE_SENSOR_EVENT_DOUBLETAP : longint;cvar;external;
    EEZE_SENSOR_EVENT_PANNING : longint;cvar;external;
    EEZE_SENSOR_EVENT_PANNING_BROWSE : longint;cvar;external;
    EEZE_SENSOR_EVENT_TILT : longint;cvar;external;
    EEZE_SENSOR_EVENT_FACEDOWN : longint;cvar;external;
    EEZE_SENSOR_EVENT_DIRECT_CALL : longint;cvar;external;
    EEZE_SENSOR_EVENT_SMART_ALERT : longint;cvar;external;
    EEZE_SENSOR_EVENT_NO_MOVE : longint;cvar;external;
    EEZE_SENSOR_EVENT_BAROMETER : longint;cvar;external;
    EEZE_SENSOR_EVENT_TEMPERATURE : longint;cvar;external;
{*@ }
{*
 * @typedef Eeze_Sensor_Obj;
 *
 * Object for a sensor type. Keeps information about the type and holds the
 * data for the accessor functions. As this information gets also updated by
 * asynchronous reads it might be a good idea to check the timestamp value to
 * see when the data has been updated. The timestamp is given as floating point
 * value in seconds.
 *
 * You are not supposed to access the raw data values from here but use the
 * getter functions for it. Using the raw values from this struct might break
 * your applications later if the internal structure changes.
 *
 * @since 1.8
  }
{*< Sensor type see #Eeze_Sensor_Type  }
{*< Accuracy of the sensor value  }
{*< Sensor data depending on the sensor type  }
{*< Timestamp of data read  }
{*< FUTURE USE: Continuous flow of sensor read out  }
{*< Data pointer used for passing data to the asynchronous callback  }
type
  PEeze_Sensor_Obj = ^TEeze_Sensor_Obj;
  TEeze_Sensor_Obj = record
      _type : TEeze_Sensor_Type;
      accuracy : longint;
      data : array[0..2] of single;
      timestamp : Tdouble;
      continuous_flow : TEina_Bool;
      user_data : pointer;
    end;
{ C++ extern C conditionnal removed }
{*
 * @brief Create sensor object to operate on.
 * @param type Sensor type to create object from.
 * @return Sensor object for the given type.
 *
 * Takes the sensor type and create an object for it to operate on. During this
 * it also does an initial sensor data read to fill the sensor data into the
 * object. The #eeze_sensor_free function must be used to destroy the object
 * and release its memory.
 *
 * For every sensor type you want to work with this is the first thing you have
 * to do. Create the object from the type and everything else the operates on
 * this object.
 *
 * This also takes into account what runtime modules are loaded and handles
 * them in a given priority to pick up the best sensor source for your sensor
 * object.
 *
 * @since 1.8
  }

function eeze_sensor_new(_type:TEeze_Sensor_Type):PEeze_Sensor_Obj;cdecl;external;
{*
 * @brief Free a sensor object.
 * @param sens Sensor object to operate on.
 *
 * Free an sensor object when it is no longer needed. Always use this function
 * to cleanup unused sensor objects.
 *
 * @since 1.8
  }
procedure eeze_sensor_free(sens:PEeze_Sensor_Obj);cdecl;external;
{*
 * @brief Get accuracy from sensor object.
 * @param sens Sensor object to operate on.
 * @param accuracy Pointer to write accuracy value into.
 * @return EINA_TRUE for success and EINA_FALSE for failure
 *
 * Access function to get the accuracy property from the sensor object. The
 * accuracy value can have the following values and meaning:
 * -1 Undefined accuracy
 * 0 Bad accurancy
 * 1 Normal accuracy
 * 2 Good accuracy
 * 3 Very good accuracy
 *
 * @since 1.8
  }
function eeze_sensor_accuracy_get(sens:PEeze_Sensor_Obj; accuracy:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Get data from all three data properties
 * @param sens Sensor object to operate on.
 * @param x Pointer to write first data property value into.
 * @param y Pointer to write second data property value into.
 * @param z Pointer to write third data property value into.
 * @return EINA_TRUE for success and EINA_FALSE for failure
 *
 * Access function to get all three data properties from the sensor object.
 * This is used for sensor types that offer all three values. Like accelerometer
 * and magnetic.
 *
 * @since 1.8
  }
function eeze_sensor_xyz_get(sens:PEeze_Sensor_Obj; x:Psingle; y:Psingle; z:Psingle):TEina_Bool;cdecl;external;
{*
 * @brief Get data from first two data properties
 * @param sens Sensor object to operate on.
 * @param x Pointer to write first data property value into.
 * @param y Pointer to write second data property value into.
 * @return EINA_TRUE for success and EINA_FALSE for failure
 *
 * Access function to get the first two data properties from the sensor object.
 * This is used for sensor types that offer two values. Like panning.
 *
 * @since 1.8
  }
function eeze_sensor_xy_get(sens:PEeze_Sensor_Obj; x:Psingle; y:Psingle):TEina_Bool;cdecl;external;
{*
 * @brief Get the data from  first data property
 * @param sens Sensor object to operate on.
 * @param x Pointer to write first data property value into.
 * @return EINA_TRUE for success and EINA_FALSE for failure
 *
 * Access function to get the first data property from the sensor object. This
 * is used for sensor types that only offer one value. Like light or proximity.
 *
 * @since 1.8
  }
function eeze_sensor_x_get(sens:PEeze_Sensor_Obj; x:Psingle):TEina_Bool;cdecl;external;
{*
 * @brief Get timestamp from sensor object.
 * @param sens Sensor object to operate on.
 * @param timestamp Pointer to write timestamp value into.
 * @return EINA_TRUE for success and EINA_FALSE for failure
 *
 * Access function to get the timestamp property from the sensor object. It
 * allows you to determine if the values have been updated since the last time
 * you requested them. Timestamp is given as a floating point value in seconds.
 *
 * @since 1.8
  }
function eeze_sensor_timestamp_get(sens:PEeze_Sensor_Obj; timestamp:Pdouble):TEina_Bool;cdecl;external;
{*
 * @brief Read out sensor data
 * @param sens Sensor object to operate on.
 * @return EINA_TRUE for success and EINA_FALSE for failure
 *
 * This function reads sensor data from the device and fills the sensor object
 * with the data. This call is synchronous and blocks until the data is read out
 * and updated in the sensor object. For simple applications this is fine and
 * the easiest way to use the API. A more efficient way is to use
 * #eeze_sensor_async_read which allows the sensor readout to happen in the
 * background and the application would check the timestamp of the data to
 * determine how recent the data is.
 *
 * @since 1.8
  }
function eeze_sensor_read(sens:PEeze_Sensor_Obj):TEina_Bool;cdecl;external;
{*
 * @brief Asynchronous read out sensor data
 * @param sens Sensor object to operate on.
 * @param user_data Data to pass to the callback function.
 * @return EINA_TRUE for success and EINA_FALSE for failure
 *
 * This function reads sensor data from the device and fills the sensor object
 * with the data. The read is done asynchronously and thus does not block after
 * calling. Instead the given the application can determine how recent the
 * values are from the timestamp value that can be accessed through
 * #eeze_sensor_timestamp_get.
 *
 * This function is more efficient but needs a bit more work in the application.
 * An easier way is to use the synchronous #eeze_sensor_read functions. The
 * downside of it is that it blocks until the data was read out from the
 * physical sensor. That might be a long time depending on the hardware and its
 * interface.
 *
 * The extra data passed in as user_data here will be available in the user_data
 * pointer of the sensor object when the ecore event arrives.
 *
 * @since 1.8
  }
function eeze_sensor_async_read(sens:PEeze_Sensor_Obj; user_data:pointer):TEina_Bool;cdecl;external;
{ C++ end of extern C conditionnal removed }
{* @  }
{$endif}

implementation


end.
