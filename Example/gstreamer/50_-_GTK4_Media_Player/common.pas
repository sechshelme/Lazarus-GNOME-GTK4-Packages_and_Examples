unit Common;

interface

uses
  fp_glib2,
  fp_gst;

const
  AudioExtensions: array of Pgchar = (
    '.mp3',  // MPEG-1/2 Audio Layer 3
    '.wav',  // Waveform Audio File Format
    '.ogg',  // Ogg Vorbis
    '.flac', // Free Lossless Audio Codec
    '.aac',  // Advanced Audio Coding
    '.m4a',  // MPEG-4 Audio
    '.wma',  // Windows Media Audio
    '.aiff', // Audio Interchange File Format
    '.alac', // Apple Lossless Audio Codec
    '.ac3',  // Dolby Digital
    '.amr',  // Adaptive Multi-Rate audio codec
    '.ape',  // Monkey's Audio
    '.au',   // Sun Microsystems Audio
    '.mka',  // Matroska Audio
    '.mp2',  // MPEG-1 Audio Layer 2
    '.mp1',  // MPEG-1 Audio Layer 1
    '.ra',   // RealAudio
    '.mid',  // MIDI
    '.midi', // MIDI
    '.wv',   // WavPack
    '.aac',  // Advanced Audio Coding
    '.3gp',  // 3GPP audio container
    '.opus', // Opus
    '.spx',  // Speex

    // Exoten
    '.ahx',  // Format für Commodore Amiga
    '.hvl',  // Format für Commodore Amiga
    '.ay',   // Format für Amstrad CPC, Spectrum ZX und Atari ST
    '.ym',   // Format für Amstrad CPC, Spectrum ZX und Atari ST
    '.cop',  // Format für Sam Coupe
    '.dsf',  // Format für Sega Dreamcast
    '.gbs',  // Format für Nintendo Gameboy
    '.gsf',  // Format für Nintendo Gameboy Advance
    '.gym',  // Format für Sega Megadrive/Genesis
    '.hes',  // Format für PC Engine
    '.imf',  // Format für verschiedene Apogee Spiele
    '.kss',  // Format für MSX
    '.mdx',  // Format für Sharp X68000
    '.nsf',  // Format für Nintendo NES
    '.nsfe', // Erweitertes Format für Nintendo NES
    '.orc',  // Format für TRS-80 Orchestra-90
    '.psf',  // Format für Sony PlayStation
    '.psf2', // Format für Sony PlayStation II
    '.qsf',  // Format für Capcom QSound
    '.raw',  // Format für AdLib
    '.rol',  // Format für AdLib Visual Composer
    '.s98',  // Format für NEC PC-98
    '.sap',  // Format für Atari XL/XE
    '.sci',  // Format für verschiedene Sierra-Spiele
    '.sndh', // Format für Atari ST
    '.spu',  // Format für Sony PlayStation
    '.ssf',  // Format für Sega Saturn
    '.vgm',  // Format für Sega Master System/Game Gear
    '.vtx',  // Format für Spectrum Vortex Tracker
    '.wsr',  // Format für Bandai WonderSwan/Wonderswan Color
    '.opus', // Opus Audio-Codec (geringe Latenz)

    '.mod',  // Format für Commodore Amiga
    '.s3m',  // Format für GUS / SoundBlaster
    '.spc',  // Format für Super Nintendo
    '.ahx',  // Format für Commodore Amiga
    '.hvl',  // Format für Commodore Amiga
    '.cop',  // Format für Sam Coupe
    '.imf',  // Format für verschiedene Apogee Spiele
    '.mdx',  // Format für Sharp X68000
    '.orc',  // Format für TRS-80 Orchestra-90
    '.qsf',  // Format für Capcom QSound
    '.raw',  // Format für AdLib
    '.rol',  // Format für AdLib Visual Composer
    '.s98',  // Format für NEC PC-98
    '.sci',  // Format für verschiedene Sierra-Spiele
    '.sndh'  // Format für Atari ST
    );

type
  TSong = record
    Index: Tgint;
    FullPath: Pgchar;
    Duration: TGstClockTime;
  end;
  PSong = ^TSong;

const
  songObjectKey = 'song-object';

procedure songitem_object_free_cp(Data: Tgpointer); cdecl;

implementation

procedure songitem_object_free_cp(Data: Tgpointer); cdecl;
var
  obj: PSong absolute Data;
begin
  g_free(obj^.FullPath);
  g_free(obj);
end;



end.
