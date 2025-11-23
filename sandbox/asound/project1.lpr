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
  rawmidi,                 // conf, global
  ump,                     // global, rawmidi
  timer,                   // global, conf
  hwdep,
  control,                 // conf, global, hwdep, pcm, rawmidi, ump
  mixer,                   // control, pcm
  seq_event,
  seq,                     // conf, timer, seq_event
  seqmid,                  // seq, seq_event
  seq_midi_event,          // seq_event



  control_external,
  //control_plugin,
  //mixer_abst,
  //pcm_external,
  //pcm_extplug,
  //pcm_ioplug,
  //pcm_plugin,
  //pcm_rate,
  //seq_midi_event,
  //ump_msg,
  //use_case,

  // _dlsym_seq_001;   ???????????''

  fp_asound;

  function snd_pcm_sw_params_set_xfer_align(pcm: Pointer; params: Pointer; val: integer): longint; cdecl; external libasound;



  procedure main;
  begin
    snd_ctl_ump_next_device(nil,nil);
    snd_ctl_hwdep_next_device(nil,nil);
    snd_pcm_sw_params_set_xfer_align(nil, nil, 0);
    //     snd_pcm_sw_params_set_tstamp_mode(nil,nil,0);
    //  snd_pcm_hw_params_get_access(nil,nil);
  end;

begin
  main;
end.
