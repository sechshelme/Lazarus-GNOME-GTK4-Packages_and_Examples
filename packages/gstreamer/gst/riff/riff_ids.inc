
{$IFDEF read_interface}

const
  GST_RIFF_RIFF_WAVE = (Ord('W') or (Ord('A') shl 8) or (Ord('V') shl 16) or (Ord('E') shl 24));
  GST_RIFF_RIFF_AVI = (Ord('A') or (Ord('V') shl 8) or (Ord('I') shl 16) or (Ord(' ') shl 24));
  GST_RIFF_RIFF_CDXA = (Ord('C') or (Ord('D') shl 8) or (Ord('X') shl 16) or (Ord('A') shl 24));

  GST_RIFF_TAG_RIFF = (Ord('R') or (Ord('I') shl 8) or (Ord('F') shl 16) or (Ord('F') shl 24));
  GST_RIFF_TAG_AVF0 = (Ord('A') or (Ord('V') shl 8) or (Ord('F') shl 16) or (Ord('0') shl 24));
  GST_RIFF_TAG_RF64 = (Ord('R') or (Ord('F') shl 8) or (Ord('6') shl 16) or (Ord('4') shl 24));
  GST_RIFF_TAG_RIFX = (Ord('R') or (Ord('I') shl 8) or (Ord('F') shl 16) or (Ord('X') shl 24));
  GST_RIFF_TAG_LIST = (Ord('L') or (Ord('I') shl 8) or (Ord('S') shl 16) or (Ord('T') shl 24));
  GST_RIFF_TAG_avih = (Ord('a') or (Ord('v') shl 8) or (Ord('i') shl 16) or (Ord('h') shl 24));
  GST_RIFF_TAG_strd = (Ord('s') or (Ord('t') shl 8) or (Ord('r') shl 16) or (Ord('d') shl 24));
  GST_RIFF_TAG_strn = (Ord('s') or (Ord('t') shl 8) or (Ord('r') shl 16) or (Ord('n') shl 24));
  GST_RIFF_TAG_strh = (Ord('s') or (Ord('t') shl 8) or (Ord('r') shl 16) or (Ord('h') shl 24));
  GST_RIFF_TAG_strf = (Ord('s') or (Ord('t') shl 8) or (Ord('r') shl 16) or (Ord('f') shl 24));
  GST_RIFF_TAG_vedt = (Ord('v') or (Ord('e') shl 8) or (Ord('d') shl 16) or (Ord('t') shl 24));
  GST_RIFF_TAG_JUNK = (Ord('J') or (Ord('U') shl 8) or (Ord('N') shl 16) or (Ord('K') shl 24));
  GST_RIFF_TAG_JUNQ = (Ord('J') or (Ord('U') shl 8) or (Ord('N') shl 16) or (Ord('Q') shl 24));
  GST_RIFF_TAG_idx1 = (Ord('i') or (Ord('d') shl 8) or (Ord('x') shl 16) or (Ord('1') shl 24));
  GST_RIFF_TAG_dmlh = (Ord('d') or (Ord('m') shl 8) or (Ord('l') shl 16) or (Ord('h') shl 24));
  GST_RIFF_TAG_ID32 = (Ord('I') or (Ord('D') shl 8) or (Ord('3') shl 16) or (Ord('2') shl 24));
  GST_RIFF_TAG_id3 = (Ord('i') or (Ord('d') shl 8) or (Ord('3') shl 16) or (Ord(' ') shl 24));
  GST_RIFF_TAG_IDVX = (Ord('I') or (Ord('D') shl 8) or (Ord('V') shl 16) or (Ord('X') shl 24));
  GST_RIFF_TAG_fmt = (Ord('f') or (Ord('m') shl 8) or (Ord('t') shl 16) or (Ord(' ') shl 24));
  GST_RIFF_TAG_data = (Ord('d') or (Ord('a') shl 8) or (Ord('t') shl 16) or (Ord('a') shl 24));
  GST_RIFF_TAG_plst = (Ord('p') or (Ord('l') shl 8) or (Ord('s') shl 16) or (Ord('t') shl 24));
  GST_RIFF_TAG_cue = (Ord('c') or (Ord('u') shl 8) or (Ord('e') shl 16) or (Ord(' ') shl 24));
  GST_RIFF_TAG_bext = (Ord('b') or (Ord('e') shl 8) or (Ord('x') shl 16) or (Ord('t') shl 24));
  GST_RIFF_TAG_BEXT_ = (Ord('B') or (Ord('E') shl 8) or (Ord('X') shl 16) or (Ord('T') shl 24));
  GST_RIFF_TAG_fact = (Ord('f') or (Ord('a') shl 8) or (Ord('c') shl 16) or (Ord('t') shl 24));
  GST_RIFF_TAG_acid = (Ord('a') or (Ord('c') shl 8) or (Ord('i') shl 16) or (Ord('d') shl 24));
  GST_RIFF_TAG_labl = (Ord('l') or (Ord('a') shl 8) or (Ord('b') shl 16) or (Ord('l') shl 24));
  GST_RIFF_TAG_note = (Ord('n') or (Ord('o') shl 8) or (Ord('t') shl 16) or (Ord('e') shl 24));
  GST_RIFF_TAG_smpl = (Ord('s') or (Ord('m') shl 8) or (Ord('p') shl 16) or (Ord('l') shl 24));
  GST_RIFF_TAG_inst = (Ord('i') or (Ord('n') shl 8) or (Ord('s') shl 16) or (Ord('t') shl 24));
  GST_RIFF_TAG_FLLR = (Ord('F') or (Ord('L') shl 8) or (Ord('L') shl 16) or (Ord('R') shl 24));

  GST_RIFF_LIST_movi = (Ord('m') or (Ord('o') shl 8) or (Ord('v') shl 16) or (Ord('i') shl 24));
  GST_RIFF_LIST_hdrl = (Ord('h') or (Ord('d') shl 8) or (Ord('r') shl 16) or (Ord('l') shl 24));
  GST_RIFF_LIST_odml = (Ord('o') or (Ord('d') shl 8) or (Ord('m') shl 16) or (Ord('l') shl 24));
  GST_RIFF_LIST_strl = (Ord('s') or (Ord('t') shl 8) or (Ord('r') shl 16) or (Ord('l') shl 24));
  GST_RIFF_LIST_INFO = (Ord('I') or (Ord('N') shl 8) or (Ord('F') shl 16) or (Ord('O') shl 24));
  GST_RIFF_LIST_AVIX = (Ord('A') or (Ord('V') shl 8) or (Ord('I') shl 16) or (Ord('X') shl 24));
  GST_RIFF_LIST_adtl = (Ord('a') or (Ord('d') shl 8) or (Ord('t') shl 16) or (Ord('l') shl 24));
  GST_RIFF_LIST_ncdt = (Ord('n') or (Ord('c') shl 8) or (Ord('d') shl 16) or (Ord('t') shl 24));

  GST_RIFF_FCC_vids = (Ord('v') or (Ord('i') shl 8) or (Ord('d') shl 16) or (Ord('s') shl 24));
  GST_RIFF_FCC_auds = (Ord('a') or (Ord('u') shl 8) or (Ord('d') shl 16) or (Ord('s') shl 24));
  GST_RIFF_FCC_pads = (Ord('p') or (Ord('a') shl 8) or (Ord('d') shl 16) or (Ord('s') shl 24));
  GST_RIFF_FCC_txts = (Ord('t') or (Ord('x') shl 8) or (Ord('t') shl 16) or (Ord('s') shl 24));
  GST_RIFF_FCC_vidc = (Ord('v') or (Ord('i') shl 8) or (Ord('d') shl 16) or (Ord('c') shl 24));
  GST_RIFF_FCC_iavs = (Ord('i') or (Ord('a') shl 8) or (Ord('v') shl 16) or (Ord('s') shl 24));
  GST_RIFF_FCCH_RLE = (Ord('R') or (Ord('L') shl 8) or (Ord('E') shl 16) or (Ord(' ') shl 24));
  GST_RIFF_FCCH_msvc = (Ord('m') or (Ord('s') shl 8) or (Ord('v') shl 16) or (Ord('c') shl 24));
  GST_RIFF_FCCH_MSVC_ = (Ord('M') or (Ord('S') shl 8) or (Ord('V') shl 16) or (Ord('C') shl 24));

  GST_RIFF_INFO_IARL = (Ord('I') or (Ord('A') shl 8) or (Ord('R') shl 16) or (Ord('L') shl 24));
  GST_RIFF_INFO_IART = (Ord('I') or (Ord('A') shl 8) or (Ord('R') shl 16) or (Ord('T') shl 24));
  GST_RIFF_INFO_ICMS = (Ord('I') or (Ord('C') shl 8) or (Ord('M') shl 16) or (Ord('S') shl 24));
  GST_RIFF_INFO_ICMT = (Ord('I') or (Ord('C') shl 8) or (Ord('M') shl 16) or (Ord('T') shl 24));
  GST_RIFF_INFO_ICOP = (Ord('I') or (Ord('C') shl 8) or (Ord('O') shl 16) or (Ord('P') shl 24));
  GST_RIFF_INFO_ICRD = (Ord('I') or (Ord('C') shl 8) or (Ord('R') shl 16) or (Ord('D') shl 24));
  GST_RIFF_INFO_ICRP = (Ord('I') or (Ord('C') shl 8) or (Ord('R') shl 16) or (Ord('P') shl 24));
  GST_RIFF_INFO_IDIM = (Ord('I') or (Ord('D') shl 8) or (Ord('I') shl 16) or (Ord('M') shl 24));
  GST_RIFF_INFO_IDPI = (Ord('I') or (Ord('D') shl 8) or (Ord('P') shl 16) or (Ord('I') shl 24));
  GST_RIFF_INFO_IENG = (Ord('I') or (Ord('E') shl 8) or (Ord('N') shl 16) or (Ord('G') shl 24));
  GST_RIFF_INFO_IGNR = (Ord('I') or (Ord('G') shl 8) or (Ord('N') shl 16) or (Ord('R') shl 24));
  GST_RIFF_INFO_IKEY = (Ord('I') or (Ord('K') shl 8) or (Ord('E') shl 16) or (Ord('Y') shl 24));
  GST_RIFF_INFO_ILGT = (Ord('I') or (Ord('L') shl 8) or (Ord('G') shl 16) or (Ord('T') shl 24));
  GST_RIFF_INFO_IMED = (Ord('I') or (Ord('M') shl 8) or (Ord('E') shl 16) or (Ord('D') shl 24));
  GST_RIFF_INFO_INAM = (Ord('I') or (Ord('N') shl 8) or (Ord('A') shl 16) or (Ord('M') shl 24));
  GST_RIFF_INFO_IPLT = (Ord('I') or (Ord('P') shl 8) or (Ord('L') shl 16) or (Ord('T') shl 24));
  GST_RIFF_INFO_IPRD = (Ord('I') or (Ord('P') shl 8) or (Ord('R') shl 16) or (Ord('D') shl 24));
  GST_RIFF_INFO_ISBJ = (Ord('I') or (Ord('S') shl 8) or (Ord('B') shl 16) or (Ord('J') shl 24));
  GST_RIFF_INFO_ISFT = (Ord('I') or (Ord('S') shl 8) or (Ord('F') shl 16) or (Ord('T') shl 24));
  GST_RIFF_INFO_ISHP = (Ord('I') or (Ord('S') shl 8) or (Ord('H') shl 16) or (Ord('P') shl 24));
  GST_RIFF_INFO_ISRC = (Ord('I') or (Ord('S') shl 8) or (Ord('R') shl 16) or (Ord('C') shl 24));
  GST_RIFF_INFO_ISRF = (Ord('I') or (Ord('S') shl 8) or (Ord('R') shl 16) or (Ord('F') shl 24));
  GST_RIFF_INFO_ITCH = (Ord('I') or (Ord('T') shl 8) or (Ord('C') shl 16) or (Ord('H') shl 24));

  GST_RIFF_INFO_IAAR = (Ord('I') or (Ord('A') shl 8) or (Ord('A') shl 16) or (Ord('R') shl 24));
  GST_RIFF_INFO_ITRK = (Ord('I') or (Ord('T') shl 8) or (Ord('R') shl 16) or (Ord('K') shl 24));

  GST_RIFF_LIST_nctg = (Ord('n') or (Ord('c') shl 8) or (Ord('t') shl 16) or (Ord('g') shl 24));

  GST_RIFF_FF00 = (Ord($FF) or (Ord($FF) shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_00 = (Ord('0') or (Ord('0') shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_01 = (Ord('0') or (Ord('1') shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_02 = (Ord('0') or (Ord('2') shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_03 = (Ord('0') or (Ord('3') shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_04 = (Ord('0') or (Ord('4') shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_05 = (Ord('0') or (Ord('5') shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_06 = (Ord('0') or (Ord('6') shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_07 = (Ord('0') or (Ord('7') shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_00pc = (Ord('0') or (Ord('0') shl 8) or (Ord('p') shl 16) or (Ord('c') shl 24));
  GST_RIFF_01pc = (Ord('0') or (Ord('1') shl 8) or (Ord('p') shl 16) or (Ord('c') shl 24));
  GST_RIFF_00dc = (Ord('0') or (Ord('0') shl 8) or (Ord('d') shl 16) or (Ord('c') shl 24));
  GST_RIFF_00dx = (Ord('0') or (Ord('0') shl 8) or (Ord('d') shl 16) or (Ord('x') shl 24));
  GST_RIFF_00db = (Ord('0') or (Ord('0') shl 8) or (Ord('d') shl 16) or (Ord('b') shl 24));
  GST_RIFF_00xx = (Ord('0') or (Ord('0') shl 8) or (Ord('x') shl 16) or (Ord('x') shl 24));
  GST_RIFF_00id = (Ord('0') or (Ord('0') shl 8) or (Ord('i') shl 16) or (Ord('d') shl 24));
  GST_RIFF_00rt = (Ord('0') or (Ord('0') shl 8) or (Ord('r') shl 16) or (Ord('t') shl 24));
  GST_RIFF_0021 = (Ord('0') or (Ord('0') shl 8) or (Ord('2') shl 16) or (Ord('1') shl 24));
  GST_RIFF_00iv = (Ord('0') or (Ord('0') shl 8) or (Ord('i') shl 16) or (Ord('v') shl 24));
  GST_RIFF_0031 = (Ord('0') or (Ord('0') shl 8) or (Ord('3') shl 16) or (Ord('1') shl 24));
  GST_RIFF_0032 = (Ord('0') or (Ord('0') shl 8) or (Ord('3') shl 16) or (Ord('2') shl 24));
  GST_RIFF_00vc = (Ord('0') or (Ord('0') shl 8) or (Ord('v') shl 16) or (Ord('c') shl 24));
  GST_RIFF_00xm = (Ord('0') or (Ord('0') shl 8) or (Ord('x') shl 16) or (Ord('m') shl 24));
  GST_RIFF_01wb = (Ord('0') or (Ord('1') shl 8) or (Ord('w') shl 16) or (Ord('b') shl 24));
  GST_RIFF_01dc = (Ord('0') or (Ord('1') shl 8) or (Ord('d') shl 16) or (Ord('c') shl 24));
  GST_RIFF_00__ = (Ord('0') or (Ord('0') shl 8) or (Ord('_') shl 16) or (Ord('_') shl 24));

  GST_RIFF_cram = (Ord('c') or (Ord('r') shl 8) or (Ord('a') shl 16) or (Ord('m') shl 24));
  GST_RIFF_CRAM_ = (Ord('C') or (Ord('R') shl 8) or (Ord('A') shl 16) or (Ord('M') shl 24));
  GST_RIFF_wham = (Ord('w') or (Ord('h') shl 8) or (Ord('a') shl 16) or (Ord('m') shl 24));
  GST_RIFF_WHAM_ = (Ord('W') or (Ord('H') shl 8) or (Ord('A') shl 16) or (Ord('M') shl 24));
  GST_RIFF_rgb = (Ord($00) or (Ord($00) shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_RGB_ = (Ord('R') or (Ord('G') shl 8) or (Ord('B') shl 16) or (Ord(' ') shl 24));
  GST_RIFF_RAW = (Ord('R') or (Ord('A') shl 8) or (Ord('W') shl 16) or (Ord(' ') shl 24));
  GST_RIFF_DIB = (Ord('D') or (Ord('I') shl 8) or (Ord('B') shl 16) or (Ord(' ') shl 24));
  GST_RIFF_rle8 = (Ord($01) or (Ord($00) shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_RLE8_ = (Ord('R') or (Ord('L') shl 8) or (Ord('E') shl 16) or (Ord('8') shl 24));
  GST_RIFF_rle4 = (Ord($02) or (Ord($00) shl 8) or (Ord($00) shl 16) or (Ord($00) shl 24));
  GST_RIFF_RLE4_ = (Ord('R') or (Ord('L') shl 8) or (Ord('E') shl 16) or (Ord('4') shl 24));
  GST_RIFF_none = (Ord($00) or (Ord($00) shl 8) or (Ord($FF) shl 16) or (Ord($FF) shl 24));
  GST_RIFF_NONE_ = (Ord('N') or (Ord('O') shl 8) or (Ord('N') shl 16) or (Ord('E') shl 24));
  GST_RIFF_pack = (Ord($01) or (Ord($00) shl 8) or (Ord($FF) shl 16) or (Ord($FF) shl 24));
  GST_RIFF_PACK_ = (Ord('P') or (Ord('A') shl 8) or (Ord('C') shl 16) or (Ord('K') shl 24));
  GST_RIFF_tran = (Ord($02) or (Ord($00) shl 8) or (Ord($FF) shl 16) or (Ord($FF) shl 24));
  GST_RIFF_TRAN_ = (Ord('T') or (Ord('R') shl 8) or (Ord('A') shl 16) or (Ord('N') shl 24));
  GST_RIFF_ccc = (Ord($03) or (Ord($00) shl 8) or (Ord($FF) shl 16) or (Ord($FF) shl 24));
  GST_RIFF_CCC_ = (Ord('C') or (Ord('C') shl 8) or (Ord('C') shl 16) or (Ord(' ') shl 24));
  GST_RIFF_cyuv = (Ord('c') or (Ord('y') shl 8) or (Ord('u') shl 16) or (Ord('v') shl 24));
  GST_RIFF_CYUV_ = (Ord('C') or (Ord('Y') shl 8) or (Ord('U') shl 16) or (Ord('V') shl 24));
  GST_RIFF_jpeg = (Ord($04) or (Ord($00) shl 8) or (Ord($FF) shl 16) or (Ord($FF) shl 24));
  GST_RIFF_JPEG_ = (Ord('J') or (Ord('P') shl 8) or (Ord('E') shl 16) or (Ord('G') shl 24));
  GST_RIFF_MJPG_ = (Ord('M') or (Ord('J') shl 8) or (Ord('P') shl 16) or (Ord('G') shl 24));
  GST_RIFF_mJPG = (Ord('m') or (Ord('J') shl 8) or (Ord('P') shl 16) or (Ord('G') shl 24));
  GST_RIFF_IJPG_ = (Ord('I') or (Ord('J') shl 8) or (Ord('P') shl 16) or (Ord('G') shl 24));
  GST_RIFF_rt21 = (Ord('r') or (Ord('t') shl 8) or (Ord('2') shl 16) or (Ord('1') shl 24));
  GST_RIFF_RT21_ = (Ord('R') or (Ord('T') shl 8) or (Ord('2') shl 16) or (Ord('1') shl 24));
  GST_RIFF_iv31 = (Ord('i') or (Ord('v') shl 8) or (Ord('3') shl 16) or (Ord('1') shl 24));
  GST_RIFF_IV31_ = (Ord('I') or (Ord('V') shl 8) or (Ord('3') shl 16) or (Ord('1') shl 24));
  GST_RIFF_iv32 = (Ord('i') or (Ord('v') shl 8) or (Ord('3') shl 16) or (Ord('2') shl 24));
  GST_RIFF_IV32_ = (Ord('I') or (Ord('V') shl 8) or (Ord('3') shl 16) or (Ord('2') shl 24));
  GST_RIFF_iv41 = (Ord('i') or (Ord('v') shl 8) or (Ord('4') shl 16) or (Ord('1') shl 24));
  GST_RIFF_IV41_ = (Ord('I') or (Ord('V') shl 8) or (Ord('4') shl 16) or (Ord('1') shl 24));
  GST_RIFF_iv50 = (Ord('i') or (Ord('v') shl 8) or (Ord('5') shl 16) or (Ord('0') shl 24));
  GST_RIFF_IV50_ = (Ord('I') or (Ord('V') shl 8) or (Ord('5') shl 16) or (Ord('0') shl 24));
  GST_RIFF_cvid = (Ord('c') or (Ord('v') shl 8) or (Ord('i') shl 16) or (Ord('d') shl 24));
  GST_RIFF_CVID_ = (Ord('C') or (Ord('V') shl 8) or (Ord('I') shl 16) or (Ord('D') shl 24));
  GST_RIFF_ULTI_ = (Ord('U') or (Ord('L') shl 8) or (Ord('T') shl 16) or (Ord('I') shl 24));
  GST_RIFF_ulti = (Ord('u') or (Ord('l') shl 8) or (Ord('t') shl 16) or (Ord('i') shl 24));
  GST_RIFF_YUV9 = (Ord('Y') or (Ord('U') shl 8) or (Ord('V') shl 16) or (Ord('9') shl 24));
  GST_RIFF_YVU9 = (Ord('Y') or (Ord('V') shl 8) or (Ord('U') shl 16) or (Ord('9') shl 24));
  GST_RIFF_XMPG_ = (Ord('X') or (Ord('M') shl 8) or (Ord('P') shl 16) or (Ord('G') shl 24));
  GST_RIFF_xmpg = (Ord('x') or (Ord('m') shl 8) or (Ord('p') shl 16) or (Ord('g') shl 24));
  GST_RIFF_VDOW = (Ord('V') or (Ord('D') shl 8) or (Ord('O') shl 16) or (Ord('W') shl 24));
  GST_RIFF_MVI1_ = (Ord('M') or (Ord('V') shl 8) or (Ord('I') shl 16) or (Ord('1') shl 24));
  GST_RIFF_v422 = (Ord('v') or (Ord('4') shl 8) or (Ord('2') shl 16) or (Ord('2') shl 24));
  GST_RIFF_V422_ = (Ord('V') or (Ord('4') shl 8) or (Ord('2') shl 16) or (Ord('2') shl 24));
  GST_RIFF_mvi1 = (Ord('m') or (Ord('v') shl 8) or (Ord('i') shl 16) or (Ord('1') shl 24));
  GST_RIFF_MPIX = (Ord($04) or (Ord($00) shl 8) or (Ord('i') shl 16) or (Ord('1') shl 24));
  GST_RIFF_AURA = (Ord('A') or (Ord('U') shl 8) or (Ord('R') shl 16) or (Ord('A') shl 24));
  GST_RIFF_DMB1_ = (Ord('D') or (Ord('M') shl 8) or (Ord('B') shl 16) or (Ord('1') shl 24));
  GST_RIFF_dmb1 = (Ord('d') or (Ord('m') shl 8) or (Ord('b') shl 16) or (Ord('1') shl 24));

  GST_RIFF_BW10_ = (Ord('B') or (Ord('W') shl 8) or (Ord('1') shl 16) or (Ord('0') shl 24));
  GST_RIFF_bw10 = (Ord('b') or (Ord('w') shl 8) or (Ord('1') shl 16) or (Ord('0') shl 24));

  GST_RIFF_yuy2 = (Ord('y') or (Ord('u') shl 8) or (Ord('y') shl 16) or (Ord('2') shl 24));
  GST_RIFF_YUY2_ = (Ord('Y') or (Ord('U') shl 8) or (Ord('Y') shl 16) or (Ord('2') shl 24));
  GST_RIFF_YUV8 = (Ord('Y') or (Ord('U') shl 8) or (Ord('V') shl 16) or (Ord('8') shl 24));
  GST_RIFF_WINX = (Ord('W') or (Ord('I') shl 8) or (Ord('N') shl 16) or (Ord('X') shl 24));
  GST_RIFF_WPY2 = (Ord('W') or (Ord('P') shl 8) or (Ord('Y') shl 16) or (Ord('2') shl 24));
  GST_RIFF_m263 = (Ord('m') or (Ord('2') shl 8) or (Ord('6') shl 16) or (Ord('3') shl 24));
  GST_RIFF_M263_ = (Ord('M') or (Ord('2') shl 8) or (Ord('6') shl 16) or (Ord('3') shl 24));
  GST_RIFF_H263_ = (Ord('H') or (Ord('2') shl 8) or (Ord('6') shl 16) or (Ord('3') shl 24));
  GST_RIFF_h263 = (Ord('h') or (Ord('2') shl 8) or (Ord('6') shl 16) or (Ord('3') shl 24));
  GST_RIFF_i263 = (Ord('i') or (Ord('2') shl 8) or (Ord('6') shl 16) or (Ord('3') shl 24));
  GST_RIFF_L263 = (Ord('L') or (Ord('2') shl 8) or (Ord('6') shl 16) or (Ord('3') shl 24));
  GST_RIFF_x263 = (Ord('x') or (Ord('2') shl 8) or (Ord('6') shl 16) or (Ord('3') shl 24));
  GST_RIFF_VSSH = (Ord('V') or (Ord('S') shl 8) or (Ord('S') shl 16) or (Ord('H') shl 24));

  GST_RIFF_Q1_0 = (Ord('Q') or (Ord('1') shl 8) or (Ord($2E) shl 16) or (Ord('0') shl 24));
  GST_RIFF_SFMC = (Ord('S') or (Ord('F') shl 8) or (Ord('M') shl 16) or (Ord('C') shl 24));

  GST_RIFF_y41p = (Ord('y') or (Ord('4') shl 8) or (Ord('1') shl 16) or (Ord('p') shl 24));
  GST_RIFF_Y41P_ = (Ord('Y') or (Ord('4') shl 8) or (Ord('1') shl 16) or (Ord('P') shl 24));
  GST_RIFF_yv12 = (Ord('y') or (Ord('v') shl 8) or (Ord('1') shl 16) or (Ord('2') shl 24));
  GST_RIFF_YV12_ = (Ord('Y') or (Ord('V') shl 8) or (Ord('1') shl 16) or (Ord('2') shl 24));
  GST_RIFF_vixl = (Ord('v') or (Ord('i') shl 8) or (Ord('x') shl 16) or (Ord('l') shl 24));
  GST_RIFF_VIXL_ = (Ord('V') or (Ord('I') shl 8) or (Ord('X') shl 16) or (Ord('L') shl 24));
  GST_RIFF_iyuv = (Ord('i') or (Ord('y') shl 8) or (Ord('u') shl 16) or (Ord('v') shl 24));
  GST_RIFF_IYUV_ = (Ord('I') or (Ord('Y') shl 8) or (Ord('U') shl 16) or (Ord('V') shl 24));
  GST_RIFF_i420 = (Ord('i') or (Ord('4') shl 8) or (Ord('2') shl 16) or (Ord('0') shl 24));
  GST_RIFF_I420_ = (Ord('I') or (Ord('4') shl 8) or (Ord('2') shl 16) or (Ord('0') shl 24));
  GST_RIFF_vyuy = (Ord('v') or (Ord('y') shl 8) or (Ord('u') shl 16) or (Ord('y') shl 24));
  GST_RIFF_VYUY_ = (Ord('V') or (Ord('Y') shl 8) or (Ord('U') shl 16) or (Ord('Y') shl 24));

  GST_RIFF_DIV3 = (Ord('D') or (Ord('I') shl 8) or (Ord('V') shl 16) or (Ord('3') shl 24));

  GST_RIFF_rpza = (Ord('r') or (Ord('p') shl 8) or (Ord('z') shl 16) or (Ord('a') shl 24));
  GST_RIFF_azpr = (Ord('a') or (Ord('z') shl 8) or (Ord('p') shl 16) or (Ord('r') shl 24));

  GST_RIFF_ISFT = (Ord('I') or (Ord('S') shl 8) or (Ord('F') shl 16) or (Ord('T') shl 24));
  GST_RIFF_IDIT = (Ord('I') or (Ord('D') shl 8) or (Ord('I') shl 16) or (Ord('T') shl 24));

  GST_RIFF_00AM = (Ord('0') or (Ord('0') shl 8) or (Ord('A') shl 16) or (Ord('M') shl 24));
  GST_RIFF_DISP = (Ord('D') or (Ord('I') shl 8) or (Ord('S') shl 16) or (Ord('P') shl 24));
  GST_RIFF_ISBJ = (Ord('I') or (Ord('S') shl 8) or (Ord('B') shl 16) or (Ord('J') shl 24));

  GST_RIFF_rec = (Ord('r') or (Ord('e') shl 8) or (Ord('c') shl 16) or (Ord(' ') shl 24));

const
  GST_RIFF_STRH_DISABLED = $000000001;
  GST_RIFF_STRH_VIDEOPALCHANGES = $000010000;

type
  Tgst_riff_strh = record
    _type: Tguint32;
    fcc_handler: Tguint32;
    flags: Tguint32;
    priority: Tguint32;
    init_frames: Tguint32;
    scale: Tguint32;
    rate: Tguint32;
    start: Tguint32;
    length: Tguint32;
    bufsize: Tguint32;
    quality: Tguint32;
    samplesize: Tguint32;
  end;
  Pgst_riff_strh = ^Tgst_riff_strh;
  PPgst_riff_strh = ^Pgst_riff_strh;

  Tgst_riff_strf_vids = record
    size: Tguint32;
    Width: Tguint32;
    Height: Tguint32;
    planes: Tguint16;
    bit_cnt: Tguint16;
    compression: Tguint32;
    image_size: Tguint32;
    xpels_meter: Tguint32;
    ypels_meter: Tguint32;
    num_colors: Tguint32;
    imp_colors: Tguint32;
  end;
  Pgst_riff_strf_vids = ^Tgst_riff_strf_vids;
  PPgst_riff_strf_vids = ^Pgst_riff_strf_vids;

const
  GST_RIFF_WAVE_FORMAT_UNKNOWN = $0000;
  GST_RIFF_WAVE_FORMAT_PCM = $0001;
  GST_RIFF_WAVE_FORMAT_ADPCM = $0002;
  GST_RIFF_WAVE_FORMAT_IEEE_FLOAT = $0003;
  GST_RIFF_WAVE_FORMAT_VSELP = $0004;
  GST_RIFF_WAVE_FORMAT_IBM_CVSD = $0005;
  GST_RIFF_WAVE_FORMAT_ALAW = $0006;
  GST_RIFF_WAVE_FORMAT_MULAW = $0007;
  GST_RIFF_WAVE_FORMAT_WMS = $000a;
  GST_RIFF_WAVE_FORMAT_OKI_ADPCM = $0010;
  GST_RIFF_WAVE_FORMAT_DVI_ADPCM = $0011;
  GST_RIFF_WAVE_FORMAT_MEDIASPACE_ADPCM = $0012;
  GST_RIFF_WAVE_FORMAT_SIERRA_ADPCM = $0013;
  GST_RIFF_WAVE_FORMAT_G723_ADPCM = $0014;
  GST_RIFF_WAVE_FORMAT_DIGISTD = $0015;
  GST_RIFF_WAVE_FORMAT_DIGIFIX = $0016;
  GST_RIFF_WAVE_FORMAT_DIALOGIC_OKI_ADPCM = $0017;
  GST_RIFF_WAVE_FORMAT_MEDIAVISION_ADPCM = $0018;
  GST_RIFF_WAVE_FORMAT_CU_CODEC = $0019;
  GST_RIFF_WAVE_FORMAT_YAMAHA_ADPCM = $0020;
  GST_RIFF_WAVE_FORMAT_SONARC = $0021;
  GST_RIFF_WAVE_FORMAT_DSP_TRUESPEECH = $0022;
  GST_RIFF_WAVE_FORMAT_ECHOSC1 = $0023;
  GST_RIFF_WAVE_FORMAT_AUDIOFILE_AF36 = $0024;
  GST_RIFF_WAVE_FORMAT_APTX = $0025;
  GST_RIFF_WAVE_FORMAT_AUDIOFILE_AF10 = $0026;
  GST_RIFF_WAVE_FORMAT_PROSODY_1612 = $0027;
  GST_RIFF_WAVE_FORMAT_LRC = $0028;
  GST_RIFF_WAVE_FORMAT_DOLBY_AC2 = $0030;
  GST_RIFF_WAVE_FORMAT_GSM610 = $0031;
  GST_RIFF_WAVE_FORMAT_MSN = $0032;
  GST_RIFF_WAVE_FORMAT_ANTEX_ADPCME = $0033;
  GST_RIFF_WAVE_FORMAT_CONTROL_RES_VQLPC = $0034;
  GST_RIFF_WAVE_FORMAT_DIGIREAL = $0035;
  GST_RIFF_WAVE_FORMAT_DIGIADPCM = $0036;
  GST_RIFF_WAVE_FORMAT_CONTROL_RES_CR10 = $0037;
  GST_RIFF_WAVE_FORMAT_NMS_VBXADPCM = $0038;
  GST_RIFF_WAVE_FORMAT_CS_IMAADPCM = $0039;
  GST_RIFF_WAVE_FORMAT_ECHOSC3 = $003A;
  GST_RIFF_WAVE_FORMAT_ROCKWELL_ADPCM = $003B;
  GST_RIFF_WAVE_FORMAT_ROCKWELL_DIGITALK = $003C;
  GST_RIFF_WAVE_FORMAT_XEBEC = $003D;
  GST_RIFF_WAVE_FORMAT_ITU_G721_ADPCM = $0040;
  GST_RIFF_WAVE_FORMAT_G728_CELP = $0041;
  GST_RIFF_WAVE_FORMAT_MSG723 = $0042;
  GST_RIFF_WAVE_FORMAT_ITU_G726_ADPCM = $0045;
  GST_RIFF_WAVE_FORMAT_MPEGL12 = $0050;
  GST_RIFF_WAVE_FORMAT_RT24 = $0052;
  GST_RIFF_WAVE_FORMAT_PAC = $0053;
  GST_RIFF_WAVE_FORMAT_MPEGL3 = $0055;
  GST_RIFF_WAVE_FORMAT_AMR_NB = $0057;
  GST_RIFF_WAVE_FORMAT_AMR_WB = $0058;
  GST_RIFF_WAVE_FORMAT_LUCENT_G723 = $0059;
  GST_RIFF_WAVE_FORMAT_CIRRUS = $0060;
  GST_RIFF_WAVE_FORMAT_ADPCM_IMA_DK4 = $0061;
  GST_RIFF_WAVE_FORMAT_ADPCM_IMA_DK3 = $0062;
  GST_RIFF_WAVE_FORMAT_ESPCM = $0061;
  GST_RIFF_WAVE_FORMAT_VOXWARE = $0062;
  GST_RIFF_WAVE_FORMAT_CANOPUS_ATRAC = $0063;
  GST_RIFF_WAVE_FORMAT_G726_ADPCM = $0064;
  GST_RIFF_WAVE_FORMAT_G722_ADPCM = $0065;
  GST_RIFF_WAVE_FORMAT_ADPCM_G722 = $028F;
  GST_RIFF_WAVE_FORMAT_DSAT_DISPLAY = $0067;
  GST_RIFF_WAVE_FORMAT_ADPCM_IMA_WAV = $0069;
  GST_RIFF_WAVE_FORMAT_VOXWARE_BYTE_ALIGNED = $0069;
  GST_RIFF_WAVE_FORMAT_VOXWARE_AC8 = $0070;
  GST_RIFF_WAVE_FORMAT_VOXWARE_AC10 = $0071;
  GST_RIFF_WAVE_FORMAT_VOXWARE_AC16 = $0072;
  GST_RIFF_WAVE_FORMAT_VOXWARE_AC20 = $0073;
  GST_RIFF_WAVE_FORMAT_VOXWARE_METAVOICE = $0074;
  GST_RIFF_WAVE_FORMAT_VOXWARE_METASOUND = $0075;
  GST_RIFF_WAVE_FORMAT_VOXWARE_RT29HW = $0076;
  GST_RIFF_WAVE_FORMAT_VOXWARE_VR12 = $0077;
  GST_RIFF_WAVE_FORMAT_VOXWARE_VR18 = $0078;
  GST_RIFF_WAVE_FORMAT_VOXWARE_TQ40 = $0079;
  GST_RIFF_WAVE_FORMAT_SOFTSOUND = $0080;
  GST_RIFF_WAVE_FORMAT_VOXWARE_TQ60 = $0081;
  GST_RIFF_WAVE_FORMAT_MSRT24 = $0082;
  GST_RIFF_WAVE_FORMAT_G729A = $0083;
  GST_RIFF_WAVE_FORMAT_MVI_MVI2 = $0084;
  GST_RIFF_WAVE_FORMAT_DF_G726 = $0085;
  GST_RIFF_WAVE_FORMAT_DF_GSM610 = $0086;
  GST_RIFF_WAVE_FORMAT_ISIAUDIO = $0088;
  GST_RIFF_WAVE_FORMAT_ONLIVE = $0089;
  GST_RIFF_WAVE_FORMAT_SBC24 = $0091;
  GST_RIFF_WAVE_FORMAT_DOLBY_AC3_SPDIF = $0092;
  GST_RIFF_WAVE_FORMAT_MEDIASONIC_G723 = $0093;
  GST_RIFF_WAVE_FORMAT_PROSODY_8KBPS = $0094;
  GST_RIFF_WAVE_FORMAT_ZYXEL_ADPCM = $0097;
  GST_RIFF_WAVE_FORMAT_PHILIPS_LPCBB = $0098;
  GST_RIFF_WAVE_FORMAT_PACKED = $0099;
  GST_RIFF_WAVE_FORMAT_MALDEN_PHONYTALK = $00A0;
  GST_RIFF_WAVE_FORMAT_AAC = $00ff;
  GST_RIFF_WAVE_FORMAT_RHETOREX_ADPCM = $0100;
  GST_RIFF_IBM_FORMAT_MULAW = $0101;
  GST_RIFF_IBM_FORMAT_ALAW = $0102;
  GST_RIFF_IBM_FORMAT_ADPCM = $0103;
  GST_RIFF_WAVE_FORMAT_VIVO_G723 = $0111;
  GST_RIFF_WAVE_FORMAT_VIVO_SIREN = $0112;
  GST_RIFF_WAVE_FORMAT_DIGITAL_G723 = $0123;
  GST_RIFF_WAVE_FORMAT_SANYO_LD_ADPCM = $0125;
  GST_RIFF_WAVE_FORMAT_SIPROLAB_ACEPLNET = $0130;
  GST_RIFF_WAVE_FORMAT_SIPROLAB_ACELP4800 = $0131;
  GST_RIFF_WAVE_FORMAT_SIPROLAB_ACELP8V3 = $0132;
  GST_RIFF_WAVE_FORMAT_SIPROLAB_G729 = $0133;
  GST_RIFF_WAVE_FORMAT_SIPROLAB_G729A = $0134;
  GST_RIFF_WAVE_FORMAT_SIPROLAB_KELVIN = $0135;
  GST_RIFF_WAVE_FORMAT_G726ADPCM = $0140;
  GST_RIFF_WAVE_FORMAT_QUALCOMM_PUREVOICE = $0150;
  GST_RIFF_WAVE_FORMAT_QUALCOMM_HALFRATE = $0151;
  GST_RIFF_WAVE_FORMAT_TUBGSM = $0155;
  GST_RIFF_WAVE_FORMAT_WMAV1 = $0160;
  GST_RIFF_WAVE_FORMAT_WMAV2 = $0161;
  GST_RIFF_WAVE_FORMAT_WMAV3 = $0162;
  GST_RIFF_WAVE_FORMAT_WMAV3_L = $0163;
  GST_RIFF_WAVE_FORMAT_CREATIVE_ADPCM = $0200;
  GST_RIFF_WAVE_FORMAT_CREATIVE_FASTSPEECH8 = $0202;
  GST_RIFF_WAVE_FORMAT_CREATIVE_FASTSPEECH10 = $0203;
  GST_RIFF_WAVE_FORMAT_UHER_ADPCM = $0210;
  GST_RIFF_WAVE_FORMAT_QUARTERDECK = $0220;
  GST_RIFF_WAVE_FORMAT_ILINK_VC = $0230;
  GST_RIFF_WAVE_FORMAT_RAW_SPORT = $0240;
  GST_RIFF_WAVE_FORMAT_IPI_HSX = $0250;
  GST_RIFF_WAVE_FORMAT_IPI_RPELP = $0251;
  GST_RIFF_WAVE_FORMAT_CS2 = $0260;
  GST_RIFF_WAVE_FORMAT_SONY_ATRAC3 = $0270;
  GST_RIFF_WAVE_FORMAT_SIREN = $028E;
  GST_RIFF_WAVE_FORMAT_FM_TOWNS_SND = $0300;
  GST_RIFF_WAVE_FORMAT_BTV_DIGITAL = $0400;
  GST_RIFF_WAVE_FORMAT_IMC = $0401;
  GST_RIFF_WAVE_FORMAT_QDESIGN_MUSIC = $0450;
  GST_RIFF_WAVE_FORMAT_VME_VMPCM = $0680;
  GST_RIFF_WAVE_FORMAT_TPC = $0681;
  GST_RIFF_WAVE_FORMAT_OLIGSM = $1000;
  GST_RIFF_WAVE_FORMAT_OLIADPCM = $1001;
  GST_RIFF_WAVE_FORMAT_OLICELP = $1002;
  GST_RIFF_WAVE_FORMAT_OLISBC = $1003;
  GST_RIFF_WAVE_FORMAT_OLIOPR = $1004;
  GST_RIFF_WAVE_FORMAT_LH_CODEC = $1100;
  GST_RIFF_WAVE_FORMAT_NORRIS = $1400;
  GST_RIFF_WAVE_FORMAT_SOUNDSPACE_MUSICOMPRESS = $1500;
  GST_RIFF_WAVE_FORMAT_A52 = $2000;
  GST_RIFF_WAVE_FORMAT_DTS = $2001;
  GST_RIFF_WAVE_FORMAT_SONIC = $2048;
  GST_RIFF_WAVE_FORMAT_SONIC_LS = $2048;
  GST_RIFF_WAVE_FORMAT_AAC_AC = $4143;
  GST_RIFF_WAVE_FORMAT_VORBIS1 = $674f;
  GST_RIFF_WAVE_FORMAT_VORBIS2 = $6750;
  GST_RIFF_WAVE_FORMAT_VORBIS3 = $6751;
  GST_RIFF_WAVE_FORMAT_VORBIS1PLUS = $676f;
  GST_RIFF_WAVE_FORMAT_VORBIS2PLUS = $6770;
  GST_RIFF_WAVE_FORMAT_VORBIS3PLUS = $6771;
  GST_RIFF_WAVE_FORMAT_AAC_pm = $706d;
  GST_RIFF_WAVE_FORMAT_GSM_AMR_CBR = $7A21;
  GST_RIFF_WAVE_FORMAT_GSM_AMR_VBR = $7A22;
  GST_RIFF_WAVE_FORMAT_FLAC = $F1AC;
  GST_RIFF_WAVE_FORMAT_EXTENSIBLE = $FFFE;

type
  Tgst_riff_strf_auds = record
    format: Tguint16;
    channels: Tguint16;
    rate: Tguint32;
    av_bps: Tguint32;
    blockalign: Tguint16;
    bits_per_sample: Tguint16;
    extra_size: Tguint16;
  end;
  Pgst_riff_strf_auds = ^Tgst_riff_strf_auds;
  PPgst_riff_strf_auds = ^Pgst_riff_strf_auds;

  Tgst_riff_strf_iavs = record
    DVAAuxSrc: Tguint32;
    DVAAuxCtl: Tguint32;
    DVAAuxSrc1: Tguint32;
    DVAAuxCtl1: Tguint32;
    DVVAuxSrc: Tguint32;
    DVVAuxCtl: Tguint32;
    DVReserved1: Tguint32;
    DVReserved2: Tguint32;
  end;
  Pgst_riff_strf_iavs = ^Tgst_riff_strf_iavs;
  PPgst_riff_strf_iavs = ^Pgst_riff_strf_iavs;

const
  GST_RIFF_IF_LIST = $00000001;
  GST_RIFF_IF_KEYFRAME = $00000010;
  GST_RIFF_IF_NO_TIME = $00000100;
  GST_RIFF_IF_COMPUSE = $0FFF0000;

type
  Tgst_riff_index_entry = record
    id: Tguint32;
    flags: Tguint32;
    offset: Tguint32;
    size: Tguint32;
  end;
  Pgst_riff_index_entry = ^Tgst_riff_index_entry;

  Tgst_riff_dmlh = record
    totalframes: Tguint32;
  end;
  Pgst_riff_dmlh = ^Tgst_riff_dmlh;

  Tgst_riff_acid = record
    loop_type: Tguint32;
    root_note: Tguint16;
    unknown1: Tguint16;
    unknown2: Tgfloat;
    number_of_beats: Tguint32;
    meter_d: Tguint16;
    meter_n: Tguint16;
    tempo: Tgfloat;
  end;
  Pgst_riff_acid = ^Tgst_riff_acid;

  // === Konventiert am: 12-10-24 15:21:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
