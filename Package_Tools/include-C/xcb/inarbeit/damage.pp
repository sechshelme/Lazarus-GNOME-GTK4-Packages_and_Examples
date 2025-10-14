
unit damage;
interface

{
  Automatically converted by H2Pas 1.0.0 from damage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    damage.h
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
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_damage_add_request_t  = ^xcb_damage_add_request_t;
Pxcb_damage_bad_damage_error_t  = ^xcb_damage_bad_damage_error_t;
Pxcb_damage_create_request_t  = ^xcb_damage_create_request_t;
Pxcb_damage_damage_iterator_t  = ^xcb_damage_damage_iterator_t;
Pxcb_damage_damage_t  = ^xcb_damage_damage_t;
Pxcb_damage_destroy_request_t  = ^xcb_damage_destroy_request_t;
Pxcb_damage_notify_event_t  = ^xcb_damage_notify_event_t;
Pxcb_damage_query_version_cookie_t  = ^xcb_damage_query_version_cookie_t;
Pxcb_damage_query_version_reply_t  = ^xcb_damage_query_version_reply_t;
Pxcb_damage_query_version_request_t  = ^xcb_damage_query_version_request_t;
Pxcb_damage_report_level_t  = ^xcb_damage_report_level_t;
Pxcb_damage_subtract_request_t  = ^xcb_damage_subtract_request_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from damage.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Damage_API XCB Damage API
 * @brief Damage XCB Protocol Implementation.
 * @
 * }
{$ifndef __DAMAGE_H}
{$define __DAMAGE_H}
{$include "xcb.h"}
{$include "xproto.h"}
{$include "xfixes.h"}
{ C++ extern C conditionnal removed }

const
  XCB_DAMAGE_MAJOR_VERSION = 1;  
  XCB_DAMAGE_MINOR_VERSION = 1;  
  var
    xcb_damage_id : Txcb_extension_t;cvar;external;
type
  Pxcb_damage_damage_t = ^Txcb_damage_damage_t;
  Txcb_damage_damage_t = Tuint32_t;
{*
 * @brief xcb_damage_damage_iterator_t
 * }

  Pxcb_damage_damage_iterator_t = ^Txcb_damage_damage_iterator_t;
  Txcb_damage_damage_iterator_t = record
      data : Pxcb_damage_damage_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_damage_report_level_t = ^Txcb_damage_report_level_t;
  Txcb_damage_report_level_t =  Longint;
  Const
    XCB_DAMAGE_REPORT_LEVEL_RAW_RECTANGLES = 0;
    XCB_DAMAGE_REPORT_LEVEL_DELTA_RECTANGLES = 1;
    XCB_DAMAGE_REPORT_LEVEL_BOUNDING_BOX = 2;
    XCB_DAMAGE_REPORT_LEVEL_NON_EMPTY = 3;
;
{* Opcode for xcb_damage_bad_damage.  }
  XCB_DAMAGE_BAD_DAMAGE = 0;  
{*
 * @brief xcb_damage_bad_damage_error_t
 * }
type
  Pxcb_damage_bad_damage_error_t = ^Txcb_damage_bad_damage_error_t;
  Txcb_damage_bad_damage_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_value : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
    end;
{*
 * @brief xcb_damage_query_version_cookie_t
 * }

  Pxcb_damage_query_version_cookie_t = ^Txcb_damage_query_version_cookie_t;
  Txcb_damage_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_damage_query_version.  }

const
  XCB_DAMAGE_QUERY_VERSION = 0;  
{*
 * @brief xcb_damage_query_version_request_t
 * }
type
  Pxcb_damage_query_version_request_t = ^Txcb_damage_query_version_request_t;
  Txcb_damage_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      client_major_version : Tuint32_t;
      client_minor_version : Tuint32_t;
    end;
{*
 * @brief xcb_damage_query_version_reply_t
 * }

  Pxcb_damage_query_version_reply_t = ^Txcb_damage_query_version_reply_t;
  Txcb_damage_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
      pad1 : array[0..15] of Tuint8_t;
    end;
{* Opcode for xcb_damage_create.  }

const
  XCB_DAMAGE_CREATE = 1;  
{*
 * @brief xcb_damage_create_request_t
 * }
type
  Pxcb_damage_create_request_t = ^Txcb_damage_create_request_t;
  Txcb_damage_create_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      damage : Txcb_damage_damage_t;
      drawable : Txcb_drawable_t;
      level : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_damage_destroy.  }

const
  XCB_DAMAGE_DESTROY = 2;  
{*
 * @brief xcb_damage_destroy_request_t
 * }
type
  Pxcb_damage_destroy_request_t = ^Txcb_damage_destroy_request_t;
  Txcb_damage_destroy_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      damage : Txcb_damage_damage_t;
    end;
{* Opcode for xcb_damage_subtract.  }

const
  XCB_DAMAGE_SUBTRACT = 3;  
{*
 * @brief xcb_damage_subtract_request_t
 * }
type
  Pxcb_damage_subtract_request_t = ^Txcb_damage_subtract_request_t;
  Txcb_damage_subtract_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      damage : Txcb_damage_damage_t;
      repair : Txcb_xfixes_region_t;
      parts : Txcb_xfixes_region_t;
    end;
{* Opcode for xcb_damage_add.  }

const
  XCB_DAMAGE_ADD = 4;  
{*
 * @brief xcb_damage_add_request_t
 * }
type
  Pxcb_damage_add_request_t = ^Txcb_damage_add_request_t;
  Txcb_damage_add_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      region : Txcb_xfixes_region_t;
    end;
{* Opcode for xcb_damage_notify.  }

const
  XCB_DAMAGE_NOTIFY = 0;  
{*
 * @brief xcb_damage_notify_event_t
 * }
type
  Pxcb_damage_notify_event_t = ^Txcb_damage_notify_event_t;
  Txcb_damage_notify_event_t = record
      response_type : Tuint8_t;
      level : Tuint8_t;
      sequence : Tuint16_t;
      drawable : Txcb_drawable_t;
      damage : Txcb_damage_damage_t;
      timestamp : Txcb_timestamp_t;
      area : Txcb_rectangle_t;
      geometry : Txcb_rectangle_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_damage_damage_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_damage_damage_t)
  }

procedure xcb_damage_damage_next(i:Pxcb_damage_damage_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_damage_damage_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_damage_damage_end(i:Txcb_damage_damage_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * @brief Negotiate the version of the DAMAGE extension
 *
 * @param c The connection
 * @param client_major_version The major version supported by the client.
 * @param client_minor_version The minor version supported by the client.
 * @return A cookie
 *
 * This negotiates the version of the DAMAGE extension.  It must precede any other
 * request using the DAMAGE extension.  Failure to do so will cause a BadRequest
 * error for those requests.
 *
  }
function xcb_damage_query_version(c:Pxcb_connection_t; client_major_version:Tuint32_t; client_minor_version:Tuint32_t):Txcb_damage_query_version_cookie_t;cdecl;external;
{*
 * @brief Negotiate the version of the DAMAGE extension
 *
 * @param c The connection
 * @param client_major_version The major version supported by the client.
 * @param client_minor_version The minor version supported by the client.
 * @return A cookie
 *
 * This negotiates the version of the DAMAGE extension.  It must precede any other
 * request using the DAMAGE extension.  Failure to do so will cause a BadRequest
 * error for those requests.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_damage_query_version_unchecked(c:Pxcb_connection_t; client_major_version:Tuint32_t; client_minor_version:Tuint32_t):Txcb_damage_query_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_damage_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_damage_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_damage_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_damage_query_version_reply_t;cdecl;external;
{*
 * @brief Creates a Damage object to monitor changes to a drawable.
 *
 * @param c The connection
 * @param damage The ID with which you will refer to the new Damage object, created by
 * `xcb_generate_id`.
 * @param drawable The ID of the drawable to be monitored.
 * @param level A bitmask of #xcb_damage_report_level_t values.
 * @param level The level of detail to be provided in Damage events.
 * @return A cookie
 *
 * This creates a Damage object to monitor changes to a drawable, and specifies
 * the level of detail to be reported for changes.
 * 
 * We call changes made to pixel contents of windows and pixmaps 'damage'
 * throughout this extension.
 * 
 * Damage accumulates as drawing occurs in the drawable.  Each drawing operation
 * 'damages' one or more rectangular areas within the drawable.  The rectangles
 * are guaranteed to include the set of pixels modified by each operation, but
 * may include significantly more than just those pixels.  The desire is for
 * the damage to strike a balance between the number of rectangles reported and
 * the extraneous area included.  A reasonable goal is for each primitive
 * object drawn (line, string, rectangle) to be represented as a single
 * rectangle and for the damage area of the operation to be the union of these
 * rectangles.
 * 
 * The DAMAGE extension allows applications to either receive the raw
 * rectangles as a stream of events, or to have them partially processed within
 * the X server to reduce the amount of data transmitted as well as reduce the
 * processing latency once the repaint operation has started.
 * 
 * The Damage object holds any accumulated damage region and reflects the
 * relationship between the drawable selected for damage notification and the
 * drawable for which damage is tracked.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_damage_create_checked(c:Pxcb_connection_t; damage:Txcb_damage_damage_t; drawable:Txcb_drawable_t; level:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Creates a Damage object to monitor changes to a drawable.
 *
 * @param c The connection
 * @param damage The ID with which you will refer to the new Damage object, created by
 * `xcb_generate_id`.
 * @param drawable The ID of the drawable to be monitored.
 * @param level A bitmask of #xcb_damage_report_level_t values.
 * @param level The level of detail to be provided in Damage events.
 * @return A cookie
 *
 * This creates a Damage object to monitor changes to a drawable, and specifies
 * the level of detail to be reported for changes.
 * 
 * We call changes made to pixel contents of windows and pixmaps 'damage'
 * throughout this extension.
 * 
 * Damage accumulates as drawing occurs in the drawable.  Each drawing operation
 * 'damages' one or more rectangular areas within the drawable.  The rectangles
 * are guaranteed to include the set of pixels modified by each operation, but
 * may include significantly more than just those pixels.  The desire is for
 * the damage to strike a balance between the number of rectangles reported and
 * the extraneous area included.  A reasonable goal is for each primitive
 * object drawn (line, string, rectangle) to be represented as a single
 * rectangle and for the damage area of the operation to be the union of these
 * rectangles.
 * 
 * The DAMAGE extension allows applications to either receive the raw
 * rectangles as a stream of events, or to have them partially processed within
 * the X server to reduce the amount of data transmitted as well as reduce the
 * processing latency once the repaint operation has started.
 * 
 * The Damage object holds any accumulated damage region and reflects the
 * relationship between the drawable selected for damage notification and the
 * drawable for which damage is tracked.
 *
  }
function xcb_damage_create(c:Pxcb_connection_t; damage:Txcb_damage_damage_t; drawable:Txcb_drawable_t; level:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Destroys a previously created Damage object.
 *
 * @param c The connection
 * @param damage The ID you provided to `xcb_create_damage`.
 * @return A cookie
 *
 * This destroys a Damage object and requests the X server stop reporting
 * the changes it was tracking.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_damage_destroy_checked(c:Pxcb_connection_t; damage:Txcb_damage_damage_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Destroys a previously created Damage object.
 *
 * @param c The connection
 * @param damage The ID you provided to `xcb_create_damage`.
 * @return A cookie
 *
 * This destroys a Damage object and requests the X server stop reporting
 * the changes it was tracking.
 *
  }
function xcb_damage_destroy(c:Pxcb_connection_t; damage:Txcb_damage_damage_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Remove regions from a previously created Damage object.
 *
 * @param c The connection
 * @param damage The ID you provided to `xcb_create_damage`.
 * @return A cookie
 *
 * This updates the regions of damage recorded in a a Damage object.
 * See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
 * for details.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_damage_subtract_checked(c:Pxcb_connection_t; damage:Txcb_damage_damage_t; repair:Txcb_xfixes_region_t; parts:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Remove regions from a previously created Damage object.
 *
 * @param c The connection
 * @param damage The ID you provided to `xcb_create_damage`.
 * @return A cookie
 *
 * This updates the regions of damage recorded in a a Damage object.
 * See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
 * for details.
 *
  }
function xcb_damage_subtract(c:Pxcb_connection_t; damage:Txcb_damage_damage_t; repair:Txcb_xfixes_region_t; parts:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Add a region to a previously created Damage object.
 *
 * @param c The connection
 * @return A cookie
 *
 * This updates the regions of damage recorded in a a Damage object.
 * See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
 * for details.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_damage_add_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; region:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Add a region to a previously created Damage object.
 *
 * @param c The connection
 * @return A cookie
 *
 * This updates the regions of damage recorded in a a Damage object.
 * See https://www.x.org/releases/current/doc/damageproto/damageproto.txt
 * for details.
 *
  }
function xcb_damage_add(c:Pxcb_connection_t; drawable:Txcb_drawable_t; region:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
