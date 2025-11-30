unit lv2;

interface

uses
  fp_lv2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  //#define LV2_CORE_URI    "http://lv2plug.in/ns/lv2core"  ///< http://lv2plug.in/ns/lv2core
  //#define LV2_CORE_PREFIX LV2_CORE_URI "#"                ///< http://lv2plug.in/ns/lv2core#
const
  LV2_CORE__AllpassPlugin = 'http://lv2plug.in/ns/lv2core#AllpassPlugin';
  LV2_CORE__AmplifierPlugin = 'http://lv2plug.in/ns/lv2core#AmplifierPlugin';
  LV2_CORE__AnalyserPlugin = 'http://lv2plug.in/ns/lv2core#AnalyserPlugin';
  LV2_CORE__AudioPort = 'http://lv2plug.in/ns/lv2core#AudioPort';
  LV2_CORE__BandpassPlugin = 'http://lv2plug.in/ns/lv2core#BandpassPlugin';
  LV2_CORE__CVPort = 'http://lv2plug.in/ns/lv2core#CVPort';
  LV2_CORE__ChorusPlugin = 'http://lv2plug.in/ns/lv2core#ChorusPlugin';
  LV2_CORE__CombPlugin = 'http://lv2plug.in/ns/lv2core#CombPlugin';
  LV2_CORE__CompressorPlugin = 'http://lv2plug.in/ns/lv2core#CompressorPlugin';
  LV2_CORE__ConstantPlugin = 'http://lv2plug.in/ns/lv2core#ConstantPlugin';
  LV2_CORE__ControlPort = 'http://lv2plug.in/ns/lv2core#ControlPort';
  LV2_CORE__ConverterPlugin = 'http://lv2plug.in/ns/lv2core#ConverterPlugin';
  LV2_CORE__DelayPlugin = 'http://lv2plug.in/ns/lv2core#DelayPlugin';
  LV2_CORE__DistortionPlugin = 'http://lv2plug.in/ns/lv2core#DistortionPlugin';
  LV2_CORE__DynamicsPlugin = 'http://lv2plug.in/ns/lv2core#DynamicsPlugin';
  LV2_CORE__EQPlugin = 'http://lv2plug.in/ns/lv2core#EQPlugin';
  LV2_CORE__EnvelopePlugin = 'http://lv2plug.in/ns/lv2core#EnvelopePlugin';
  LV2_CORE__ExpanderPlugin = 'http://lv2plug.in/ns/lv2core#ExpanderPlugin';
  LV2_CORE__ExtensionData = 'http://lv2plug.in/ns/lv2core#ExtensionData';
  LV2_CORE__Feature = 'http://lv2plug.in/ns/lv2core#Feature';
  LV2_CORE__FilterPlugin = 'http://lv2plug.in/ns/lv2core#FilterPlugin';
  LV2_CORE__FlangerPlugin = 'http://lv2plug.in/ns/lv2core#FlangerPlugin';
  LV2_CORE__FunctionPlugin = 'http://lv2plug.in/ns/lv2core#FunctionPlugin';
  LV2_CORE__GatePlugin = 'http://lv2plug.in/ns/lv2core#GatePlugin';
  LV2_CORE__GeneratorPlugin = 'http://lv2plug.in/ns/lv2core#GeneratorPlugin';
  LV2_CORE__HighpassPlugin = 'http://lv2plug.in/ns/lv2core#HighpassPlugin';
  LV2_CORE__InputPort = 'http://lv2plug.in/ns/lv2core#InputPort';
  LV2_CORE__InstrumentPlugin = 'http://lv2plug.in/ns/lv2core#InstrumentPlugin';
  LV2_CORE__LimiterPlugin = 'http://lv2plug.in/ns/lv2core#LimiterPlugin';
  LV2_CORE__LowpassPlugin = 'http://lv2plug.in/ns/lv2core#LowpassPlugin';
  LV2_CORE__MixerPlugin = 'http://lv2plug.in/ns/lv2core#MixerPlugin';
  LV2_CORE__ModulatorPlugin = 'http://lv2plug.in/ns/lv2core#ModulatorPlugin';
  LV2_CORE__MultiEQPlugin = 'http://lv2plug.in/ns/lv2core#MultiEQPlugin';
  LV2_CORE__OscillatorPlugin = 'http://lv2plug.in/ns/lv2core#OscillatorPlugin';
  LV2_CORE__OutputPort = 'http://lv2plug.in/ns/lv2core#OutputPort';
  LV2_CORE__ParaEQPlugin = 'http://lv2plug.in/ns/lv2core#ParaEQPlugin';
  LV2_CORE__PhaserPlugin = 'http://lv2plug.in/ns/lv2core#PhaserPlugin';
  LV2_CORE__PitchPlugin = 'http://lv2plug.in/ns/lv2core#PitchPlugin';
  LV2_CORE__Plugin = 'http://lv2plug.in/ns/lv2core#Plugin';
  LV2_CORE__PluginBase = 'http://lv2plug.in/ns/lv2core#PluginBase';
  LV2_CORE__Point = 'http://lv2plug.in/ns/lv2core#Point';
  LV2_CORE__Port = 'http://lv2plug.in/ns/lv2core#Port';
  LV2_CORE__PortProperty = 'http://lv2plug.in/ns/lv2core#PortProperty';
  LV2_CORE__Resource = 'http://lv2plug.in/ns/lv2core#Resource';
  LV2_CORE__ReverbPlugin = 'http://lv2plug.in/ns/lv2core#ReverbPlugin';
  LV2_CORE__ScalePoint = 'http://lv2plug.in/ns/lv2core#ScalePoint';
  LV2_CORE__SimulatorPlugin = 'http://lv2plug.in/ns/lv2core#SimulatorPlugin';
  LV2_CORE__SpatialPlugin = 'http://lv2plug.in/ns/lv2core#SpatialPlugin';
  LV2_CORE__Specification = 'http://lv2plug.in/ns/lv2core#Specification';
  LV2_CORE__SpectralPlugin = 'http://lv2plug.in/ns/lv2core#SpectralPlugin';
  LV2_CORE__UtilityPlugin = 'http://lv2plug.in/ns/lv2core#UtilityPlugin';
  LV2_CORE__WaveshaperPlugin = 'http://lv2plug.in/ns/lv2core#WaveshaperPlugin';
  LV2_CORE__appliesTo = 'http://lv2plug.in/ns/lv2core#appliesTo';
  LV2_CORE__binary = 'http://lv2plug.in/ns/lv2core#binary';
  LV2_CORE__connectionOptional = 'http://lv2plug.in/ns/lv2core#connectionOptional';
  LV2_CORE__control = 'http://lv2plug.in/ns/lv2core#control';
  LV2_CORE__default = 'http://lv2plug.in/ns/lv2core#default';
  LV2_CORE__designation = 'http://lv2plug.in/ns/lv2core#designation';
  LV2_CORE__documentation = 'http://lv2plug.in/ns/lv2core#documentation';
  LV2_CORE__enabled = 'http://lv2plug.in/ns/lv2core#enabled';
  LV2_CORE__enumeration = 'http://lv2plug.in/ns/lv2core#enumeration';
  LV2_CORE__extensionData_ = 'http://lv2plug.in/ns/lv2core#extensionData';
  LV2_CORE__freeWheeling = 'http://lv2plug.in/ns/lv2core#freeWheeling';
  LV2_CORE__hardRTCapable = 'http://lv2plug.in/ns/lv2core#hardRTCapable';
  LV2_CORE__inPlaceBroken = 'http://lv2plug.in/ns/lv2core#inPlaceBroken';
  LV2_CORE__index = 'http://lv2plug.in/ns/lv2core#index';
  LV2_CORE__integer = 'http://lv2plug.in/ns/lv2core#integer';
  LV2_CORE__isLive = 'http://lv2plug.in/ns/lv2core#isLive';
  LV2_CORE__latency = 'http://lv2plug.in/ns/lv2core#latency';
  LV2_CORE__maximum = 'http://lv2plug.in/ns/lv2core#maximum';
  LV2_CORE__microVersion = 'http://lv2plug.in/ns/lv2core#microVersion';
  LV2_CORE__minimum = 'http://lv2plug.in/ns/lv2core#minimum';
  LV2_CORE__minorVersion = 'http://lv2plug.in/ns/lv2core#minorVersion';
  LV2_CORE__name = 'http://lv2plug.in/ns/lv2core#name';
  LV2_CORE__optionalFeature = 'http://lv2plug.in/ns/lv2core#optionalFeature';
  LV2_CORE__port_ = 'http://lv2plug.in/ns/lv2core#port';
  LV2_CORE__portProperty_ = 'http://lv2plug.in/ns/lv2core#portProperty';
  LV2_CORE__project = 'http://lv2plug.in/ns/lv2core#project';
  LV2_CORE__prototype = 'http://lv2plug.in/ns/lv2core#prototype';
  LV2_CORE__reportsLatency = 'http://lv2plug.in/ns/lv2core#reportsLatency';
  LV2_CORE__requiredFeature = 'http://lv2plug.in/ns/lv2core#requiredFeature';
  LV2_CORE__sampleRate = 'http://lv2plug.in/ns/lv2core#sampleRate';
  LV2_CORE__scalePoint_ = 'http://lv2plug.in/ns/lv2core#scalePoint';
  LV2_CORE__symbol = 'http://lv2plug.in/ns/lv2core#symbol';
  LV2_CORE__toggled = 'http://lv2plug.in/ns/lv2core#toggled';

type
  PLV2_Handle = ^TLV2_Handle;
  TLV2_Handle = pointer;

  TLV2_Feature = record
    URI: pchar;
    data: pointer;
  end;
  PLV2_Feature = ^TLV2_Feature;
  PPLV2_Feature = ^PLV2_Feature;

  PLV2_Descriptor = ^TLV2_Descriptor;

  TLV2_Descriptor = record
    URI: pchar;
    instantiate: function(descriptor: PLV2_Descriptor; sample_rate: double; bundle_path: pchar; features: PPLV2_Feature): TLV2_Handle; cdecl;
    connect_port: procedure(instance: TLV2_Handle; port: Tuint32_t; data_location: pointer); cdecl;
    activate: procedure(instance: TLV2_Handle); cdecl;
    run: procedure(instance: TLV2_Handle; sample_count: Tuint32_t); cdecl;
    deactivate: procedure(instance: TLV2_Handle); cdecl;
    cleanup: procedure(instance: TLV2_Handle); cdecl;
    extension_data: function(uri: pchar): pointer; cdecl;
  end;

function lv2_descriptor(index: Tuint32_t): PLV2_Descriptor; cdecl; external liblv2;

type
  TLV2_Descriptor_Function = function(index: Tuint32_t): PLV2_Descriptor; cdecl;

  PLV2_Lib_Handle = ^TLV2_Lib_Handle;
  TLV2_Lib_Handle = pointer;

  PLV2_Lib_Descriptor = ^TLV2_Lib_Descriptor;

  TLV2_Lib_Descriptor = record
    handle: TLV2_Lib_Handle;
    size: Tuint32_t;
    cleanup: procedure(handle: TLV2_Lib_Handle); cdecl;
    get_plugin: function(handle: TLV2_Lib_Handle; index: Tuint32_t): PLV2_Descriptor; cdecl;
  end;

function lv2_lib_descriptor(bundle_path: pchar; features: PPLV2_Feature): PLV2_Lib_Descriptor; cdecl; external liblv2;

type
  TLV2_Lib_Descriptor_Function = function(bundle_path: pchar; features: PPLV2_Feature): PLV2_Lib_Descriptor; cdecl;

  // === Konventiert am: 30-11-25 17:24:58 ===


implementation



end.
