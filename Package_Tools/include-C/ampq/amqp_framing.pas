unit amqp_framing;

interface

uses
  fp_rabbitmq;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Generated code. Do not edit. Edit and re-run codegen.py instead.
 *
 * ***** BEGIN LICENSE BLOCK *****
 * Version: MIT
 *
 * Portions created by Alan Antonuk are Copyright (c) 2012-2013
 * Alan Antonuk. All Rights Reserved.
 *
 * Portions created by VMware are Copyright (c) 2007-2012 VMware, Inc.
 * All Rights Reserved.
 *
 * Portions created by Tony Garnock-Jones are Copyright (c) 2009-2010
 * VMware, Inc. and Tony Garnock-Jones. All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 * ***** END LICENSE BLOCK *****
  }
{* @file amqp_framing.h  }
{$ifndef AMQP_FRAMING_H}
{$define AMQP_FRAMING_H}
{$include <amqp.h>}
{*< AMQP protocol version major  }

const
  AMQP_PROTOCOL_VERSION_MAJOR = 0;  
{*< AMQP protocol version minor  }
  AMQP_PROTOCOL_VERSION_MINOR = 9;  
{*< AMQP protocol version revision \
                                       }
  AMQP_PROTOCOL_VERSION_REVISION = 1;  
{*< Default AMQP Port  }
  AMQP_PROTOCOL_PORT = 5672;  
{*< Constant: FRAME-METHOD  }
  AMQP_FRAME_METHOD = 1;  
{*< Constant: FRAME-HEADER  }
  AMQP_FRAME_HEADER = 2;  
{*< Constant: FRAME-BODY  }
  AMQP_FRAME_BODY = 3;  
{*< Constant: FRAME-HEARTBEAT  }
  AMQP_FRAME_HEARTBEAT = 8;  
{*< Constant: FRAME-MIN-SIZE  }
  AMQP_FRAME_MIN_SIZE = 4096;  
{*< Constant: FRAME-END  }
  AMQP_FRAME_END = 206;  
{*< Constant: REPLY-SUCCESS  }
  AMQP_REPLY_SUCCESS = 200;  
{*< Constant: CONTENT-TOO-LARGE  }
  AMQP_CONTENT_TOO_LARGE = 311;  
{*< Constant: NO-ROUTE  }
  AMQP_NO_ROUTE = 312;  
{*< Constant: NO-CONSUMERS  }
  AMQP_NO_CONSUMERS = 313;  
{*< Constant: ACCESS-REFUSED  }
  AMQP_ACCESS_REFUSED = 403;  
{*< Constant: NOT-FOUND  }
  AMQP_NOT_FOUND = 404;  
{*< Constant: RESOURCE-LOCKED  }
  AMQP_RESOURCE_LOCKED = 405;  
{*< Constant: PRECONDITION-FAILED  }
  AMQP_PRECONDITION_FAILED = 406;  
{*< Constant: CONNECTION-FORCED  }
  AMQP_CONNECTION_FORCED = 320;  
{*< Constant: INVALID-PATH  }
  AMQP_INVALID_PATH = 402;  
{*< Constant: FRAME-ERROR  }
  AMQP_FRAME_ERROR = 501;  
{*< Constant: SYNTAX-ERROR  }
  AMQP_SYNTAX_ERROR = 502;  
{*< Constant: COMMAND-INVALID  }
  AMQP_COMMAND_INVALID = 503;  
{*< Constant: CHANNEL-ERROR  }
  AMQP_CHANNEL_ERROR = 504;  
{*< Constant: UNEXPECTED-FRAME  }
  AMQP_UNEXPECTED_FRAME = 505;  
{*< Constant: RESOURCE-ERROR  }
  AMQP_RESOURCE_ERROR = 506;  
{*< Constant: NOT-ALLOWED  }
  AMQP_NOT_ALLOWED = 530;  
{*< Constant: NOT-IMPLEMENTED  }
  AMQP_NOT_IMPLEMENTED = 540;  
{*< Constant: INTERNAL-ERROR  }
  AMQP_INTERNAL_ERROR = 541;  
{ Function prototypes.  }
{*
 * Get constant name string from constant
 *
 * @param [in] constantNumber constant to get the name of
 * @returns string describing the constant. String is managed by
 *           the library and should not be free()'d by the program
  }

function amqp_constant_name(constantNumber:longint):Pchar;cdecl;external librabbitmq;
{*
 * Checks to see if a constant is a hard error
 *
 * A hard error occurs when something severe enough
 * happens that the connection must be closed.
 *
 * @param [in] constantNumber the error constant
 * @returns true if its a hard error, false otherwise
  }
function amqp_constant_is_hard_error(constantNumber:longint):Tamqp_boolean_t;cdecl;external librabbitmq;
{*
 * Get method name string from method number
 *
 * @param [in] methodNumber the method number
 * @returns method name string. String is managed by the library
 *           and should not be freed()'d by the program
  }
function amqp_method_name(methodNumber:Tamqp_method_number_t):Pchar;cdecl;external librabbitmq;
{*
 * Check whether a method has content
 *
 * A method that has content will receive the method frame
 * a properties frame, then 1 to N body frames
 *
 * @param [in] methodNumber the method number
 * @returns true if method has content, false otherwise
  }
function amqp_method_has_content(methodNumber:Tamqp_method_number_t):Tamqp_boolean_t;cdecl;external librabbitmq;
{*
 * Decodes a method from AMQP wireformat
 *
 * @param [in] methodNumber the method number for the decoded parameter
 * @param [in] pool the memory pool to allocate the decoded method from
 * @param [in] encoded the encoded byte string buffer
 * @param [out] decoded pointer to the decoded method struct
 * @returns 0 on success, an error code otherwise
  }
function amqp_decode_method(methodNumber:Tamqp_method_number_t; pool:Pamqp_pool_t; encoded:Tamqp_bytes_t; decoded:Ppointer):longint;cdecl;external librabbitmq;
{*
 * Decodes a header frame properties structure from AMQP wireformat
 *
 * @param [in] class_id the class id for the decoded parameter
 * @param [in] pool the memory pool to allocate the decoded properties from
 * @param [in] encoded the encoded byte string buffer
 * @param [out] decoded pointer to the decoded properties struct
 * @returns 0 on success, an error code otherwise
  }
function amqp_decode_properties(class_id:Tuint16_t; pool:Pamqp_pool_t; encoded:Tamqp_bytes_t; decoded:Ppointer):longint;cdecl;external librabbitmq;
{*
 * Encodes a method structure in AMQP wireformat
 *
 * @param [in] methodNumber the method number for the decoded parameter
 * @param [in] decoded the method structure (e.g., amqp_connection_start_t)
 * @param [in] encoded an allocated byte buffer for the encoded method
 *              structure to be written to. If the buffer isn't large enough
 *              to hold the encoded method, an error code will be returned.
 * @returns 0 on success, an error code otherwise.
  }
function amqp_encode_method(methodNumber:Tamqp_method_number_t; decoded:pointer; encoded:Tamqp_bytes_t):longint;cdecl;external librabbitmq;
{*
 * Encodes a properties structure in AMQP wireformat
 *
 * @param [in] class_id the class id for the decoded parameter
 * @param [in] decoded the properties structure (e.g., amqp_basic_properties_t)
 * @param [in] encoded an allocated byte buffer for the encoded properties to
 * written to.
 *              If the buffer isn't large enough to hold the encoded method, an
 *              an error code will be returned
 * @returns 0 on success, an error code otherwise.
  }
function amqp_encode_properties(class_id:Tuint16_t; decoded:pointer; encoded:Tamqp_bytes_t):longint;cdecl;external librabbitmq;
{ Method field records.  }
{*< connection.start method id \
                                        @internal 10, 10; 655370  }
{ was #define dname def_expr }
function AMQP_CONNECTION_START_METHOD : Tamqp_method_number_t;  

{* connection.start method fields  }
{*< version-major  }
{*< version-minor  }
{*< server-properties  }
{*< mechanisms  }
{*< locales  }
type
  Pamqp_connection_start_t_ = ^Tamqp_connection_start_t_;
  Tamqp_connection_start_t_ = record
      version_major : Tuint8_t;
      version_minor : Tuint8_t;
      server_properties : Tamqp_table_t;
      mechanisms : Tamqp_bytes_t;
      locales : Tamqp_bytes_t;
    end;
  Tamqp_connection_start_t = Tamqp_connection_start_t_;
  Pamqp_connection_start_t = ^Tamqp_connection_start_t;
{*< connection.start-ok method id \
                                        @internal 10, 11; 655371  }

{ was #define dname def_expr }
function AMQP_CONNECTION_START_OK_METHOD : Tamqp_method_number_t;  

{* connection.start-ok method fields  }
{*< client-properties  }
{*< mechanism  }
{*< response  }
{*< locale  }
type
  Pamqp_connection_start_ok_t_ = ^Tamqp_connection_start_ok_t_;
  Tamqp_connection_start_ok_t_ = record
      client_properties : Tamqp_table_t;
      mechanism : Tamqp_bytes_t;
      response : Tamqp_bytes_t;
      locale : Tamqp_bytes_t;
    end;
  Tamqp_connection_start_ok_t = Tamqp_connection_start_ok_t_;
  Pamqp_connection_start_ok_t = ^Tamqp_connection_start_ok_t;
{*< connection.secure method id \
                                        @internal 10, 20; 655380  }

{ was #define dname def_expr }
function AMQP_CONNECTION_SECURE_METHOD : Tamqp_method_number_t;  

{* connection.secure method fields  }
{*< challenge  }
type
  Pamqp_connection_secure_t_ = ^Tamqp_connection_secure_t_;
  Tamqp_connection_secure_t_ = record
      challenge : Tamqp_bytes_t;
    end;
  Tamqp_connection_secure_t = Tamqp_connection_secure_t_;
  Pamqp_connection_secure_t = ^Tamqp_connection_secure_t;
{*< connection.secure-ok method id \
                                        @internal 10, 21; 655381  }

{ was #define dname def_expr }
function AMQP_CONNECTION_SECURE_OK_METHOD : Tamqp_method_number_t;  

{* connection.secure-ok method fields  }
{*< response  }
type
  Pamqp_connection_secure_ok_t_ = ^Tamqp_connection_secure_ok_t_;
  Tamqp_connection_secure_ok_t_ = record
      response : Tamqp_bytes_t;
    end;
  Tamqp_connection_secure_ok_t = Tamqp_connection_secure_ok_t_;
  Pamqp_connection_secure_ok_t = ^Tamqp_connection_secure_ok_t;
{*< connection.tune method id \
                                        @internal 10, 30; 655390  }

{ was #define dname def_expr }
function AMQP_CONNECTION_TUNE_METHOD : Tamqp_method_number_t;  

{* connection.tune method fields  }
{*< channel-max  }
{*< frame-max  }
{*< heartbeat  }
type
  Pamqp_connection_tune_t_ = ^Tamqp_connection_tune_t_;
  Tamqp_connection_tune_t_ = record
      channel_max : Tuint16_t;
      frame_max : Tuint32_t;
      heartbeat : Tuint16_t;
    end;
  Tamqp_connection_tune_t = Tamqp_connection_tune_t_;
  Pamqp_connection_tune_t = ^Tamqp_connection_tune_t;
{*< connection.tune-ok method id \
                                        @internal 10, 31; 655391  }

{ was #define dname def_expr }
function AMQP_CONNECTION_TUNE_OK_METHOD : Tamqp_method_number_t;  

{* connection.tune-ok method fields  }
{*< channel-max  }
{*< frame-max  }
{*< heartbeat  }
type
  Pamqp_connection_tune_ok_t_ = ^Tamqp_connection_tune_ok_t_;
  Tamqp_connection_tune_ok_t_ = record
      channel_max : Tuint16_t;
      frame_max : Tuint32_t;
      heartbeat : Tuint16_t;
    end;
  Tamqp_connection_tune_ok_t = Tamqp_connection_tune_ok_t_;
  Pamqp_connection_tune_ok_t = ^Tamqp_connection_tune_ok_t;
{*< connection.open method id \
                                        @internal 10, 40; 655400  }

{ was #define dname def_expr }
function AMQP_CONNECTION_OPEN_METHOD : Tamqp_method_number_t;  

{* connection.open method fields  }
{*< virtual-host  }
{*< capabilities  }
{*< insist  }
type
  Pamqp_connection_open_t_ = ^Tamqp_connection_open_t_;
  Tamqp_connection_open_t_ = record
      virtual_host : Tamqp_bytes_t;
      capabilities : Tamqp_bytes_t;
      insist : Tamqp_boolean_t;
    end;
  Tamqp_connection_open_t = Tamqp_connection_open_t_;
  Pamqp_connection_open_t = ^Tamqp_connection_open_t;
{*< connection.open-ok method id \
                                        @internal 10, 41; 655401  }

{ was #define dname def_expr }
function AMQP_CONNECTION_OPEN_OK_METHOD : Tamqp_method_number_t;  

{* connection.open-ok method fields  }
{*< known-hosts  }
type
  Pamqp_connection_open_ok_t_ = ^Tamqp_connection_open_ok_t_;
  Tamqp_connection_open_ok_t_ = record
      known_hosts : Tamqp_bytes_t;
    end;
  Tamqp_connection_open_ok_t = Tamqp_connection_open_ok_t_;
  Pamqp_connection_open_ok_t = ^Tamqp_connection_open_ok_t;
{*< connection.close method id \
                                        @internal 10, 50; 655410  }

{ was #define dname def_expr }
function AMQP_CONNECTION_CLOSE_METHOD : Tamqp_method_number_t;  

{* connection.close method fields  }
{*< reply-code  }
{*< reply-text  }
{*< class-id  }
{*< method-id  }
type
  Pamqp_connection_close_t_ = ^Tamqp_connection_close_t_;
  Tamqp_connection_close_t_ = record
      reply_code : Tuint16_t;
      reply_text : Tamqp_bytes_t;
      class_id : Tuint16_t;
      method_id : Tuint16_t;
    end;
  Tamqp_connection_close_t = Tamqp_connection_close_t_;
  Pamqp_connection_close_t = ^Tamqp_connection_close_t;
{*< connection.close-ok method id \
                                        @internal 10, 51; 655411  }

{ was #define dname def_expr }
function AMQP_CONNECTION_CLOSE_OK_METHOD : Tamqp_method_number_t;  

{* connection.close-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_connection_close_ok_t_ = ^Tamqp_connection_close_ok_t_;
  Tamqp_connection_close_ok_t_ = record
      dummy : char;
    end;
  Tamqp_connection_close_ok_t = Tamqp_connection_close_ok_t_;
  Pamqp_connection_close_ok_t = ^Tamqp_connection_close_ok_t;
{*< connection.blocked method id \
                                        @internal 10, 60; 655420  }

{ was #define dname def_expr }
function AMQP_CONNECTION_BLOCKED_METHOD : Tamqp_method_number_t;  

{* connection.blocked method fields  }
{*< reason  }
type
  Pamqp_connection_blocked_t_ = ^Tamqp_connection_blocked_t_;
  Tamqp_connection_blocked_t_ = record
      reason : Tamqp_bytes_t;
    end;
  Tamqp_connection_blocked_t = Tamqp_connection_blocked_t_;
  Pamqp_connection_blocked_t = ^Tamqp_connection_blocked_t;
{*< connection.unblocked method id \
                                        @internal 10, 61; 655421  }

{ was #define dname def_expr }
function AMQP_CONNECTION_UNBLOCKED_METHOD : Tamqp_method_number_t;  

{* connection.unblocked method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_connection_unblocked_t_ = ^Tamqp_connection_unblocked_t_;
  Tamqp_connection_unblocked_t_ = record
      dummy : char;
    end;
  Tamqp_connection_unblocked_t = Tamqp_connection_unblocked_t_;
  Pamqp_connection_unblocked_t = ^Tamqp_connection_unblocked_t;
{*< channel.open method id @internal \
                                        20, 10; 1310730  }

{ was #define dname def_expr }
function AMQP_CHANNEL_OPEN_METHOD : Tamqp_method_number_t;  

{* channel.open method fields  }
{*< out-of-band  }
type
  Pamqp_channel_open_t_ = ^Tamqp_channel_open_t_;
  Tamqp_channel_open_t_ = record
      out_of_band : Tamqp_bytes_t;
    end;
  Tamqp_channel_open_t = Tamqp_channel_open_t_;
  Pamqp_channel_open_t = ^Tamqp_channel_open_t;
{*< channel.open-ok method id \
                                        @internal 20, 11; 1310731  }

{ was #define dname def_expr }
function AMQP_CHANNEL_OPEN_OK_METHOD : Tamqp_method_number_t;  

{* channel.open-ok method fields  }
{*< channel-id  }
type
  Pamqp_channel_open_ok_t_ = ^Tamqp_channel_open_ok_t_;
  Tamqp_channel_open_ok_t_ = record
      channel_id : Tamqp_bytes_t;
    end;
  Tamqp_channel_open_ok_t = Tamqp_channel_open_ok_t_;
  Pamqp_channel_open_ok_t = ^Tamqp_channel_open_ok_t;
{*< channel.flow method id @internal \
                                        20, 20; 1310740  }

{ was #define dname def_expr }
function AMQP_CHANNEL_FLOW_METHOD : Tamqp_method_number_t;  

{* channel.flow method fields  }
{*< active  }
type
  Pamqp_channel_flow_t_ = ^Tamqp_channel_flow_t_;
  Tamqp_channel_flow_t_ = record
      active : Tamqp_boolean_t;
    end;
  Tamqp_channel_flow_t = Tamqp_channel_flow_t_;
  Pamqp_channel_flow_t = ^Tamqp_channel_flow_t;
{*< channel.flow-ok method id \
                                        @internal 20, 21; 1310741  }

{ was #define dname def_expr }
function AMQP_CHANNEL_FLOW_OK_METHOD : Tamqp_method_number_t;  

{* channel.flow-ok method fields  }
{*< active  }
type
  Pamqp_channel_flow_ok_t_ = ^Tamqp_channel_flow_ok_t_;
  Tamqp_channel_flow_ok_t_ = record
      active : Tamqp_boolean_t;
    end;
  Tamqp_channel_flow_ok_t = Tamqp_channel_flow_ok_t_;
  Pamqp_channel_flow_ok_t = ^Tamqp_channel_flow_ok_t;
{*< channel.close method id @internal \
                                        20, 40; 1310760  }

{ was #define dname def_expr }
function AMQP_CHANNEL_CLOSE_METHOD : Tamqp_method_number_t;  

{* channel.close method fields  }
{*< reply-code  }
{*< reply-text  }
{*< class-id  }
{*< method-id  }
type
  Pamqp_channel_close_t_ = ^Tamqp_channel_close_t_;
  Tamqp_channel_close_t_ = record
      reply_code : Tuint16_t;
      reply_text : Tamqp_bytes_t;
      class_id : Tuint16_t;
      method_id : Tuint16_t;
    end;
  Tamqp_channel_close_t = Tamqp_channel_close_t_;
  Pamqp_channel_close_t = ^Tamqp_channel_close_t;
{*< channel.close-ok method id \
                                        @internal 20, 41; 1310761  }

{ was #define dname def_expr }
function AMQP_CHANNEL_CLOSE_OK_METHOD : Tamqp_method_number_t;  

{* channel.close-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_channel_close_ok_t_ = ^Tamqp_channel_close_ok_t_;
  Tamqp_channel_close_ok_t_ = record
      dummy : char;
    end;
  Tamqp_channel_close_ok_t = Tamqp_channel_close_ok_t_;
  Pamqp_channel_close_ok_t = ^Tamqp_channel_close_ok_t;
{*< access.request method id @internal \
                                        30, 10; 1966090  }

{ was #define dname def_expr }
function AMQP_ACCESS_REQUEST_METHOD : Tamqp_method_number_t;  

{* access.request method fields  }
{*< realm  }
{*< exclusive  }
{*< passive  }
{*< active  }
{*< write  }
{*< read  }
type
  Pamqp_access_request_t_ = ^Tamqp_access_request_t_;
  Tamqp_access_request_t_ = record
      realm : Tamqp_bytes_t;
      exclusive : Tamqp_boolean_t;
      passive : Tamqp_boolean_t;
      active : Tamqp_boolean_t;
      write : Tamqp_boolean_t;
      read : Tamqp_boolean_t;
    end;
  Tamqp_access_request_t = Tamqp_access_request_t_;
  Pamqp_access_request_t = ^Tamqp_access_request_t;
{*< access.request-ok method id \
                                        @internal 30, 11; 1966091  }

{ was #define dname def_expr }
function AMQP_ACCESS_REQUEST_OK_METHOD : Tamqp_method_number_t;  

{* access.request-ok method fields  }
{*< ticket  }
type
  Pamqp_access_request_ok_t_ = ^Tamqp_access_request_ok_t_;
  Tamqp_access_request_ok_t_ = record
      ticket : Tuint16_t;
    end;
  Tamqp_access_request_ok_t = Tamqp_access_request_ok_t_;
  Pamqp_access_request_ok_t = ^Tamqp_access_request_ok_t;
{*< exchange.declare method id \
                                        @internal 40, 10; 2621450  }

{ was #define dname def_expr }
function AMQP_EXCHANGE_DECLARE_METHOD : Tamqp_method_number_t;  

{* exchange.declare method fields  }
{*< ticket  }
{*< exchange  }
{*< type  }
{*< passive  }
{*< durable  }
{*< auto-delete  }
{*< internal  }
{*< nowait  }
{*< arguments  }
type
  Pamqp_exchange_declare_t_ = ^Tamqp_exchange_declare_t_;
  Tamqp_exchange_declare_t_ = record
      ticket : Tuint16_t;
      exchange : Tamqp_bytes_t;
      _type : Tamqp_bytes_t;
      passive : Tamqp_boolean_t;
      durable : Tamqp_boolean_t;
      auto_delete : Tamqp_boolean_t;
      internal : Tamqp_boolean_t;
      nowait : Tamqp_boolean_t;
      arguments : Tamqp_table_t;
    end;
  Tamqp_exchange_declare_t = Tamqp_exchange_declare_t_;
  Pamqp_exchange_declare_t = ^Tamqp_exchange_declare_t;
{*< exchange.declare-ok method id \
                                        @internal 40, 11; 2621451  }

{ was #define dname def_expr }
function AMQP_EXCHANGE_DECLARE_OK_METHOD : Tamqp_method_number_t;  

{* exchange.declare-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_exchange_declare_ok_t_ = ^Tamqp_exchange_declare_ok_t_;
  Tamqp_exchange_declare_ok_t_ = record
      dummy : char;
    end;
  Tamqp_exchange_declare_ok_t = Tamqp_exchange_declare_ok_t_;
  Pamqp_exchange_declare_ok_t = ^Tamqp_exchange_declare_ok_t;
{*< exchange.delete method id \
                                        @internal 40, 20; 2621460  }

{ was #define dname def_expr }
function AMQP_EXCHANGE_DELETE_METHOD : Tamqp_method_number_t;  

{* exchange.delete method fields  }
{*< ticket  }
{*< exchange  }
{*< if-unused  }
{*< nowait  }
type
  Pamqp_exchange_delete_t_ = ^Tamqp_exchange_delete_t_;
  Tamqp_exchange_delete_t_ = record
      ticket : Tuint16_t;
      exchange : Tamqp_bytes_t;
      if_unused : Tamqp_boolean_t;
      nowait : Tamqp_boolean_t;
    end;
  Tamqp_exchange_delete_t = Tamqp_exchange_delete_t_;
  Pamqp_exchange_delete_t = ^Tamqp_exchange_delete_t;
{*< exchange.delete-ok method id \
                                        @internal 40, 21; 2621461  }

{ was #define dname def_expr }
function AMQP_EXCHANGE_DELETE_OK_METHOD : Tamqp_method_number_t;  

{* exchange.delete-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_exchange_delete_ok_t_ = ^Tamqp_exchange_delete_ok_t_;
  Tamqp_exchange_delete_ok_t_ = record
      dummy : char;
    end;
  Tamqp_exchange_delete_ok_t = Tamqp_exchange_delete_ok_t_;
  Pamqp_exchange_delete_ok_t = ^Tamqp_exchange_delete_ok_t;
{*< exchange.bind method id @internal \
                                        40, 30; 2621470  }

{ was #define dname def_expr }
function AMQP_EXCHANGE_BIND_METHOD : Tamqp_method_number_t;  

{* exchange.bind method fields  }
{*< ticket  }
{*< destination  }
{*< source  }
{*< routing-key  }
{*< nowait  }
{*< arguments  }
type
  Pamqp_exchange_bind_t_ = ^Tamqp_exchange_bind_t_;
  Tamqp_exchange_bind_t_ = record
      ticket : Tuint16_t;
      destination : Tamqp_bytes_t;
      source : Tamqp_bytes_t;
      routing_key : Tamqp_bytes_t;
      nowait : Tamqp_boolean_t;
      arguments : Tamqp_table_t;
    end;
  Tamqp_exchange_bind_t = Tamqp_exchange_bind_t_;
  Pamqp_exchange_bind_t = ^Tamqp_exchange_bind_t;
{*< exchange.bind-ok method id \
                                        @internal 40, 31; 2621471  }

{ was #define dname def_expr }
function AMQP_EXCHANGE_BIND_OK_METHOD : Tamqp_method_number_t;  

{* exchange.bind-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_exchange_bind_ok_t_ = ^Tamqp_exchange_bind_ok_t_;
  Tamqp_exchange_bind_ok_t_ = record
      dummy : char;
    end;
  Tamqp_exchange_bind_ok_t = Tamqp_exchange_bind_ok_t_;
  Pamqp_exchange_bind_ok_t = ^Tamqp_exchange_bind_ok_t;
{*< exchange.unbind method id \
                                        @internal 40, 40; 2621480  }

{ was #define dname def_expr }
function AMQP_EXCHANGE_UNBIND_METHOD : Tamqp_method_number_t;  

{* exchange.unbind method fields  }
{*< ticket  }
{*< destination  }
{*< source  }
{*< routing-key  }
{*< nowait  }
{*< arguments  }
type
  Pamqp_exchange_unbind_t_ = ^Tamqp_exchange_unbind_t_;
  Tamqp_exchange_unbind_t_ = record
      ticket : Tuint16_t;
      destination : Tamqp_bytes_t;
      source : Tamqp_bytes_t;
      routing_key : Tamqp_bytes_t;
      nowait : Tamqp_boolean_t;
      arguments : Tamqp_table_t;
    end;
  Tamqp_exchange_unbind_t = Tamqp_exchange_unbind_t_;
  Pamqp_exchange_unbind_t = ^Tamqp_exchange_unbind_t;
{*< exchange.unbind-ok method id \
                                        @internal 40, 51; 2621491  }

{ was #define dname def_expr }
function AMQP_EXCHANGE_UNBIND_OK_METHOD : Tamqp_method_number_t;  

{* exchange.unbind-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_exchange_unbind_ok_t_ = ^Tamqp_exchange_unbind_ok_t_;
  Tamqp_exchange_unbind_ok_t_ = record
      dummy : char;
    end;
  Tamqp_exchange_unbind_ok_t = Tamqp_exchange_unbind_ok_t_;
  Pamqp_exchange_unbind_ok_t = ^Tamqp_exchange_unbind_ok_t;
{*< queue.declare method id @internal \
                                        50, 10; 3276810  }

{ was #define dname def_expr }
function AMQP_QUEUE_DECLARE_METHOD : Tamqp_method_number_t;  

{* queue.declare method fields  }
{*< ticket  }
{*< queue  }
{*< passive  }
{*< durable  }
{*< exclusive  }
{*< auto-delete  }
{*< nowait  }
{*< arguments  }
type
  Pamqp_queue_declare_t_ = ^Tamqp_queue_declare_t_;
  Tamqp_queue_declare_t_ = record
      ticket : Tuint16_t;
      queue : Tamqp_bytes_t;
      passive : Tamqp_boolean_t;
      durable : Tamqp_boolean_t;
      exclusive : Tamqp_boolean_t;
      auto_delete : Tamqp_boolean_t;
      nowait : Tamqp_boolean_t;
      arguments : Tamqp_table_t;
    end;
  Tamqp_queue_declare_t = Tamqp_queue_declare_t_;
  Pamqp_queue_declare_t = ^Tamqp_queue_declare_t;
{*< queue.declare-ok method id \
                                        @internal 50, 11; 3276811  }

{ was #define dname def_expr }
function AMQP_QUEUE_DECLARE_OK_METHOD : Tamqp_method_number_t;  

{* queue.declare-ok method fields  }
{*< queue  }
{*< message-count  }
{*< consumer-count  }
type
  Pamqp_queue_declare_ok_t_ = ^Tamqp_queue_declare_ok_t_;
  Tamqp_queue_declare_ok_t_ = record
      queue : Tamqp_bytes_t;
      message_count : Tuint32_t;
      consumer_count : Tuint32_t;
    end;
  Tamqp_queue_declare_ok_t = Tamqp_queue_declare_ok_t_;
  Pamqp_queue_declare_ok_t = ^Tamqp_queue_declare_ok_t;
{*< queue.bind method id @internal 50, \
                                        20; 3276820  }

{ was #define dname def_expr }
function AMQP_QUEUE_BIND_METHOD : Tamqp_method_number_t;  

{* queue.bind method fields  }
{*< ticket  }
{*< queue  }
{*< exchange  }
{*< routing-key  }
{*< nowait  }
{*< arguments  }
type
  Pamqp_queue_bind_t_ = ^Tamqp_queue_bind_t_;
  Tamqp_queue_bind_t_ = record
      ticket : Tuint16_t;
      queue : Tamqp_bytes_t;
      exchange : Tamqp_bytes_t;
      routing_key : Tamqp_bytes_t;
      nowait : Tamqp_boolean_t;
      arguments : Tamqp_table_t;
    end;
  Tamqp_queue_bind_t = Tamqp_queue_bind_t_;
  Pamqp_queue_bind_t = ^Tamqp_queue_bind_t;
{*< queue.bind-ok method id @internal \
                                        50, 21; 3276821  }

{ was #define dname def_expr }
function AMQP_QUEUE_BIND_OK_METHOD : Tamqp_method_number_t;  

{* queue.bind-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_queue_bind_ok_t_ = ^Tamqp_queue_bind_ok_t_;
  Tamqp_queue_bind_ok_t_ = record
      dummy : char;
    end;
  Tamqp_queue_bind_ok_t = Tamqp_queue_bind_ok_t_;
  Pamqp_queue_bind_ok_t = ^Tamqp_queue_bind_ok_t;
{*< queue.purge method id @internal \
                                        50, 30; 3276830  }

{ was #define dname def_expr }
function AMQP_QUEUE_PURGE_METHOD : Tamqp_method_number_t;  

{* queue.purge method fields  }
{*< ticket  }
{*< queue  }
{*< nowait  }
type
  Pamqp_queue_purge_t_ = ^Tamqp_queue_purge_t_;
  Tamqp_queue_purge_t_ = record
      ticket : Tuint16_t;
      queue : Tamqp_bytes_t;
      nowait : Tamqp_boolean_t;
    end;
  Tamqp_queue_purge_t = Tamqp_queue_purge_t_;
  Pamqp_queue_purge_t = ^Tamqp_queue_purge_t;
{*< queue.purge-ok method id @internal \
                                        50, 31; 3276831  }

{ was #define dname def_expr }
function AMQP_QUEUE_PURGE_OK_METHOD : Tamqp_method_number_t;  

{* queue.purge-ok method fields  }
{*< message-count  }
type
  Pamqp_queue_purge_ok_t_ = ^Tamqp_queue_purge_ok_t_;
  Tamqp_queue_purge_ok_t_ = record
      message_count : Tuint32_t;
    end;
  Tamqp_queue_purge_ok_t = Tamqp_queue_purge_ok_t_;
  Pamqp_queue_purge_ok_t = ^Tamqp_queue_purge_ok_t;
{*< queue.delete method id @internal \
                                        50, 40; 3276840  }

{ was #define dname def_expr }
function AMQP_QUEUE_DELETE_METHOD : Tamqp_method_number_t;  

{* queue.delete method fields  }
{*< ticket  }
{*< queue  }
{*< if-unused  }
{*< if-empty  }
{*< nowait  }
type
  Pamqp_queue_delete_t_ = ^Tamqp_queue_delete_t_;
  Tamqp_queue_delete_t_ = record
      ticket : Tuint16_t;
      queue : Tamqp_bytes_t;
      if_unused : Tamqp_boolean_t;
      if_empty : Tamqp_boolean_t;
      nowait : Tamqp_boolean_t;
    end;
  Tamqp_queue_delete_t = Tamqp_queue_delete_t_;
  Pamqp_queue_delete_t = ^Tamqp_queue_delete_t;
{*< queue.delete-ok method id \
                                        @internal 50, 41; 3276841  }

{ was #define dname def_expr }
function AMQP_QUEUE_DELETE_OK_METHOD : Tamqp_method_number_t;  

{* queue.delete-ok method fields  }
{*< message-count  }
type
  Pamqp_queue_delete_ok_t_ = ^Tamqp_queue_delete_ok_t_;
  Tamqp_queue_delete_ok_t_ = record
      message_count : Tuint32_t;
    end;
  Tamqp_queue_delete_ok_t = Tamqp_queue_delete_ok_t_;
  Pamqp_queue_delete_ok_t = ^Tamqp_queue_delete_ok_t;
{*< queue.unbind method id @internal \
                                        50, 50; 3276850  }

{ was #define dname def_expr }
function AMQP_QUEUE_UNBIND_METHOD : Tamqp_method_number_t;  

{* queue.unbind method fields  }
{*< ticket  }
{*< queue  }
{*< exchange  }
{*< routing-key  }
{*< arguments  }
type
  Pamqp_queue_unbind_t_ = ^Tamqp_queue_unbind_t_;
  Tamqp_queue_unbind_t_ = record
      ticket : Tuint16_t;
      queue : Tamqp_bytes_t;
      exchange : Tamqp_bytes_t;
      routing_key : Tamqp_bytes_t;
      arguments : Tamqp_table_t;
    end;
  Tamqp_queue_unbind_t = Tamqp_queue_unbind_t_;
  Pamqp_queue_unbind_t = ^Tamqp_queue_unbind_t;
{*< queue.unbind-ok method id \
                                        @internal 50, 51; 3276851  }

{ was #define dname def_expr }
function AMQP_QUEUE_UNBIND_OK_METHOD : Tamqp_method_number_t;  

{* queue.unbind-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_queue_unbind_ok_t_ = ^Tamqp_queue_unbind_ok_t_;
  Tamqp_queue_unbind_ok_t_ = record
      dummy : char;
    end;
  Tamqp_queue_unbind_ok_t = Tamqp_queue_unbind_ok_t_;
  Pamqp_queue_unbind_ok_t = ^Tamqp_queue_unbind_ok_t;
{*< basic.qos method id @internal 60, \
                                        10; 3932170  }

{ was #define dname def_expr }
function AMQP_BASIC_QOS_METHOD : Tamqp_method_number_t;  

{* basic.qos method fields  }
{*< prefetch-size  }
{*< prefetch-count  }
{*< global  }
type
  Pamqp_basic_qos_t_ = ^Tamqp_basic_qos_t_;
  Tamqp_basic_qos_t_ = record
      prefetch_size : Tuint32_t;
      prefetch_count : Tuint16_t;
      global : Tamqp_boolean_t;
    end;
  Tamqp_basic_qos_t = Tamqp_basic_qos_t_;
  Pamqp_basic_qos_t = ^Tamqp_basic_qos_t;
{*< basic.qos-ok method id @internal \
                                        60, 11; 3932171  }

{ was #define dname def_expr }
function AMQP_BASIC_QOS_OK_METHOD : Tamqp_method_number_t;  

{* basic.qos-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_basic_qos_ok_t_ = ^Tamqp_basic_qos_ok_t_;
  Tamqp_basic_qos_ok_t_ = record
      dummy : char;
    end;
  Tamqp_basic_qos_ok_t = Tamqp_basic_qos_ok_t_;
  Pamqp_basic_qos_ok_t = ^Tamqp_basic_qos_ok_t;
{*< basic.consume method id @internal \
                                        60, 20; 3932180  }

{ was #define dname def_expr }
function AMQP_BASIC_CONSUME_METHOD : Tamqp_method_number_t;  

{* basic.consume method fields  }
{*< ticket  }
{*< queue  }
{*< consumer-tag  }
{*< no-local  }
{*< no-ack  }
{*< exclusive  }
{*< nowait  }
{*< arguments  }
type
  Pamqp_basic_consume_t_ = ^Tamqp_basic_consume_t_;
  Tamqp_basic_consume_t_ = record
      ticket : Tuint16_t;
      queue : Tamqp_bytes_t;
      consumer_tag : Tamqp_bytes_t;
      no_local : Tamqp_boolean_t;
      no_ack : Tamqp_boolean_t;
      exclusive : Tamqp_boolean_t;
      nowait : Tamqp_boolean_t;
      arguments : Tamqp_table_t;
    end;
  Tamqp_basic_consume_t = Tamqp_basic_consume_t_;
  Pamqp_basic_consume_t = ^Tamqp_basic_consume_t;
{*< basic.consume-ok method id \
                                        @internal 60, 21; 3932181  }

{ was #define dname def_expr }
function AMQP_BASIC_CONSUME_OK_METHOD : Tamqp_method_number_t;  

{* basic.consume-ok method fields  }
{*< consumer-tag  }
type
  Pamqp_basic_consume_ok_t_ = ^Tamqp_basic_consume_ok_t_;
  Tamqp_basic_consume_ok_t_ = record
      consumer_tag : Tamqp_bytes_t;
    end;
  Tamqp_basic_consume_ok_t = Tamqp_basic_consume_ok_t_;
  Pamqp_basic_consume_ok_t = ^Tamqp_basic_consume_ok_t;
{*< basic.cancel method id @internal \
                                        60, 30; 3932190  }

{ was #define dname def_expr }
function AMQP_BASIC_CANCEL_METHOD : Tamqp_method_number_t;  

{* basic.cancel method fields  }
{*< consumer-tag  }
{*< nowait  }
type
  Pamqp_basic_cancel_t_ = ^Tamqp_basic_cancel_t_;
  Tamqp_basic_cancel_t_ = record
      consumer_tag : Tamqp_bytes_t;
      nowait : Tamqp_boolean_t;
    end;
  Tamqp_basic_cancel_t = Tamqp_basic_cancel_t_;
  Pamqp_basic_cancel_t = ^Tamqp_basic_cancel_t;
{*< basic.cancel-ok method id \
                                        @internal 60, 31; 3932191  }

{ was #define dname def_expr }
function AMQP_BASIC_CANCEL_OK_METHOD : Tamqp_method_number_t;  

{* basic.cancel-ok method fields  }
{*< consumer-tag  }
type
  Pamqp_basic_cancel_ok_t_ = ^Tamqp_basic_cancel_ok_t_;
  Tamqp_basic_cancel_ok_t_ = record
      consumer_tag : Tamqp_bytes_t;
    end;
  Tamqp_basic_cancel_ok_t = Tamqp_basic_cancel_ok_t_;
  Pamqp_basic_cancel_ok_t = ^Tamqp_basic_cancel_ok_t;
{*< basic.publish method id @internal \
                                        60, 40; 3932200  }

{ was #define dname def_expr }
function AMQP_BASIC_PUBLISH_METHOD : Tamqp_method_number_t;  

{* basic.publish method fields  }
{*< ticket  }
{*< exchange  }
{*< routing-key  }
{*< mandatory  }
{*< immediate  }
type
  Pamqp_basic_publish_t_ = ^Tamqp_basic_publish_t_;
  Tamqp_basic_publish_t_ = record
      ticket : Tuint16_t;
      exchange : Tamqp_bytes_t;
      routing_key : Tamqp_bytes_t;
      mandatory : Tamqp_boolean_t;
      immediate : Tamqp_boolean_t;
    end;
  Tamqp_basic_publish_t = Tamqp_basic_publish_t_;
  Pamqp_basic_publish_t = ^Tamqp_basic_publish_t;
{*< basic.return method id @internal \
                                        60, 50; 3932210  }

{ was #define dname def_expr }
function AMQP_BASIC_RETURN_METHOD : Tamqp_method_number_t;  

{* basic.return method fields  }
{*< reply-code  }
{*< reply-text  }
{*< exchange  }
{*< routing-key  }
type
  Pamqp_basic_return_t_ = ^Tamqp_basic_return_t_;
  Tamqp_basic_return_t_ = record
      reply_code : Tuint16_t;
      reply_text : Tamqp_bytes_t;
      exchange : Tamqp_bytes_t;
      routing_key : Tamqp_bytes_t;
    end;
  Tamqp_basic_return_t = Tamqp_basic_return_t_;
  Pamqp_basic_return_t = ^Tamqp_basic_return_t;
{*< basic.deliver method id @internal \
                                        60, 60; 3932220  }

{ was #define dname def_expr }
function AMQP_BASIC_DELIVER_METHOD : Tamqp_method_number_t;  

{* basic.deliver method fields  }
{*< consumer-tag  }
{*< delivery-tag  }
{*< redelivered  }
{*< exchange  }
{*< routing-key  }
type
  Pamqp_basic_deliver_t_ = ^Tamqp_basic_deliver_t_;
  Tamqp_basic_deliver_t_ = record
      consumer_tag : Tamqp_bytes_t;
      delivery_tag : Tuint64_t;
      redelivered : Tamqp_boolean_t;
      exchange : Tamqp_bytes_t;
      routing_key : Tamqp_bytes_t;
    end;
  Tamqp_basic_deliver_t = Tamqp_basic_deliver_t_;
  Pamqp_basic_deliver_t = ^Tamqp_basic_deliver_t;
{*< basic.get method id @internal 60, \
                                        70; 3932230  }

{ was #define dname def_expr }
function AMQP_BASIC_GET_METHOD : Tamqp_method_number_t;  

{* basic.get method fields  }
{*< ticket  }
{*< queue  }
{*< no-ack  }
type
  Pamqp_basic_get_t_ = ^Tamqp_basic_get_t_;
  Tamqp_basic_get_t_ = record
      ticket : Tuint16_t;
      queue : Tamqp_bytes_t;
      no_ack : Tamqp_boolean_t;
    end;
  Tamqp_basic_get_t = Tamqp_basic_get_t_;
  Pamqp_basic_get_t = ^Tamqp_basic_get_t;
{*< basic.get-ok method id @internal \
                                        60, 71; 3932231  }

{ was #define dname def_expr }
function AMQP_BASIC_GET_OK_METHOD : Tamqp_method_number_t;  

{* basic.get-ok method fields  }
{*< delivery-tag  }
{*< redelivered  }
{*< exchange  }
{*< routing-key  }
{*< message-count  }
type
  Pamqp_basic_get_ok_t_ = ^Tamqp_basic_get_ok_t_;
  Tamqp_basic_get_ok_t_ = record
      delivery_tag : Tuint64_t;
      redelivered : Tamqp_boolean_t;
      exchange : Tamqp_bytes_t;
      routing_key : Tamqp_bytes_t;
      message_count : Tuint32_t;
    end;
  Tamqp_basic_get_ok_t = Tamqp_basic_get_ok_t_;
  Pamqp_basic_get_ok_t = ^Tamqp_basic_get_ok_t;
{*< basic.get-empty method id \
                                        @internal 60, 72; 3932232  }

{ was #define dname def_expr }
function AMQP_BASIC_GET_EMPTY_METHOD : Tamqp_method_number_t;  

{* basic.get-empty method fields  }
{*< cluster-id  }
type
  Pamqp_basic_get_empty_t_ = ^Tamqp_basic_get_empty_t_;
  Tamqp_basic_get_empty_t_ = record
      cluster_id : Tamqp_bytes_t;
    end;
  Tamqp_basic_get_empty_t = Tamqp_basic_get_empty_t_;
  Pamqp_basic_get_empty_t = ^Tamqp_basic_get_empty_t;
{*< basic.ack method id @internal 60, \
                                        80; 3932240  }

{ was #define dname def_expr }
function AMQP_BASIC_ACK_METHOD : Tamqp_method_number_t;  

{* basic.ack method fields  }
{*< delivery-tag  }
{*< multiple  }
type
  Pamqp_basic_ack_t_ = ^Tamqp_basic_ack_t_;
  Tamqp_basic_ack_t_ = record
      delivery_tag : Tuint64_t;
      multiple : Tamqp_boolean_t;
    end;
  Tamqp_basic_ack_t = Tamqp_basic_ack_t_;
  Pamqp_basic_ack_t = ^Tamqp_basic_ack_t;
{*< basic.reject method id @internal \
                                        60, 90; 3932250  }

{ was #define dname def_expr }
function AMQP_BASIC_REJECT_METHOD : Tamqp_method_number_t;  

{* basic.reject method fields  }
{*< delivery-tag  }
{*< requeue  }
type
  Pamqp_basic_reject_t_ = ^Tamqp_basic_reject_t_;
  Tamqp_basic_reject_t_ = record
      delivery_tag : Tuint64_t;
      requeue : Tamqp_boolean_t;
    end;
  Tamqp_basic_reject_t = Tamqp_basic_reject_t_;
  Pamqp_basic_reject_t = ^Tamqp_basic_reject_t;
{*< basic.recover-async method id \
                                        @internal 60, 100; 3932260  }

{ was #define dname def_expr }
function AMQP_BASIC_RECOVER_ASYNC_METHOD : Tamqp_method_number_t;  

{* basic.recover-async method fields  }
{*< requeue  }
type
  Pamqp_basic_recover_async_t_ = ^Tamqp_basic_recover_async_t_;
  Tamqp_basic_recover_async_t_ = record
      requeue : Tamqp_boolean_t;
    end;
  Tamqp_basic_recover_async_t = Tamqp_basic_recover_async_t_;
  Pamqp_basic_recover_async_t = ^Tamqp_basic_recover_async_t;
{*< basic.recover method id @internal \
                                        60, 110; 3932270  }

{ was #define dname def_expr }
function AMQP_BASIC_RECOVER_METHOD : Tamqp_method_number_t;  

{* basic.recover method fields  }
{*< requeue  }
type
  Pamqp_basic_recover_t_ = ^Tamqp_basic_recover_t_;
  Tamqp_basic_recover_t_ = record
      requeue : Tamqp_boolean_t;
    end;
  Tamqp_basic_recover_t = Tamqp_basic_recover_t_;
  Pamqp_basic_recover_t = ^Tamqp_basic_recover_t;
{*< basic.recover-ok method id \
                                        @internal 60, 111; 3932271  }

{ was #define dname def_expr }
function AMQP_BASIC_RECOVER_OK_METHOD : Tamqp_method_number_t;  

{* basic.recover-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_basic_recover_ok_t_ = ^Tamqp_basic_recover_ok_t_;
  Tamqp_basic_recover_ok_t_ = record
      dummy : char;
    end;
  Tamqp_basic_recover_ok_t = Tamqp_basic_recover_ok_t_;
  Pamqp_basic_recover_ok_t = ^Tamqp_basic_recover_ok_t;
{*< basic.nack method id @internal 60, \
                                        120; 3932280  }

{ was #define dname def_expr }
function AMQP_BASIC_NACK_METHOD : Tamqp_method_number_t;  

{* basic.nack method fields  }
{*< delivery-tag  }
{*< multiple  }
{*< requeue  }
type
  Pamqp_basic_nack_t_ = ^Tamqp_basic_nack_t_;
  Tamqp_basic_nack_t_ = record
      delivery_tag : Tuint64_t;
      multiple : Tamqp_boolean_t;
      requeue : Tamqp_boolean_t;
    end;
  Tamqp_basic_nack_t = Tamqp_basic_nack_t_;
  Pamqp_basic_nack_t = ^Tamqp_basic_nack_t;
{*< tx.select method id @internal 90, \
                                        10; 5898250  }

{ was #define dname def_expr }
function AMQP_TX_SELECT_METHOD : Tamqp_method_number_t;  

{* tx.select method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_tx_select_t_ = ^Tamqp_tx_select_t_;
  Tamqp_tx_select_t_ = record
      dummy : char;
    end;
  Tamqp_tx_select_t = Tamqp_tx_select_t_;
  Pamqp_tx_select_t = ^Tamqp_tx_select_t;
{*< tx.select-ok method id @internal \
                                        90, 11; 5898251  }

{ was #define dname def_expr }
function AMQP_TX_SELECT_OK_METHOD : Tamqp_method_number_t;  

{* tx.select-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_tx_select_ok_t_ = ^Tamqp_tx_select_ok_t_;
  Tamqp_tx_select_ok_t_ = record
      dummy : char;
    end;
  Tamqp_tx_select_ok_t = Tamqp_tx_select_ok_t_;
  Pamqp_tx_select_ok_t = ^Tamqp_tx_select_ok_t;
{*< tx.commit method id @internal 90, \
                                        20; 5898260  }

{ was #define dname def_expr }
function AMQP_TX_COMMIT_METHOD : Tamqp_method_number_t;  

{* tx.commit method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_tx_commit_t_ = ^Tamqp_tx_commit_t_;
  Tamqp_tx_commit_t_ = record
      dummy : char;
    end;
  Tamqp_tx_commit_t = Tamqp_tx_commit_t_;
  Pamqp_tx_commit_t = ^Tamqp_tx_commit_t;
{*< tx.commit-ok method id @internal \
                                        90, 21; 5898261  }

{ was #define dname def_expr }
function AMQP_TX_COMMIT_OK_METHOD : Tamqp_method_number_t;  

{* tx.commit-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_tx_commit_ok_t_ = ^Tamqp_tx_commit_ok_t_;
  Tamqp_tx_commit_ok_t_ = record
      dummy : char;
    end;
  Tamqp_tx_commit_ok_t = Tamqp_tx_commit_ok_t_;
  Pamqp_tx_commit_ok_t = ^Tamqp_tx_commit_ok_t;
{*< tx.rollback method id @internal \
                                        90, 30; 5898270  }

{ was #define dname def_expr }
function AMQP_TX_ROLLBACK_METHOD : Tamqp_method_number_t;  

{* tx.rollback method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_tx_rollback_t_ = ^Tamqp_tx_rollback_t_;
  Tamqp_tx_rollback_t_ = record
      dummy : char;
    end;
  Tamqp_tx_rollback_t = Tamqp_tx_rollback_t_;
  Pamqp_tx_rollback_t = ^Tamqp_tx_rollback_t;
{*< tx.rollback-ok method id @internal \
                                        90, 31; 5898271  }

{ was #define dname def_expr }
function AMQP_TX_ROLLBACK_OK_METHOD : Tamqp_method_number_t;  

{* tx.rollback-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_tx_rollback_ok_t_ = ^Tamqp_tx_rollback_ok_t_;
  Tamqp_tx_rollback_ok_t_ = record
      dummy : char;
    end;
  Tamqp_tx_rollback_ok_t = Tamqp_tx_rollback_ok_t_;
  Pamqp_tx_rollback_ok_t = ^Tamqp_tx_rollback_ok_t;
{*< confirm.select method id @internal \
                                        85, 10; 5570570  }

{ was #define dname def_expr }
function AMQP_CONFIRM_SELECT_METHOD : Tamqp_method_number_t;  

{* confirm.select method fields  }
{*< nowait  }
type
  Pamqp_confirm_select_t_ = ^Tamqp_confirm_select_t_;
  Tamqp_confirm_select_t_ = record
      nowait : Tamqp_boolean_t;
    end;
  Tamqp_confirm_select_t = Tamqp_confirm_select_t_;
  Pamqp_confirm_select_t = ^Tamqp_confirm_select_t;
{*< confirm.select-ok method id \
                                        @internal 85, 11; 5570571  }

{ was #define dname def_expr }
function AMQP_CONFIRM_SELECT_OK_METHOD : Tamqp_method_number_t;  

{* confirm.select-ok method fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_confirm_select_ok_t_ = ^Tamqp_confirm_select_ok_t_;
  Tamqp_confirm_select_ok_t_ = record
      dummy : char;
    end;
  Tamqp_confirm_select_ok_t = Tamqp_confirm_select_ok_t_;
  Pamqp_confirm_select_ok_t = ^Tamqp_confirm_select_ok_t;
{ Class property records.  }
{*< connection class id @internal 10 \
             }

const
  AMQP_CONNECTION_CLASS = $000A;  
{* connection class properties  }
{*< bit-mask of set fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_connection_properties_t_ = ^Tamqp_connection_properties_t_;
  Tamqp_connection_properties_t_ = record
      _flags : Tamqp_flags_t;
      dummy : char;
    end;
  Tamqp_connection_properties_t = Tamqp_connection_properties_t_;
  Pamqp_connection_properties_t = ^Tamqp_connection_properties_t;
{*< channel class id @internal 20  }

const
  AMQP_CHANNEL_CLASS = $0014;  
{* channel class properties  }
{*< bit-mask of set fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_channel_properties_t_ = ^Tamqp_channel_properties_t_;
  Tamqp_channel_properties_t_ = record
      _flags : Tamqp_flags_t;
      dummy : char;
    end;
  Tamqp_channel_properties_t = Tamqp_channel_properties_t_;
  Pamqp_channel_properties_t = ^Tamqp_channel_properties_t;
{*< access class id @internal 30  }

const
  AMQP_ACCESS_CLASS = $001E;  
{* access class properties  }
{*< bit-mask of set fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_access_properties_t_ = ^Tamqp_access_properties_t_;
  Tamqp_access_properties_t_ = record
      _flags : Tamqp_flags_t;
      dummy : char;
    end;
  Tamqp_access_properties_t = Tamqp_access_properties_t_;
  Pamqp_access_properties_t = ^Tamqp_access_properties_t;
{*< exchange class id @internal 40  }

const
  AMQP_EXCHANGE_CLASS = $0028;  
{* exchange class properties  }
{*< bit-mask of set fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_exchange_properties_t_ = ^Tamqp_exchange_properties_t_;
  Tamqp_exchange_properties_t_ = record
      _flags : Tamqp_flags_t;
      dummy : char;
    end;
  Tamqp_exchange_properties_t = Tamqp_exchange_properties_t_;
  Pamqp_exchange_properties_t = ^Tamqp_exchange_properties_t;
{*< queue class id @internal 50  }

const
  AMQP_QUEUE_CLASS = $0032;  
{* queue class properties  }
{*< bit-mask of set fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_queue_properties_t_ = ^Tamqp_queue_properties_t_;
  Tamqp_queue_properties_t_ = record
      _flags : Tamqp_flags_t;
      dummy : char;
    end;
  Tamqp_queue_properties_t = Tamqp_queue_properties_t_;
  Pamqp_queue_properties_t = ^Tamqp_queue_properties_t;
{*< basic class id @internal 60  }

const
  AMQP_BASIC_CLASS = $003C;  
  AMQP_BASIC_CONTENT_TYPE_FLAG = 1 shl 15;  
  AMQP_BASIC_CONTENT_ENCODING_FLAG = 1 shl 14;  
  AMQP_BASIC_HEADERS_FLAG = 1 shl 13;  
  AMQP_BASIC_DELIVERY_MODE_FLAG = 1 shl 12;  
  AMQP_BASIC_PRIORITY_FLAG = 1 shl 11;  
  AMQP_BASIC_CORRELATION_ID_FLAG = 1 shl 10;  
  AMQP_BASIC_REPLY_TO_FLAG = 1 shl 9;  
  AMQP_BASIC_EXPIRATION_FLAG = 1 shl 8;  
  AMQP_BASIC_MESSAGE_ID_FLAG = 1 shl 7;  
  AMQP_BASIC_TIMESTAMP_FLAG = 1 shl 6;  
  AMQP_BASIC_TYPE_FLAG = 1 shl 5;  
  AMQP_BASIC_USER_ID_FLAG = 1 shl 4;  
  AMQP_BASIC_APP_ID_FLAG = 1 shl 3;  
  AMQP_BASIC_CLUSTER_ID_FLAG = 1 shl 2;  
{* basic class properties  }
{*< bit-mask of set fields  }
{*< content-type  }
{*< content-encoding  }
{*< headers  }
{*< delivery-mode  }
{*< priority  }
{*< correlation-id  }
{*< reply-to  }
{*< expiration  }
{*< message-id  }
{*< timestamp  }
{*< type  }
{*< user-id  }
{*< app-id  }
{*< cluster-id  }
type
  Pamqp_basic_properties_t_ = ^Tamqp_basic_properties_t_;
  Tamqp_basic_properties_t_ = record
      _flags : Tamqp_flags_t;
      content_type : Tamqp_bytes_t;
      content_encoding : Tamqp_bytes_t;
      headers : Tamqp_table_t;
      delivery_mode : Tuint8_t;
      priority : Tuint8_t;
      correlation_id : Tamqp_bytes_t;
      reply_to : Tamqp_bytes_t;
      expiration : Tamqp_bytes_t;
      message_id : Tamqp_bytes_t;
      timestamp : Tuint64_t;
      _type : Tamqp_bytes_t;
      user_id : Tamqp_bytes_t;
      app_id : Tamqp_bytes_t;
      cluster_id : Tamqp_bytes_t;
    end;
  Tamqp_basic_properties_t = Tamqp_basic_properties_t_;
  Pamqp_basic_properties_t = ^Tamqp_basic_properties_t;
{*< tx class id @internal 90  }

const
  AMQP_TX_CLASS = $005A;  
{* tx class properties  }
{*< bit-mask of set fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_tx_properties_t_ = ^Tamqp_tx_properties_t_;
  Tamqp_tx_properties_t_ = record
      _flags : Tamqp_flags_t;
      dummy : char;
    end;
  Tamqp_tx_properties_t = Tamqp_tx_properties_t_;
  Pamqp_tx_properties_t = ^Tamqp_tx_properties_t;
{*< confirm class id @internal 85  }

const
  AMQP_CONFIRM_CLASS = $0055;  
{* confirm class properties  }
{*< bit-mask of set fields  }
{*< Dummy field to avoid empty struct  }
type
  Pamqp_confirm_properties_t_ = ^Tamqp_confirm_properties_t_;
  Tamqp_confirm_properties_t_ = record
      _flags : Tamqp_flags_t;
      dummy : char;
    end;
  Tamqp_confirm_properties_t = Tamqp_confirm_properties_t_;
  Pamqp_confirm_properties_t = ^Tamqp_confirm_properties_t;
{ API functions for methods  }
{*
 * amqp_channel_open
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @returns amqp_channel_open_ok_t
  }

function amqp_channel_open(state:Tamqp_connection_state_t; channel:Tamqp_channel_t):Pamqp_channel_open_ok_t;cdecl;external librabbitmq;
{*
 * amqp_channel_flow
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] active active
 * @returns amqp_channel_flow_ok_t
  }
function amqp_channel_flow(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; active:Tamqp_boolean_t):Pamqp_channel_flow_ok_t;cdecl;external librabbitmq;
{*
 * amqp_exchange_declare
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] exchange exchange
 * @param [in] type type
 * @param [in] passive passive
 * @param [in] durable durable
 * @param [in] auto_delete auto_delete
 * @param [in] internal internal
 * @param [in] arguments arguments
 * @returns amqp_exchange_declare_ok_t
  }
function amqp_exchange_declare(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; exchange:Tamqp_bytes_t; _type:Tamqp_bytes_t; passive:Tamqp_boolean_t; 
           durable:Tamqp_boolean_t; auto_delete:Tamqp_boolean_t; internal:Tamqp_boolean_t; arguments:Tamqp_table_t):Pamqp_exchange_declare_ok_t;cdecl;external librabbitmq;
{*
 * amqp_exchange_delete
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] exchange exchange
 * @param [in] if_unused if_unused
 * @returns amqp_exchange_delete_ok_t
  }
function amqp_exchange_delete(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; exchange:Tamqp_bytes_t; if_unused:Tamqp_boolean_t):Pamqp_exchange_delete_ok_t;cdecl;external librabbitmq;
{*
 * amqp_exchange_bind
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] destination destination
 * @param [in] source source
 * @param [in] routing_key routing_key
 * @param [in] arguments arguments
 * @returns amqp_exchange_bind_ok_t
  }
function amqp_exchange_bind(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; destination:Tamqp_bytes_t; source:Tamqp_bytes_t; routing_key:Tamqp_bytes_t; 
           arguments:Tamqp_table_t):Pamqp_exchange_bind_ok_t;cdecl;external librabbitmq;
{*
 * amqp_exchange_unbind
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] destination destination
 * @param [in] source source
 * @param [in] routing_key routing_key
 * @param [in] arguments arguments
 * @returns amqp_exchange_unbind_ok_t
  }
function amqp_exchange_unbind(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; destination:Tamqp_bytes_t; source:Tamqp_bytes_t; routing_key:Tamqp_bytes_t; 
           arguments:Tamqp_table_t):Pamqp_exchange_unbind_ok_t;cdecl;external librabbitmq;
{*
 * amqp_queue_declare
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] queue queue
 * @param [in] passive passive
 * @param [in] durable durable
 * @param [in] exclusive exclusive
 * @param [in] auto_delete auto_delete
 * @param [in] arguments arguments
 * @returns amqp_queue_declare_ok_t
  }
function amqp_queue_declare(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; queue:Tamqp_bytes_t; passive:Tamqp_boolean_t; durable:Tamqp_boolean_t; 
           exclusive:Tamqp_boolean_t; auto_delete:Tamqp_boolean_t; arguments:Tamqp_table_t):Pamqp_queue_declare_ok_t;cdecl;external librabbitmq;
{*
 * amqp_queue_bind
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] queue queue
 * @param [in] exchange exchange
 * @param [in] routing_key routing_key
 * @param [in] arguments arguments
 * @returns amqp_queue_bind_ok_t
  }
function amqp_queue_bind(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; queue:Tamqp_bytes_t; exchange:Tamqp_bytes_t; routing_key:Tamqp_bytes_t; 
           arguments:Tamqp_table_t):Pamqp_queue_bind_ok_t;cdecl;external librabbitmq;
{*
 * amqp_queue_purge
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] queue queue
 * @returns amqp_queue_purge_ok_t
  }
function amqp_queue_purge(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; queue:Tamqp_bytes_t):Pamqp_queue_purge_ok_t;cdecl;external librabbitmq;
{*
 * amqp_queue_delete
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] queue queue
 * @param [in] if_unused if_unused
 * @param [in] if_empty if_empty
 * @returns amqp_queue_delete_ok_t
  }
function amqp_queue_delete(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; queue:Tamqp_bytes_t; if_unused:Tamqp_boolean_t; if_empty:Tamqp_boolean_t):Pamqp_queue_delete_ok_t;cdecl;external librabbitmq;
{*
 * amqp_queue_unbind
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] queue queue
 * @param [in] exchange exchange
 * @param [in] routing_key routing_key
 * @param [in] arguments arguments
 * @returns amqp_queue_unbind_ok_t
  }
function amqp_queue_unbind(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; queue:Tamqp_bytes_t; exchange:Tamqp_bytes_t; routing_key:Tamqp_bytes_t; 
           arguments:Tamqp_table_t):Pamqp_queue_unbind_ok_t;cdecl;external librabbitmq;
{*
 * amqp_basic_qos
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] prefetch_size prefetch_size
 * @param [in] prefetch_count prefetch_count
 * @param [in] global global
 * @returns amqp_basic_qos_ok_t
  }
function amqp_basic_qos(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; prefetch_size:Tuint32_t; prefetch_count:Tuint16_t; global:Tamqp_boolean_t):Pamqp_basic_qos_ok_t;cdecl;external librabbitmq;
{*
 * amqp_basic_consume
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] queue queue
 * @param [in] consumer_tag consumer_tag
 * @param [in] no_local no_local
 * @param [in] no_ack no_ack
 * @param [in] exclusive exclusive
 * @param [in] arguments arguments
 * @returns amqp_basic_consume_ok_t
  }
function amqp_basic_consume(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; queue:Tamqp_bytes_t; consumer_tag:Tamqp_bytes_t; no_local:Tamqp_boolean_t; 
           no_ack:Tamqp_boolean_t; exclusive:Tamqp_boolean_t; arguments:Tamqp_table_t):Pamqp_basic_consume_ok_t;cdecl;external librabbitmq;
{*
 * amqp_basic_cancel
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] consumer_tag consumer_tag
 * @returns amqp_basic_cancel_ok_t
  }
function amqp_basic_cancel(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; consumer_tag:Tamqp_bytes_t):Pamqp_basic_cancel_ok_t;cdecl;external librabbitmq;
{*
 * amqp_basic_recover
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @param [in] requeue requeue
 * @returns amqp_basic_recover_ok_t
  }
function amqp_basic_recover(state:Tamqp_connection_state_t; channel:Tamqp_channel_t; requeue:Tamqp_boolean_t):Pamqp_basic_recover_ok_t;cdecl;external librabbitmq;
{*
 * amqp_tx_select
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @returns amqp_tx_select_ok_t
  }
function amqp_tx_select(state:Tamqp_connection_state_t; channel:Tamqp_channel_t):Pamqp_tx_select_ok_t;cdecl;external librabbitmq;
{*
 * amqp_tx_commit
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @returns amqp_tx_commit_ok_t
  }
function amqp_tx_commit(state:Tamqp_connection_state_t; channel:Tamqp_channel_t):Pamqp_tx_commit_ok_t;cdecl;external librabbitmq;
{*
 * amqp_tx_rollback
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @returns amqp_tx_rollback_ok_t
  }
function amqp_tx_rollback(state:Tamqp_connection_state_t; channel:Tamqp_channel_t):Pamqp_tx_rollback_ok_t;cdecl;external librabbitmq;
{*
 * amqp_confirm_select
 *
 * @param [in] state connection state
 * @param [in] channel the channel to do the RPC on
 * @returns amqp_confirm_select_ok_t
  }
function amqp_confirm_select(state:Tamqp_connection_state_t; channel:Tamqp_channel_t):Pamqp_confirm_select_ok_t;cdecl;external librabbitmq;
{$endif}
{ AMQP_FRAMING_H  }

// === Konventiert am: 4-9-26 19:56:42 ===


implementation


{ was #define dname def_expr }
function AMQP_CONNECTION_START_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_START_METHOD:=Tamqp_method_number_t($000A000A);
  end;

{ was #define dname def_expr }
function AMQP_CONNECTION_START_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_START_OK_METHOD:=Tamqp_method_number_t($000A000B);
  end;

{ was #define dname def_expr }
function AMQP_CONNECTION_SECURE_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_SECURE_METHOD:=Tamqp_method_number_t($000A0014);
  end;

{ was #define dname def_expr }
function AMQP_CONNECTION_SECURE_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_SECURE_OK_METHOD:=Tamqp_method_number_t($000A0015);
  end;

{ was #define dname def_expr }
function AMQP_CONNECTION_TUNE_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_TUNE_METHOD:=Tamqp_method_number_t($000A001E);
  end;

{ was #define dname def_expr }
function AMQP_CONNECTION_TUNE_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_TUNE_OK_METHOD:=Tamqp_method_number_t($000A001F);
  end;

{ was #define dname def_expr }
function AMQP_CONNECTION_OPEN_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_OPEN_METHOD:=Tamqp_method_number_t($000A0028);
  end;

{ was #define dname def_expr }
function AMQP_CONNECTION_OPEN_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_OPEN_OK_METHOD:=Tamqp_method_number_t($000A0029);
  end;

{ was #define dname def_expr }
function AMQP_CONNECTION_CLOSE_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_CLOSE_METHOD:=Tamqp_method_number_t($000A0032);
  end;

{ was #define dname def_expr }
function AMQP_CONNECTION_CLOSE_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_CLOSE_OK_METHOD:=Tamqp_method_number_t($000A0033);
  end;

{ was #define dname def_expr }
function AMQP_CONNECTION_BLOCKED_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_BLOCKED_METHOD:=Tamqp_method_number_t($000A003C);
  end;

{ was #define dname def_expr }
function AMQP_CONNECTION_UNBLOCKED_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONNECTION_UNBLOCKED_METHOD:=Tamqp_method_number_t($000A003D);
  end;

{ was #define dname def_expr }
function AMQP_CHANNEL_OPEN_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CHANNEL_OPEN_METHOD:=Tamqp_method_number_t($0014000A);
  end;

{ was #define dname def_expr }
function AMQP_CHANNEL_OPEN_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CHANNEL_OPEN_OK_METHOD:=Tamqp_method_number_t($0014000B);
  end;

{ was #define dname def_expr }
function AMQP_CHANNEL_FLOW_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CHANNEL_FLOW_METHOD:=Tamqp_method_number_t($00140014);
  end;

{ was #define dname def_expr }
function AMQP_CHANNEL_FLOW_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CHANNEL_FLOW_OK_METHOD:=Tamqp_method_number_t($00140015);
  end;

{ was #define dname def_expr }
function AMQP_CHANNEL_CLOSE_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CHANNEL_CLOSE_METHOD:=Tamqp_method_number_t($00140028);
  end;

{ was #define dname def_expr }
function AMQP_CHANNEL_CLOSE_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CHANNEL_CLOSE_OK_METHOD:=Tamqp_method_number_t($00140029);
  end;

{ was #define dname def_expr }
function AMQP_ACCESS_REQUEST_METHOD : Tamqp_method_number_t;
  begin
    AMQP_ACCESS_REQUEST_METHOD:=Tamqp_method_number_t($001E000A);
  end;

{ was #define dname def_expr }
function AMQP_ACCESS_REQUEST_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_ACCESS_REQUEST_OK_METHOD:=Tamqp_method_number_t($001E000B);
  end;

{ was #define dname def_expr }
function AMQP_EXCHANGE_DECLARE_METHOD : Tamqp_method_number_t;
  begin
    AMQP_EXCHANGE_DECLARE_METHOD:=Tamqp_method_number_t($0028000A);
  end;

{ was #define dname def_expr }
function AMQP_EXCHANGE_DECLARE_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_EXCHANGE_DECLARE_OK_METHOD:=Tamqp_method_number_t($0028000B);
  end;

{ was #define dname def_expr }
function AMQP_EXCHANGE_DELETE_METHOD : Tamqp_method_number_t;
  begin
    AMQP_EXCHANGE_DELETE_METHOD:=Tamqp_method_number_t($00280014);
  end;

{ was #define dname def_expr }
function AMQP_EXCHANGE_DELETE_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_EXCHANGE_DELETE_OK_METHOD:=Tamqp_method_number_t($00280015);
  end;

{ was #define dname def_expr }
function AMQP_EXCHANGE_BIND_METHOD : Tamqp_method_number_t;
  begin
    AMQP_EXCHANGE_BIND_METHOD:=Tamqp_method_number_t($0028001E);
  end;

{ was #define dname def_expr }
function AMQP_EXCHANGE_BIND_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_EXCHANGE_BIND_OK_METHOD:=Tamqp_method_number_t($0028001F);
  end;

{ was #define dname def_expr }
function AMQP_EXCHANGE_UNBIND_METHOD : Tamqp_method_number_t;
  begin
    AMQP_EXCHANGE_UNBIND_METHOD:=Tamqp_method_number_t($00280028);
  end;

{ was #define dname def_expr }
function AMQP_EXCHANGE_UNBIND_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_EXCHANGE_UNBIND_OK_METHOD:=Tamqp_method_number_t($00280033);
  end;

{ was #define dname def_expr }
function AMQP_QUEUE_DECLARE_METHOD : Tamqp_method_number_t;
  begin
    AMQP_QUEUE_DECLARE_METHOD:=Tamqp_method_number_t($0032000A);
  end;

{ was #define dname def_expr }
function AMQP_QUEUE_DECLARE_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_QUEUE_DECLARE_OK_METHOD:=Tamqp_method_number_t($0032000B);
  end;

{ was #define dname def_expr }
function AMQP_QUEUE_BIND_METHOD : Tamqp_method_number_t;
  begin
    AMQP_QUEUE_BIND_METHOD:=Tamqp_method_number_t($00320014);
  end;

{ was #define dname def_expr }
function AMQP_QUEUE_BIND_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_QUEUE_BIND_OK_METHOD:=Tamqp_method_number_t($00320015);
  end;

{ was #define dname def_expr }
function AMQP_QUEUE_PURGE_METHOD : Tamqp_method_number_t;
  begin
    AMQP_QUEUE_PURGE_METHOD:=Tamqp_method_number_t($0032001E);
  end;

{ was #define dname def_expr }
function AMQP_QUEUE_PURGE_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_QUEUE_PURGE_OK_METHOD:=Tamqp_method_number_t($0032001F);
  end;

{ was #define dname def_expr }
function AMQP_QUEUE_DELETE_METHOD : Tamqp_method_number_t;
  begin
    AMQP_QUEUE_DELETE_METHOD:=Tamqp_method_number_t($00320028);
  end;

{ was #define dname def_expr }
function AMQP_QUEUE_DELETE_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_QUEUE_DELETE_OK_METHOD:=Tamqp_method_number_t($00320029);
  end;

{ was #define dname def_expr }
function AMQP_QUEUE_UNBIND_METHOD : Tamqp_method_number_t;
  begin
    AMQP_QUEUE_UNBIND_METHOD:=Tamqp_method_number_t($00320032);
  end;

{ was #define dname def_expr }
function AMQP_QUEUE_UNBIND_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_QUEUE_UNBIND_OK_METHOD:=Tamqp_method_number_t($00320033);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_QOS_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_QOS_METHOD:=Tamqp_method_number_t($003C000A);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_QOS_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_QOS_OK_METHOD:=Tamqp_method_number_t($003C000B);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_CONSUME_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_CONSUME_METHOD:=Tamqp_method_number_t($003C0014);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_CONSUME_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_CONSUME_OK_METHOD:=Tamqp_method_number_t($003C0015);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_CANCEL_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_CANCEL_METHOD:=Tamqp_method_number_t($003C001E);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_CANCEL_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_CANCEL_OK_METHOD:=Tamqp_method_number_t($003C001F);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_PUBLISH_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_PUBLISH_METHOD:=Tamqp_method_number_t($003C0028);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_RETURN_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_RETURN_METHOD:=Tamqp_method_number_t($003C0032);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_DELIVER_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_DELIVER_METHOD:=Tamqp_method_number_t($003C003C);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_GET_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_GET_METHOD:=Tamqp_method_number_t($003C0046);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_GET_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_GET_OK_METHOD:=Tamqp_method_number_t($003C0047);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_GET_EMPTY_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_GET_EMPTY_METHOD:=Tamqp_method_number_t($003C0048);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_ACK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_ACK_METHOD:=Tamqp_method_number_t($003C0050);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_REJECT_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_REJECT_METHOD:=Tamqp_method_number_t($003C005A);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_RECOVER_ASYNC_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_RECOVER_ASYNC_METHOD:=Tamqp_method_number_t($003C0064);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_RECOVER_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_RECOVER_METHOD:=Tamqp_method_number_t($003C006E);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_RECOVER_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_RECOVER_OK_METHOD:=Tamqp_method_number_t($003C006F);
  end;

{ was #define dname def_expr }
function AMQP_BASIC_NACK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_BASIC_NACK_METHOD:=Tamqp_method_number_t($003C0078);
  end;

{ was #define dname def_expr }
function AMQP_TX_SELECT_METHOD : Tamqp_method_number_t;
  begin
    AMQP_TX_SELECT_METHOD:=Tamqp_method_number_t($005A000A);
  end;

{ was #define dname def_expr }
function AMQP_TX_SELECT_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_TX_SELECT_OK_METHOD:=Tamqp_method_number_t($005A000B);
  end;

{ was #define dname def_expr }
function AMQP_TX_COMMIT_METHOD : Tamqp_method_number_t;
  begin
    AMQP_TX_COMMIT_METHOD:=Tamqp_method_number_t($005A0014);
  end;

{ was #define dname def_expr }
function AMQP_TX_COMMIT_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_TX_COMMIT_OK_METHOD:=Tamqp_method_number_t($005A0015);
  end;

{ was #define dname def_expr }
function AMQP_TX_ROLLBACK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_TX_ROLLBACK_METHOD:=Tamqp_method_number_t($005A001E);
  end;

{ was #define dname def_expr }
function AMQP_TX_ROLLBACK_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_TX_ROLLBACK_OK_METHOD:=Tamqp_method_number_t($005A001F);
  end;

{ was #define dname def_expr }
function AMQP_CONFIRM_SELECT_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONFIRM_SELECT_METHOD:=Tamqp_method_number_t($0055000A);
  end;

{ was #define dname def_expr }
function AMQP_CONFIRM_SELECT_OK_METHOD : Tamqp_method_number_t;
  begin
    AMQP_CONFIRM_SELECT_OK_METHOD:=Tamqp_method_number_t($0055000B);
  end;


end.
