
unit jbclass;
interface

{
  Automatically converted by H2Pas 1.0.0 from jbclass.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    jbclass.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PJbClasser  = ^JbClasser;
PJbData  = ^JbData;
PL_DnaHash  = ^L_DnaHash;
PNuma  = ^Numa;
PPix  = ^Pix;
PPixa  = ^Pixa;
PPixaa  = ^Pixaa;
PPta  = ^Pta;
PSarray  = ^Sarray;
Pxxxxxxxxxx  = ^xxxxxxxxxx;
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
{$ifndef  LEPTONICA_JBCLASS_H}
{$define LEPTONICA_JBCLASS_H}
{!
 * \file jbclass.h
 *
 *       JbClasser
 *       JbData
  }
{!
     * <pre>
     * The JbClasser struct holds all the data accumulated during the
     * classification process that can be used for a compressed
     * jbig2-type representation of a set of images.  This is created
     * in an initialization process and added to as the selected components
     * on each successive page are analyzed.
     * </pre>
      }
{!< input page image file names           }
{!< JB_RANKHAUS, JB_CORRELATION           }
{!< JB_CONN_COMPS, JB_CHARACTERS or       }
{!< JB_WORDS                              }
{!< max component width allowed           }
{!< max component height allowed          }
{!< number of pages already processed     }
{!< number components already processed   }
{!< on fully processed pages              }
{!< number of components on each page     }
{!< size of square struct elem for haus   }
{!< rank val of haus match, each way      }
{!< thresh value for correlation score    }
{!< corrects thresh value for heaver      }
{!< components; use 0 for no correction   }
{!< w * h of each template, without       }
{!< extra border pixels                   }
{!< max width of original src images      }
{!< max height of original src images     }
{!< current number of classes             }
{!< If zero, pixaa isn't filled           }
{!< instances for each class; unbordered  }
{!< templates for each class; bordered    }
{!< and not dilated                       }
{!< templates for each class; bordered    }
{!< and dilated                           }
{!< Hash table to find templates by size  }
{!< fg areas of undilated templates;      }
{!< only used for rank < 1.0              }
{!< centroids of all bordered cc          }
{!< centroids of all bordered template cc  }
{!< array of class ids for each component  }
{!< array of page nums for each component  }
{!< array of UL corners at which the      }
{!< template is to be placed for each     }
{!< component                             }
{!< similar to ptaul, but for LL corners  }
type
  PJbClasser = ^TJbClasser;
  TJbClasser = record
      safiles : PSarray;
      method : Tl_int32;
      components : Tl_int32;
      maxwidth : Tl_int32;
      maxheight : Tl_int32;
      npages : Tl_int32;
      baseindex : Tl_int32;
      nacomps : PNuma;
      sizehaus : Tl_int32;
      rankhaus : Tl_float32;
      thresh : Tl_float32;
      weightfactor : Tl_float32;
      naarea : PNuma;
      w : Tl_int32;
      h : Tl_int32;
      nclass : Tl_int32;
      keep_pixaa : Tl_int32;
      pixaa : PPixaa;
      pixat : PPixa;
      pixatd : PPixa;
      dahash : PL_DnaHash;
      nafgt : PNuma;
      ptac : PPta;
      ptact : PPta;
      naclass : PNuma;
      napage : PNuma;
      ptaul : PPta;
      ptall : PPta;
    end;

{!
     * <pre>
     * The JbData struct holds all the data required for
     * the compressed jbig-type representation of a set of images.
     * The data can be written to file, read back, and used
     * to regenerate an approximate version of the original,
     * which differs in two ways from the original:
     *   (1) It uses a template image for each c.c. instead of the
     *       original instance, for each occurrence on each page.
     *   (2) It discards components with either a height or width larger
     *       than the maximuma, given here by the lattice dimensions
     *       used for storing the templates.
     * </pre>
      }
{!< template composite for all classes     }
{!< number of pages                        }
{!< max width of original page images      }
{!< max height of original page images     }
{!< number of classes                      }
{!< lattice width for template composite   }
{!< lattice height for template composite  }
{!< array of class ids for each component  }
{!< array of page nums for each component  }
{!< array of UL corners at which the       }
{!< template is to be placed for each      }
{!< component                              }
  PJbData = ^TJbData;
  TJbData = record
      pix : PPix;
      npages : Tl_int32;
      w : Tl_int32;
      h : Tl_int32;
      nclass : Tl_int32;
      latticew : Tl_int32;
      latticeh : Tl_int32;
      naclass : PNuma;
      napage : PNuma;
      ptaul : PPta;
    end;

{! JB Classifier  }
  Txxxxxxxxxx =  Longint;
  Const
    JB_RANKHAUS = 0;
    JB_CORRELATION = 1;

{! For jbGetComponents(): type of component to extract from images  }
{! JB Component  }
type
  Txxxxxxxxxx =  Longint;
  Const
    JB_CONN_COMPS = 0;
    JB_CHARACTERS = 1;
    JB_WORDS = 2;

{! These parameters are used for naming the two files
     * in which the jbig2-like compressed data is stored.   }
  JB_TEMPLATE_EXT = '.templates.png';  
  JB_DATA_EXT = '.data';  
{$endif}
{ LEPTONICA_JBCLASS_H  }

implementation


end.
