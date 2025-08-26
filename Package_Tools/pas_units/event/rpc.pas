unit rpc;

interface

uses
  fp_event;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Pevbuffer = type Pointer;
  Pevent_base = type Pointer;
  Pevrpc_req_generic = type Pointer;
  Pevrpc_request_wrapper = type Pointer;
  Pevrpc = type Pointer;
  Pevhttp_request = type Pointer;
  Pevrpc_status = type Pointer;
  Pevrpc_hook_meta = type Pointer;

{ xxxxxxxxxxxxxxxxxxxxxx
#define EVRPC_HEADER(rpcname, reqstruct, rplystruct) \
EVRPC_STRUCT(rpcname) 	\
	struct evrpc_hook_meta *hook_meta; \
	struct reqstruct* request; \
	struct rplystruct* reply; \
	struct evrpc* rpc; \
	struct evhttp_request* http_req; \
	struct evbuffer* rpc_data; \
;								     \
extern \
int evrpc_send_request_##rpcname(struct evrpc_pool *, \
    struct reqstruct *, struct rplystruct *, \
    void (*)(struct evrpc_status *, \
	struct reqstruct *, struct rplystruct *, void *cbarg),	\
    void *);

 }
  Pevrpc_pool = type Pointer;

type Treq_marshal_proc=procedure (para1:Pevbuffer; para2:pointer);
  Trpl_clear_proc=   procedure (para1:pointer);
  Trpl_unmarshal_func=function (para1:pointer; para2:Pevbuffer):longint;
  tcp_proc=procedure (para1:Pevrpc_status; para2:pointer; para3:pointer; para4:pointer);
function evrpc_make_request_ctx(pool:Pevrpc_pool; request:pointer; reply:pointer; rpcname:Pchar; req_marshal:Treq_marshal_proc;
           rpl_clear:Trpl_clear_proc; rpl_unmarshal:Trpl_unmarshal_func; cb:tcp_proc; cbarg:pointer):Pevrpc_request_wrapper;cdecl;external libevent;
procedure evrpc_request_done(req:Pevrpc_req_generic);cdecl;external libevent;
function evrpc_get_request(req:Pevrpc_req_generic):pointer;cdecl;external libevent;
function evrpc_get_reply(req:Pevrpc_req_generic):pointer;cdecl;external libevent;
type
  Pevrpc_base = type Pointer;
  Pevhttp = type Pointer;

function evrpc_init(server:Pevhttp):Pevrpc_base;cdecl;external libevent;
procedure evrpc_free(base:Pevrpc_base);cdecl;external libevent;
type
  Tregister_rpc_proc=procedure (para1:Pevrpc_req_generic; para2:pointer);
function evrpc_register_rpc(para1:Pevrpc_base; para2:Pevrpc; para3:Tregister_rpc_proc; para4:pointer):longint;cdecl;external libevent;
function evrpc_unregister_rpc(base:Pevrpc_base; name:Pchar):longint;cdecl;external libevent;
type
  Pevhttp_connection = type Pointer;

function evrpc_make_request(ctx:Pevrpc_request_wrapper):longint;cdecl;external libevent;
function evrpc_pool_new(base:Pevent_base):Pevrpc_pool;cdecl;external libevent;
procedure evrpc_pool_free(pool:Pevrpc_pool);cdecl;external libevent;
procedure evrpc_pool_add_connection(pool:Pevrpc_pool; evcon:Pevhttp_connection);cdecl;external libevent;
procedure evrpc_pool_remove_connection(pool:Pevrpc_pool; evcon:Pevhttp_connection);cdecl;external libevent;
procedure evrpc_pool_set_timeout(pool:Pevrpc_pool; timeout_in_secs:longint);cdecl;external libevent;
type
  TEVRPC_HOOK_TYPE =  Longint;
  Const
    EVRPC_INPUT = 0;
    EVRPC_OUTPUT = 1;

const
  INPUT = EVRPC_INPUT;  
  OUTPUT = EVRPC_OUTPUT;
type
  TEVRPC_HOOK_RESULT =  Longint;
  Const
    EVRPC_TERMINATE = -(1);
    EVRPC_CONTINUE = 0;
    EVRPC_PAUSE = 1;

function evrpc_add_hook(vbase:pointer; hook_type:TEVRPC_HOOK_TYPE; cb:function (para1:pointer; para2:Pevhttp_request; para3:Pevbuffer; para4:pointer):longint; cb_arg:pointer):pointer;cdecl;external libevent;
function evrpc_remove_hook(vbase:pointer; hook_type:TEVRPC_HOOK_TYPE; handle:pointer):longint;cdecl;external libevent;
function evrpc_resume_request(vbase:pointer; ctx:pointer; res:TEVRPC_HOOK_RESULT):longint;cdecl;external libevent;
procedure evrpc_hook_add_meta(ctx:pointer; key:Pchar; data:pointer; data_size:Tsize_t);cdecl;external libevent;
function evrpc_hook_find_meta(ctx:pointer; key:Pchar; data:Ppointer; data_size:Psize_t):longint;cdecl;external libevent;
function evrpc_hook_get_connection(ctx:pointer):Pevhttp_connection;cdecl;external libevent;
function evrpc_send_request_generic(pool:Pevrpc_pool; request:pointer; reply:pointer; cb:procedure (para1:Pevrpc_status; para2:pointer; para3:pointer; para4:pointer); cb_arg:pointer;
           rpcname:Pchar; req_marshal:procedure (para1:Pevbuffer; para2:pointer); rpl_clear:procedure (para1:pointer); rpl_unmarshal:function (para1:pointer; para2:Pevbuffer):longint):longint;cdecl;external libevent;
function evrpc_register_generic(base:Pevrpc_base; name:Pchar; callback:procedure (para1:Pevrpc_req_generic; para2:pointer); cbarg:pointer; req_new:function (para1:pointer):pointer;
           req_new_arg:pointer; req_free:procedure (para1:pointer); req_unmarshal:function (para1:pointer; para2:Pevbuffer):longint; rpl_new:function (para1:pointer):pointer; rpl_new_arg:pointer; 
           rpl_free:procedure (para1:pointer); rpl_complete:function (para1:pointer):longint; rpl_marshal:procedure (para1:Pevbuffer; para2:pointer)):longint;cdecl;external libevent;
function evrpc_request_get_pool(ctx:Pevrpc_request_wrapper):Pevrpc_pool;cdecl;external libevent;
procedure evrpc_request_set_pool(ctx:Pevrpc_request_wrapper; pool:Pevrpc_pool);cdecl;external libevent;
procedure evrpc_request_set_cb(ctx:Pevrpc_request_wrapper; cb:procedure (para1:Pevrpc_status; request:pointer; reply:pointer; arg:pointer); cb_arg:pointer);cdecl;external libevent;

// === Konventiert am: 26-8-25 19:37:58 ===


implementation



end.
