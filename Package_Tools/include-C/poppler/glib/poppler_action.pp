
unit poppler_action;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler_action.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler_action.h
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
Pgchar  = ^gchar;
PGList  = ^GList;
Pgsize  = ^gsize;
Pguint8  = ^guint8;
PPopplerAction  = ^PopplerAction;
PPopplerActionAny  = ^PopplerActionAny;
PPopplerActionGotoDest  = ^PopplerActionGotoDest;
PPopplerActionGotoRemote  = ^PopplerActionGotoRemote;
PPopplerActionJavascript  = ^PopplerActionJavascript;
PPopplerActionLaunch  = ^PopplerActionLaunch;
PPopplerActionLayer  = ^PopplerActionLayer;
PPopplerActionLayerAction  = ^PopplerActionLayerAction;
PPopplerActionMovie  = ^PopplerActionMovie;
PPopplerActionMovieOperation  = ^PopplerActionMovieOperation;
PPopplerActionNamed  = ^PopplerActionNamed;
PPopplerActionOCGState  = ^PopplerActionOCGState;
PPopplerActionRendition  = ^PopplerActionRendition;
PPopplerActionResetForm  = ^PopplerActionResetForm;
PPopplerActionType  = ^PopplerActionType;
PPopplerActionUri  = ^PopplerActionUri;
PPopplerDest  = ^PopplerDest;
PPopplerDestType  = ^PopplerDestType;
PPopplerMedia  = ^PopplerMedia;
PPopplerMovie  = ^PopplerMovie;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler-action.h: glib interface to poppler
 * Copyright (C) 2004, Red Hat, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __POPPLER_ACTION_H__}
{$define __POPPLER_ACTION_H__}
{$include <glib-object.h>}
{$include "poppler.h"}
{*
 * PopplerActionType:
 * @POPPLER_ACTION_UNKNOWN: unknown action
 * @POPPLER_ACTION_NONE: no action specified
 * @POPPLER_ACTION_GOTO_DEST: go to destination
 * @POPPLER_ACTION_GOTO_REMOTE: go to destination in another document
 * @POPPLER_ACTION_LAUNCH: launch app (or open document)
 * @POPPLER_ACTION_URI: URI
 * @POPPLER_ACTION_NAMED: predefined action
 * @POPPLER_ACTION_MOVIE: play movies. Since 0.14
 * @POPPLER_ACTION_RENDITION: play multimedia content. Since 0.14
 * @POPPLER_ACTION_OCG_STATE: state of layer. Since 0.14
 * @POPPLER_ACTION_JAVASCRIPT: Javascript. Since 0.18
 * @POPPLER_ACTION_RESET_FORM: resets form. Since 0.90
 *
 * Action types
  }
{ unknown action  }
{ no action specified  }
{ go to destination  }
{ go to destination in new file  }
{ launch app (or open document)  }
{ URI  }
{ named action }
{ movie action  }
{ rendition action  }
{ Set-OCG-State action  }
{ Javascript action  }
{ ResetForm action  }
type
  PPopplerActionType = ^TPopplerActionType;
  TPopplerActionType =  Longint;
  Const
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
;
{*
 * PopplerDestType:
 * @POPPLER_DEST_UNKNOWN: unknown destination
 * @POPPLER_DEST_XYZ: go to page with coordinates (left, top)
 * positioned at the upper-left corner of the window and the contents of
 * the page magnified by the factor zoom
 * @POPPLER_DEST_FIT: go to page with its contents magnified just
 * enough to fit the entire page within the window both horizontally and
 * vertically
 * @POPPLER_DEST_FITH: go to page with the vertical coordinate top
 * positioned at the top edge of the window and the contents of the page
 * magnified just enough to fit the entire width of the page within the window
 * @POPPLER_DEST_FITV: go to page with the horizontal coordinate
 * left positioned at the left edge of the window and the contents of the
 * page magnified just enough to fit the entire height of the page within the window
 * @POPPLER_DEST_FITR: go to page with its contents magnified just
 * enough to fit the rectangle specified by the coordinates left, bottom,
 * right, and top entirely within the window both horizontally and vertically
 * @POPPLER_DEST_FITB: go to page with its contents magnified just enough to fit
 * its bounding box entirely within the window both horizontally and vertically
 * @POPPLER_DEST_FITBH: go to page with the vertical
 * coordinate top positioned at the top edge of the window and the
 * contents of the page magnified just enough to fit the entire width of its
 * bounding box within the window
 * @POPPLER_DEST_FITBV: go to page with the horizontal
 * coordinate left positioned at the left edge of the window and the
 * contents of the page magnified just enough to fit the entire height of its
 * bounding box within the window
 * @POPPLER_DEST_NAMED: got to page specified by a name. See poppler_document_find_dest()
 *
 * Destination types
  }
type
  PPopplerDestType = ^TPopplerDestType;
  TPopplerDestType =  Longint;
  Const
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
;
{*
 * PopplerActionMovieOperation:
 * @POPPLER_ACTION_MOVIE_PLAY: play movie
 * @POPPLER_ACTION_MOVIE_PAUSE: pause playing movie
 * @POPPLER_ACTION_MOVIE_RESUME: resume paused movie
 * @POPPLER_ACTION_MOVIE_STOP: stop playing movie
 *
 * Movie operations
 *
 * Since: 0.14
  }
type
  PPopplerActionMovieOperation = ^TPopplerActionMovieOperation;
  TPopplerActionMovieOperation =  Longint;
  Const
    POPPLER_ACTION_MOVIE_PLAY = 0;
    POPPLER_ACTION_MOVIE_PAUSE = 1;
    POPPLER_ACTION_MOVIE_RESUME = 2;
    POPPLER_ACTION_MOVIE_STOP = 3;
;
{*
 * PopplerActionLayerAction:
 * @POPPLER_ACTION_LAYER_ON: set layer visibility on
 * @POPPLER_ACTION_LAYER_OFF: set layer visibility off
 * @POPPLER_ACTION_LAYER_TOGGLE: reverse the layer visibility state
 *
 * Layer actions
 *
 * Since: 0.14
  }
type
  PPopplerActionLayerAction = ^TPopplerActionLayerAction;
  TPopplerActionLayerAction =  Longint;
  Const
    POPPLER_ACTION_LAYER_ON = 0;
    POPPLER_ACTION_LAYER_OFF = 1;
    POPPLER_ACTION_LAYER_TOGGLE = 2;
;
{ Define the PopplerAction types  }
type
{*
 * PopplerDest:
 * @type: type of destination
 * @page_num: page number
 * @left: left coordinate
 * @bottom: bottom coordinate
 * @right: right coordinate
 * @top: top coordinate
 * @zoom: scale factor
 * @named_dest: name of the destination (#POPPLER_DEST_NAMED only)
 * @change_left: whether left coordinate should be changed
 * @change_top: whether top coordinate should be changed
 * @change_zoom: whether scale factor should be changed
 *
 * Data structure for holding a destination
 *
 * Note that @named_dest is the string representation of the named
 * destination. This is the right form to pass to poppler functions,
 * e.g. poppler_document_find_dest(), but to get the destination as
 * it appears in the PDF itself, you need to convert it to a bytestring
 * with poppler_named_dest_to_bytestring() first.
 * Also note that @named_dest does not have a defined encoding and
 * is not in a form suitable to be displayed to the user.
  }
  PPopplerDest = ^TPopplerDest;
  TPopplerDest = record
      _type : TPopplerDestType;
      page_num : longint;
      left : Tdouble;
      bottom : Tdouble;
      right : Tdouble;
      top : Tdouble;
      zoom : Tdouble;
      named_dest : Pgchar;
      flag0 : word;
    end;


const
  bm_TPopplerDest_change_left = $1;
  bp_TPopplerDest_change_left = 0;
  bm_TPopplerDest_change_top = $2;
  bp_TPopplerDest_change_top = 1;
  bm_TPopplerDest_change_zoom = $4;
  bp_TPopplerDest_change_zoom = 2;

function change_left(var a : TPopplerDest) : Tguint;
procedure set_change_left(var a : TPopplerDest; __change_left : Tguint);
function change_top(var a : TPopplerDest) : Tguint;
procedure set_change_top(var a : TPopplerDest; __change_top : Tguint);
function change_zoom(var a : TPopplerDest) : Tguint;
procedure set_change_zoom(var a : TPopplerDest; __change_zoom : Tguint);
{*
 * PopplerActionLayer:
 * @action: a #PopplerActionLayerAction
 * @layers: (element-type PopplerLayer): list of #PopplerLayer<!-- -->s
 *
 * Action to perform over a list of layers
  }
type
  PPopplerActionLayer = ^TPopplerActionLayer;
  TPopplerActionLayer = record
      action : TPopplerActionLayerAction;
      layers : PGList;
    end;

{*
 * PopplerActionAny:
 * @type: action type
 * @title: action title
 *
 * Fields common to all #PopplerAction<!-- -->s
  }
  PPopplerActionAny = ^TPopplerActionAny;
  TPopplerActionAny = record
      _type : TPopplerActionType;
      title : Pgchar;
    end;

{*
 * PopplerActionGotoDest:
 * @type: action type (%POPPLER_ACTION_GOTO_DEST)
 * @title: action title
 * @dest: destination
 *
 * Go to destination
  }
  PPopplerActionGotoDest = ^TPopplerActionGotoDest;
  TPopplerActionGotoDest = record
      _type : TPopplerActionType;
      title : Pgchar;
      dest : PPopplerDest;
    end;

{*
 * PopplerActionGotoRemote:
 * @type: action type (%POPPLER_ACTION_GOTO_REMOTE)
 * @title: action title
 * @file_name: file name
 * @dest: destination
 *
 * Go to destination in another document
  }
  PPopplerActionGotoRemote = ^TPopplerActionGotoRemote;
  TPopplerActionGotoRemote = record
      _type : TPopplerActionType;
      title : Pgchar;
      file_name : Pgchar;
      dest : PPopplerDest;
    end;

{*
 * PopplerActionLaunch:
 * @type: action type (%POPPLER_ACTION_LAUNCH)
 * @title: action title
 * @file_name: file name
 * @params: parameters
 *
 * Launch app (or open document)
  }
  PPopplerActionLaunch = ^TPopplerActionLaunch;
  TPopplerActionLaunch = record
      _type : TPopplerActionType;
      title : Pgchar;
      file_name : Pgchar;
      params : Pgchar;
    end;

{*
 * PopplerActionUri:
 * @type: action type (%POPPLER_ACTION_URI)
 * @title: action title
 * @uri: URI
 *
 * URI
  }
  PPopplerActionUri = ^TPopplerActionUri;
  TPopplerActionUri = record
      _type : TPopplerActionType;
      title : Pgchar;
      uri : Pchar;
    end;

{*
 * PopplerActionNamed:
 * @type: action type (%POPPLER_ACTION_NAMED)
 * @title: action title
 * @named_dest: named destination
 *
 * Predefined action
  }
  PPopplerActionNamed = ^TPopplerActionNamed;
  TPopplerActionNamed = record
      _type : TPopplerActionType;
      title : Pgchar;
      named_dest : Pgchar;
    end;

{*
 * PopplerActionMovie:
 * @type: action type (%POPPLER_ACTION_MOVIE)
 * @title: action title
 * @operation: operation
 * @movie: movie
 *
 * Play movies.
 *
 * Since: 0.14
  }
  PPopplerActionMovie = ^TPopplerActionMovie;
  TPopplerActionMovie = record
      _type : TPopplerActionType;
      title : Pgchar;
      operation : TPopplerActionMovieOperation;
      movie : PPopplerMovie;
    end;

{*
 * PopplerActionRendition:
 * @type: action type (%POPPLER_ACTION_RENDITION)
 * @title: action title
 * @op: operation
 * @media: media
 *
 * Play multimedia content.
 *
 * Since: 0.14
  }
  PPopplerActionRendition = ^TPopplerActionRendition;
  TPopplerActionRendition = record
      _type : TPopplerActionType;
      title : Pgchar;
      op : Tgint;
      media : PPopplerMedia;
    end;

{*
 * PopplerActionOCGState:
 * @type: action type (%POPPLER_ACTION_OCG_STATE)
 * @title: action title
 * @state_list: (element-type PopplerActionLayer): list of #PopplerActionLayer<!-- -->s
 *
 * State of layer.
 *
 * Since: 0.14
  }
  PPopplerActionOCGState = ^TPopplerActionOCGState;
  TPopplerActionOCGState = record
      _type : TPopplerActionType;
      title : Pgchar;
      state_list : PGList;
    end;

{*
 * PopplerActionJavascript:
 * @type: action type (%POPPLER_ACTION_JAVASCRIPT)
 * @title: action title
 * @script: javascript
 *
 * Javascript.
 *
 * Since: 0.18
  }
  PPopplerActionJavascript = ^TPopplerActionJavascript;
  TPopplerActionJavascript = record
      _type : TPopplerActionType;
      title : Pgchar;
      script : Pgchar;
    end;

{*
 * PopplerActionResetForm:
 * @type: action type (%POPPLER_ACTION_RESET_FORM)
 * @title: action title
 * @fields: (element-type utf8) (nullable): list of field names to
 *   reset / retain
 * @exclude: whether to reset all but the listed fields
 *
 * Resets some or all fields within a PDF form.
 *
 * The default behavior resets only the list of @fields, but setting
 * @exclude to %TRUE will cause the action to reset all fields but those
 * listed. Providing an empty list of fields resets the entire form.
 *
 * Since: 0.90
  }
  PPopplerActionResetForm = ^TPopplerActionResetForm;
  TPopplerActionResetForm = record
      _type : TPopplerActionType;
      title : Pgchar;
      fields : PGList;
      exclude : Tgboolean;
    end;

{*
 * PopplerAction:
 *
 * A generic wrapper for actions that exposes only #PopplerActionType.
  }
  PPopplerAction = ^TPopplerAction;
  TPopplerAction = record
      case longint of
        0 : ( _type : TPopplerActionType );
        1 : ( any : TPopplerActionAny );
        2 : ( goto_dest : TPopplerActionGotoDest );
        3 : ( goto_remote : TPopplerActionGotoRemote );
        4 : ( launch : TPopplerActionLaunch );
        5 : ( uri : TPopplerActionUri );
        6 : ( named : TPopplerActionNamed );
        7 : ( movie : TPopplerActionMovie );
        8 : ( rendition : TPopplerActionRendition );
        9 : ( ocg_state : TPopplerActionOCGState );
        10 : ( javascript : TPopplerActionJavascript );
        11 : ( reset_form : TPopplerActionResetForm );
      end;


{ was #define dname def_expr }
function POPPLER_TYPE_ACTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ACTION(obj : longint) : longint;

function poppler_action_get_type:TGType;cdecl;external;
procedure poppler_action_free(action:PPopplerAction);cdecl;external;
function poppler_action_copy(action:PPopplerAction):PPopplerAction;cdecl;external;
{ was #define dname def_expr }
function POPPLER_TYPE_DEST : longint; { return type might be wrong }

function poppler_dest_get_type:TGType;cdecl;external;
procedure poppler_dest_free(dest:PPopplerDest);cdecl;external;
function poppler_dest_copy(dest:PPopplerDest):PPopplerDest;cdecl;external;
(* Const before type ignored *)
function poppler_named_dest_from_bytestring(data:Pguint8; length:Tgsize):Pchar;cdecl;external;
(* Const before type ignored *)
function poppler_named_dest_to_bytestring(name:Pchar; length:Pgsize):Pguint8;cdecl;external;
{$endif}
{ __POPPLER_GLIB_H__  }

implementation

function change_left(var a : TPopplerDest) : Tguint;
begin
  change_left:=(a.flag0 and bm_TPopplerDest_change_left) shr bp_TPopplerDest_change_left;
end;

procedure set_change_left(var a : TPopplerDest; __change_left : Tguint);
begin
  a.flag0:=a.flag0 or ((__change_left shl bp_TPopplerDest_change_left) and bm_TPopplerDest_change_left);
end;

function change_top(var a : TPopplerDest) : Tguint;
begin
  change_top:=(a.flag0 and bm_TPopplerDest_change_top) shr bp_TPopplerDest_change_top;
end;

procedure set_change_top(var a : TPopplerDest; __change_top : Tguint);
begin
  a.flag0:=a.flag0 or ((__change_top shl bp_TPopplerDest_change_top) and bm_TPopplerDest_change_top);
end;

function change_zoom(var a : TPopplerDest) : Tguint;
begin
  change_zoom:=(a.flag0 and bm_TPopplerDest_change_zoom) shr bp_TPopplerDest_change_zoom;
end;

procedure set_change_zoom(var a : TPopplerDest; __change_zoom : Tguint);
begin
  a.flag0:=a.flag0 or ((__change_zoom shl bp_TPopplerDest_change_zoom) and bm_TPopplerDest_change_zoom);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_ACTION : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ACTION:=poppler_action_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ACTION(obj : longint) : longint;
begin
  POPPLER_ACTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ACTION,PopplerAction);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_DEST : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_DEST:=poppler_dest_get_type;
  end;


end.
