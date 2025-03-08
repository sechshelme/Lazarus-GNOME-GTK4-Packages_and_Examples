unit LoadTitle;

{$mode ObjFPC}{$H+}

interface

uses
  ctypes,
  fp_glib2,
  //  fp_GLIBTools,
  fp_GTK4,
  Streamer;

type
  TSong = record
    Index: Tgint;
    FullPath: Pgchar;
    Duration: Tgint64;
  end;
  PSong = ^TSong;

const
  songObjectKey = 'song-object';

procedure LoadTitles(store: PGListStore; path: Pgchar);

implementation

type
  TDirStruct = record
    store: PGListStore;
    path: Pgchar;
    dir: PGDir;
  end;
  PDirStruct = ^TDirStruct;

procedure item_object_free_cp(Data: Tgpointer); cdecl;
var
  obj: PSong absolute Data;
begin
  WriteLn(obj^.FullPath, '  (freed)');
  g_free(obj^.FullPath);
  g_free(obj);
end;

function OpenTitel1(user_data: Tgpointer): Tgboolean; cdecl;
var
  dirStruct: PDirStruct absolute user_data;
  entryName, fullPath: Pgchar;
  obj: PGObject;
  song: PSong;
  i: integer;
const
  index: integer = 0;
  suffixe: array of Pgchar = (
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

begin
  entryName := g_dir_read_name(dirStruct^.dir);
  if entryName = nil then begin
    g_dir_close(dirStruct^.dir);
    g_free(dirStruct);
    Exit(G_SOURCE_REMOVE_);
  end;

  for i := 0 to Length(suffixe) - 1 do begin
    if g_str_has_suffix(entryName, suffixe[i]) then  begin
      song := g_malloc(SizeOf(TSong));
      song^.Index := index;
      fullPath:=     g_strdup(PChar(dirStruct^.path + '/' + entryName));
      song^.FullPath :=fullPath;
      song^.Duration := get_duration(fullPath);
      Inc(index);

      obj := g_object_new(G_TYPE_OBJECT, nil);
      g_object_set_data_full(obj, songObjectKey, song, @item_object_free_cp);
      g_list_store_append(dirStruct^.store, obj);
      g_object_unref(obj);
      Break;
    end;
  end;

  Exit(G_SOURCE_CONTINUE);
end;

procedure LoadTitles(store: PGListStore; path: Pgchar);
var
  dirStruct: PDirStruct;
begin
  dirStruct := g_malloc(SizeOf(TDirStruct));
  dirStruct^.store := store;
  dirStruct^.path := path;
  dirStruct^.dir := g_dir_open(path, 0, nil);

  if dirStruct^.dir = nil then begin
    WriteLn('Konnte Ordner nicht öffnen !');
  end else begin
    g_idle_add(@OpenTitel1, dirStruct);
  end;
end;



end.
