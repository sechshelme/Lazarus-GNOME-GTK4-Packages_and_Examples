
unit efl_net_http_types_eot;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_http_types_eot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_http_types_eot.h
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
PEfl_Net_Http_Authentication_Method  = ^Efl_Net_Http_Authentication_Method;
PEfl_Net_Http_Header  = ^Efl_Net_Http_Header;
PEfl_Net_Http_Status  = ^Efl_Net_Http_Status;
PEfl_Net_Http_Version  = ^Efl_Net_Http_Version;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_HTTP_TYPES_EOT_H_}
{$define _EFL_NET_HTTP_TYPES_EOT_H_}
{$ifndef _EFL_NET_HTTP_TYPES_EOT_TYPES}
{$define _EFL_NET_HTTP_TYPES_EOT_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* HTTP protocol versions
 *
 * @ingroup Efl_Net_Http_Version
  }
{*< HTTP version 1.0  }
{*< HTTP version 1.1  }
{*< HTTP version 2.0  }
type
  PEfl_Net_Http_Version = ^TEfl_Net_Http_Version;
  TEfl_Net_Http_Version =  Longint;
  Const
    EFL_NET_HTTP_VERSION_V1_0 = 100;
    EFL_NET_HTTP_VERSION_V1_1 = 101;
    EFL_NET_HTTP_VERSION_V2_0 = 200;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* HTTP authentication methods
 *
 * @ingroup Efl_Net_Http_Authentication_Method
  }
{*< HTTP authentication method
                                                * none  }
{ 1 >> 0  }{*< HTTP authentication method basic  }
{ 1 >> 1  }{*< HTTP authentication method digest
                                                                }
{ 1 >> 2  }{*< HTTP authentication method
                                                                  * negotiate  }
{ 1 >> 3  }{*< HTTP authentication method ntlm  }
{ 1 >> 4  }{*< HTTP authentication method ntlm
                                                                      * winbind  }
{ ((Efl.Net.Http.Authentication_Method.digest ^ Efl.Net.Http.Authentication_Method.negotiate) ^ Efl.Net.Http.Authentication_Method.ntlm) ^ Efl.Net.Http.Authentication_Method.ntlm_winbind  }{*< HTTP authentication method any safe
                                                                                                                                                                                                                                                     }
{ Efl.Net.Http.Authentication_Method.any_safe ^ Efl.Net.Http.Authentication_Method.basic  }{*< HTTP authentication method any  }
type
  PEfl_Net_Http_Authentication_Method = ^TEfl_Net_Http_Authentication_Method;
  TEfl_Net_Http_Authentication_Method =  Longint;
  Const
    EFL_NET_HTTP_AUTHENTICATION_METHOD_NONE = 0;
    EFL_NET_HTTP_AUTHENTICATION_METHOD_BASIC = 1;
    EFL_NET_HTTP_AUTHENTICATION_METHOD_DIGEST = 2;
    EFL_NET_HTTP_AUTHENTICATION_METHOD_NEGOTIATE = 4;
    EFL_NET_HTTP_AUTHENTICATION_METHOD_NTLM = 8;
    EFL_NET_HTTP_AUTHENTICATION_METHOD_NTLM_WINBIND = 16;
    EFL_NET_HTTP_AUTHENTICATION_METHOD_ANY_SAFE = 30;
    EFL_NET_HTTP_AUTHENTICATION_METHOD_ANY = 31;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Common HTTP status codes. A more detailed description on the various HTTPS
 * status codes can be found one Wikipedia:
 * https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
 *
 * @ingroup Efl_Net_Http_Status
  }
{*< HTTP status code: Unknown, likely not
                                    * connected  }
{*< HTTP status code: continue  }
{*< HTTP status code:
                                                  * switching protocols  }
{*< HTTP status code: checkpoint
                                         * (unofficial extension)  }
{*< HTTP status code: processing  }
{*< HTTP status code: OK  }
{*< HTTP status code: created  }
{*< HTTP status code: accepted  }
{*< HTTP status
                                                            * code: non
                                                            * authoritative
                                                            * information  }
{*< HTTP status code: no content  }
{*< HTTP status code: reset content
                                             }
{*< HTTP status code: partial
                                              * content  }
{*< HTTP status code: multi status  }
{*< HTTP status code: already
                                               * reported  }
{*< HTTP status code: IM used  }
{*< HTTP status code: multiple
                                               * choices  }
{*< HTTP status code: moved
                                                * permanently  }
{*< HTTP status code: found  }
{*< HTTP status code: see other  }
{*< HTTP status code: not modified  }
{*< HTTP status code: use proxy  }
{*< HTTP status code: switch proxy  }
{*< HTTP status code: temporary
                                                 * redirect  }
{*< HTTP status code: permanent
                                                 * redirect  }
{*< HTTP status code: bad request  }
{*< HTTP status code: unauthorized  }
{*< HTTP status code: payment
                                               * required  }
{*< HTTP status code: forbidden  }
{*< HTTP status code: not found  }
{*< HTTP status code: method
                                                 * not allowed  }
{*< HTTP status code: not
                                             * acceptable  }
{*< HTTP status
                                                            * code: proxy
                                                            * authentication
                                                            * required  }
{*< HTTP status code: request
                                              * timeout  }
{*< HTTP status code: conflict  }
{*< HTTP status code: gone  }
{*< HTTP status code: length
                                              * required  }
{*< HTTP status code:
                                                  * precondition failed  }
{*< HTTP status code: payload
                                                * too large  }
{*< HTTP status code: URI too long  }
{*< HTTP status code:
                                                     * unsupported media type
                                                      }
{*< HTTP status code: range
                                                    * not satisfied  }
{*< HTTP status code:
                                                 * expectation failed  }
{*< HTTP status code:
                                                  * misdirected request  }
{*< HTTP status code:
                                                   * unprocessable entity  }
{*< HTTP status code: locked  }
{*< HTTP status code: failed
                                                * dependency  }
{*< HTTP status code: upgrade
                                               * required  }
{*< HTTP status code:
                                                    * precondition required  }
{*< HTTP status code: too many
                                                * requests  }
{*< HTTP status code: request header
                                                              * fields too large  }
{*< HTTP status code: login timeout
                                            * (unofficial extension)  }
{*< HTTP status code: no response
                                          * (unofficial extension)  }
{*< HTTP status code: retry with
                                         * (unofficial extension)  }
{*< HTTP status code: blocked by
                                                                   * windows parental controls
                                                                   * (unofficial extension)  }
{*< HTTP status
                                                            * code: unavailable
                                                            * for legal reasons
                                                             }
{*< HTTP status code: SSL
                                                    * certificate error
                                                    * (unofficial extension)  }
{*< HTTP status code: SSL
                                                       * certificate required
                                                       * (unofficial extension)
                                                        }
{*< HTTP status code: HTTP request sent
                                                              * to HTTPS port (unofficial extension)
                                                               }
{*< HTTP status code: request has been
                                                                      * forbidden by anti virus  }
{*< HTTP status code:
                                                    * internal server error  }
{*< HTTP status code: not
                                              * implemented  }
{*< HTTP status code: bad gateway  }
{*< HTTP status code: service
                                                  * unavailable  }
{*< HTTP status code: gateway
                                              * timeout  }
{*< HTTP status code:
                                                         * HTTP version not
                                                         * supported  }
{*< HTTP status code:
                                                      * variant also negotiates
                                                       }
{*< HTTP status code:
                                                   * insufficient storage  }
{*< HTTP status code: loop detected
                                             }
{*< HTTP status code:
                                                       * bandwidth limit
                                                       * exceeded (unofficial
                                                       * extension)  }
{*< HTTP status code: not extended  }
{*< HTTP status code: network
                                                             * authentication required  }
type
  PEfl_Net_Http_Status = ^TEfl_Net_Http_Status;
  TEfl_Net_Http_Status =  Longint;
  Const
    EFL_NET_HTTP_STATUS_UNKNOWN = 0;
    EFL_NET_HTTP_STATUS_CONTINUE = 100;
    EFL_NET_HTTP_STATUS_SWITCHING_PROTOCOLS = 101;
    EFL_NET_HTTP_STATUS_CHECKPOINT = 103;
    EFL_NET_HTTP_STATUS_PROCESSING = 102;
    EFL_NET_HTTP_STATUS_OK = 200;
    EFL_NET_HTTP_STATUS_CREATED = 201;
    EFL_NET_HTTP_STATUS_ACCEPTED = 202;
    EFL_NET_HTTP_STATUS_NON_AUTHORITATIVE_INFORMATION = 203;
    EFL_NET_HTTP_STATUS_NO_CONTENT = 204;
    EFL_NET_HTTP_STATUS_RESET_CONTENT = 205;
    EFL_NET_HTTP_STATUS_PARTIAL_CONTENT = 206;
    EFL_NET_HTTP_STATUS_MULTI_STATUS = 207;
    EFL_NET_HTTP_STATUS_ALREADY_REPORTED = 208;
    EFL_NET_HTTP_STATUS_IM_USED = 226;
    EFL_NET_HTTP_STATUS_MULTIPLE_CHOICES = 300;
    EFL_NET_HTTP_STATUS_MOVED_PERMANENTLY = 301;
    EFL_NET_HTTP_STATUS_FOUND = 302;
    EFL_NET_HTTP_STATUS_SEE_OTHER = 303;
    EFL_NET_HTTP_STATUS_NOT_MODIFIED = 304;
    EFL_NET_HTTP_STATUS_USE_PROXY = 305;
    EFL_NET_HTTP_STATUS_SWITCH_PROXY = 306;
    EFL_NET_HTTP_STATUS_TEMPORARY_REDIRECT = 307;
    EFL_NET_HTTP_STATUS_PERMANENT_REDIRECT = 308;
    EFL_NET_HTTP_STATUS_BAD_REQUEST = 400;
    EFL_NET_HTTP_STATUS_UNAUTHORIZED = 401;
    EFL_NET_HTTP_STATUS_PAYMENT_REQUIRED = 402;
    EFL_NET_HTTP_STATUS_FORBIDDEN = 403;
    EFL_NET_HTTP_STATUS_NOT_FOUND = 404;
    EFL_NET_HTTP_STATUS_METHOD_NOT_ALLOWED = 405;
    EFL_NET_HTTP_STATUS_NOT_ACCEPTABLE = 406;
    EFL_NET_HTTP_STATUS_PROXY_AUTHENTICATION_REQUIRED = 407;
    EFL_NET_HTTP_STATUS_REQUEST_TIMEOUT = 408;
    EFL_NET_HTTP_STATUS_CONFLICT = 409;
    EFL_NET_HTTP_STATUS_GONE = 410;
    EFL_NET_HTTP_STATUS_LENGTH_REQUIRED = 411;
    EFL_NET_HTTP_STATUS_PRECONDITION_FAILED = 412;
    EFL_NET_HTTP_STATUS_PAYLOAD_TOO_LARGE = 413;
    EFL_NET_HTTP_STATUS_URI_TOO_LONG = 414;
    EFL_NET_HTTP_STATUS_UNSUPPORTED_MEDIA_TYPE = 415;
    EFL_NET_HTTP_STATUS_RANGE_NOT_SATISFIABLE = 416;
    EFL_NET_HTTP_STATUS_EXPECTATION_FAILED = 417;
    EFL_NET_HTTP_STATUS_MISDIRECTED_REQUEST = 421;
    EFL_NET_HTTP_STATUS_UNPROCESSABLE_ENTITY = 422;
    EFL_NET_HTTP_STATUS_LOCKED = 423;
    EFL_NET_HTTP_STATUS_FAILED_DEPENDENCY = 424;
    EFL_NET_HTTP_STATUS_UPGRADE_REQUIRED = 426;
    EFL_NET_HTTP_STATUS_PRECONDITION_REQUIRED = 428;
    EFL_NET_HTTP_STATUS_TOO_MANY_REQUESTS = 429;
    EFL_NET_HTTP_STATUS_REQUEST_HEADER_FIELDS_TOO_LARGE = 431;
    EFL_NET_HTTP_STATUS_LOGIN_TIMEOUT = 440;
    EFL_NET_HTTP_STATUS_NO_RESPONSE = 444;
    EFL_NET_HTTP_STATUS_RETRY_WITH = 449;
    EFL_NET_HTTP_STATUS_BLOCKED_BY_WINDOWS_PARENTAL_CONTROLS = 450;
    EFL_NET_HTTP_STATUS_UNAVAILABLE_FOR_LEGAL_REASONS = 451;
    EFL_NET_HTTP_STATUS_SSL_CERTIFICATE_ERROR = 495;
    EFL_NET_HTTP_STATUS_SSL_CERTIFICATE_REQUIRED = 496;
    EFL_NET_HTTP_STATUS_HTTP_REQUEST_SENT_TO_HTTPS_PORT = 497;
    EFL_NET_HTTP_STATUS_REQUEST_HAS_BEEN_FORBIDDEN_BY_ANTIVIRUS = 499;
    EFL_NET_HTTP_STATUS_INTERNAL_SERVER_ERROR = 500;
    EFL_NET_HTTP_STATUS_NOT_IMPLEMENTED = 501;
    EFL_NET_HTTP_STATUS_BAD_GATEWAY = 502;
    EFL_NET_HTTP_STATUS_SERVICE_UNAVAILABLE = 503;
    EFL_NET_HTTP_STATUS_GATEWAY_TIMEOUT = 504;
    EFL_NET_HTTP_STATUS_HTTP_VERSION_NOT_SUPPORTED = 505;
    EFL_NET_HTTP_STATUS_VARIANT_ALSO_NEGOTIATES = 506;
    EFL_NET_HTTP_STATUS_INSUFFICIENT_STORAGE = 507;
    EFL_NET_HTTP_STATUS_LOOP_DETECTED = 508;
    EFL_NET_HTTP_STATUS_BANDWIDTH_LIMIT_EXCEEDED = 509;
    EFL_NET_HTTP_STATUS_NOT_EXTENDED = 510;
    EFL_NET_HTTP_STATUS_NETWORK_AUTHENTICATION_REQUIRED = 511;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief An HTTP Header.
 *
 * Do not assume strings are Eina_Stringshare and they may be NULL. The key and
 * value should not include any trailing whitespace.
 *
 * There is a special case for response headers when "allow_redirects" is
 * enabled, in that case efl_net_dialer_http_response_headers_all_get() will
 * return some items with key being NULL, that notifies of a new request as
 * described in the value "HTTP/1.1 200 Ok".
 *
 * @ingroup Efl_Net_Http_Header
  }
(* Const before type ignored *)
{*< for response headers this may be null to indicate a new
                    * request response, then the value will be a line such as
                    * 'HTTP/1.1 200 Ok'  }
(* Const before type ignored *)
{*< Header value  }
type
  PEfl_Net_Http_Header = ^TEfl_Net_Http_Header;
  TEfl_Net_Http_Header = record
      key : Pchar;
      value : Pchar;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$endif}

implementation


end.
