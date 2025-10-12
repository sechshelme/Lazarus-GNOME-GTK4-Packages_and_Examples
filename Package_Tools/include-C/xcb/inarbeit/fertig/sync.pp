
unit sync;
interface

{
  Automatically converted by H2Pas 1.0.0 from sync.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sync.h
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
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_sync_alarm_error_t  = ^xcb_sync_alarm_error_t;
Pxcb_sync_alarm_iterator_t  = ^xcb_sync_alarm_iterator_t;
Pxcb_sync_alarm_notify_event_t  = ^xcb_sync_alarm_notify_event_t;
Pxcb_sync_alarm_t  = ^xcb_sync_alarm_t;
Pxcb_sync_alarmstate_t  = ^xcb_sync_alarmstate_t;
Pxcb_sync_await_fence_request_t  = ^xcb_sync_await_fence_request_t;
Pxcb_sync_await_request_t  = ^xcb_sync_await_request_t;
Pxcb_sync_ca_t  = ^xcb_sync_ca_t;
Pxcb_sync_change_alarm_request_t  = ^xcb_sync_change_alarm_request_t;
Pxcb_sync_change_alarm_value_list_t  = ^xcb_sync_change_alarm_value_list_t;
Pxcb_sync_change_counter_request_t  = ^xcb_sync_change_counter_request_t;
Pxcb_sync_counter_error_t  = ^xcb_sync_counter_error_t;
Pxcb_sync_counter_iterator_t  = ^xcb_sync_counter_iterator_t;
Pxcb_sync_counter_notify_event_t  = ^xcb_sync_counter_notify_event_t;
Pxcb_sync_counter_t  = ^xcb_sync_counter_t;
Pxcb_sync_create_alarm_request_t  = ^xcb_sync_create_alarm_request_t;
Pxcb_sync_create_alarm_value_list_t  = ^xcb_sync_create_alarm_value_list_t;
Pxcb_sync_create_counter_request_t  = ^xcb_sync_create_counter_request_t;
Pxcb_sync_create_fence_request_t  = ^xcb_sync_create_fence_request_t;
Pxcb_sync_destroy_alarm_request_t  = ^xcb_sync_destroy_alarm_request_t;
Pxcb_sync_destroy_counter_request_t  = ^xcb_sync_destroy_counter_request_t;
Pxcb_sync_destroy_fence_request_t  = ^xcb_sync_destroy_fence_request_t;
Pxcb_sync_fence_iterator_t  = ^xcb_sync_fence_iterator_t;
Pxcb_sync_fence_t  = ^xcb_sync_fence_t;
Pxcb_sync_get_priority_cookie_t  = ^xcb_sync_get_priority_cookie_t;
Pxcb_sync_get_priority_reply_t  = ^xcb_sync_get_priority_reply_t;
Pxcb_sync_get_priority_request_t  = ^xcb_sync_get_priority_request_t;
Pxcb_sync_initialize_cookie_t  = ^xcb_sync_initialize_cookie_t;
Pxcb_sync_initialize_reply_t  = ^xcb_sync_initialize_reply_t;
Pxcb_sync_initialize_request_t  = ^xcb_sync_initialize_request_t;
Pxcb_sync_int64_iterator_t  = ^xcb_sync_int64_iterator_t;
Pxcb_sync_int64_t  = ^xcb_sync_int64_t;
Pxcb_sync_list_system_counters_cookie_t  = ^xcb_sync_list_system_counters_cookie_t;
Pxcb_sync_list_system_counters_reply_t  = ^xcb_sync_list_system_counters_reply_t;
Pxcb_sync_list_system_counters_request_t  = ^xcb_sync_list_system_counters_request_t;
Pxcb_sync_query_alarm_cookie_t  = ^xcb_sync_query_alarm_cookie_t;
Pxcb_sync_query_alarm_reply_t  = ^xcb_sync_query_alarm_reply_t;
Pxcb_sync_query_alarm_request_t  = ^xcb_sync_query_alarm_request_t;
Pxcb_sync_query_counter_cookie_t  = ^xcb_sync_query_counter_cookie_t;
Pxcb_sync_query_counter_reply_t  = ^xcb_sync_query_counter_reply_t;
Pxcb_sync_query_counter_request_t  = ^xcb_sync_query_counter_request_t;
Pxcb_sync_query_fence_cookie_t  = ^xcb_sync_query_fence_cookie_t;
Pxcb_sync_query_fence_reply_t  = ^xcb_sync_query_fence_reply_t;
Pxcb_sync_query_fence_request_t  = ^xcb_sync_query_fence_request_t;
Pxcb_sync_reset_fence_request_t  = ^xcb_sync_reset_fence_request_t;
Pxcb_sync_set_counter_request_t  = ^xcb_sync_set_counter_request_t;
Pxcb_sync_set_priority_request_t  = ^xcb_sync_set_priority_request_t;
Pxcb_sync_systemcounter_iterator_t  = ^xcb_sync_systemcounter_iterator_t;
Pxcb_sync_systemcounter_t  = ^xcb_sync_systemcounter_t;
Pxcb_sync_testtype_t  = ^xcb_sync_testtype_t;
Pxcb_sync_trigger_fence_request_t  = ^xcb_sync_trigger_fence_request_t;
Pxcb_sync_trigger_iterator_t  = ^xcb_sync_trigger_iterator_t;
Pxcb_sync_trigger_t  = ^xcb_sync_trigger_t;
Pxcb_sync_valuetype_t  = ^xcb_sync_valuetype_t;
Pxcb_sync_waitcondition_iterator_t  = ^xcb_sync_waitcondition_iterator_t;
Pxcb_sync_waitcondition_t  = ^xcb_sync_waitcondition_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from sync.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Sync_API XCB Sync API
 * @brief Sync XCB Protocol Implementation.
 * @
 * }
{$ifndef __SYNC_H}
{$define __SYNC_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_SYNC_MAJOR_VERSION = 3;  
  XCB_SYNC_MINOR_VERSION = 1;  
  var
    xcb_sync_id : Txcb_extension_t;cvar;external;
type
  Pxcb_sync_alarm_t = ^Txcb_sync_alarm_t;
  Txcb_sync_alarm_t = Tuint32_t;
{*
 * @brief xcb_sync_alarm_iterator_t
 * }

  Pxcb_sync_alarm_iterator_t = ^Txcb_sync_alarm_iterator_t;
  Txcb_sync_alarm_iterator_t = record
      data : Pxcb_sync_alarm_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_sync_alarmstate_t = ^Txcb_sync_alarmstate_t;
  Txcb_sync_alarmstate_t =  Longint;
  Const
    XCB_SYNC_ALARMSTATE_ACTIVE = 0;
    XCB_SYNC_ALARMSTATE_INACTIVE = 1;
    XCB_SYNC_ALARMSTATE_DESTROYED = 2;
;
type
  Pxcb_sync_counter_t = ^Txcb_sync_counter_t;
  Txcb_sync_counter_t = Tuint32_t;
{*
 * @brief xcb_sync_counter_iterator_t
 * }

  Pxcb_sync_counter_iterator_t = ^Txcb_sync_counter_iterator_t;
  Txcb_sync_counter_iterator_t = record
      data : Pxcb_sync_counter_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_sync_fence_t = ^Txcb_sync_fence_t;
  Txcb_sync_fence_t = Tuint32_t;
{*
 * @brief xcb_sync_fence_iterator_t
 * }

  Pxcb_sync_fence_iterator_t = ^Txcb_sync_fence_iterator_t;
  Txcb_sync_fence_iterator_t = record
      data : Pxcb_sync_fence_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_sync_testtype_t = ^Txcb_sync_testtype_t;
  Txcb_sync_testtype_t =  Longint;
  Const
    XCB_SYNC_TESTTYPE_POSITIVE_TRANSITION = 0;
    XCB_SYNC_TESTTYPE_NEGATIVE_TRANSITION = 1;
    XCB_SYNC_TESTTYPE_POSITIVE_COMPARISON = 2;
    XCB_SYNC_TESTTYPE_NEGATIVE_COMPARISON = 3;
;
type
  Pxcb_sync_valuetype_t = ^Txcb_sync_valuetype_t;
  Txcb_sync_valuetype_t =  Longint;
  Const
    XCB_SYNC_VALUETYPE_ABSOLUTE = 0;
    XCB_SYNC_VALUETYPE_RELATIVE = 1;
;
type
  Pxcb_sync_ca_t = ^Txcb_sync_ca_t;
  Txcb_sync_ca_t =  Longint;
  Const
    XCB_SYNC_CA_COUNTER = 1;
    XCB_SYNC_CA_VALUE_TYPE = 2;
    XCB_SYNC_CA_VALUE = 4;
    XCB_SYNC_CA_TEST_TYPE = 8;
    XCB_SYNC_CA_DELTA = 16;
    XCB_SYNC_CA_EVENTS = 32;
;
{*
 * @brief xcb_sync_int64_t
 * }
type
  Pxcb_sync_int64_t = ^Txcb_sync_int64_t;
  Txcb_sync_int64_t = record
      hi : Tint32_t;
      lo : Tuint32_t;
    end;
{*
 * @brief xcb_sync_int64_iterator_t
 * }

  Pxcb_sync_int64_iterator_t = ^Txcb_sync_int64_iterator_t;
  Txcb_sync_int64_iterator_t = record
      data : Pxcb_sync_int64_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_sync_systemcounter_t
 * }

  Pxcb_sync_systemcounter_t = ^Txcb_sync_systemcounter_t;
  Txcb_sync_systemcounter_t = record
      counter : Txcb_sync_counter_t;
      resolution : Txcb_sync_int64_t;
      name_len : Tuint16_t;
    end;
{*
 * @brief xcb_sync_systemcounter_iterator_t
 * }

  Pxcb_sync_systemcounter_iterator_t = ^Txcb_sync_systemcounter_iterator_t;
  Txcb_sync_systemcounter_iterator_t = record
      data : Pxcb_sync_systemcounter_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_sync_trigger_t
 * }

  Pxcb_sync_trigger_t = ^Txcb_sync_trigger_t;
  Txcb_sync_trigger_t = record
      counter : Txcb_sync_counter_t;
      wait_type : Tuint32_t;
      wait_value : Txcb_sync_int64_t;
      test_type : Tuint32_t;
    end;
{*
 * @brief xcb_sync_trigger_iterator_t
 * }

  Pxcb_sync_trigger_iterator_t = ^Txcb_sync_trigger_iterator_t;
  Txcb_sync_trigger_iterator_t = record
      data : Pxcb_sync_trigger_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_sync_waitcondition_t
 * }

  Pxcb_sync_waitcondition_t = ^Txcb_sync_waitcondition_t;
  Txcb_sync_waitcondition_t = record
      trigger : Txcb_sync_trigger_t;
      event_threshold : Txcb_sync_int64_t;
    end;
{*
 * @brief xcb_sync_waitcondition_iterator_t
 * }

  Pxcb_sync_waitcondition_iterator_t = ^Txcb_sync_waitcondition_iterator_t;
  Txcb_sync_waitcondition_iterator_t = record
      data : Pxcb_sync_waitcondition_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_sync_counter.  }

const
  XCB_SYNC_COUNTER = 0;  
{*
 * @brief xcb_sync_counter_error_t
 * }
type
  Pxcb_sync_counter_error_t = ^Txcb_sync_counter_error_t;
  Txcb_sync_counter_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_counter : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
    end;
{* Opcode for xcb_sync_alarm.  }

const
  XCB_SYNC_ALARM = 1;  
{*
 * @brief xcb_sync_alarm_error_t
 * }
type
  Pxcb_sync_alarm_error_t = ^Txcb_sync_alarm_error_t;
  Txcb_sync_alarm_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_alarm : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
    end;
{*
 * @brief xcb_sync_initialize_cookie_t
 * }

  Pxcb_sync_initialize_cookie_t = ^Txcb_sync_initialize_cookie_t;
  Txcb_sync_initialize_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_sync_initialize.  }

const
  XCB_SYNC_INITIALIZE = 0;  
{*
 * @brief xcb_sync_initialize_request_t
 * }
type
  Pxcb_sync_initialize_request_t = ^Txcb_sync_initialize_request_t;
  Txcb_sync_initialize_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      desired_major_version : Tuint8_t;
      desired_minor_version : Tuint8_t;
    end;
{*
 * @brief xcb_sync_initialize_reply_t
 * }

  Pxcb_sync_initialize_reply_t = ^Txcb_sync_initialize_reply_t;
  Txcb_sync_initialize_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint8_t;
      minor_version : Tuint8_t;
      pad1 : array[0..21] of Tuint8_t;
    end;
{*
 * @brief xcb_sync_list_system_counters_cookie_t
 * }

  Pxcb_sync_list_system_counters_cookie_t = ^Txcb_sync_list_system_counters_cookie_t;
  Txcb_sync_list_system_counters_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_sync_list_system_counters.  }

const
  XCB_SYNC_LIST_SYSTEM_COUNTERS = 1;  
{*
 * @brief xcb_sync_list_system_counters_request_t
 * }
type
  Pxcb_sync_list_system_counters_request_t = ^Txcb_sync_list_system_counters_request_t;
  Txcb_sync_list_system_counters_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_sync_list_system_counters_reply_t
 * }

  Pxcb_sync_list_system_counters_reply_t = ^Txcb_sync_list_system_counters_reply_t;
  Txcb_sync_list_system_counters_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      counters_len : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{* Opcode for xcb_sync_create_counter.  }

const
  XCB_SYNC_CREATE_COUNTER = 2;  
{*
 * @brief xcb_sync_create_counter_request_t
 * }
type
  Pxcb_sync_create_counter_request_t = ^Txcb_sync_create_counter_request_t;
  Txcb_sync_create_counter_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      id : Txcb_sync_counter_t;
      initial_value : Txcb_sync_int64_t;
    end;
{* Opcode for xcb_sync_destroy_counter.  }

const
  XCB_SYNC_DESTROY_COUNTER = 6;  
{*
 * @brief xcb_sync_destroy_counter_request_t
 * }
type
  Pxcb_sync_destroy_counter_request_t = ^Txcb_sync_destroy_counter_request_t;
  Txcb_sync_destroy_counter_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      counter : Txcb_sync_counter_t;
    end;
{*
 * @brief xcb_sync_query_counter_cookie_t
 * }

  Pxcb_sync_query_counter_cookie_t = ^Txcb_sync_query_counter_cookie_t;
  Txcb_sync_query_counter_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_sync_query_counter.  }

const
  XCB_SYNC_QUERY_COUNTER = 5;  
{*
 * @brief xcb_sync_query_counter_request_t
 * }
type
  Pxcb_sync_query_counter_request_t = ^Txcb_sync_query_counter_request_t;
  Txcb_sync_query_counter_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      counter : Txcb_sync_counter_t;
    end;
{*
 * @brief xcb_sync_query_counter_reply_t
 * }

  Pxcb_sync_query_counter_reply_t = ^Txcb_sync_query_counter_reply_t;
  Txcb_sync_query_counter_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      counter_value : Txcb_sync_int64_t;
    end;
{* Opcode for xcb_sync_await.  }

const
  XCB_SYNC_AWAIT = 7;  
{*
 * @brief xcb_sync_await_request_t
 * }
type
  Pxcb_sync_await_request_t = ^Txcb_sync_await_request_t;
  Txcb_sync_await_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{* Opcode for xcb_sync_change_counter.  }

const
  XCB_SYNC_CHANGE_COUNTER = 4;  
{*
 * @brief xcb_sync_change_counter_request_t
 * }
type
  Pxcb_sync_change_counter_request_t = ^Txcb_sync_change_counter_request_t;
  Txcb_sync_change_counter_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      counter : Txcb_sync_counter_t;
      amount : Txcb_sync_int64_t;
    end;
{* Opcode for xcb_sync_set_counter.  }

const
  XCB_SYNC_SET_COUNTER = 3;  
{*
 * @brief xcb_sync_set_counter_request_t
 * }
type
  Pxcb_sync_set_counter_request_t = ^Txcb_sync_set_counter_request_t;
  Txcb_sync_set_counter_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      counter : Txcb_sync_counter_t;
      value : Txcb_sync_int64_t;
    end;
{*
 * @brief xcb_sync_create_alarm_value_list_t
 * }

  Pxcb_sync_create_alarm_value_list_t = ^Txcb_sync_create_alarm_value_list_t;
  Txcb_sync_create_alarm_value_list_t = record
      counter : Txcb_sync_counter_t;
      valueType : Tuint32_t;
      value : Txcb_sync_int64_t;
      testType : Tuint32_t;
      delta : Txcb_sync_int64_t;
      events : Tuint32_t;
    end;
{* Opcode for xcb_sync_create_alarm.  }

const
  XCB_SYNC_CREATE_ALARM = 8;  
{*
 * @brief xcb_sync_create_alarm_request_t
 * }
type
  Pxcb_sync_create_alarm_request_t = ^Txcb_sync_create_alarm_request_t;
  Txcb_sync_create_alarm_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      id : Txcb_sync_alarm_t;
      value_mask : Tuint32_t;
    end;
{*
 * @brief xcb_sync_change_alarm_value_list_t
 * }

  Pxcb_sync_change_alarm_value_list_t = ^Txcb_sync_change_alarm_value_list_t;
  Txcb_sync_change_alarm_value_list_t = record
      counter : Txcb_sync_counter_t;
      valueType : Tuint32_t;
      value : Txcb_sync_int64_t;
      testType : Tuint32_t;
      delta : Txcb_sync_int64_t;
      events : Tuint32_t;
    end;
{* Opcode for xcb_sync_change_alarm.  }

const
  XCB_SYNC_CHANGE_ALARM = 9;  
{*
 * @brief xcb_sync_change_alarm_request_t
 * }
type
  Pxcb_sync_change_alarm_request_t = ^Txcb_sync_change_alarm_request_t;
  Txcb_sync_change_alarm_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      id : Txcb_sync_alarm_t;
      value_mask : Tuint32_t;
    end;
{* Opcode for xcb_sync_destroy_alarm.  }

const
  XCB_SYNC_DESTROY_ALARM = 11;  
{*
 * @brief xcb_sync_destroy_alarm_request_t
 * }
type
  Pxcb_sync_destroy_alarm_request_t = ^Txcb_sync_destroy_alarm_request_t;
  Txcb_sync_destroy_alarm_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      alarm : Txcb_sync_alarm_t;
    end;
{*
 * @brief xcb_sync_query_alarm_cookie_t
 * }

  Pxcb_sync_query_alarm_cookie_t = ^Txcb_sync_query_alarm_cookie_t;
  Txcb_sync_query_alarm_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_sync_query_alarm.  }

const
  XCB_SYNC_QUERY_ALARM = 10;  
{*
 * @brief xcb_sync_query_alarm_request_t
 * }
type
  Pxcb_sync_query_alarm_request_t = ^Txcb_sync_query_alarm_request_t;
  Txcb_sync_query_alarm_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      alarm : Txcb_sync_alarm_t;
    end;
{*
 * @brief xcb_sync_query_alarm_reply_t
 * }

  Pxcb_sync_query_alarm_reply_t = ^Txcb_sync_query_alarm_reply_t;
  Txcb_sync_query_alarm_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      trigger : Txcb_sync_trigger_t;
      delta : Txcb_sync_int64_t;
      events : Tuint8_t;
      state : Tuint8_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{* Opcode for xcb_sync_set_priority.  }

const
  XCB_SYNC_SET_PRIORITY = 12;  
{*
 * @brief xcb_sync_set_priority_request_t
 * }
type
  Pxcb_sync_set_priority_request_t = ^Txcb_sync_set_priority_request_t;
  Txcb_sync_set_priority_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      id : Tuint32_t;
      priority : Tint32_t;
    end;
{*
 * @brief xcb_sync_get_priority_cookie_t
 * }

  Pxcb_sync_get_priority_cookie_t = ^Txcb_sync_get_priority_cookie_t;
  Txcb_sync_get_priority_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_sync_get_priority.  }

const
  XCB_SYNC_GET_PRIORITY = 13;  
{*
 * @brief xcb_sync_get_priority_request_t
 * }
type
  Pxcb_sync_get_priority_request_t = ^Txcb_sync_get_priority_request_t;
  Txcb_sync_get_priority_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      id : Tuint32_t;
    end;
{*
 * @brief xcb_sync_get_priority_reply_t
 * }

  Pxcb_sync_get_priority_reply_t = ^Txcb_sync_get_priority_reply_t;
  Txcb_sync_get_priority_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      priority : Tint32_t;
    end;
{* Opcode for xcb_sync_create_fence.  }

const
  XCB_SYNC_CREATE_FENCE = 14;  
{*
 * @brief xcb_sync_create_fence_request_t
 * }
type
  Pxcb_sync_create_fence_request_t = ^Txcb_sync_create_fence_request_t;
  Txcb_sync_create_fence_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      fence : Txcb_sync_fence_t;
      initially_triggered : Tuint8_t;
    end;
{* Opcode for xcb_sync_trigger_fence.  }

const
  XCB_SYNC_TRIGGER_FENCE = 15;  
{*
 * @brief xcb_sync_trigger_fence_request_t
 * }
type
  Pxcb_sync_trigger_fence_request_t = ^Txcb_sync_trigger_fence_request_t;
  Txcb_sync_trigger_fence_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      fence : Txcb_sync_fence_t;
    end;
{* Opcode for xcb_sync_reset_fence.  }

const
  XCB_SYNC_RESET_FENCE = 16;  
{*
 * @brief xcb_sync_reset_fence_request_t
 * }
type
  Pxcb_sync_reset_fence_request_t = ^Txcb_sync_reset_fence_request_t;
  Txcb_sync_reset_fence_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      fence : Txcb_sync_fence_t;
    end;
{* Opcode for xcb_sync_destroy_fence.  }

const
  XCB_SYNC_DESTROY_FENCE = 17;  
{*
 * @brief xcb_sync_destroy_fence_request_t
 * }
type
  Pxcb_sync_destroy_fence_request_t = ^Txcb_sync_destroy_fence_request_t;
  Txcb_sync_destroy_fence_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      fence : Txcb_sync_fence_t;
    end;
{*
 * @brief xcb_sync_query_fence_cookie_t
 * }

  Pxcb_sync_query_fence_cookie_t = ^Txcb_sync_query_fence_cookie_t;
  Txcb_sync_query_fence_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_sync_query_fence.  }

const
  XCB_SYNC_QUERY_FENCE = 18;  
{*
 * @brief xcb_sync_query_fence_request_t
 * }
type
  Pxcb_sync_query_fence_request_t = ^Txcb_sync_query_fence_request_t;
  Txcb_sync_query_fence_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      fence : Txcb_sync_fence_t;
    end;
{*
 * @brief xcb_sync_query_fence_reply_t
 * }

  Pxcb_sync_query_fence_reply_t = ^Txcb_sync_query_fence_reply_t;
  Txcb_sync_query_fence_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      triggered : Tuint8_t;
      pad1 : array[0..22] of Tuint8_t;
    end;
{* Opcode for xcb_sync_await_fence.  }

const
  XCB_SYNC_AWAIT_FENCE = 19;  
{*
 * @brief xcb_sync_await_fence_request_t
 * }
type
  Pxcb_sync_await_fence_request_t = ^Txcb_sync_await_fence_request_t;
  Txcb_sync_await_fence_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{* Opcode for xcb_sync_counter_notify.  }

const
  XCB_SYNC_COUNTER_NOTIFY = 0;  
{*
 * @brief xcb_sync_counter_notify_event_t
 * }
type
  Pxcb_sync_counter_notify_event_t = ^Txcb_sync_counter_notify_event_t;
  Txcb_sync_counter_notify_event_t = record
      response_type : Tuint8_t;
      kind : Tuint8_t;
      sequence : Tuint16_t;
      counter : Txcb_sync_counter_t;
      wait_value : Txcb_sync_int64_t;
      counter_value : Txcb_sync_int64_t;
      timestamp : Txcb_timestamp_t;
      count : Tuint16_t;
      destroyed : Tuint8_t;
      pad0 : Tuint8_t;
    end;
{* Opcode for xcb_sync_alarm_notify.  }

const
  XCB_SYNC_ALARM_NOTIFY = 1;  
{*
 * @brief xcb_sync_alarm_notify_event_t
 * }
type
  Pxcb_sync_alarm_notify_event_t = ^Txcb_sync_alarm_notify_event_t;
  Txcb_sync_alarm_notify_event_t = record
      response_type : Tuint8_t;
      kind : Tuint8_t;
      sequence : Tuint16_t;
      alarm : Txcb_sync_alarm_t;
      counter_value : Txcb_sync_int64_t;
      alarm_value : Txcb_sync_int64_t;
      timestamp : Txcb_timestamp_t;
      state : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_sync_alarm_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_sync_alarm_t)
  }

procedure xcb_sync_alarm_next(i:Pxcb_sync_alarm_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_sync_alarm_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_sync_alarm_end(i:Txcb_sync_alarm_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_sync_counter_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_sync_counter_t)
  }
procedure xcb_sync_counter_next(i:Pxcb_sync_counter_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_sync_counter_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_sync_counter_end(i:Txcb_sync_counter_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_sync_fence_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_sync_fence_t)
  }
procedure xcb_sync_fence_next(i:Pxcb_sync_fence_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_sync_fence_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_sync_fence_end(i:Txcb_sync_fence_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_sync_int64_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_sync_int64_t)
  }
procedure xcb_sync_int64_next(i:Pxcb_sync_int64_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_sync_int64_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_sync_int64_end(i:Txcb_sync_int64_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_systemcounter_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_sync_systemcounter_name(R:Pxcb_sync_systemcounter_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_sync_systemcounter_name_length(R:Pxcb_sync_systemcounter_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_sync_systemcounter_name_end(R:Pxcb_sync_systemcounter_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_sync_systemcounter_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_sync_systemcounter_t)
  }
procedure xcb_sync_systemcounter_next(i:Pxcb_sync_systemcounter_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_sync_systemcounter_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_sync_systemcounter_end(i:Txcb_sync_systemcounter_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_sync_trigger_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_sync_trigger_t)
  }
procedure xcb_sync_trigger_next(i:Pxcb_sync_trigger_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_sync_trigger_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_sync_trigger_end(i:Txcb_sync_trigger_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_sync_waitcondition_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_sync_waitcondition_t)
  }
procedure xcb_sync_waitcondition_next(i:Pxcb_sync_waitcondition_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_sync_waitcondition_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_sync_waitcondition_end(i:Txcb_sync_waitcondition_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_initialize(c:Pxcb_connection_t; desired_major_version:Tuint8_t; desired_minor_version:Tuint8_t):Txcb_sync_initialize_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_sync_initialize_unchecked(c:Pxcb_connection_t; desired_major_version:Tuint8_t; desired_minor_version:Tuint8_t):Txcb_sync_initialize_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_sync_initialize_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_sync_initialize_reply(c:Pxcb_connection_t; cookie:Txcb_sync_initialize_cookie_t; e:PPxcb_generic_error_t):Pxcb_sync_initialize_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_list_system_counters_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_list_system_counters(c:Pxcb_connection_t):Txcb_sync_list_system_counters_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_sync_list_system_counters_unchecked(c:Pxcb_connection_t):Txcb_sync_list_system_counters_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_list_system_counters_counters_length(R:Pxcb_sync_list_system_counters_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_sync_list_system_counters_counters_iterator(R:Pxcb_sync_list_system_counters_reply_t):Txcb_sync_systemcounter_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_sync_list_system_counters_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_sync_list_system_counters_reply(c:Pxcb_connection_t; cookie:Txcb_sync_list_system_counters_cookie_t; e:PPxcb_generic_error_t):Pxcb_sync_list_system_counters_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_sync_create_counter_checked(c:Pxcb_connection_t; id:Txcb_sync_counter_t; initial_value:Txcb_sync_int64_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_create_counter(c:Pxcb_connection_t; id:Txcb_sync_counter_t; initial_value:Txcb_sync_int64_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_sync_destroy_counter_checked(c:Pxcb_connection_t; counter:Txcb_sync_counter_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_destroy_counter(c:Pxcb_connection_t; counter:Txcb_sync_counter_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_query_counter(c:Pxcb_connection_t; counter:Txcb_sync_counter_t):Txcb_sync_query_counter_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_sync_query_counter_unchecked(c:Pxcb_connection_t; counter:Txcb_sync_counter_t):Txcb_sync_query_counter_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_sync_query_counter_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_sync_query_counter_reply(c:Pxcb_connection_t; cookie:Txcb_sync_query_counter_cookie_t; e:PPxcb_generic_error_t):Pxcb_sync_query_counter_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_await_sizeof(_buffer:pointer; wait_list_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_sync_await_checked(c:Pxcb_connection_t; wait_list_len:Tuint32_t; wait_list:Pxcb_sync_waitcondition_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_sync_await(c:Pxcb_connection_t; wait_list_len:Tuint32_t; wait_list:Pxcb_sync_waitcondition_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_await_wait_list(R:Pxcb_sync_await_request_t):Pxcb_sync_waitcondition_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_await_wait_list_length(R:Pxcb_sync_await_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_sync_await_wait_list_iterator(R:Pxcb_sync_await_request_t):Txcb_sync_waitcondition_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_sync_change_counter_checked(c:Pxcb_connection_t; counter:Txcb_sync_counter_t; amount:Txcb_sync_int64_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_change_counter(c:Pxcb_connection_t; counter:Txcb_sync_counter_t; amount:Txcb_sync_int64_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_sync_set_counter_checked(c:Pxcb_connection_t; counter:Txcb_sync_counter_t; value:Txcb_sync_int64_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_set_counter(c:Pxcb_connection_t; counter:Txcb_sync_counter_t; value:Txcb_sync_int64_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_create_alarm_value_list_serialize(_buffer:Ppointer; value_mask:Tuint32_t; _aux:Pxcb_sync_create_alarm_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_sync_create_alarm_value_list_unpack(_buffer:pointer; value_mask:Tuint32_t; _aux:Pxcb_sync_create_alarm_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_sync_create_alarm_value_list_sizeof(_buffer:pointer; value_mask:Tuint32_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_sync_create_alarm_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_sync_create_alarm_checked(c:Pxcb_connection_t; id:Txcb_sync_alarm_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_sync_create_alarm(c:Pxcb_connection_t; id:Txcb_sync_alarm_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_sync_create_alarm_aux_checked(c:Pxcb_connection_t; id:Txcb_sync_alarm_t; value_mask:Tuint32_t; value_list:Pxcb_sync_create_alarm_value_list_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_sync_create_alarm_aux(c:Pxcb_connection_t; id:Txcb_sync_alarm_t; value_mask:Tuint32_t; value_list:Pxcb_sync_create_alarm_value_list_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_create_alarm_value_list(R:Pxcb_sync_create_alarm_request_t):pointer;cdecl;external;
(* Const before type ignored *)
function xcb_sync_change_alarm_value_list_serialize(_buffer:Ppointer; value_mask:Tuint32_t; _aux:Pxcb_sync_change_alarm_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_sync_change_alarm_value_list_unpack(_buffer:pointer; value_mask:Tuint32_t; _aux:Pxcb_sync_change_alarm_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_sync_change_alarm_value_list_sizeof(_buffer:pointer; value_mask:Tuint32_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_sync_change_alarm_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_sync_change_alarm_checked(c:Pxcb_connection_t; id:Txcb_sync_alarm_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_sync_change_alarm(c:Pxcb_connection_t; id:Txcb_sync_alarm_t; value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_sync_change_alarm_aux_checked(c:Pxcb_connection_t; id:Txcb_sync_alarm_t; value_mask:Tuint32_t; value_list:Pxcb_sync_change_alarm_value_list_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_sync_change_alarm_aux(c:Pxcb_connection_t; id:Txcb_sync_alarm_t; value_mask:Tuint32_t; value_list:Pxcb_sync_change_alarm_value_list_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_change_alarm_value_list(R:Pxcb_sync_change_alarm_request_t):pointer;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_sync_destroy_alarm_checked(c:Pxcb_connection_t; alarm:Txcb_sync_alarm_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_destroy_alarm(c:Pxcb_connection_t; alarm:Txcb_sync_alarm_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_query_alarm(c:Pxcb_connection_t; alarm:Txcb_sync_alarm_t):Txcb_sync_query_alarm_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_sync_query_alarm_unchecked(c:Pxcb_connection_t; alarm:Txcb_sync_alarm_t):Txcb_sync_query_alarm_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_sync_query_alarm_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_sync_query_alarm_reply(c:Pxcb_connection_t; cookie:Txcb_sync_query_alarm_cookie_t; e:PPxcb_generic_error_t):Pxcb_sync_query_alarm_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_sync_set_priority_checked(c:Pxcb_connection_t; id:Tuint32_t; priority:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_set_priority(c:Pxcb_connection_t; id:Tuint32_t; priority:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_get_priority(c:Pxcb_connection_t; id:Tuint32_t):Txcb_sync_get_priority_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_sync_get_priority_unchecked(c:Pxcb_connection_t; id:Tuint32_t):Txcb_sync_get_priority_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_sync_get_priority_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_sync_get_priority_reply(c:Pxcb_connection_t; cookie:Txcb_sync_get_priority_cookie_t; e:PPxcb_generic_error_t):Pxcb_sync_get_priority_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_sync_create_fence_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; fence:Txcb_sync_fence_t; initially_triggered:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_create_fence(c:Pxcb_connection_t; drawable:Txcb_drawable_t; fence:Txcb_sync_fence_t; initially_triggered:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_sync_trigger_fence_checked(c:Pxcb_connection_t; fence:Txcb_sync_fence_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_trigger_fence(c:Pxcb_connection_t; fence:Txcb_sync_fence_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_sync_reset_fence_checked(c:Pxcb_connection_t; fence:Txcb_sync_fence_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_reset_fence(c:Pxcb_connection_t; fence:Txcb_sync_fence_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_sync_destroy_fence_checked(c:Pxcb_connection_t; fence:Txcb_sync_fence_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_destroy_fence(c:Pxcb_connection_t; fence:Txcb_sync_fence_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_sync_query_fence(c:Pxcb_connection_t; fence:Txcb_sync_fence_t):Txcb_sync_query_fence_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_sync_query_fence_unchecked(c:Pxcb_connection_t; fence:Txcb_sync_fence_t):Txcb_sync_query_fence_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_sync_query_fence_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_sync_query_fence_reply(c:Pxcb_connection_t; cookie:Txcb_sync_query_fence_cookie_t; e:PPxcb_generic_error_t):Pxcb_sync_query_fence_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_await_fence_sizeof(_buffer:pointer; fence_list_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
(* Const before type ignored *)
function xcb_sync_await_fence_checked(c:Pxcb_connection_t; fence_list_len:Tuint32_t; fence_list:Pxcb_sync_fence_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_sync_await_fence(c:Pxcb_connection_t; fence_list_len:Tuint32_t; fence_list:Pxcb_sync_fence_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_await_fence_fence_list(R:Pxcb_sync_await_fence_request_t):Pxcb_sync_fence_t;cdecl;external;
(* Const before type ignored *)
function xcb_sync_await_fence_fence_list_length(R:Pxcb_sync_await_fence_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_sync_await_fence_fence_list_end(R:Pxcb_sync_await_fence_request_t):Txcb_generic_iterator_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
