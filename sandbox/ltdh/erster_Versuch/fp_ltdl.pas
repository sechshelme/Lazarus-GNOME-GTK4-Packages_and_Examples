unit fp_ltdl;

interface


const
  {$IFDEF linux}
  libltdl = 'libltdl';
  {$ENDIF}

  {$IFDEF windows}
  libltdl = 'libltdl-7.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


// /usr/include/ltdl.h

type
  Plt_dlhandle = ^Tlt_dlhandle;
  Tlt_dlhandle = Plt__handle;

function lt_dlinit:longint;cdecl;external libltdl;
function lt_dlexit:longint;cdecl;external libltdl;
function lt_dladdsearchdir(search_dir:Pchar):longint;cdecl;external libltdl;
function lt_dlinsertsearchdir(before:Pchar; search_dir:Pchar):longint;cdecl;external libltdl;
function lt_dlsetsearchpath(search_path:Pchar):longint;cdecl;external libltdl;
function lt_dlgetsearchpath:Pchar;cdecl;external libltdl;
type
  TFileFunc = function(filename: PChar; data: Pointer): LongInt; cdecl;

function lt_dlforeachfile(search_path:Pchar; func:TFileFunc; data:pointer):longint;cdecl;external libltdl;
function lt_dladvise_init(advise:Plt_dladvise):longint;cdecl;external libltdl;
function lt_dladvise_destroy(advise:Plt_dladvise):longint;cdecl;external libltdl;
function lt_dladvise_ext(advise:Plt_dladvise):longint;cdecl;external libltdl;
function lt_dladvise_resident(advise:Plt_dladvise):longint;cdecl;external libltdl;
function lt_dladvise_local(advise:Plt_dladvise):longint;cdecl;external libltdl;
function lt_dladvise_global(advise:Plt_dladvise):longint;cdecl;external libltdl;
function lt_dladvise_preload(advise:Plt_dladvise):longint;cdecl;external libltdl;
function lt_dlopen(filename:Pchar):Tlt_dlhandle;cdecl;external libltdl;
function lt_dlopenext(filename:Pchar):Tlt_dlhandle;cdecl;external libltdl;
function lt_dlopenadvise(filename:Pchar; advise:Tlt_dladvise):Tlt_dlhandle;cdecl;external libltdl;
function lt_dlsym(handle:Tlt_dlhandle; name:Pchar):pointer;cdecl;external libltdl;
function lt_dlerror:Pchar;cdecl;external libltdl;
function lt_dlclose(handle:Tlt_dlhandle):longint;cdecl;external libltdl;
type
  Plt_dlsymlist = ^Tlt_dlsymlist;
  Tlt_dlsymlist = record
      name : Pchar;
      address : pointer;
    end;

  Tlt_dlpreload_callback_func = function (handle:Tlt_dlhandle):longint;cdecl;

function lt_dlpreload(preloaded:Plt_dlsymlist):longint;cdecl;external libltdl;
function lt_dlpreload_default(preloaded:Plt_dlsymlist):longint;cdecl;external libltdl;
function lt_dlpreload_open(originator:Pchar; func:Plt_dlpreload_callback_func):longint;cdecl;external libltdl;
const
  lt_preloaded_symbols = lt__PROGRAM__LTX_preloaded_symbols;  
  var
    lt__PROGRAM__LTX_preloaded_symbols : Plt_dlsymlist;cvar;external libltdl;

function LTDL_SET_PRELOADED_SYMBOLS : longint;

type
  Plt_dlinterface_id = ^Tlt_dlinterface_id;
  Tlt_dlinterface_id = pointer;

  Tlt_dlhandle_interface = function (handle:Tlt_dlhandle; id_string:Pchar):longint;cdecl;

function lt_dlinterface_register(id_string:Pchar; iface:Plt_dlhandle_interface):Tlt_dlinterface_id;cdecl;external libltdl;
procedure lt_dlinterface_free(key:Tlt_dlinterface_id);cdecl;external libltdl;
function lt_dlcaller_set_data(key:Tlt_dlinterface_id; handle:Tlt_dlhandle; data:pointer):pointer;cdecl;external libltdl;
function lt_dlcaller_get_data(key:Tlt_dlinterface_id; handle:Tlt_dlhandle):pointer;cdecl;external libltdl;
type
  Plt_dlinfo = ^Tlt_dlinfo;
  Tlt_dlinfo =bitpacked record
      filename : Pchar;
      name : Pchar;
      ref_count : longint;
 	is_resident:0..1;
 	is_symglobal:0..1;
 	is_symlocal:0..1;
    end;

function lt_dlgetinfo(handle:Tlt_dlhandle):Plt_dlinfo;cdecl;external libltdl;
function lt_dlhandle_iterate(iface:Tlt_dlinterface_id; place:Tlt_dlhandle):Tlt_dlhandle;cdecl;external libltdl;
function lt_dlhandle_fetch(iface:Tlt_dlinterface_id; module_name:Pchar):Tlt_dlhandle;cdecl;external libltdl;
function lt_dlhandle_map(iface:Tlt_dlinterface_id; func:function (handle:Tlt_dlhandle; data:pointer):longint; data:pointer):longint;cdecl;external libltdl;
function lt_dlmakeresident(handle:Tlt_dlhandle):longint;cdecl;external libltdl;
function lt_dlisresident(handle:Tlt_dlhandle):longint;cdecl;external libltdl;

type Tlt_ptr=Popinter;

// === Konventiert am: 8-9-25 13:57:40 ===


implementation

function LTDL_SET_PRELOADED_SYMBOLS : longint;
begin
  LTDL_SET_PRELOADED_SYMBOLS:=lt_dlpreload_default(lt_preloaded_symbols);
end;

end.
