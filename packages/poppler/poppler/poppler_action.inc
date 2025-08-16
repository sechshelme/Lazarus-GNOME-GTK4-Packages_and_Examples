{$IFDEF read_interface}


type
  PPopplerActionType = ^TPopplerActionType;
  TPopplerActionType = longint;

const
  POPPLER_ACTION_UNKNOWN = 0;
  POPPLER_ACTION_NONE = 1;
  POPPLER_ACTION_GOTO_DEST = 2;
  POPPLER_ACTION_GOTO_REMOTE = 3;
  POPPLER_ACTION_LAUNCH = 4;
  POPPLER_ACTION_URI = 5;
  POPPLER_ACTION_NAMED = 6;
  POPPLER_ACTION_MOVIE = 7;
  POPPLER_ACTION_RENDITION = 8;
  POPPLER_ACTION_OCG_STATE = 9;
  POPPLER_ACTION_JAVASCRIPT = 10;
  POPPLER_ACTION_RESET_FORM = 11;

type
  PPopplerDestType = ^TPopplerDestType;
  TPopplerDestType = longint;

const
  POPPLER_DEST_UNKNOWN = 0;
  POPPLER_DEST_XYZ = 1;
  POPPLER_DEST_FIT = 2;
  POPPLER_DEST_FITH = 3;
  POPPLER_DEST_FITV = 4;
  POPPLER_DEST_FITR = 5;
  POPPLER_DEST_FITB = 6;
  POPPLER_DEST_FITBH = 7;
  POPPLER_DEST_FITBV = 8;
  POPPLER_DEST_NAMED = 9;

type
  PPopplerActionMovieOperation = ^TPopplerActionMovieOperation;
  TPopplerActionMovieOperation = longint;

const
  POPPLER_ACTION_MOVIE_PLAY = 0;
  POPPLER_ACTION_MOVIE_PAUSE = 1;
  POPPLER_ACTION_MOVIE_RESUME = 2;
  POPPLER_ACTION_MOVIE_STOP = 3;

type
  PPopplerActionLayerAction = ^TPopplerActionLayerAction;
  TPopplerActionLayerAction = longint;

const
  POPPLER_ACTION_LAYER_ON = 0;
  POPPLER_ACTION_LAYER_OFF = 1;
  POPPLER_ACTION_LAYER_TOGGLE = 2;

type
  TPopplerDest = bitpacked record
    _type: TPopplerDestType;
    page_num: longint;
    left: Tdouble;
    bottom: Tdouble;
    right: Tdouble;
    top: Tdouble;
    zoom: Tdouble;
    named_dest: Pgchar;
    change_left: 0..1;
    change_top: 0..1;
    change_zoom: 0..1;
  end;
  PPopplerDest = ^TPopplerDest;

type
  TPopplerActionLayer = record
    action: TPopplerActionLayerAction;
    layers: PGList;
  end;
  PPopplerActionLayer = ^TPopplerActionLayer;

  TPopplerActionAny = record
    _type: TPopplerActionType;
    title: Pgchar;
  end;
  PPopplerActionAny = ^TPopplerActionAny;

  TPopplerActionGotoDest = record
    _type: TPopplerActionType;
    title: Pgchar;
    dest: PPopplerDest;
  end;
  PPopplerActionGotoDest = ^TPopplerActionGotoDest;

  TPopplerActionGotoRemote = record
    _type: TPopplerActionType;
    title: Pgchar;
    file_name: Pgchar;
    dest: PPopplerDest;
  end;
  PPopplerActionGotoRemote = ^TPopplerActionGotoRemote;

  TPopplerActionLaunch = record
    _type: TPopplerActionType;
    title: Pgchar;
    file_name: Pgchar;
    params: Pgchar;
  end;
  PPopplerActionLaunch = ^TPopplerActionLaunch;

  TPopplerActionUri = record
    _type: TPopplerActionType;
    title: Pgchar;
    uri: pchar;
  end;
  PPopplerActionUri = ^TPopplerActionUri;

  TPopplerActionNamed = record
    _type: TPopplerActionType;
    title: Pgchar;
    named_dest: Pgchar;
  end;
  PPopplerActionNamed = ^TPopplerActionNamed;

  TPopplerActionMovie = record
    _type: TPopplerActionType;
    title: Pgchar;
    operation: TPopplerActionMovieOperation;
    movie: PPopplerMovie;
  end;
  PPopplerActionMovie = ^TPopplerActionMovie;

  TPopplerActionRendition = record
    _type: TPopplerActionType;
    title: Pgchar;
    op: Tgint;
    media: PPopplerMedia;
  end;
  PPopplerActionRendition = ^TPopplerActionRendition;

  TPopplerActionOCGState = record
    _type: TPopplerActionType;
    title: Pgchar;
    state_list: PGList;
  end;
  PPopplerActionOCGState = ^TPopplerActionOCGState;

  TPopplerActionJavascript = record
    _type: TPopplerActionType;
    title: Pgchar;
    script: Pgchar;
  end;
  PPopplerActionJavascript = ^TPopplerActionJavascript;

  PPopplerActionResetForm = ^TPopplerActionResetForm;

  TPopplerActionResetForm = record
    _type: TPopplerActionType;
    title: Pgchar;
    fields: PGList;
    exclude: Tgboolean;
  end;

  TPopplerAction = record
    case longint of
      0: (_type: TPopplerActionType);
      1: (any: TPopplerActionAny);
      2: (goto_dest: TPopplerActionGotoDest);
      3: (goto_remote: TPopplerActionGotoRemote);
      4: (launch: TPopplerActionLaunch);
      5: (uri: TPopplerActionUri);
      6: (named: TPopplerActionNamed);
      7: (movie: TPopplerActionMovie);
      8: (rendition: TPopplerActionRendition);
      9: (ocg_state: TPopplerActionOCGState);
      10: (javascript: TPopplerActionJavascript);
      11: (reset_form: TPopplerActionResetForm);
  end;
  PPopplerAction = ^TPopplerAction;


function POPPLER_TYPE_ACTION: TGType;
function POPPLER_ACTION(obj: Pointer): PPopplerAction;

function poppler_action_get_type: TGType; cdecl; external libpoppler_glib;
procedure poppler_action_free(action: PPopplerAction); cdecl; external libpoppler_glib;
function poppler_action_copy(action: PPopplerAction): PPopplerAction; cdecl; external libpoppler_glib;

function POPPLER_TYPE_DEST: TGType;

function poppler_dest_get_type: TGType; cdecl; external libpoppler_glib;
procedure poppler_dest_free(dest: PPopplerDest); cdecl; external libpoppler_glib;
function poppler_dest_copy(dest: PPopplerDest): PPopplerDest; cdecl; external libpoppler_glib;
function poppler_named_dest_from_bytestring(data: Pguint8; length: Tgsize): pchar; cdecl; external libpoppler_glib;
function poppler_named_dest_to_bytestring(name: pchar; length: Pgsize): Pguint8; cdecl; external libpoppler_glib;

// === Konventiert am: 15-8-25 16:58:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function POPPLER_TYPE_ACTION: TGType;
begin
  POPPLER_TYPE_ACTION := poppler_action_get_type;
end;

function POPPLER_ACTION(obj: Pointer): PPopplerAction;
begin
  Result := PPopplerAction(g_type_check_instance_cast(obj, POPPLER_TYPE_ACTION));
end;

function POPPLER_TYPE_DEST: TGType;
begin
  POPPLER_TYPE_DEST := poppler_dest_get_type;
end;


{$ENDIF read_implementation}
