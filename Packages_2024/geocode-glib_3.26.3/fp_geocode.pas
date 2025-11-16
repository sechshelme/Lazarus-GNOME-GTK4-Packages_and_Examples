unit fp_geocode;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgeocode_glib = 'libgeocode-glib-2';
  {$ENDIF}

  {$IFDEF Windows}
  libgeocode_glib = 'libgeocode-glib-2.dll';  // ?????
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include geocode/geocode_enum_types.inc}
  {$include geocode/geocode_location.inc}
  {$include geocode/geocode_bounding_box.inc}
  {$include geocode/geocode_backend.inc}
  {$include geocode/geocode_place.inc}
  {$include geocode/geocode_forward.inc}
  {$include geocode/geocode_reverse.inc}
  {$include geocode/geocode_error.inc}
  {$include geocode/geocode_nominatim.inc}
  {$include geocode/geocode_mock_backend.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include geocode/geocode_enum_types.inc}
{$include geocode/geocode_location.inc}
{$include geocode/geocode_bounding_box.inc}
{$include geocode/geocode_backend.inc}
{$include geocode/geocode_place.inc}
{$include geocode/geocode_forward.inc}
{$include geocode/geocode_reverse.inc}
{$include geocode/geocode_error.inc}
{$include geocode/geocode_nominatim.inc}
{$include geocode/geocode_mock_backend.inc}
{$UNDEF read_implementation}

end.
