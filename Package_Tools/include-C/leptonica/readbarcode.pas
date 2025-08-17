unit readbarcode;

interface

uses
  fp_lept;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{====================================================================*
 -  Copyright (C) 2001 Leptonica.  All rights reserved.
 -
 -  Redistribution and use in source and binary forms, with or without
 -  modification, are permitted provided that the following conditions
 -  are met:
 -  1. Redistributions of source code must retain the above copyright
 -     notice, this list of conditions and the following disclaimer.
 -  2. Redistributions in binary form must reproduce the above
 -     copyright notice, this list of conditions and the following
 -     disclaimer in the documentation and/or other materials
 -     provided with the distribution.
 -
 -  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 -  ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 -  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 -  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL ANY
 -  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 -  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 -  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 -  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 -  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 -  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 -  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *==================================================================== }
{$ifndef  LEPTONICA_READBARCODE_H}
{$define LEPTONICA_READBARCODE_H}
{ ----------------------------------------------------------------- *
     *            Flags for method of extracting barcode widths          *
     * -----------------------------------------------------------------  }
{! Barcode Method  }
{!< use histogram of barcode widths            }
{!< find best window for decoding transitions  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_USE_WIDTHS = 1;
    L_USE_WINDOWS = 2;

{ ----------------------------------------------------------------- *
     *                     Flags for barcode formats                     *
     * These are used both to identify a barcode format and to identify  *
     * the decoding method to use on a barcode.                          *
     * -----------------------------------------------------------------  }
{! Barcode Format  }
{!< unknown format                             }
{!< try decoding with all known formats        }
{!< decode with Code128 format                 }
{!< decode with EAN8 format                    }
{!< decode with EAN13 format                   }
{!< decode with Code 2 of 5 format             }
{!< decode with Interleaved 2 of 5 format      }
{!< decode with Code39 format                  }
{!< decode with Code93 format                  }
{!< decode with Code93 format                  }
{!< decode with UPC A format                   }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_BF_UNKNOWN = 0;
    L_BF_ANY = 1;
    L_BF_CODE128 = 2;
    L_BF_EAN8 = 3;
    L_BF_EAN13 = 4;
    L_BF_CODE2OF5 = 5;
    L_BF_CODEI2OF5 = 6;
    L_BF_CODE39 = 7;
    L_BF_CODE93 = 8;
    L_BF_CODABAR = 9;
    L_BF_UPCA = 10;

{ ----------------------------------------------------------------- *
     *                  Currently supported formats                      *
     *            Update these arrays as new formats are added.          *
     * -----------------------------------------------------------------  }
{ xxxxxxxxxxxxxxxxxxxxxxx
static const l_int32  SupportedBarcodeFormat[] = 
    L_BF_CODE2OF5,
    L_BF_CODEI2OF5,
    L_BF_CODE93,
    L_BF_CODE39,
    L_BF_CODABAR,
    L_BF_UPCA,
    L_BF_EAN13
;

static const char  *SupportedBarcodeFormatName[] = 
    "Code2of5",
    "CodeI2of5",
    "Code93",
    "Code39",
    "Codabar",
    "Upca",
    "Ean13"
;
static const l_int32  NumSupportedBarcodeFormats = 7; 


static const char *Code2of5[] = 
    "111121211", "211111112", "112111112", "212111111",   
    "111121112", "211121111", "112121111", "111111212",   
    "211111211", "112111211",                             
    "21211", "21112"                                      
;

static const l_int32  C25_START = 10;
static const l_int32  C25_STOP =  11;


static const char *CodeI2of5[] = 
    "11221", "21112", "12112", "22111", "11212",    
    "21211", "12211", "11122", "21121", "12121",    
    "1111", "211"                                   
;

static const l_int32  CI25_START = 10;
static const l_int32  CI25_STOP =  11;


static const char *Code93[] = 
    "131112", "111213", "111312", "111411", "121113", 
    "121212", "121311", "111114", "131211", "141111", 
    "211113", "211212", "211311", "221112", "221211", 
    "231111", "112113", "112212", "112311", "122112", 
    "132111", "111123", "111222", "111321", "121122", 
    "131121", "212112", "212211", "211122", "211221", 
    "221121", "222111", "112122", "112221", "122121", 
    "123111", "121131", "311112", "311211", "321111", 
    "112131", "113121", "211131", "131221", "312111", 
    "311121", "122211", "111141"                      
;

static const char Code93Val[] =
    "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%[]#";

static const l_int32  C93_START = 47;
static const l_int32  C93_STOP =  47;


static const char *Code39[] = 
    "111221211", "211211112", "112211112", "212211111",  
    "111221112", "211221111", "112221111", "111211212", 
    "211211211", "112211211", "211112112", "112112112", 
    "212112111", "111122112", "211122111", "112122111", 
    "111112212", "211112211", "112112211", "111122211", 
    "211111122", "112111122", "212111121", "111121122", 
    "211121121", "112121121", "111111222", "211111221", 
    "112111221", "111121221", "221111112", "122111112", 
    "222111111", "121121112", "221121111", "122121111", 
    "121111212", "221111211", "122111211", "121212111", 
    "121211121", "121112121", "111212121", "121121211"  
;

static const char Code39Val[] =
    "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%*";

static const l_int32  C39_START = 43;
static const l_int32  C39_STOP =  43;


static const char *Codabar[] = 
    "1111122", "1111221", "1112112", "2211111", "1121121", 
    "2111121", "1211112", "1211211", "1221111", "2112111", 
    "1112211", "1122111", "2111212", "2121112", "2121211", 
    "1121212", "1122121", "1212112", "1112122", "1112221"  
;

static const char CodabarVal[] = "0123456789-$:/.+ABCD";


static const char *Upca[] = 
    "3211", "2221", "2122", "1411", "1132",  
    "1231", "1114", "1312", "1213", "3112",  
    "111", "111", "11111"                    
;

static const l_int32  UPCA_START = 10;
static const l_int32  UPCA_STOP =  11;
static const l_int32  UPCA_MID =   12;


static const char *Code128[] = 
    "212222", "222122", "222221", "121223", "121322",  
    "131222", "122213", "122312", "132212", "221213",  
    "221312", "231212", "112232", "122132", "122231",  
    "113222", "123122", "123221", "223211", "221132",  
    "221231", "213212", "223112", "312131", "311222",  
    "321122", "321221", "312212", "322112", "322211",  
    "212123", "212321", "232121", "111323", "131123",  
    "131321", "112313", "132113", "132311", "211313",  
    "231113", "231311", "112133", "112331", "132131",  
    "113123", "113321", "133121", "313121", "211331",    
    "231131", "213113", "213311", "213131", "311123",    
    "311321", "331121", "312113", "312311", "332111",    
    "314111", "221411", "431111", "111224", "111422",    
    "121124", "121421", "141122", "141221", "112214",    
    "112412", "122114", "122411", "142112", "142211",    
    "241211", "221114", "413111", "241112", "134111",    
    "111242", "121142", "121241", "114212", "124112",    
    "124211", "411212", "421112", "421211", "212141",    
    "214121", "412121", "111143", "111341", "131141",    
    "114113", "114311", "411113", "411311", "113141",    
    "114131", "311141", "411131", "211412", "211214",    
    "211232", "2331112"                                  
;

static const l_int32  C128_FUN_3 =    96;   
static const l_int32  C128_FUNC_2 =   97;   
static const l_int32  C128_SHIFT =    98;   
static const l_int32  C128_GOTO_C =   99;   
static const l_int32  C128_GOTO_B =  100;
static const l_int32  C128_GOTO_A =  101;
static const l_int32  C128_FUNC_1 =  102;
static const l_int32  C128_START_A = 103;
static const l_int32  C128_START_B = 104;
static const l_int32  C128_START_C = 105;
static const l_int32  C128_STOP =    106;
static const l_int32  C128_SYMBOL_WIDTH = 11;

 }
{$endif}
{ LEPTONICA_READBARCODE_H  }

// === Konventiert am: 17-8-25 13:40:31 ===


implementation



end.
