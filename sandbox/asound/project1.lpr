program project1;

//  long durchsuchen ????????????

//#include <alsa/asoundef.h>
//#include <alsa/version.h>
//#include <alsa/global.h>
//#include <alsa/input.h>
//#include <alsa/output.h>
//#include <alsa/error.h>
//#include <alsa/conf.h>
//#include <alsa/pcm.h>
//#include <alsa/rawmidi.h>
//#include <alsa/ump.h>
//#include <alsa/timer.h>
//#include <alsa/hwdep.h>
//#include <alsa/control.h>
//#include <alsa/mixer.h>
//#include <alsa/seq_event.h>
//#include <alsa/seq.h>
//#include <alsa/seqmid.h>
//#include <alsa/seq_midi_event.h>

uses
  asoundef,
  version,
  global,
  input,
  output,
  error,
  conf,                    // input, output
  pcm,                     // conf, global, output


  //control,
  //control_external,
  //control_plugin,
  //hwdep,
  //mixer,
  //mixer_abst,
  //pcm_external,
  //pcm_extplug,
  //pcm_ioplug,
  //pcm_plugin,
  //pcm_rate,
  //rawmidi,
  //seq,
  //seq_event,
  //seqmid,
  //seq_midi_event,
  //timer,
  //ump,
  //ump_msg,
  //use_case,

  fp_asound;

function snd_pcm_sw_params_set_xfer_align(pcm:Pointer; params:Pointer; val:Integer):longint;cdecl;external libasound;



procedure main;
begin
     snd_pcm_sw_params_set_xfer_align(nil,nil,0);
//     snd_pcm_sw_params_set_tstamp_mode(nil,nil,0);
//  snd_pcm_hw_params_get_access(nil,nil);
end;

begin
     main;
end.
