

{$include asound/asoundef.inc}
{$include asound/version.inc}
{$include asound/global.inc}
{$include asound/input.inc}
{$include asound/output.inc}
{$include asound/error.inc}
{$include asound/conf.inc}                    // input, output
{$include asound/pcm.inc}                     // conf, global, output
{$include asound/rawmidi.inc}                 // conf, global
{$include asound/ump.inc}                     // global, rawmidi
{$include asound/timer.inc}                   // global, conf
{$include asound/hwdep.inc}
{$include asound/control.inc}                 // conf, global, hwdep, pcm, rawmidi, ump
{$include asound/mixer.inc}                   // control, pcm
{$include asound/seq_event.inc}
{$include asound/seq.inc}                     // conf, timer, seq_event
{$include asound/seqmid.inc}                  // seq, seq_event
{$include asound/seq_midi_event.inc}          // seq_event
{$include asound/control_external.inc}
{$include asound/control_plugin.inc}
{$include asound/mixer_abst.inc}
{$include asound/pcm_external.inc}
{$include asound/pcm_extplug.inc}
{$include asound/pcm_ioplug.inc}
{$include asound/pcm_plugin.inc}
{$include asound/pcm_rate.inc}
{$include asound/ump_msg.inc}
{$include asound/use_case.inc}

