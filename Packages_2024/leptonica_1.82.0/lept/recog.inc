{$IFDEF read_interface}


const
  RECOG_VERSION_NUMBER = 2;

type
  TL_Rdid = record
    pixs: PPix;
    counta: ^Pl_int32;
    delya: ^Pl_int32;
    narray: Tl_int32;
    size: Tl_int32;
    setwidth: Pl_int32;
    nasum: PNuma;
    namoment: PNuma;
    fullarrays: Tl_int32;
    beta: Pl_float32;
    gamma: Pl_float32;
    trellisscore: Pl_float32;
    trellistempl: Pl_int32;
    natempl: PNuma;
    naxloc: PNuma;
    nadely: PNuma;
    nawidth: PNuma;
    boxa: PBoxa;
    nascore: PNuma;
    natempl_r: PNuma;
    nasample_r: PNuma;
    naxloc_r: PNuma;
    nadely_r: PNuma;
    nawidth_r: PNuma;
    nascore_r: PNuma;
  end;
  PL_RDID = ^TL_Rdid;

  TL_Rch = record
    index: Tl_int32;
    score: Tl_float32;
    text: pchar;
    sample: Tl_int32;
    xloc: Tl_int32;
    yloc: Tl_int32;
    width: Tl_int32;
  end;
  PL_RCH = ^TL_Rch;
  PPL_RCH = ^PL_RCH;

  TL_Rcha = record
    naindex: PNuma;
    nascore: PNuma;
    satext: PSarray;
    nasample: PNuma;
    naxloc: PNuma;
    nayloc: PNuma;
    nawidth: PNuma;
  end;
  PL_RCHA = ^TL_Rcha;
  PPL_RCHA = ^PL_RCHA;

  TL_Recog = record
    scalew: Tl_int32;
    scaleh: Tl_int32;
    linew: Tl_int32;
    templ_use: Tl_int32;
    maxarraysize: Tl_int32;
    setsize: Tl_int32;
    threshold: Tl_int32;
    maxyshift: Tl_int32;
    charset_type: Tl_int32;
    charset_size: Tl_int32;
    min_nopad: Tl_int32;
    num_samples: Tl_int32;
    minwidth_u: Tl_int32;
    maxwidth_u: Tl_int32;
    minheight_u: Tl_int32;
    maxheight_u: Tl_int32;
    minwidth: Tl_int32;
    maxwidth: Tl_int32;
    ave_done: Tl_int32;
    train_done: Tl_int32;
    max_wh_ratio: Tl_float32;
    max_ht_ratio: Tl_float32;
    min_splitw: Tl_int32;
    max_splith: Tl_int32;
    sa_text: PSarray;
    dna_tochar: PL_Dna;
    centtab: Pl_int32;
    sumtab: Pl_int32;
    pixaa_u: PPixaa;
    ptaa_u: PPtaa;
    naasum_u: PNumaa;
    pixaa: PPixaa;
    ptaa: PPtaa;
    naasum: PNumaa;
    pixa_u: PPixa;
    pta_u: PPta;
    nasum_u: PNuma;
    pixa: PPixa;
    pta: PPta;
    nasum: PNuma;
    pixa_tr: PPixa;
    pixadb_ave: PPixa;
    pixa_id: PPixa;
    pixdb_ave: PPix;
    pixdb_range: PPix;
    pixadb_boot: PPixa;
    pixadb_split: PPixa;
    bmf: PL_Bmf;
    bmf_size: Tl_int32;
    did: PL_Rdid;
    rch: PL_Rch;
    rcha: PL_Rcha;
  end;
  PL_RECOG = ^TL_Recog;
  PPL_RECOG = ^PL_RECOG;

const
  L_UNKNOWN = 0;
  L_ARABIC_NUMERALS = 1;
  L_LC_ROMAN_NUMERALS = 2;
  L_UC_ROMAN_NUMERALS = 3;
  L_LC_ALPHA = 4;
  L_UC_ALPHA = 5;

const
  L_USE_ALL_TEMPLATES = 0;
  L_USE_AVERAGE_TEMPLATES = 1;

  // === Konventiert am: 17-8-25 13:40:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
