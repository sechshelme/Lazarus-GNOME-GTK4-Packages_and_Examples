{$IFDEF read_interface}


type
  PCURLM = ^TCURLM;
  TCURLM = pointer;

type
  TCurl_multi = TCURLM;

type
  PCURLMcode = ^TCURLMcode;
  TCURLMcode = longint;

const
  CURLM_CALL_MULTI_PERFORM = -(1);
  CURLM_OK = (-(1)) + 1;
  CURLM_BAD_HANDLE = (-(1)) + 2;
  CURLM_BAD_EASY_HANDLE = (-(1)) + 3;
  CURLM_OUT_OF_MEMORY = (-(1)) + 4;
  CURLM_INTERNAL_ERROR = (-(1)) + 5;
  CURLM_BAD_SOCKET = (-(1)) + 6;
  CURLM_UNKNOWN_OPTION = (-(1)) + 7;
  CURLM_ADDED_ALREADY = (-(1)) + 8;
  CURLM_RECURSIVE_API_CALL = (-(1)) + 9;
  CURLM_WAKEUP_FAILURE = (-(1)) + 10;
  CURLM_BAD_FUNCTION_ARGUMENT = (-(1)) + 11;
  CURLM_ABORTED_BY_CALLBACK = (-(1)) + 12;
  CURLM_UNRECOVERABLE_POLL = (-(1)) + 13;
  CURLM_LAST = (-(1)) + 14;

const
  CURLM_CALL_MULTI_SOCKET = CURLM_CALL_MULTI_PERFORM;
  CURLPIPE_NOTHING = 0;
  CURLPIPE_HTTP1 = 1;
  CURLPIPE_MULTIPLEX = 2;

type
  PCURLMSG_ = ^TCURLMSG_;
  TCURLMSG_ = longint;

const
  CURLMSG_NONE = 0;
  CURLMSG_DONE = 1;
  CURLMSG_LAST = 2;

type
  TCURLMsg = record
    msg: TCURLMSG_;
    easy_handle: PCURL;
    data: record
      case longint of
        0: (whatever: pointer);
        1: (result: TCURLcode);
      end;
  end;
  PCURLMsg = ^TCURLMsg;

const
  CURL_WAIT_POLLIN = $0001;
  CURL_WAIT_POLLPRI = $0002;
  CURL_WAIT_POLLOUT = $0004;

type
  Tcurl_waitfd = record
    fd: Tcurl_socket_t;
    events: smallint;
    revents: smallint;
  end;
  Pcurl_waitfd = ^Tcurl_waitfd;

function curl_multi_init: PCURLM; cdecl; external libcurl;
function curl_multi_add_handle(multi_handle: PCURLM; curl_handle: PCURL): TCURLMcode; cdecl; external libcurl;
function curl_multi_remove_handle(multi_handle: PCURLM; curl_handle: PCURL): TCURLMcode; cdecl; external libcurl;
function curl_multi_fdset(multi_handle: PCURLM; read_fd_set: Pfd_set; write_fd_set: Pfd_set; exc_fd_set: Pfd_set; max_fd: Plongint): TCURLMcode; cdecl; external libcurl;
function curl_multi_wait(multi_handle: PCURLM; extra_fds: Pcurl_waitfd; extra_nfds: dword; timeout_ms: longint; ret: Plongint): TCURLMcode; cdecl; external libcurl;
function curl_multi_poll(multi_handle: PCURLM; extra_fds: Pcurl_waitfd; extra_nfds: dword; timeout_ms: longint; ret: Plongint): TCURLMcode; cdecl; external libcurl;
function curl_multi_wakeup(multi_handle: PCURLM): TCURLMcode; cdecl; external libcurl;
function curl_multi_perform(multi_handle: PCURLM; running_handles: Plongint): TCURLMcode; cdecl; external libcurl;
function curl_multi_cleanup(multi_handle: PCURLM): TCURLMcode; cdecl; external libcurl;
function curl_multi_info_read(multi_handle: PCURLM; msgs_in_queue: Plongint): PCURLMsg; cdecl; external libcurl;
function curl_multi_strerror(para1: TCURLMcode): pchar; cdecl; external libcurl;

const
  CURL_POLL_NONE = 0;
  CURL_POLL_IN = 1;
  CURL_POLL_OUT = 2;
  CURL_POLL_INOUT = 3;
  CURL_POLL_REMOVE = 4;
  CURL_SOCKET_TIMEOUT = CURL_SOCKET_BAD;
  CURL_CSELECT_IN = $01;
  CURL_CSELECT_OUT = $02;
  CURL_CSELECT_ERR = $04;

type
  Tcurl_socket_callback = function(easy: PCURL; s: Tcurl_socket_t; what: longint; userp: pointer; socketp: pointer): longint; cdecl;
  Tcurl_multi_timer_callback = function(multi: PCURLM; timeout_ms: Tclong; userp: pointer): longint; cdecl;

function curl_multi_socket(multi_handle: PCURLM; s: Tcurl_socket_t; running_handles: Plongint): TCURLMcode; cdecl; external libcurl;
function curl_multi_socket_action(multi_handle: PCURLM; s: Tcurl_socket_t; ev_bitmask: longint; running_handles: Plongint): TCURLMcode; cdecl; external libcurl;
function curl_multi_socket_all(multi_handle: PCURLM; running_handles: Plongint): TCURLMcode; cdecl; external libcurl; deprecated;

function curl_multi_timeout(multi_handle: PCURLM; milliseconds: Pclong): TCURLMcode; cdecl; external libcurl;

type
  PCURLMoption = ^TCURLMoption;
  TCURLMoption = longint;

const
  CURLMOPT_SOCKETFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 1;
  CURLMOPT_SOCKETDATA = CURLOPTTYPE_OBJECTPOINT + 2;
  CURLMOPT_PIPELINING = CURLOPTTYPE_LONG + 3;
  CURLMOPT_TIMERFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 4;
  CURLMOPT_TIMERDATA = CURLOPTTYPE_OBJECTPOINT + 5;
  CURLMOPT_MAXCONNECTS = CURLOPTTYPE_LONG + 6;
  CURLMOPT_MAX_HOST_CONNECTIONS = CURLOPTTYPE_LONG + 7;
  CURLMOPT_MAX_PIPELINE_LENGTH = CURLOPTTYPE_LONG + 8;
  CURLMOPT_CONTENT_LENGTH_PENALTY_SIZE = CURLOPTTYPE_OFF_T + 9;
  CURLMOPT_CHUNK_LENGTH_PENALTY_SIZE = CURLOPTTYPE_OFF_T + 10;
  CURLMOPT_PIPELINING_SITE_BL = CURLOPTTYPE_OBJECTPOINT + 11;
  CURLMOPT_PIPELINING_SERVER_BL = CURLOPTTYPE_OBJECTPOINT + 12;
  CURLMOPT_MAX_TOTAL_CONNECTIONS = CURLOPTTYPE_LONG + 13;
  CURLMOPT_PUSHFUNCTION = CURLOPTTYPE_FUNCTIONPOINT + 14;
  CURLMOPT_PUSHDATA = CURLOPTTYPE_OBJECTPOINT + 15;
  CURLMOPT_MAX_CONCURRENT_STREAMS = CURLOPTTYPE_LONG + 16;
  CURLMOPT_LASTENTRY = (CURLOPTTYPE_LONG + 16) + 1;

function curl_multi_setopt(multi_handle: PCURLM; option: TCURLMoption; args: array of const): TCURLMcode; cdecl; external libcurl;
function curl_multi_setopt(multi_handle: PCURLM; option: TCURLMoption): TCURLMcode; cdecl; external libcurl;
function curl_multi_assign(multi_handle: PCURLM; sockfd: Tcurl_socket_t; sockp: pointer): TCURLMcode; cdecl; external libcurl;
function curl_multi_get_handles(multi_handle: PCURLM): PPCURL; cdecl; external libcurl;

const
  CURL_PUSH_OK = 0;
  CURL_PUSH_DENY = 1;
  CURL_PUSH_ERROROUT = 2;

type
  Pcurl_pushheaders = ^Tcurl_pushheaders;
  Tcurl_pushheaders = record
  end;

function curl_pushheader_bynum(h: Pcurl_pushheaders; num: Tsize_t): pchar; cdecl; external libcurl;
function curl_pushheader_byname(h: Pcurl_pushheaders; name: pchar): pchar; cdecl; external libcurl;

type
  Tcurl_push_callback = function(parent: PCURL; easy: PCURL; num_headers: Tsize_t; headers: Pcurl_pushheaders; userp: pointer): longint; cdecl;

  // === Konventiert am: 12-7-25 13:50:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
