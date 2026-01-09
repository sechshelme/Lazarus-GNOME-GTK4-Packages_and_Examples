
unit static;
interface

{
  Automatically converted by H2Pas 1.0.0 from static.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    static.h
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
Pchar  = ^char;
PExceptionInfo  = ^ExceptionInfo;
PImage  = ^Image;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.
  
  You may not use this file except in compliance with the License.  You may
  obtain a copy of the License at
  
    https://imagemagick.org/script/license.php
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore static coder registration methods.
 }
{$ifndef MAGICKCORE_STATIC_H}
{$define MAGICKCORE_STATIC_H}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function InvokeStaticImageFilter(para1:Pchar; para2:PPImage; para3:longint; para4:PPchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function RegisterStaticModule(para1:Pchar; exception:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function UnregisterStaticModule(para1:Pchar):TMagickBooleanType;cdecl;external;
function RegisterAAIImage:Tsize_t;cdecl;external;
function RegisterARTImage:Tsize_t;cdecl;external;
function RegisterAVIImage:Tsize_t;cdecl;external;
function RegisterAVSImage:Tsize_t;cdecl;external;
function RegisterBIEImage:Tsize_t;cdecl;external;
function RegisterBGRImage:Tsize_t;cdecl;external;
function RegisterBMPImage:Tsize_t;cdecl;external;
function RegisterBRAILLEImage:Tsize_t;cdecl;external;
function RegisterCALSImage:Tsize_t;cdecl;external;
function RegisterCAPTIONImage:Tsize_t;cdecl;external;
function RegisterCINImage:Tsize_t;cdecl;external;
function RegisterCIPImage:Tsize_t;cdecl;external;
function RegisterCLIPImage:Tsize_t;cdecl;external;
function RegisterCLIPBOARDImage:Tsize_t;cdecl;external;
function RegisterCMYKImage:Tsize_t;cdecl;external;
function RegisterCUTImage:Tsize_t;cdecl;external;
function RegisterDCMImage:Tsize_t;cdecl;external;
function RegisterDCXImage:Tsize_t;cdecl;external;
function RegisterDDSImage:Tsize_t;cdecl;external;
function RegisterDEBUGImage:Tsize_t;cdecl;external;
function RegisterDIBImage:Tsize_t;cdecl;external;
function RegisterDJVUImage:Tsize_t;cdecl;external;
function RegisterDNGImage:Tsize_t;cdecl;external;
function RegisterDOTImage:Tsize_t;cdecl;external;
function RegisterDPSImage:Tsize_t;cdecl;external;
function RegisterDPXImage:Tsize_t;cdecl;external;
function RegisterEMFImage:Tsize_t;cdecl;external;
function RegisterEPDFImage:Tsize_t;cdecl;external;
function RegisterEPIImage:Tsize_t;cdecl;external;
function RegisterEPSImage:Tsize_t;cdecl;external;
function RegisterEPS2Image:Tsize_t;cdecl;external;
function RegisterEPSFImage:Tsize_t;cdecl;external;
function RegisterEPSIImage:Tsize_t;cdecl;external;
function RegisterEPTImage:Tsize_t;cdecl;external;
function RegisterEXRImage:Tsize_t;cdecl;external;
function RegisterFAXImage:Tsize_t;cdecl;external;
function RegisterFITSImage:Tsize_t;cdecl;external;
function RegisterFLIFImage:Tsize_t;cdecl;external;
function RegisterFPXImage:Tsize_t;cdecl;external;
function RegisterG3Image:Tsize_t;cdecl;external;
function RegisterGIFImage:Tsize_t;cdecl;external;
function RegisterGIF87Image:Tsize_t;cdecl;external;
function RegisterGRADIENTImage:Tsize_t;cdecl;external;
function RegisterGRANITEImage:Tsize_t;cdecl;external;
function RegisterGRAYImage:Tsize_t;cdecl;external;
function RegisterHALDImage:Tsize_t;cdecl;external;
function RegisterHDRImage:Tsize_t;cdecl;external;
function RegisterHEICImage:Tsize_t;cdecl;external;
function RegisterHImage:Tsize_t;cdecl;external;
function RegisterHISTOGRAMImage:Tsize_t;cdecl;external;
function RegisterHRZImage:Tsize_t;cdecl;external;
function RegisterHTMLImage:Tsize_t;cdecl;external;
function RegisterICBImage:Tsize_t;cdecl;external;
function RegisterICONImage:Tsize_t;cdecl;external;
function RegisterINFOImage:Tsize_t;cdecl;external;
function RegisterINLINEImage:Tsize_t;cdecl;external;
function RegisterIPLImage:Tsize_t;cdecl;external;
function RegisterJBGImage:Tsize_t;cdecl;external;
function RegisterJBIGImage:Tsize_t;cdecl;external;
function RegisterJNXImage:Tsize_t;cdecl;external;
function RegisterJPEGImage:Tsize_t;cdecl;external;
function RegisterJP2Image:Tsize_t;cdecl;external;
function RegisterJSONImage:Tsize_t;cdecl;external;
function RegisterLABELImage:Tsize_t;cdecl;external;
function RegisterMACImage:Tsize_t;cdecl;external;
function RegisterMAGICKImage:Tsize_t;cdecl;external;
function RegisterMAPImage:Tsize_t;cdecl;external;
function RegisterMASKImage:Tsize_t;cdecl;external;
function RegisterMATImage:Tsize_t;cdecl;external;
function RegisterMATTEImage:Tsize_t;cdecl;external;
function RegisterMETAImage:Tsize_t;cdecl;external;
function RegisterMIFFImage:Tsize_t;cdecl;external;
function RegisterMNGImage:Tsize_t;cdecl;external;
function RegisterMONOImage:Tsize_t;cdecl;external;
function RegisterMPCImage:Tsize_t;cdecl;external;
function RegisterMPRImage:Tsize_t;cdecl;external;
function RegisterMSLImage:Tsize_t;cdecl;external;
function RegisterMTVImage:Tsize_t;cdecl;external;
function RegisterMVGImage:Tsize_t;cdecl;external;
function RegisterNETSCAPEImage:Tsize_t;cdecl;external;
function RegisterNULLImage:Tsize_t;cdecl;external;
function RegisterP7Image:Tsize_t;cdecl;external;
function RegisterPBMImage:Tsize_t;cdecl;external;
function RegisterOTBImage:Tsize_t;cdecl;external;
function RegisterPALMImage:Tsize_t;cdecl;external;
function RegisterPANGOImage:Tsize_t;cdecl;external;
function RegisterPATTERNImage:Tsize_t;cdecl;external;
function RegisterPCDImage:Tsize_t;cdecl;external;
function RegisterPCDSImage:Tsize_t;cdecl;external;
function RegisterPCLImage:Tsize_t;cdecl;external;
function RegisterPCTImage:Tsize_t;cdecl;external;
function RegisterPCXImage:Tsize_t;cdecl;external;
function RegisterPDBImage:Tsize_t;cdecl;external;
function RegisterPDFImage:Tsize_t;cdecl;external;
function RegisterPESImage:Tsize_t;cdecl;external;
function RegisterPGXImage:Tsize_t;cdecl;external;
function RegisterPICImage:Tsize_t;cdecl;external;
function RegisterPICTImage:Tsize_t;cdecl;external;
function RegisterPIXImage:Tsize_t;cdecl;external;
function RegisterPGMImage:Tsize_t;cdecl;external;
function RegisterPLASMAImage:Tsize_t;cdecl;external;
function RegisterPMImage:Tsize_t;cdecl;external;
function RegisterPNGImage:Tsize_t;cdecl;external;
function RegisterPNMImage:Tsize_t;cdecl;external;
function RegisterPPMImage:Tsize_t;cdecl;external;
function RegisterPREVIEWImage:Tsize_t;cdecl;external;
function RegisterPSImage:Tsize_t;cdecl;external;
function RegisterPS2Image:Tsize_t;cdecl;external;
function RegisterPS3Image:Tsize_t;cdecl;external;
function RegisterPSDImage:Tsize_t;cdecl;external;
function RegisterPTIFImage:Tsize_t;cdecl;external;
function RegisterPWPImage:Tsize_t;cdecl;external;
function RegisterRASImage:Tsize_t;cdecl;external;
function RegisterRAWImage:Tsize_t;cdecl;external;
function RegisterRGBImage:Tsize_t;cdecl;external;
function RegisterRGBAImage:Tsize_t;cdecl;external;
function RegisterRGFImage:Tsize_t;cdecl;external;
function RegisterRLAImage:Tsize_t;cdecl;external;
function RegisterRLEImage:Tsize_t;cdecl;external;
function RegisterSCRImage:Tsize_t;cdecl;external;
function RegisterSCREENSHOTImage:Tsize_t;cdecl;external;
function RegisterSCTImage:Tsize_t;cdecl;external;
function RegisterSFWImage:Tsize_t;cdecl;external;
function RegisterSGIImage:Tsize_t;cdecl;external;
function RegisterSHTMLImage:Tsize_t;cdecl;external;
function RegisterSIXELImage:Tsize_t;cdecl;external;
function RegisterSTEGANOImage:Tsize_t;cdecl;external;
function RegisterSUNImage:Tsize_t;cdecl;external;
function RegisterSVGImage:Tsize_t;cdecl;external;
function RegisterTEXTImage:Tsize_t;cdecl;external;
function RegisterTGAImage:Tsize_t;cdecl;external;
function RegisterTHUMBNAILImage:Tsize_t;cdecl;external;
function RegisterTIFImage:Tsize_t;cdecl;external;
function RegisterTIFFImage:Tsize_t;cdecl;external;
function RegisterTILEImage:Tsize_t;cdecl;external;
function RegisterTIMImage:Tsize_t;cdecl;external;
function RegisterTTFImage:Tsize_t;cdecl;external;
function RegisterTXTImage:Tsize_t;cdecl;external;
function RegisterUILImage:Tsize_t;cdecl;external;
function RegisterURLImage:Tsize_t;cdecl;external;
function RegisterUYVYImage:Tsize_t;cdecl;external;
function RegisterVDAImage:Tsize_t;cdecl;external;
function RegisterVICARImage:Tsize_t;cdecl;external;
function RegisterVIDImage:Tsize_t;cdecl;external;
function RegisterVIDEOImage:Tsize_t;cdecl;external;
function RegisterVIFFImage:Tsize_t;cdecl;external;
function RegisterVIPSImage:Tsize_t;cdecl;external;
function RegisterVSTImage:Tsize_t;cdecl;external;
function RegisterWBMPImage:Tsize_t;cdecl;external;
function RegisterWEBPImage:Tsize_t;cdecl;external;
function RegisterWMFImage:Tsize_t;cdecl;external;
function RegisterWPGImage:Tsize_t;cdecl;external;
function RegisterXImage:Tsize_t;cdecl;external;
function RegisterXBMImage:Tsize_t;cdecl;external;
function RegisterXCImage:Tsize_t;cdecl;external;
function RegisterXCFImage:Tsize_t;cdecl;external;
function RegisterXPMImage:Tsize_t;cdecl;external;
function RegisterXPSImage:Tsize_t;cdecl;external;
function RegisterXVImage:Tsize_t;cdecl;external;
function RegisterXWDImage:Tsize_t;cdecl;external;
function RegisterYCBCRImage:Tsize_t;cdecl;external;
function RegisterYUVImage:Tsize_t;cdecl;external;
procedure UnregisterAAIImage;cdecl;external;
procedure UnregisterARTImage;cdecl;external;
procedure UnregisterAVIImage;cdecl;external;
procedure UnregisterAVSImage;cdecl;external;
procedure UnregisterBIEImage;cdecl;external;
procedure UnregisterBGRImage;cdecl;external;
procedure UnregisterBMPImage;cdecl;external;
procedure UnregisterBRAILLEImage;cdecl;external;
procedure UnregisterCALSImage;cdecl;external;
procedure UnregisterCAPTIONImage;cdecl;external;
procedure UnregisterCINImage;cdecl;external;
procedure UnregisterCIPImage;cdecl;external;
procedure UnregisterCLIPImage;cdecl;external;
procedure UnregisterCLIPBOARDImage;cdecl;external;
procedure UnregisterCMYKImage;cdecl;external;
procedure UnregisterCUTImage;cdecl;external;
procedure UnregisterDCMImage;cdecl;external;
procedure UnregisterDCXImage;cdecl;external;
procedure UnregisterDDSImage;cdecl;external;
procedure UnregisterDEBUGImage;cdecl;external;
procedure UnregisterDIBImage;cdecl;external;
procedure UnregisterDJVUImage;cdecl;external;
procedure UnregisterDNGImage;cdecl;external;
procedure UnregisterDOTImage;cdecl;external;
procedure UnregisterDPSImage;cdecl;external;
procedure UnregisterDPXImage;cdecl;external;
procedure UnregisterEMFImage;cdecl;external;
procedure UnregisterEPDFImage;cdecl;external;
procedure UnregisterEPIImage;cdecl;external;
procedure UnregisterEPSImage;cdecl;external;
procedure UnregisterEPS2Image;cdecl;external;
procedure UnregisterEPSFImage;cdecl;external;
procedure UnregisterEPSIImage;cdecl;external;
procedure UnregisterEPTImage;cdecl;external;
procedure UnregisterEXRImage;cdecl;external;
procedure UnregisterFAXImage;cdecl;external;
procedure UnregisterFITSImage;cdecl;external;
procedure UnregisterFLIFImage;cdecl;external;
procedure UnregisterFPXImage;cdecl;external;
procedure UnregisterG3Image;cdecl;external;
procedure UnregisterGIFImage;cdecl;external;
procedure UnregisterGIF87Image;cdecl;external;
procedure UnregisterGRADIENTImage;cdecl;external;
procedure UnregisterGRANITEImage;cdecl;external;
procedure UnregisterGRAYImage;cdecl;external;
procedure UnregisterHALDImage;cdecl;external;
procedure UnregisterHDRImage;cdecl;external;
procedure UnregisterHEICImage;cdecl;external;
procedure UnregisterHImage;cdecl;external;
procedure UnregisterHISTOGRAMImage;cdecl;external;
procedure UnregisterHRZImage;cdecl;external;
procedure UnregisterHTMLImage;cdecl;external;
procedure UnregisterICBImage;cdecl;external;
procedure UnregisterICONImage;cdecl;external;
procedure UnregisterINFOImage;cdecl;external;
procedure UnregisterINLINEImage;cdecl;external;
procedure UnregisterIPLImage;cdecl;external;
procedure UnregisterJBGImage;cdecl;external;
procedure UnregisterJBIGImage;cdecl;external;
procedure UnregisterJNXImage;cdecl;external;
procedure UnregisterJPEGImage;cdecl;external;
procedure UnregisterJP2Image;cdecl;external;
procedure UnregisterJSONImage;cdecl;external;
procedure UnregisterLABELImage;cdecl;external;
procedure UnregisterLOCALEImage;cdecl;external;
procedure UnregisterMACImage;cdecl;external;
procedure UnregisterMAGICKImage;cdecl;external;
procedure UnregisterMAPImage;cdecl;external;
procedure UnregisterMASKImage;cdecl;external;
procedure UnregisterMATImage;cdecl;external;
procedure UnregisterMATTEImage;cdecl;external;
procedure UnregisterMETAImage;cdecl;external;
procedure UnregisterMIFFImage;cdecl;external;
procedure UnregisterMNGImage;cdecl;external;
procedure UnregisterMONOImage;cdecl;external;
procedure UnregisterMPCImage;cdecl;external;
procedure UnregisterMPRImage;cdecl;external;
procedure UnregisterMSLImage;cdecl;external;
procedure UnregisterMTVImage;cdecl;external;
procedure UnregisterMVGImage;cdecl;external;
procedure UnregisterNETSCAPEImage;cdecl;external;
procedure UnregisterNULLImage;cdecl;external;
procedure UnregisterP7Image;cdecl;external;
procedure UnregisterPBMImage;cdecl;external;
procedure UnregisterOTBImage;cdecl;external;
procedure UnregisterPALMImage;cdecl;external;
procedure UnregisterPANGOImage;cdecl;external;
procedure UnregisterPATTERNImage;cdecl;external;
procedure UnregisterPCDImage;cdecl;external;
procedure UnregisterPCDSImage;cdecl;external;
procedure UnregisterPCLImage;cdecl;external;
procedure UnregisterPCTImage;cdecl;external;
procedure UnregisterPCXImage;cdecl;external;
procedure UnregisterPDBImage;cdecl;external;
procedure UnregisterPDFImage;cdecl;external;
procedure UnregisterPESImage;cdecl;external;
procedure UnregisterPGXImage;cdecl;external;
procedure UnregisterPICImage;cdecl;external;
procedure UnregisterPICTImage;cdecl;external;
procedure UnregisterPIXImage;cdecl;external;
procedure UnregisterPLASMAImage;cdecl;external;
procedure UnregisterPGMImage;cdecl;external;
procedure UnregisterPMImage;cdecl;external;
procedure UnregisterPNGImage;cdecl;external;
procedure UnregisterPNMImage;cdecl;external;
procedure UnregisterPPMImage;cdecl;external;
procedure UnregisterPREVIEWImage;cdecl;external;
procedure UnregisterPSImage;cdecl;external;
procedure UnregisterPS2Image;cdecl;external;
procedure UnregisterPS3Image;cdecl;external;
procedure UnregisterPSDImage;cdecl;external;
procedure UnregisterPTIFImage;cdecl;external;
procedure UnregisterPWPImage;cdecl;external;
procedure UnregisterRASImage;cdecl;external;
procedure UnregisterRAWImage;cdecl;external;
procedure UnregisterRGBImage;cdecl;external;
procedure UnregisterRGBAImage;cdecl;external;
procedure UnregisterRGFImage;cdecl;external;
procedure UnregisterRLAImage;cdecl;external;
procedure UnregisterRLEImage;cdecl;external;
procedure UnregisterSCRImage;cdecl;external;
procedure UnregisterSCREENSHOTImage;cdecl;external;
procedure UnregisterSCTImage;cdecl;external;
procedure UnregisterSFWImage;cdecl;external;
procedure UnregisterSGIImage;cdecl;external;
procedure UnregisterSHTMLImage;cdecl;external;
procedure UnregisterSIXELImage;cdecl;external;
procedure UnregisterSTEGANOImage;cdecl;external;
procedure UnregisterSUNImage;cdecl;external;
procedure UnregisterSVGImage;cdecl;external;
procedure UnregisterTEXTImage;cdecl;external;
procedure UnregisterTGAImage;cdecl;external;
procedure UnregisterTHUMBNAILImage;cdecl;external;
procedure UnregisterTIFImage;cdecl;external;
procedure UnregisterTIFFImage;cdecl;external;
procedure UnregisterTILEImage;cdecl;external;
procedure UnregisterTIMImage;cdecl;external;
procedure UnregisterTTFImage;cdecl;external;
procedure UnregisterTXTImage;cdecl;external;
procedure UnregisterUILImage;cdecl;external;
procedure UnregisterURLImage;cdecl;external;
procedure UnregisterUYVYImage;cdecl;external;
procedure UnregisterVDAImage;cdecl;external;
procedure UnregisterVICARImage;cdecl;external;
procedure UnregisterVIDImage;cdecl;external;
procedure UnregisterVIDEOImage;cdecl;external;
procedure UnregisterVIFFImage;cdecl;external;
procedure UnregisterVIPSImage;cdecl;external;
procedure UnregisterVSTImage;cdecl;external;
procedure UnregisterWBMPImage;cdecl;external;
procedure UnregisterWEBPImage;cdecl;external;
procedure UnregisterWMFImage;cdecl;external;
procedure UnregisterWPGImage;cdecl;external;
procedure UnregisterXImage;cdecl;external;
procedure UnregisterXBMImage;cdecl;external;
procedure UnregisterXCImage;cdecl;external;
procedure UnregisterXCFImage;cdecl;external;
procedure UnregisterXPMImage;cdecl;external;
procedure UnregisterXPSImage;cdecl;external;
procedure UnregisterXVImage;cdecl;external;
procedure UnregisterXWDImage;cdecl;external;
procedure UnregisterYCBCRImage;cdecl;external;
procedure UnregisterYUVImage;cdecl;external;
procedure RegisterStaticModules;cdecl;external;
procedure UnregisterStaticModules;cdecl;external;
{$endif}

implementation


end.
