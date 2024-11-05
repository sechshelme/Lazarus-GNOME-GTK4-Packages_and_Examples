/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstPollFD = ^TGstPollFD;

  TGstPollFD = record
    fd: longint;
    idx: Tgint;
  end;

  TGstPoll = record
  end;
  PGstPoll = ^TGstPoll;

function gst_poll_new(controllable: Tgboolean): PGstPoll; cdecl; external libgstreamer;
function gst_poll_new_timer: PGstPoll; cdecl; external libgstreamer;
procedure gst_poll_free(set_: PGstPoll); cdecl; external libgstreamer;
procedure gst_poll_get_read_gpollfd(set_: PGstPoll; fd: PGPollFD); cdecl; external libgstreamer;
procedure gst_poll_fd_init(fd: PGstPollFD); cdecl; external libgstreamer;
function gst_poll_add_fd(set_: PGstPoll; fd: PGstPollFD): Tgboolean; cdecl; external libgstreamer;
function gst_poll_remove_fd(set_: PGstPoll; fd: PGstPollFD): Tgboolean; cdecl; external libgstreamer;
function gst_poll_fd_ctl_write(set_: PGstPoll; fd: PGstPollFD; active: Tgboolean): Tgboolean; cdecl; external libgstreamer;
function gst_poll_fd_ctl_read(set_: PGstPoll; fd: PGstPollFD; active: Tgboolean): Tgboolean; cdecl; external libgstreamer;
function gst_poll_fd_ctl_pri(set_: PGstPoll; fd: PGstPollFD; active: Tgboolean): Tgboolean; cdecl; external libgstreamer;
procedure gst_poll_fd_ignored(set_: PGstPoll; fd: PGstPollFD); cdecl; external libgstreamer;
function gst_poll_fd_has_closed(set_: PGstPoll; fd: PGstPollFD): Tgboolean; cdecl; external libgstreamer;
function gst_poll_fd_has_error(set_: PGstPoll; fd: PGstPollFD): Tgboolean; cdecl; external libgstreamer;
function gst_poll_fd_can_read(set_: PGstPoll; fd: PGstPollFD): Tgboolean; cdecl; external libgstreamer;
function gst_poll_fd_can_write(set_: PGstPoll; fd: PGstPollFD): Tgboolean; cdecl; external libgstreamer;
function gst_poll_fd_has_pri(set_: PGstPoll; fd: PGstPollFD): Tgboolean; cdecl; external libgstreamer;
function gst_poll_wait(set_: PGstPoll; timeout: TGstClockTime): Tgint; cdecl; external libgstreamer;
function gst_poll_set_controllable(set_: PGstPoll; controllable: Tgboolean): Tgboolean; cdecl; external libgstreamer;
procedure gst_poll_restart(set_: PGstPoll); cdecl; external libgstreamer;
procedure gst_poll_set_flushing(set_: PGstPoll; flushing: Tgboolean); cdecl; external libgstreamer;
function gst_poll_write_control(set_: PGstPoll): Tgboolean; cdecl; external libgstreamer;
function gst_poll_read_control(set_: PGstPoll): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 17-9-24 17:52:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
