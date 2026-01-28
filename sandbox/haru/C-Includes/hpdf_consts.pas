unit hpdf_consts;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_consts.h
 *
 * URL: http://libharu.org
 *
 * Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
 * Copyright (c) 2007-2009 Antony Dovgal <tony@daylessday.org>
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.
 * It is provided "as is" without express or implied warranty.
 *
  }
{$ifndef _HPDF_CONSTS_H}
{$define _HPDF_CONSTS_H}
{---------------------------------------------------------------------------- }

const
  HPDF_TRUE = 1;  
  HPDF_FALSE = 0;  
  HPDF_OK = 0;  
  HPDF_NOERROR = 0;  
{----- default values ------------------------------------------------------- }
{ buffer size which is required when we convert to character string.  }
  HPDF_TMP_BUF_SIZ = 512;  
  HPDF_SHORT_BUF_SIZ = 32;  
  HPDF_REAL_LEN = 64;  
  HPDF_INT_LEN = 11;  
  HPDF_TEXT_DEFAULT_LEN = 256;  
  HPDF_UNICODE_HEADER_LEN = 2;  
  HPDF_DATE_TIME_STR_LEN = 23;  
{ length of each item defined in PDF  }
  HPDF_BYTE_OFFSET_LEN = 10;  
  HPDF_OBJ_ID_LEN = 7;  
  HPDF_GEN_NO_LEN = 5;  
{ default value of Graphic State  }
  HPDF_DEF_FONT = 'Helvetica';  
  HPDF_DEF_PAGE_LAYOUT = HPDF_PAGE_LAYOUT_SINGLE;  
  HPDF_DEF_PAGE_MODE = HPDF_PAGE_MODE_USE_NONE;  
  HPDF_DEF_WORDSPACE = 0;  
  HPDF_DEF_CHARSPACE = 0;  
  HPDF_DEF_FONTSIZE = 10;  
  HPDF_DEF_HSCALING = 100;  
  HPDF_DEF_LEADING = 0;  
  HPDF_DEF_RENDERING_MODE = HPDF_FILL;  
  HPDF_DEF_RISE = 0;  
  HPDF_DEF_RAISE = HPDF_DEF_RISE;  
  HPDF_DEF_LINEWIDTH = 1;  
  HPDF_DEF_LINECAP = HPDF_BUTT_END;  
  HPDF_DEF_LINEJOIN = HPDF_MITER_JOIN;  
  HPDF_DEF_MITERLIMIT = 10;  
  HPDF_DEF_FLATNESS = 1;  
  HPDF_DEF_PAGE_NUM = 1;  
  HPDF_BS_DEF_WIDTH = 1;  
{ default page-size  }
  HPDF_DEF_PAGE_WIDTH = 595.276;  
  HPDF_DEF_PAGE_HEIGHT = 841.89;  
{--------------------------------------------------------------------------- }
{----- compression mode ---------------------------------------------------- }
  HPDF_COMP_NONE = $00;  
  HPDF_COMP_TEXT = $01;  
  HPDF_COMP_IMAGE = $02;  
  HPDF_COMP_METADATA = $04;  
  HPDF_COMP_ALL = $0F;  
{ #define  HPDF_COMP_BEST_COMPRESS   0x10
 * #define  HPDF_COMP_BEST_SPEED      0x20
  }
  HPDF_COMP_MASK = $FF;  
{---------------------------------------------------------------------------- }
{----- permission flags (only Revision 2 is supported)----------------------- }
  HPDF_ENABLE_READ = 0;  
  HPDF_ENABLE_PRINT = 4;  
  HPDF_ENABLE_EDIT_ALL = 8;  
  HPDF_ENABLE_COPY = 16;  
  HPDF_ENABLE_EDIT = 32;  
{---------------------------------------------------------------------------- }
{------ viewer preferences definitions -------------------------------------- }
  HPDF_HIDE_TOOLBAR = 1;  
  HPDF_HIDE_MENUBAR = 2;  
  HPDF_HIDE_WINDOW_UI = 4;  
  HPDF_FIT_WINDOW = 8;  
  HPDF_CENTER_WINDOW = 16;  
  HPDF_PRINT_SCALING_NONE = 32;  
{--------------------------------------------------------------------------- }
{------ limitation of object implementation (PDF1.4) ----------------------- }
  HPDF_LIMIT_MAX_INT = 2147483647;  
  HPDF_LIMIT_MIN_INT = -(2147483647);  
  HPDF_LIMIT_MAX_REAL = 3.4E38;  { per PDF 1.7 spec, Annex C, old value  32767 }
  HPDF_LIMIT_MIN_REAL = -(3.4E38);  { per PDF 1.7 spec, Annex C, old value -32767 }
  HPDF_LIMIT_MAX_STRING_LEN = 2147483646;  { per PDF 1.7 spec, limit 32767 is for strings in content stream and no limit in other cases => open the limit to max Integer, old value 65535 }
  HPDF_LIMIT_MAX_NAME_LEN = 127;  
  HPDF_LIMIT_MAX_ARRAY = 8388607;  { per PDF 1.7 spec, "Maximum number of indirect objects in a PDF file" is 8388607, old value 8191 }
  HPDF_LIMIT_MAX_DICT_ELEMENT = 8388607;  { per PDF 1.7 spec, "Maximum number of indirect objects in a PDF file" is 8388607, old value 4095 }
  HPDF_LIMIT_MAX_XREF_ELEMENT = 8388607;  
  HPDF_LIMIT_MAX_GSTATE = 28;  
  HPDF_LIMIT_MAX_DEVICE_N = 8;  
  HPDF_LIMIT_MAX_DEVICE_N_V15 = 32;  
  HPDF_LIMIT_MAX_CID = 65535;  
  HPDF_MAX_GENERATION_NUM = 65535;  
  HPDF_MIN_PAGE_HEIGHT = 3;  
  HPDF_MIN_PAGE_WIDTH = 3;  
  HPDF_MAX_PAGE_HEIGHT = 14400;  
  HPDF_MAX_PAGE_WIDTH = 14400;  
  HPDF_MIN_MAGNIFICATION_FACTOR = 8;  
  HPDF_MAX_MAGNIFICATION_FACTOR = 3200;  
{--------------------------------------------------------------------------- }
{------ limitation of various properties ----------------------------------- }
  HPDF_MIN_PAGE_SIZE = 3;  
  HPDF_MAX_PAGE_SIZE = 14400;  
  HPDF_MIN_HORIZONTALSCALING = 10;  
  HPDF_MAX_HORIZONTALSCALING = 300;  
  HPDF_MIN_WORDSPACE = -(30);  
  HPDF_MAX_WORDSPACE = 300;  
  HPDF_MIN_CHARSPACE = -(30);  
  HPDF_MAX_CHARSPACE = 300;  
  HPDF_MAX_FONTSIZE = 600;  
  HPDF_MAX_ZOOMSIZE = 10;  
  HPDF_MAX_LEADING = 300;  
  HPDF_MAX_LINEWIDTH = 100;  
  HPDF_MAX_DASH_PATTERN = 100;  
  HPDF_MAX_JWW_NUM = 128;  
{---------------------------------------------------------------------------- }
{----- country code definition ---------------------------------------------- }
{ AFGHANISTAN  }
  HPDF_COUNTRY_AF = 'AF';  
{ ALBANIA  }
  HPDF_COUNTRY_AL = 'AL';  
{ ALGERIA  }
  HPDF_COUNTRY_DZ = 'DZ';  
{ AMERICAN SAMOA  }
  HPDF_COUNTRY_AS = 'AS';  
{ ANDORRA  }
  HPDF_COUNTRY_AD = 'AD';  
{ ANGOLA  }
  HPDF_COUNTRY_AO = 'AO';  
{ ANGUILLA  }
  HPDF_COUNTRY_AI = 'AI';  
{ ANTARCTICA  }
  HPDF_COUNTRY_AQ = 'AQ';  
{ ANTIGUA AND BARBUDA  }
  HPDF_COUNTRY_AG = 'AG';  
{ ARGENTINA  }
  HPDF_COUNTRY_AR = 'AR';  
{ ARMENIA  }
  HPDF_COUNTRY_AM = 'AM';  
{ ARUBA  }
  HPDF_COUNTRY_AW = 'AW';  
{ AUSTRALIA  }
  HPDF_COUNTRY_AU = 'AU';  
{ AUSTRIA  }
  HPDF_COUNTRY_AT = 'AT';  
{ AZERBAIJAN  }
  HPDF_COUNTRY_AZ = 'AZ';  
{ BAHAMAS  }
  HPDF_COUNTRY_BS = 'BS';  
{ BAHRAIN  }
  HPDF_COUNTRY_BH = 'BH';  
{ BANGLADESH  }
  HPDF_COUNTRY_BD = 'BD';  
{ BARBADOS  }
  HPDF_COUNTRY_BB = 'BB';  
{ BELARUS  }
  HPDF_COUNTRY_BY = 'BY';  
{ BELGIUM  }
  HPDF_COUNTRY_BE = 'BE';  
{ BELIZE  }
  HPDF_COUNTRY_BZ = 'BZ';  
{ BENIN  }
  HPDF_COUNTRY_BJ = 'BJ';  
{ BERMUDA  }
  HPDF_COUNTRY_BM = 'BM';  
{ BHUTAN  }
  HPDF_COUNTRY_BT = 'BT';  
{ BOLIVIA  }
  HPDF_COUNTRY_BO = 'BO';  
{ BOSNIA AND HERZEGOWINA  }
  HPDF_COUNTRY_BA = 'BA';  
{ BOTSWANA  }
  HPDF_COUNTRY_BW = 'BW';  
{ BOUVET ISLAND  }
  HPDF_COUNTRY_BV = 'BV';  
{ BRAZIL  }
  HPDF_COUNTRY_BR = 'BR';  
{ BRITISH INDIAN OCEAN TERRITORY  }
  HPDF_COUNTRY_IO = 'IO';  
{ BRUNEI DARUSSALAM  }
  HPDF_COUNTRY_BN = 'BN';  
{ BULGARIA  }
  HPDF_COUNTRY_BG = 'BG';  
{ BURKINA FASO  }
  HPDF_COUNTRY_BF = 'BF';  
{ BURUNDI  }
  HPDF_COUNTRY_BI = 'BI';  
{ CAMBODIA  }
  HPDF_COUNTRY_KH = 'KH';  
{ CAMEROON  }
  HPDF_COUNTRY_CM = 'CM';  
{ CANADA  }
  HPDF_COUNTRY_CA = 'CA';  
{ CAPE VERDE  }
  HPDF_COUNTRY_CV = 'CV';  
{ CAYMAN ISLANDS  }
  HPDF_COUNTRY_KY = 'KY';  
{ CENTRAL AFRICAN REPUBLIC  }
  HPDF_COUNTRY_CF = 'CF';  
{ CHAD  }
  HPDF_COUNTRY_TD = 'TD';  
{ CHILE  }
  HPDF_COUNTRY_CL = 'CL';  
{ CHINA  }
  HPDF_COUNTRY_CN = 'CN';  
{ CHRISTMAS ISLAND  }
  HPDF_COUNTRY_CX = 'CX';  
{ COCOS (KEELING) ISLANDS  }
  HPDF_COUNTRY_CC = 'CC';  
{ COLOMBIA  }
  HPDF_COUNTRY_CO = 'CO';  
{ COMOROS  }
  HPDF_COUNTRY_KM = 'KM';  
{ CONGO  }
  HPDF_COUNTRY_CG = 'CG';  
{ COOK ISLANDS  }
  HPDF_COUNTRY_CK = 'CK';  
{ COSTA RICA  }
  HPDF_COUNTRY_CR = 'CR';  
{ COTE D'IVOIRE  }
  HPDF_COUNTRY_CI = 'CI';  
{ CROATIA (local name: Hrvatska)  }
  HPDF_COUNTRY_HR = 'HR';  
{ CUBA  }
  HPDF_COUNTRY_CU = 'CU';  
{ CYPRUS  }
  HPDF_COUNTRY_CY = 'CY';  
{ CZECH REPUBLIC  }
  HPDF_COUNTRY_CZ = 'CZ';  
{ DENMARK  }
  HPDF_COUNTRY_DK = 'DK';  
{ DJIBOUTI  }
  HPDF_COUNTRY_DJ = 'DJ';  
{ DOMINICA  }
  HPDF_COUNTRY_DM = 'DM';  
{ DOMINICAN REPUBLIC  }
  HPDF_COUNTRY_DO = 'DO';  
{ EAST TIMOR  }
  HPDF_COUNTRY_TP = 'TP';  
{ ECUADOR  }
  HPDF_COUNTRY_EC = 'EC';  
{ EGYPT  }
  HPDF_COUNTRY_EG = 'EG';  
{ EL SALVADOR  }
  HPDF_COUNTRY_SV = 'SV';  
{ EQUATORIAL GUINEA  }
  HPDF_COUNTRY_GQ = 'GQ';  
{ ERITREA  }
  HPDF_COUNTRY_ER = 'ER';  
{ ESTONIA  }
  HPDF_COUNTRY_EE = 'EE';  
{ ETHIOPIA  }
  HPDF_COUNTRY_ET = 'ET';  
{ FALKLAND ISLANDS (MALVINAS)  }
  HPDF_COUNTRY_FK = 'FK';  
{ FAROE ISLANDS  }
  HPDF_COUNTRY_FO = 'FO';  
{ FIJI  }
  HPDF_COUNTRY_FJ = 'FJ';  
{ FINLAND  }
  HPDF_COUNTRY_FI = 'FI';  
{ FRANCE  }
  HPDF_COUNTRY_FR = 'FR';  
{ FRANCE, METROPOLITAN  }
  HPDF_COUNTRY_FX = 'FX';  
{ FRENCH GUIANA  }
  HPDF_COUNTRY_GF = 'GF';  
{ FRENCH POLYNESIA  }
  HPDF_COUNTRY_PF = 'PF';  
{ FRENCH SOUTHERN TERRITORIES  }
  HPDF_COUNTRY_TF = 'TF';  
{ GABON  }
  HPDF_COUNTRY_GA = 'GA';  
{ GAMBIA  }
  HPDF_COUNTRY_GM = 'GM';  
{ GEORGIA  }
  HPDF_COUNTRY_GE = 'GE';  
{ GERMANY  }
  HPDF_COUNTRY_DE = 'DE';  
{ GHANA  }
  HPDF_COUNTRY_GH = 'GH';  
{ GIBRALTAR  }
  HPDF_COUNTRY_GI = 'GI';  
{ GREECE  }
  HPDF_COUNTRY_GR = 'GR';  
{ GREENLAND  }
  HPDF_COUNTRY_GL = 'GL';  
{ GRENADA  }
  HPDF_COUNTRY_GD = 'GD';  
{ GUADELOUPE  }
  HPDF_COUNTRY_GP = 'GP';  
{ GUAM  }
  HPDF_COUNTRY_GU = 'GU';  
{ GUATEMALA  }
  HPDF_COUNTRY_GT = 'GT';  
{ GUINEA  }
  HPDF_COUNTRY_GN = 'GN';  
{ GUINEA-BISSAU  }
  HPDF_COUNTRY_GW = 'GW';  
{ GUYANA  }
  HPDF_COUNTRY_GY = 'GY';  
{ HAITI  }
  HPDF_COUNTRY_HT = 'HT';  
{ HEARD AND MC DONALD ISLANDS  }
  HPDF_COUNTRY_HM = 'HM';  
{ HONDURAS  }
  HPDF_COUNTRY_HN = 'HN';  
{ HONG KONG  }
  HPDF_COUNTRY_HK = 'HK';  
{ HUNGARY  }
  HPDF_COUNTRY_HU = 'HU';  
{ ICELAND  }
  HPDF_COUNTRY_IS = 'IS';  
{ INDIA  }
  HPDF_COUNTRY_IN = 'IN';  
{ INDONESIA  }
  HPDF_COUNTRY_ID = 'ID';  
{ IRAN (ISLAMIC REPUBLIC OF)  }
  HPDF_COUNTRY_IR = 'IR';  
{ IRAQ  }
  HPDF_COUNTRY_IQ = 'IQ';  
{ IRELAND  }
  HPDF_COUNTRY_IE = 'IE';  
{ ISRAEL  }
  HPDF_COUNTRY_IL = 'IL';  
{ ITALY  }
  HPDF_COUNTRY_IT = 'IT';  
{ JAMAICA  }
  HPDF_COUNTRY_JM = 'JM';  
{ JAPAN  }
  HPDF_COUNTRY_JP = 'JP';  
{ JORDAN  }
  HPDF_COUNTRY_JO = 'JO';  
{ KAZAKHSTAN  }
  HPDF_COUNTRY_KZ = 'KZ';  
{ KENYA  }
  HPDF_COUNTRY_KE = 'KE';  
{ KIRIBATI  }
  HPDF_COUNTRY_KI = 'KI';  
{ KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF  }
  HPDF_COUNTRY_KP = 'KP';  
{ KOREA, REPUBLIC OF  }
  HPDF_COUNTRY_KR = 'KR';  
{ KUWAIT  }
  HPDF_COUNTRY_KW = 'KW';  
{ KYRGYZSTAN  }
  HPDF_COUNTRY_KG = 'KG';  
{ LAO PEOPLE'S DEMOCRATIC REPUBLIC  }
  HPDF_COUNTRY_LA = 'LA';  
{ LATVIA  }
  HPDF_COUNTRY_LV = 'LV';  
{ LEBANON  }
  HPDF_COUNTRY_LB = 'LB';  
{ LESOTHO  }
  HPDF_COUNTRY_LS = 'LS';  
{ LIBERIA  }
  HPDF_COUNTRY_LR = 'LR';  
{ LIBYAN ARAB JAMAHIRIYA  }
  HPDF_COUNTRY_LY = 'LY';  
{ LIECHTENSTEIN  }
  HPDF_COUNTRY_LI = 'LI';  
{ LITHUANIA  }
  HPDF_COUNTRY_LT = 'LT';  
{ LUXEMBOURG  }
  HPDF_COUNTRY_LU = 'LU';  
{ MACAU  }
  HPDF_COUNTRY_MO = 'MO';  
{ MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF  }
  HPDF_COUNTRY_MK = 'MK';  
{ MADAGASCAR  }
  HPDF_COUNTRY_MG = 'MG';  
{ MALAWI  }
  HPDF_COUNTRY_MW = 'MW';  
{ MALAYSIA  }
  HPDF_COUNTRY_MY = 'MY';  
{ MALDIVES  }
  HPDF_COUNTRY_MV = 'MV';  
{ MALI  }
  HPDF_COUNTRY_ML = 'ML';  
{ MALTA  }
  HPDF_COUNTRY_MT = 'MT';  
{ MARSHALL ISLANDS  }
  HPDF_COUNTRY_MH = 'MH';  
{ MARTINIQUE  }
  HPDF_COUNTRY_MQ = 'MQ';  
{ MAURITANIA  }
  HPDF_COUNTRY_MR = 'MR';  
{ MAURITIUS  }
  HPDF_COUNTRY_MU = 'MU';  
{ MAYOTTE  }
  HPDF_COUNTRY_YT = 'YT';  
{ MEXICO  }
  HPDF_COUNTRY_MX = 'MX';  
{ MICRONESIA, FEDERATED STATES OF  }
  HPDF_COUNTRY_FM = 'FM';  
{ MOLDOVA, REPUBLIC OF  }
  HPDF_COUNTRY_MD = 'MD';  
{ MONACO  }
  HPDF_COUNTRY_MC = 'MC';  
{ MONGOLIA  }
  HPDF_COUNTRY_MN = 'MN';  
{ MONTSERRAT  }
  HPDF_COUNTRY_MS = 'MS';  
{ MOROCCO  }
  HPDF_COUNTRY_MA = 'MA';  
{ MOZAMBIQUE  }
  HPDF_COUNTRY_MZ = 'MZ';  
{ MYANMAR  }
  HPDF_COUNTRY_MM = 'MM';  
{ NAMIBIA  }
  HPDF_COUNTRY_NA = 'NA';  
{ NAURU  }
  HPDF_COUNTRY_NR = 'NR';  
{ NEPAL  }
  HPDF_COUNTRY_NP = 'NP';  
{ NETHERLANDS  }
  HPDF_COUNTRY_NL = 'NL';  
{ NETHERLANDS ANTILLES  }
  HPDF_COUNTRY_AN = 'AN';  
{ NEW CALEDONIA  }
  HPDF_COUNTRY_NC = 'NC';  
{ NEW ZEALAND  }
  HPDF_COUNTRY_NZ = 'NZ';  
{ NICARAGUA  }
  HPDF_COUNTRY_NI = 'NI';  
{ NIGER  }
  HPDF_COUNTRY_NE = 'NE';  
{ NIGERIA  }
  HPDF_COUNTRY_NG = 'NG';  
{ NIUE  }
  HPDF_COUNTRY_NU = 'NU';  
{ NORFOLK ISLAND  }
  HPDF_COUNTRY_NF = 'NF';  
{ NORTHERN MARIANA ISLANDS  }
  HPDF_COUNTRY_MP = 'MP';  
{ NORWAY  }
  HPDF_COUNTRY_NO = 'NO';  
{ OMAN  }
  HPDF_COUNTRY_OM = 'OM';  
{ PAKISTAN  }
  HPDF_COUNTRY_PK = 'PK';  
{ PALAU  }
  HPDF_COUNTRY_PW = 'PW';  
{ PANAMA  }
  HPDF_COUNTRY_PA = 'PA';  
{ PAPUA NEW GUINEA  }
  HPDF_COUNTRY_PG = 'PG';  
{ PARAGUAY  }
  HPDF_COUNTRY_PY = 'PY';  
{ PERU  }
  HPDF_COUNTRY_PE = 'PE';  
{ PHILIPPINES  }
  HPDF_COUNTRY_PH = 'PH';  
{ PITCAIRN  }
  HPDF_COUNTRY_PN = 'PN';  
{ POLAND  }
  HPDF_COUNTRY_PL = 'PL';  
{ PORTUGAL  }
  HPDF_COUNTRY_PT = 'PT';  
{ PUERTO RICO  }
  HPDF_COUNTRY_PR = 'PR';  
{ QATAR  }
  HPDF_COUNTRY_QA = 'QA';  
{ REUNION  }
  HPDF_COUNTRY_RE = 'RE';  
{ ROMANIA  }
  HPDF_COUNTRY_RO = 'RO';  
{ RUSSIAN FEDERATION  }
  HPDF_COUNTRY_RU = 'RU';  
{ RWANDA  }
  HPDF_COUNTRY_RW = 'RW';  
{ SAINT KITTS AND NEVIS  }
  HPDF_COUNTRY_KN = 'KN';  
{ SAINT LUCIA  }
  HPDF_COUNTRY_LC = 'LC';  
{ SAINT VINCENT AND THE GRENADINES  }
  HPDF_COUNTRY_VC = 'VC';  
{ SAMOA  }
  HPDF_COUNTRY_WS = 'WS';  
{ SAN MARINO  }
  HPDF_COUNTRY_SM = 'SM';  
{ SAO TOME AND PRINCIPE  }
  HPDF_COUNTRY_ST = 'ST';  
{ SAUDI ARABIA  }
  HPDF_COUNTRY_SA = 'SA';  
{ SENEGAL  }
  HPDF_COUNTRY_SN = 'SN';  
{ SEYCHELLES  }
  HPDF_COUNTRY_SC = 'SC';  
{ SIERRA LEONE  }
  HPDF_COUNTRY_SL = 'SL';  
{ SINGAPORE  }
  HPDF_COUNTRY_SG = 'SG';  
{ SLOVAKIA (Slovak Republic)  }
  HPDF_COUNTRY_SK = 'SK';  
{ SLOVENIA  }
  HPDF_COUNTRY_SI = 'SI';  
{ SOLOMON ISLANDS  }
  HPDF_COUNTRY_SB = 'SB';  
{ SOMALIA  }
  HPDF_COUNTRY_SO = 'SO';  
{ SOUTH AFRICA  }
  HPDF_COUNTRY_ZA = 'ZA';  
{ SPAIN  }
  HPDF_COUNTRY_ES = 'ES';  
{ SRI LANKA  }
  HPDF_COUNTRY_LK = 'LK';  
{ ST. HELENA  }
  HPDF_COUNTRY_SH = 'SH';  
{ ST. PIERRE AND MIQUELON  }
  HPDF_COUNTRY_PM = 'PM';  
{ SUDAN  }
  HPDF_COUNTRY_SD = 'SD';  
{ SURINAME  }
  HPDF_COUNTRY_SR = 'SR';  
{ SVALBARD AND JAN MAYEN ISLANDS  }
  HPDF_COUNTRY_SJ = 'SJ';  
{ SWAZILAND  }
  HPDF_COUNTRY_SZ = 'SZ';  
{ SWEDEN  }
  HPDF_COUNTRY_SE = 'SE';  
{ SWITZERLAND  }
  HPDF_COUNTRY_CH = 'CH';  
{ SYRIAN ARAB REPUBLIC  }
  HPDF_COUNTRY_SY = 'SY';  
{ TAIWAN, PROVINCE OF CHINA  }
  HPDF_COUNTRY_TW = 'TW';  
{ TAJIKISTAN  }
  HPDF_COUNTRY_TJ = 'TJ';  
{ TANZANIA, UNITED REPUBLIC OF  }
  HPDF_COUNTRY_TZ = 'TZ';  
{ THAILAND  }
  HPDF_COUNTRY_TH = 'TH';  
{ TOGO  }
  HPDF_COUNTRY_TG = 'TG';  
{ TOKELAU  }
  HPDF_COUNTRY_TK = 'TK';  
{ TONGA  }
  HPDF_COUNTRY_TO = 'TO';  
{ TRINIDAD AND TOBAGO  }
  HPDF_COUNTRY_TT = 'TT';  
{ TUNISIA  }
  HPDF_COUNTRY_TN = 'TN';  
{ TURKEY  }
  HPDF_COUNTRY_TR = 'TR';  
{ TURKMENISTAN  }
  HPDF_COUNTRY_TM = 'TM';  
{ TURKS AND CAICOS ISLANDS  }
  HPDF_COUNTRY_TC = 'TC';  
{ TUVALU  }
  HPDF_COUNTRY_TV = 'TV';  
{ UGANDA  }
  HPDF_COUNTRY_UG = 'UG';  
{ UKRAINE  }
  HPDF_COUNTRY_UA = 'UA';  
{ UNITED ARAB EMIRATES  }
  HPDF_COUNTRY_AE = 'AE';  
{ UNITED KINGDOM  }
  HPDF_COUNTRY_GB = 'GB';  
{ UNITED STATES  }
  HPDF_COUNTRY_US = 'US';  
{ UNITED STATES MINOR OUTLYING ISLANDS  }
  HPDF_COUNTRY_UM = 'UM';  
{ URUGUAY  }
  HPDF_COUNTRY_UY = 'UY';  
{ UZBEKISTAN  }
  HPDF_COUNTRY_UZ = 'UZ';  
{ VANUATU  }
  HPDF_COUNTRY_VU = 'VU';  
{ VATICAN CITY STATE (HOLY SEE)  }
  HPDF_COUNTRY_VA = 'VA';  
{ VENEZUELA  }
  HPDF_COUNTRY_VE = 'VE';  
{ VIET NAM  }
  HPDF_COUNTRY_VN = 'VN';  
{ VIRGIN ISLANDS (BRITISH)  }
  HPDF_COUNTRY_VG = 'VG';  
{ VIRGIN ISLANDS (U.S.)  }
  HPDF_COUNTRY_VI = 'VI';  
{ WALLIS AND FUTUNA ISLANDS  }
  HPDF_COUNTRY_WF = 'WF';  
{ WESTERN SAHARA  }
  HPDF_COUNTRY_EH = 'EH';  
{ YEMEN  }
  HPDF_COUNTRY_YE = 'YE';  
{ YUGOSLAVIA  }
  HPDF_COUNTRY_YU = 'YU';  
{ ZAIRE  }
  HPDF_COUNTRY_ZR = 'ZR';  
{ ZAMBIA  }
  HPDF_COUNTRY_ZM = 'ZM';  
{ ZIMBABWE  }
  HPDF_COUNTRY_ZW = 'ZW';  
{---------------------------------------------------------------------------- }
{----- lang code definition ------------------------------------------------- }
{ Afar  }
  HPDF_LANG_AA = 'aa';  
{ Abkhazian  }
  HPDF_LANG_AB = 'ab';  
{ Afrikaans  }
  HPDF_LANG_AF = 'af';  
{ Amharic  }
  HPDF_LANG_AM = 'am';  
{ Arabic  }
  HPDF_LANG_AR = 'ar';  
{ Assamese  }
  HPDF_LANG_AS = 'as';  
{ Aymara  }
  HPDF_LANG_AY = 'ay';  
{ Azerbaijani  }
  HPDF_LANG_AZ = 'az';  
{ Bashkir  }
  HPDF_LANG_BA = 'ba';  
{ Byelorussian  }
  HPDF_LANG_BE = 'be';  
{ Bulgarian  }
  HPDF_LANG_BG = 'bg';  
{ Bihari  }
  HPDF_LANG_BH = 'bh';  
{ Bislama  }
  HPDF_LANG_BI = 'bi';  
{ Bengali Bangla  }
  HPDF_LANG_BN = 'bn';  
{ Tibetan  }
  HPDF_LANG_BO = 'bo';  
{ Breton  }
  HPDF_LANG_BR = 'br';  
{ Catalan  }
  HPDF_LANG_CA = 'ca';  
{ Corsican  }
  HPDF_LANG_CO = 'co';  
{ Czech  }
  HPDF_LANG_CS = 'cs';  
{ Welsh  }
  HPDF_LANG_CY = 'cy';  
{ Danish  }
  HPDF_LANG_DA = 'da';  
{ German  }
  HPDF_LANG_DE = 'de';  
{ Bhutani  }
  HPDF_LANG_DZ = 'dz';  
{ Greek  }
  HPDF_LANG_EL = 'el';  
{ English  }
  HPDF_LANG_EN = 'en';  
{ Esperanto  }
  HPDF_LANG_EO = 'eo';  
{ Spanish  }
  HPDF_LANG_ES = 'es';  
{ Estonian  }
  HPDF_LANG_ET = 'et';  
{ Basque  }
  HPDF_LANG_EU = 'eu';  
{ Persian  }
  HPDF_LANG_FA = 'fa';  
{ Finnish  }
  HPDF_LANG_FI = 'fi';  
{ Fiji  }
  HPDF_LANG_FJ = 'fj';  
{ Faeroese  }
  HPDF_LANG_FO = 'fo';  
{ French  }
  HPDF_LANG_FR = 'fr';  
{ Frisian  }
  HPDF_LANG_FY = 'fy';  
{ Irish  }
  HPDF_LANG_GA = 'ga';  
{ Scots Gaelic  }
  HPDF_LANG_GD = 'gd';  
{ Galician  }
  HPDF_LANG_GL = 'gl';  
{ Guarani  }
  HPDF_LANG_GN = 'gn';  
{ Gujarati  }
  HPDF_LANG_GU = 'gu';  
{ Hausa  }
  HPDF_LANG_HA = 'ha';  
{ Hindi  }
  HPDF_LANG_HI = 'hi';  
{ Croatian  }
  HPDF_LANG_HR = 'hr';  
{ Hungarian  }
  HPDF_LANG_HU = 'hu';  
{ Armenian  }
  HPDF_LANG_HY = 'hy';  
{ Interlingua  }
  HPDF_LANG_IA = 'ia';  
{ Interlingue  }
  HPDF_LANG_IE = 'ie';  
{ Inupiak  }
  HPDF_LANG_IK = 'ik';  
{ Indonesian  }
  HPDF_LANG_IN = 'in';  
{ Icelandic  }
  HPDF_LANG_IS = 'is';  
{ Italian  }
  HPDF_LANG_IT = 'it';  
{ Hebrew  }
  HPDF_LANG_IW = 'iw';  
{ Japanese  }
  HPDF_LANG_JA = 'ja';  
{ Yiddish  }
  HPDF_LANG_JI = 'ji';  
{ Javanese  }
  HPDF_LANG_JW = 'jw';  
{ Georgian  }
  HPDF_LANG_KA = 'ka';  
{ Kazakh  }
  HPDF_LANG_KK = 'kk';  
{ Greenlandic  }
  HPDF_LANG_KL = 'kl';  
{ Cambodian  }
  HPDF_LANG_KM = 'km';  
{ Kannada  }
  HPDF_LANG_KN = 'kn';  
{ Korean  }
  HPDF_LANG_KO = 'ko';  
{ Kashmiri  }
  HPDF_LANG_KS = 'ks';  
{ Kurdish  }
  HPDF_LANG_KU = 'ku';  
{ Kirghiz  }
  HPDF_LANG_KY = 'ky';  
{ Latin  }
  HPDF_LANG_LA = 'la';  
{ Lingala  }
  HPDF_LANG_LN = 'ln';  
{ Laothian  }
  HPDF_LANG_LO = 'lo';  
{ Lithuanian  }
  HPDF_LANG_LT = 'lt';  
{ Latvian,Lettish  }
  HPDF_LANG_LV = 'lv';  
{ Malagasy  }
  HPDF_LANG_MG = 'mg';  
{ Maori  }
  HPDF_LANG_MI = 'mi';  
{ Macedonian  }
  HPDF_LANG_MK = 'mk';  
{ Malayalam  }
  HPDF_LANG_ML = 'ml';  
{ Mongolian  }
  HPDF_LANG_MN = 'mn';  
{ Moldavian  }
  HPDF_LANG_MO = 'mo';  
{ Marathi  }
  HPDF_LANG_MR = 'mr';  
{ Malay  }
  HPDF_LANG_MS = 'ms';  
{ Maltese  }
  HPDF_LANG_MT = 'mt';  
{ Burmese  }
  HPDF_LANG_MY = 'my';  
{ Nauru  }
  HPDF_LANG_NA = 'na';  
{ Nepali  }
  HPDF_LANG_NE = 'ne';  
{ Dutch  }
  HPDF_LANG_NL = 'nl';  
{ Norwegian  }
  HPDF_LANG_NO = 'no';  
{ Occitan  }
  HPDF_LANG_OC = 'oc';  
{ (Afan)Oromo  }
  HPDF_LANG_OM = 'om';  
{ Oriya  }
  HPDF_LANG_OR = 'or';  
{ Punjabi  }
  HPDF_LANG_PA = 'pa';  
{ Polish  }
  HPDF_LANG_PL = 'pl';  
{ Pashto,Pushto  }
  HPDF_LANG_PS = 'ps';  
{ Portuguese   }
  HPDF_LANG_PT = 'pt';  
{ Quechua  }
  HPDF_LANG_QU = 'qu';  
{ Rhaeto-Romance  }
  HPDF_LANG_RM = 'rm';  
{ Kirundi  }
  HPDF_LANG_RN = 'rn';  
{ Romanian  }
  HPDF_LANG_RO = 'ro';  
{ Russian  }
  HPDF_LANG_RU = 'ru';  
{ Kinyarwanda  }
  HPDF_LANG_RW = 'rw';  
{ Sanskrit  }
  HPDF_LANG_SA = 'sa';  
{ Sindhi  }
  HPDF_LANG_SD = 'sd';  
{ Sangro  }
  HPDF_LANG_SG = 'sg';  
{ Serbo-Croatian  }
  HPDF_LANG_SH = 'sh';  
{ Singhalese  }
  HPDF_LANG_SI = 'si';  
{ Slovak  }
  HPDF_LANG_SK = 'sk';  
{ Slovenian  }
  HPDF_LANG_SL = 'sl';  
{ Samoan  }
  HPDF_LANG_SM = 'sm';  
{ Shona  }
  HPDF_LANG_SN = 'sn';  
{ Somali  }
  HPDF_LANG_SO = 'so';  
{ Albanian  }
  HPDF_LANG_SQ = 'sq';  
{ Serbian  }
  HPDF_LANG_SR = 'sr';  
{ Siswati  }
  HPDF_LANG_SS = 'ss';  
{ Sesotho  }
  HPDF_LANG_ST = 'st';  
{ Sundanese  }
  HPDF_LANG_SU = 'su';  
{ Swedish  }
  HPDF_LANG_SV = 'sv';  
{ Swahili  }
  HPDF_LANG_SW = 'sw';  
{ Tamil  }
  HPDF_LANG_TA = 'ta';  
{ Tegulu  }
  HPDF_LANG_TE = 'te';  
{ Tajik  }
  HPDF_LANG_TG = 'tg';  
{ Thai  }
  HPDF_LANG_TH = 'th';  
{ Tigrinya  }
  HPDF_LANG_TI = 'ti';  
{ Turkmen  }
  HPDF_LANG_TK = 'tk';  
{ Tagalog  }
  HPDF_LANG_TL = 'tl';  
{ Setswanato Tonga  }
  HPDF_LANG_TN = 'tn';  
{ Turkish  }
  HPDF_LANG_TR = 'tr';  
{ Tsonga  }
  HPDF_LANG_TS = 'ts';  
{ Tatar  }
  HPDF_LANG_TT = 'tt';  
{ Twi  }
  HPDF_LANG_TW = 'tw';  
{ Ukrainian  }
  HPDF_LANG_UK = 'uk';  
{ Urdu  }
  HPDF_LANG_UR = 'ur';  
{ Uzbek  }
  HPDF_LANG_UZ = 'uz';  
{ Vietnamese  }
  HPDF_LANG_VI = 'vi';  
{ Volapuk  }
  HPDF_LANG_VO = 'vo';  
{ Wolof  }
  HPDF_LANG_WO = 'wo';  
{ Xhosa  }
  HPDF_LANG_XH = 'xh';  
{ Yoruba  }
  HPDF_LANG_YO = 'yo';  
{ Chinese  }
  HPDF_LANG_ZH = 'zh';  
{ Zulu  }
  HPDF_LANG_ZU = 'zu';  
{---------------------------------------------------------------------------- }
{----- Graphics mode -------------------------------------------------------- }
  HPDF_GMODE_PAGE_DESCRIPTION = $0001;  
  HPDF_GMODE_PATH_OBJECT = $0002;  
  HPDF_GMODE_TEXT_OBJECT = $0004;  
  HPDF_GMODE_CLIPPING_PATH = $0008;  
  HPDF_GMODE_SHADING = $0010;  
  HPDF_GMODE_INLINE_IMAGE = $0020;  
  HPDF_GMODE_EXTERNAL_OBJECT = $0040;  
{---------------------------------------------------------------------------- }
{$endif}
{ _HPDF_CONSTS_H  }

// === Konventiert am: 28-1-26 13:59:58 ===


implementation



end.
