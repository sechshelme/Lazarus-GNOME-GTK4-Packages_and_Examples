unit recog;

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
{$ifndef  LEPTONICA_RECOG_H}
{$define LEPTONICA_RECOG_H}
{!
 * \file recog.h
 *
 * <pre>
 *     This is a simple utility for training and recognizing individual
 *     machine-printed text characters.  It is designed to be adapted
 *     to a particular set of character images; e.g., from a book.
 *
 *     There are two methods of training the recognizer.  In the most
 *     simple, a set of bitmaps has been labeled by some means, such
 *     a generic OCR program.  This is input either one template at a time
 *     or as a pixa of templates, to a function that creates a recog.
 *     If in a pixa, the text string label must be embedded in the
 *     text field of each pix.
 *
 *     If labeled data is not available, we start with a bootstrap
 *     recognizer (BSR) that has labeled data from a variety of sources.
 *     These images are scaled, typically to a fixed height, and then
 *     fed similarly scaled unlabeled images from the source (e.g., book),
 *     and the BSR attempts to identify them.  All images that have
 *     a high enough correlation score with one of the templates in the
 *     BSR are emitted in a pixa, which now holds unscaled and labeled
 *     templates from the source.  This is the generator for a book adapted
 *     recognizer (BAR).
 *
 *     The pixa should always be thought of as the primary structure.
 *     It is the generator for the recog, because a recog is built
 *     from a pixa of unscaled images.
 *
 *     New image templates can be added to a recog as long as it is
 *     in training mode.  Once training is finished, to add templates
 *     it is necessary to extract the generating pixa, add templates
 *     to that pixa, and make a new recog.  Similarly, we do not
 *     join two recog; instead, we simply join their generating pixa,
 *     and make a recog from that.
 *
 *     To remove outliers from a pixa of labeled pix, make a recog,
 *     determine the outliers, and generate a new pixa with the
 *     outliers removed.  The outliers are determined by building
 *     special templates for each character set that are scaled averages
 *     of the individual templates.  Then a correlation score is found
 *     between each template and the averaged templates.  There are
 *     two implementations; outliers are determined as either:
 *      (1) a template having a correlation score with its class average
 *          that is below a threshold, or
 *      (2) a template having a correlation score with its class average
 *          that is smaller than the correlation score with the average
 *          of another class.
 *     Outliers are removed from the generating pixa.  Scaled averaging
 *     is only performed for determining outliers and for splitting
 *     characters; it is never used in a trained recognizer for identifying
 *     unlabeled samples.
 *
 *     Two methods using averaged templates are provided for splitting
 *     touching characters:
 *      (1) greedy matching
 *      (2) document image decoding (DID)
 *     The DID method is the default.  It is about 5x faster and
 *     possibly more accurate.
 *
 *     Once a BAR has been made, unlabeled sample images are identified
 *     by finding the individual template in the BAR with highest
 *     correlation.  The input images and images in the BAR can be
 *     represented in two ways:
 *      (1) as scanned, binarized to 1 bpp
 *      (2) as a width-normalized outline formed by thinning to a
 *          skeleton and then dilating by a fixed amount.
 *
 *     The recog can be serialized to file and read back.  The serialized
 *     version holds the templates used for correlation (which may have
 *     been modified by scaling and turning into lines from the unscaled
 *     templates), plus, for arbitrary character sets, the UTF8
 *     representation and the lookup table mapping from the character
 *     representation to index.
 *
 *     Why do we not use averaged templates for recognition?
 *     Letterforms can take on significantly different shapes (eg.,
 *     the letters 'a' and 'g'), and it makes no sense to average these.
 *     The previous version of this utility allowed multiple recognizers
 *     to exist, but this is an unnecessary complication if recognition
 *     is done on all samples instead of on averages.
 * </pre>
  }

const
  RECOG_VERSION_NUMBER = 2;  
{!< scale all examples to this width;       }
{!< use 0 prevent horizontal scaling        }
{!< scale all examples to this height;      }
{!< use 0 prevent vertical scaling          }
{!< use a value > 0 to convert the bitmap   }
{!< to lines of fixed width; 0 to skip      }
{!< template use: use either the average    }
{!< or all temmplates (L_USE_AVERAGE or     }
{!< L_USE_ALL)                              }
{!< initialize container arrays to this     }
{!< size of character set                   }
{!< for binarizing if depth > 1             }
{!< vertical jiggle on nominal centroid     }
{!< alignment; typically 0 or 1             }
{!< one of L_ARABIC_NUMERALS, etc.          }
{!< expected number of classes in charset   }
{!< min number of samples without padding   }
{!< number of training samples              }
{!< min width averaged unscaled templates   }
{!< max width averaged unscaled templates   }
{!< min height averaged unscaled templates  }
{!< max height averaged unscaled templates  }
{!< min width averaged scaled templates     }
{!< max width averaged scaled templates     }
{!< set to 1 when averaged bitmaps are made  }
{!< set to 1 when training is complete or   }
{!< identification has started              }
{!< max width/height ratio to split         }
{!< max of max/min template height ratio    }
{!< min component width kept in splitting   }
{!< max component height kept in splitting  }
{!< text array for arbitrary char set       }
{!< index-to-char lut for arbitrary charset  }
{!< table for finding centroids             }
{!< table for finding pixel sums            }
{!< all unscaled templates for each class   }
{!< centroids of all unscaled templates     }
{!< area of all unscaled templates          }
{!< all (scaled) templates for each class   }
{!< centroids of all (scaledl) templates    }
{!< area of all (scaled) templates          }
{!< averaged unscaled templates per class   }
{!< centroids of unscaled ave. templates    }
{!< area of unscaled averaged templates     }
{!< averaged (scaled) templates per class   }
{!< centroids of (scaled) ave. templates    }
{!< area of (scaled) averaged templates     }
{!< all input training images               }
{!< unscaled and scaled averaged bitmaps    }
{!< input images for identifying            }
{!< debug: best match of input against ave.  }
{!< debug: best matches within range        }
{!< debug: bootstrap training results       }
{!< debug: splitting results                }
{!< bmf fonts                               }
{!< font size of bmf; default is 6 pt       }
{!< temp data used for image decoding       }
{!< temp data used for holding best char    }
{!< temp data used for array of best chars  }
type
  PL_Recog = ^TL_Recog;
  TL_Recog = record
      scalew : Tl_int32;
      scaleh : Tl_int32;
      linew : Tl_int32;
      templ_use : Tl_int32;
      maxarraysize : Tl_int32;
      setsize : Tl_int32;
      threshold : Tl_int32;
      maxyshift : Tl_int32;
      charset_type : Tl_int32;
      charset_size : Tl_int32;
      min_nopad : Tl_int32;
      num_samples : Tl_int32;
      minwidth_u : Tl_int32;
      maxwidth_u : Tl_int32;
      minheight_u : Tl_int32;
      maxheight_u : Tl_int32;
      minwidth : Tl_int32;
      maxwidth : Tl_int32;
      ave_done : Tl_int32;
      train_done : Tl_int32;
      max_wh_ratio : Tl_float32;
      max_ht_ratio : Tl_float32;
      min_splitw : Tl_int32;
      max_splith : Tl_int32;
      sa_text : PSarray;
      dna_tochar : PL_Dna;
      centtab : Pl_int32;
      sumtab : Pl_int32;
      pixaa_u : PPixaa;
      ptaa_u : PPtaa;
      naasum_u : PNumaa;
      pixaa : PPixaa;
      ptaa : PPtaa;
      naasum : PNumaa;
      pixa_u : PPixa;
      pta_u : PPta;
      nasum_u : PNuma;
      pixa : PPixa;
      pta : PPta;
      nasum : PNuma;
      pixa_tr : PPixa;
      pixadb_ave : PPixa;
      pixa_id : PPixa;
      pixdb_ave : PPix;
      pixdb_range : PPix;
      pixadb_boot : PPixa;
      pixadb_split : PPixa;
      bmf : PL_Bmf;
      bmf_size : Tl_int32;
      did : PL_Rdid;
      rch : PL_Rch;
      rcha : PL_Rcha;
    end;

{!
 *  Data returned from correlation matching on a single character
  }
{!< index of best template                    }
{!< correlation score of best template        }
{!< character string of best template         }
{!< index of best sample (within the best     }
{!< template class, if all samples are used)  }
{!< x-location of template (delx + shiftx)    }
{!< y-location of template (dely + shifty)    }
{!< width of best template                    }
  PL_Rch = ^TL_Rch;
  TL_Rch = record
      index : Tl_int32;
      score : Tl_float32;
      text : Pchar;
      sample : Tl_int32;
      xloc : Tl_int32;
      yloc : Tl_int32;
      width : Tl_int32;
    end;

{!
 *  Data returned from correlation matching on an array of characters
  }
{!< indices of best templates                 }
{!< correlation scores of best templates      }
{!< character strings of best templates       }
{!< indices of best samples                   }
{!< x-locations of templates (delx + shiftx)  }
{!< y-locations of templates (dely + shifty)  }
{!< widths of best templates                  }
  PL_Rcha = ^TL_Rcha;
  TL_Rcha = record
      naindex : PNuma;
      nascore : PNuma;
      satext : PSarray;
      nasample : PNuma;
      naxloc : PNuma;
      nayloc : PNuma;
      nawidth : PNuma;
    end;

{!
 *  Data used for decoding a line of characters.
  }
{!< clone of pix to be decoded              }
{!< count array for each averaged template  }
{!< best y-shift array per average template  }
{!< number of averaged templates            }
{!< size of count array (width of pixs)     }
{!< setwidths for each template             }
{!< pixel count in pixs by column           }
{!< first moment of pixels in pixs by cols  }
{!< 1 if full arrays are made; 0 otherwise  }
{!< channel coeffs for template fg term     }
{!< channel coeffs for bit-and term         }
{!< score on trellis                        }
{!< template on trellis (for backtrack)     }
{!< indices of best path templates          }
{!< x locations of best path templates      }
{!< y locations of best path templates      }
{!< widths of best path templates           }
{!< Viterbi result for splitting input pixs  }
{!< correlation scores: best path templates  }
{!< indices of best rescored templates      }
{!< samples of best scored templates        }
{!< x locations of best rescoredtemplates   }
{!< y locations of best rescoredtemplates   }
{!< widths of best rescoredtemplates        }
{!< correlation scores: rescored templates  }
  PL_Rdid = ^TL_Rdid;
  TL_Rdid = record
      pixs : PPix;
      counta : ^Pl_int32;
      delya : ^Pl_int32;
      narray : Tl_int32;
      size : Tl_int32;
      setwidth : Pl_int32;
      nasum : PNuma;
      namoment : PNuma;
      fullarrays : Tl_int32;
      beta : Pl_float32;
      gamma : Pl_float32;
      trellisscore : Pl_float32;
      trellistempl : Pl_int32;
      natempl : PNuma;
      naxloc : PNuma;
      nadely : PNuma;
      nawidth : PNuma;
      boxa : PBoxa;
      nascore : PNuma;
      natempl_r : PNuma;
      nasample_r : PNuma;
      naxloc_r : PNuma;
      nadely_r : PNuma;
      nawidth_r : PNuma;
      nascore_r : PNuma;
    end;

{-------------------------------------------------------------------------*
 *             Flags for describing limited character sets                 *
 *------------------------------------------------------------------------- }
{! Character Set  }
{!< character set type is not specified       }
{!< 10 digits                                 }
{!< 7 lower-case letters (i,v,x,l,c,d,m)      }
{!< 7 upper-case letters (I,V,X,L,C,D,M)      }
{!< 26 lower-case letters                     }
{!< 26 upper-case letters                     }
  Txxxxxxxxxx =  Longint;
  Const
    L_UNKNOWN = 0;
    L_ARABIC_NUMERALS = 1;
    L_LC_ROMAN_NUMERALS = 2;
    L_UC_ROMAN_NUMERALS = 3;
    L_LC_ALPHA = 4;
    L_UC_ALPHA = 5;

{-------------------------------------------------------------------------*
 *      Flags for selecting between using average and all templates:       *
 *                           recog->templ_use                              *
 *------------------------------------------------------------------------- }
{! Template Select  }
{!< use all templates; default             }
{!< use average templates; special cases   }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_USE_ALL_TEMPLATES = 0;
    L_USE_AVERAGE_TEMPLATES = 1;

{$endif}
{ LEPTONICA_RECOG_H  }

// === Konventiert am: 17-8-25 13:40:33 ===


implementation



end.
