unit Sensor;

interface

uses
  fp_sfml;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{////////////////////////////////////////////////////////// }
{ }
{ SFML - Simple and Fast Multimedia Library }
{ Copyright (C) 2007-2023 Laurent Gomila (laurent@sfml-dev.org) }
{ }
{ This software is provided 'as-is', without any express or implied warranty. }
{ In no event will the authors be held liable for any damages arising from the use of this software. }
{ }
{ Permission is granted to anyone to use this software for any purpose, }
{ including commercial applications, and to alter it and redistribute it freely, }
{ subject to the following restrictions: }
{ }
{ 1. The origin of this software must not be misrepresented; }
{    you must not claim that you wrote the original software. }
{    If you use this software in a product, an acknowledgment }
{    in the product documentation would be appreciated but is not required. }
{ }
{ 2. Altered source versions must be plainly marked as such, }
{    and must not be misrepresented as being the original software. }
{ }
{ 3. This notice may not be removed or altered from any source distribution. }
{ }
{////////////////////////////////////////////////////////// }
{$ifndef SFML_SENSOR_H}
{$define SFML_SENSOR_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Window/Export.h>}
{$include <SFML/Window/Types.h>}
{$include <SFML/System/Vector3.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Sensor Types }
{/ }
{////////////////////////////////////////////////////////// }
{/< Measures the raw acceleration (m/s^2) }
{/< Measures the raw rotation rates (degrees/s) }
{/< Measures the ambient magnetic field (micro-teslas) }
{/< Measures the direction and intensity of gravity, independent of device acceleration (m/s^2) }
{/< Measures the direction and intensity of device acceleration, independent of the gravity (m/s^2) }
{/< Measures the absolute 3D orientation (degrees) }
{/< Keep last -- the total number of sensor types }
type
  PsfSensorType = ^TsfSensorType;
  TsfSensorType =  Longint;
  Const
    sfSensorAccelerometer = 0;
    sfSensorGyroscope = 1;
    sfSensorMagnetometer = 2;
    sfSensorGravity = 3;
    sfSensorUserAcceleration = 4;
    sfSensorOrientation = 5;
    sfSensorCount = 6;
;
{////////////////////////////////////////////////////////// }
{/ \brief Check if a sensor is available on the underlying platform }
{/ }
{/ \param sensor Sensor to check }
{/ }
{/ \return sfTrue if the sensor is available, sfFalse otherwise }
{/ }
{////////////////////////////////////////////////////////// }

function sfSensor_isAvailable(sensor:TsfSensorType):TsfBool;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Enable or disable a sensor }
{/ }
{/ All sensors are disabled by default, to avoid consuming too }
{/ much battery power. Once a sensor is enabled, it starts }
{/ sending events of the corresponding type. }
{/ }
{/ This function does nothing if the sensor is unavailable. }
{/ }
{/ \param sensor Sensor to enable }
{/ \param enabled sfTrue to enable, sfFalse to disable }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfSensor_setEnabled(sensor:TsfSensorType; enabled:TsfBool);cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Get the current sensor value }
{/ }
{/ \param sensor Sensor to read }
{/ }
{/ \return The current sensor value }
{/ }
{////////////////////////////////////////////////////////// }
function sfSensor_getValue(sensor:TsfSensorType):TsfVector3f;cdecl;external libsfml_window;
{$endif}
{ SFML_SENSOR_H }

// === Konventiert am: 24-9-25 16:58:09 ===


implementation



end.
