
unit elm_thumb_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_thumb_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_thumb_common.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Thumb
 *
 * @
  }
{*
 * Get the ethumb_client handle so custom configuration can be made.
 *
 * @return Ethumb_Client instance or NULL.
 *
 * The ethumb client handle returned may or may not be NULL. It may or may
 * not survive into the future (ethumbd may become disconnected). Do not use
 * this unless you know what you are doing.
  }

function elm_thumb_ethumb_client_get:pointer;cdecl;external;
{*
 * Get the ethumb_client connection state.
 *
 * @return @c EINA_TRUE if the client is connected to the server or @c
 * EINA_FALSE otherwise.
  }
function elm_thumb_ethumb_client_connected_get:TEina_Bool;cdecl;external;
{*
 * @
  }

implementation


end.
