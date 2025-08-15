unit poppler_movie;

interface

uses
  fp_glib2, fp_cairo, fp_poppler_glib, poppler;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPopplerMoviePlayMode = ^TPopplerMoviePlayMode;
  TPopplerMoviePlayMode = longint;

const
  POPPLER_MOVIE_PLAY_MODE_ONCE = 0;
  POPPLER_MOVIE_PLAY_MODE_OPEN = 1;
  POPPLER_MOVIE_PLAY_MODE_REPEAT = 2;
  POPPLER_MOVIE_PLAY_MODE_PALINDROME = 3;

function poppler_movie_get_type: TGType; cdecl; external poppler_glib;
function poppler_movie_get_filename(poppler_movie: PPopplerMovie): Pgchar; cdecl; external poppler_glib;
function poppler_movie_need_poster(poppler_movie: PPopplerMovie): Tgboolean; cdecl; external poppler_glib;
function poppler_movie_show_controls(poppler_movie: PPopplerMovie): Tgboolean; cdecl; external poppler_glib;
function poppler_movie_get_play_mode(poppler_movie: PPopplerMovie): TPopplerMoviePlayMode; cdecl; external poppler_glib;
function poppler_movie_is_synchronous(poppler_movie: PPopplerMovie): Tgboolean; cdecl; external poppler_glib;
function poppler_movie_get_volume(poppler_movie: PPopplerMovie): Tgdouble; cdecl; external poppler_glib;
function poppler_movie_get_rate(poppler_movie: PPopplerMovie): Tgdouble; cdecl; external poppler_glib;
function poppler_movie_get_rotation_angle(poppler_movie: PPopplerMovie): Tgushort; cdecl; external poppler_glib;
function poppler_movie_get_start(poppler_movie: PPopplerMovie): Tguint64; cdecl; external poppler_glib;
function poppler_movie_get_duration(poppler_movie: PPopplerMovie): Tguint64; cdecl; external poppler_glib;
procedure poppler_movie_get_aspect(poppler_movie: PPopplerMovie; width: Pgint; height: Pgint); cdecl; external poppler_glib;

// === Konventiert am: 15-8-25 16:55:20 ===

function POPPLER_TYPE_MOVIE: TGType;
function POPPLER_MOVIE(obj: Pointer): PPopplerMovie;
function POPPLER_IS_MOVIE(obj: Pointer): Tgboolean;

implementation

function POPPLER_TYPE_MOVIE: TGType;
begin
  POPPLER_TYPE_MOVIE := poppler_movie_get_type;
end;

function POPPLER_MOVIE(obj: Pointer): PPopplerMovie;
begin
  Result := PPopplerMovie(g_type_check_instance_cast(obj, POPPLER_TYPE_MOVIE));
end;

function POPPLER_IS_MOVIE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_MOVIE);
end;



end.
