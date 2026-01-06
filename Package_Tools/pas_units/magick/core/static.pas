unit static;

interface

uses
  fp_magiccore;

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

function InvokeStaticImageFilter(para1:Pchar; para2:PPImage; para3:longint; para4:PPchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function RegisterStaticModule(para1:Pchar; exception:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function UnregisterStaticModule(para1:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function RegisterAAIImage:Tsize_t;cdecl;external libmagiccore;
function RegisterARTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterAVIImage:Tsize_t;cdecl;external libmagiccore;
function RegisterAVSImage:Tsize_t;cdecl;external libmagiccore;
function RegisterBIEImage:Tsize_t;cdecl;external libmagiccore;
function RegisterBGRImage:Tsize_t;cdecl;external libmagiccore;
function RegisterBMPImage:Tsize_t;cdecl;external libmagiccore;
function RegisterBRAILLEImage:Tsize_t;cdecl;external libmagiccore;
function RegisterCALSImage:Tsize_t;cdecl;external libmagiccore;
function RegisterCAPTIONImage:Tsize_t;cdecl;external libmagiccore;
function RegisterCINImage:Tsize_t;cdecl;external libmagiccore;
function RegisterCIPImage:Tsize_t;cdecl;external libmagiccore;
function RegisterCLIPImage:Tsize_t;cdecl;external libmagiccore;
function RegisterCLIPBOARDImage:Tsize_t;cdecl;external libmagiccore;
function RegisterCMYKImage:Tsize_t;cdecl;external libmagiccore;
function RegisterCUTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterDCMImage:Tsize_t;cdecl;external libmagiccore;
function RegisterDCXImage:Tsize_t;cdecl;external libmagiccore;
function RegisterDDSImage:Tsize_t;cdecl;external libmagiccore;
function RegisterDEBUGImage:Tsize_t;cdecl;external libmagiccore;
function RegisterDIBImage:Tsize_t;cdecl;external libmagiccore;
function RegisterDJVUImage:Tsize_t;cdecl;external libmagiccore;
function RegisterDNGImage:Tsize_t;cdecl;external libmagiccore;
function RegisterDOTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterDPSImage:Tsize_t;cdecl;external libmagiccore;
function RegisterDPXImage:Tsize_t;cdecl;external libmagiccore;
function RegisterEMFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterEPDFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterEPIImage:Tsize_t;cdecl;external libmagiccore;
function RegisterEPSImage:Tsize_t;cdecl;external libmagiccore;
function RegisterEPS2Image:Tsize_t;cdecl;external libmagiccore;
function RegisterEPSFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterEPSIImage:Tsize_t;cdecl;external libmagiccore;
function RegisterEPTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterEXRImage:Tsize_t;cdecl;external libmagiccore;
function RegisterFAXImage:Tsize_t;cdecl;external libmagiccore;
function RegisterFITSImage:Tsize_t;cdecl;external libmagiccore;
function RegisterFLIFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterFPXImage:Tsize_t;cdecl;external libmagiccore;
function RegisterG3Image:Tsize_t;cdecl;external libmagiccore;
function RegisterGIFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterGIF87Image:Tsize_t;cdecl;external libmagiccore;
function RegisterGRADIENTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterGRANITEImage:Tsize_t;cdecl;external libmagiccore;
function RegisterGRAYImage:Tsize_t;cdecl;external libmagiccore;
function RegisterHALDImage:Tsize_t;cdecl;external libmagiccore;
function RegisterHDRImage:Tsize_t;cdecl;external libmagiccore;
function RegisterHEICImage:Tsize_t;cdecl;external libmagiccore;
function RegisterHImage:Tsize_t;cdecl;external libmagiccore;
function RegisterHISTOGRAMImage:Tsize_t;cdecl;external libmagiccore;
function RegisterHRZImage:Tsize_t;cdecl;external libmagiccore;
function RegisterHTMLImage:Tsize_t;cdecl;external libmagiccore;
function RegisterICBImage:Tsize_t;cdecl;external libmagiccore;
function RegisterICONImage:Tsize_t;cdecl;external libmagiccore;
function RegisterINFOImage:Tsize_t;cdecl;external libmagiccore;
function RegisterINLINEImage:Tsize_t;cdecl;external libmagiccore;
function RegisterIPLImage:Tsize_t;cdecl;external libmagiccore;
function RegisterJBGImage:Tsize_t;cdecl;external libmagiccore;
function RegisterJBIGImage:Tsize_t;cdecl;external libmagiccore;
function RegisterJNXImage:Tsize_t;cdecl;external libmagiccore;
function RegisterJPEGImage:Tsize_t;cdecl;external libmagiccore;
function RegisterJP2Image:Tsize_t;cdecl;external libmagiccore;
function RegisterJSONImage:Tsize_t;cdecl;external libmagiccore;
function RegisterLABELImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMACImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMAGICKImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMAPImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMASKImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMATImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMATTEImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMETAImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMIFFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMNGImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMONOImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMPCImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMPRImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMSLImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMTVImage:Tsize_t;cdecl;external libmagiccore;
function RegisterMVGImage:Tsize_t;cdecl;external libmagiccore;
function RegisterNETSCAPEImage:Tsize_t;cdecl;external libmagiccore;
function RegisterNULLImage:Tsize_t;cdecl;external libmagiccore;
function RegisterP7Image:Tsize_t;cdecl;external libmagiccore;
function RegisterPBMImage:Tsize_t;cdecl;external libmagiccore;
function RegisterOTBImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPALMImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPANGOImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPATTERNImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPCDImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPCDSImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPCLImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPCTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPCXImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPDBImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPDFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPESImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPGXImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPICImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPICTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPIXImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPGMImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPLASMAImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPMImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPNGImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPNMImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPPMImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPREVIEWImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPSImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPS2Image:Tsize_t;cdecl;external libmagiccore;
function RegisterPS3Image:Tsize_t;cdecl;external libmagiccore;
function RegisterPSDImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPTIFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterPWPImage:Tsize_t;cdecl;external libmagiccore;
function RegisterRASImage:Tsize_t;cdecl;external libmagiccore;
function RegisterRAWImage:Tsize_t;cdecl;external libmagiccore;
function RegisterRGBImage:Tsize_t;cdecl;external libmagiccore;
function RegisterRGBAImage:Tsize_t;cdecl;external libmagiccore;
function RegisterRGFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterRLAImage:Tsize_t;cdecl;external libmagiccore;
function RegisterRLEImage:Tsize_t;cdecl;external libmagiccore;
function RegisterSCRImage:Tsize_t;cdecl;external libmagiccore;
function RegisterSCREENSHOTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterSCTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterSFWImage:Tsize_t;cdecl;external libmagiccore;
function RegisterSGIImage:Tsize_t;cdecl;external libmagiccore;
function RegisterSHTMLImage:Tsize_t;cdecl;external libmagiccore;
function RegisterSIXELImage:Tsize_t;cdecl;external libmagiccore;
function RegisterSTEGANOImage:Tsize_t;cdecl;external libmagiccore;
function RegisterSUNImage:Tsize_t;cdecl;external libmagiccore;
function RegisterSVGImage:Tsize_t;cdecl;external libmagiccore;
function RegisterTEXTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterTGAImage:Tsize_t;cdecl;external libmagiccore;
function RegisterTHUMBNAILImage:Tsize_t;cdecl;external libmagiccore;
function RegisterTIFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterTIFFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterTILEImage:Tsize_t;cdecl;external libmagiccore;
function RegisterTIMImage:Tsize_t;cdecl;external libmagiccore;
function RegisterTTFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterTXTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterUILImage:Tsize_t;cdecl;external libmagiccore;
function RegisterURLImage:Tsize_t;cdecl;external libmagiccore;
function RegisterUYVYImage:Tsize_t;cdecl;external libmagiccore;
function RegisterVDAImage:Tsize_t;cdecl;external libmagiccore;
function RegisterVICARImage:Tsize_t;cdecl;external libmagiccore;
function RegisterVIDImage:Tsize_t;cdecl;external libmagiccore;
function RegisterVIDEOImage:Tsize_t;cdecl;external libmagiccore;
function RegisterVIFFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterVIPSImage:Tsize_t;cdecl;external libmagiccore;
function RegisterVSTImage:Tsize_t;cdecl;external libmagiccore;
function RegisterWBMPImage:Tsize_t;cdecl;external libmagiccore;
function RegisterWEBPImage:Tsize_t;cdecl;external libmagiccore;
function RegisterWMFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterWPGImage:Tsize_t;cdecl;external libmagiccore;
function RegisterXImage:Tsize_t;cdecl;external libmagiccore;
function RegisterXBMImage:Tsize_t;cdecl;external libmagiccore;
function RegisterXCImage:Tsize_t;cdecl;external libmagiccore;
function RegisterXCFImage:Tsize_t;cdecl;external libmagiccore;
function RegisterXPMImage:Tsize_t;cdecl;external libmagiccore;
function RegisterXPSImage:Tsize_t;cdecl;external libmagiccore;
function RegisterXVImage:Tsize_t;cdecl;external libmagiccore;
function RegisterXWDImage:Tsize_t;cdecl;external libmagiccore;
function RegisterYCBCRImage:Tsize_t;cdecl;external libmagiccore;
function RegisterYUVImage:Tsize_t;cdecl;external libmagiccore;
procedure UnregisterAAIImage;cdecl;external libmagiccore;
procedure UnregisterARTImage;cdecl;external libmagiccore;
procedure UnregisterAVIImage;cdecl;external libmagiccore;
procedure UnregisterAVSImage;cdecl;external libmagiccore;
procedure UnregisterBIEImage;cdecl;external libmagiccore;
procedure UnregisterBGRImage;cdecl;external libmagiccore;
procedure UnregisterBMPImage;cdecl;external libmagiccore;
procedure UnregisterBRAILLEImage;cdecl;external libmagiccore;
procedure UnregisterCALSImage;cdecl;external libmagiccore;
procedure UnregisterCAPTIONImage;cdecl;external libmagiccore;
procedure UnregisterCINImage;cdecl;external libmagiccore;
procedure UnregisterCIPImage;cdecl;external libmagiccore;
procedure UnregisterCLIPImage;cdecl;external libmagiccore;
procedure UnregisterCLIPBOARDImage;cdecl;external libmagiccore;
procedure UnregisterCMYKImage;cdecl;external libmagiccore;
procedure UnregisterCUTImage;cdecl;external libmagiccore;
procedure UnregisterDCMImage;cdecl;external libmagiccore;
procedure UnregisterDCXImage;cdecl;external libmagiccore;
procedure UnregisterDDSImage;cdecl;external libmagiccore;
procedure UnregisterDEBUGImage;cdecl;external libmagiccore;
procedure UnregisterDIBImage;cdecl;external libmagiccore;
procedure UnregisterDJVUImage;cdecl;external libmagiccore;
procedure UnregisterDNGImage;cdecl;external libmagiccore;
procedure UnregisterDOTImage;cdecl;external libmagiccore;
procedure UnregisterDPSImage;cdecl;external libmagiccore;
procedure UnregisterDPXImage;cdecl;external libmagiccore;
procedure UnregisterEMFImage;cdecl;external libmagiccore;
procedure UnregisterEPDFImage;cdecl;external libmagiccore;
procedure UnregisterEPIImage;cdecl;external libmagiccore;
procedure UnregisterEPSImage;cdecl;external libmagiccore;
procedure UnregisterEPS2Image;cdecl;external libmagiccore;
procedure UnregisterEPSFImage;cdecl;external libmagiccore;
procedure UnregisterEPSIImage;cdecl;external libmagiccore;
procedure UnregisterEPTImage;cdecl;external libmagiccore;
procedure UnregisterEXRImage;cdecl;external libmagiccore;
procedure UnregisterFAXImage;cdecl;external libmagiccore;
procedure UnregisterFITSImage;cdecl;external libmagiccore;
procedure UnregisterFLIFImage;cdecl;external libmagiccore;
procedure UnregisterFPXImage;cdecl;external libmagiccore;
procedure UnregisterG3Image;cdecl;external libmagiccore;
procedure UnregisterGIFImage;cdecl;external libmagiccore;
procedure UnregisterGIF87Image;cdecl;external libmagiccore;
procedure UnregisterGRADIENTImage;cdecl;external libmagiccore;
procedure UnregisterGRANITEImage;cdecl;external libmagiccore;
procedure UnregisterGRAYImage;cdecl;external libmagiccore;
procedure UnregisterHALDImage;cdecl;external libmagiccore;
procedure UnregisterHDRImage;cdecl;external libmagiccore;
procedure UnregisterHEICImage;cdecl;external libmagiccore;
procedure UnregisterHImage;cdecl;external libmagiccore;
procedure UnregisterHISTOGRAMImage;cdecl;external libmagiccore;
procedure UnregisterHRZImage;cdecl;external libmagiccore;
procedure UnregisterHTMLImage;cdecl;external libmagiccore;
procedure UnregisterICBImage;cdecl;external libmagiccore;
procedure UnregisterICONImage;cdecl;external libmagiccore;
procedure UnregisterINFOImage;cdecl;external libmagiccore;
procedure UnregisterINLINEImage;cdecl;external libmagiccore;
procedure UnregisterIPLImage;cdecl;external libmagiccore;
procedure UnregisterJBGImage;cdecl;external libmagiccore;
procedure UnregisterJBIGImage;cdecl;external libmagiccore;
procedure UnregisterJNXImage;cdecl;external libmagiccore;
procedure UnregisterJPEGImage;cdecl;external libmagiccore;
procedure UnregisterJP2Image;cdecl;external libmagiccore;
procedure UnregisterJSONImage;cdecl;external libmagiccore;
procedure UnregisterLABELImage;cdecl;external libmagiccore;
procedure UnregisterLOCALEImage;cdecl;external libmagiccore;
procedure UnregisterMACImage;cdecl;external libmagiccore;
procedure UnregisterMAGICKImage;cdecl;external libmagiccore;
procedure UnregisterMAPImage;cdecl;external libmagiccore;
procedure UnregisterMASKImage;cdecl;external libmagiccore;
procedure UnregisterMATImage;cdecl;external libmagiccore;
procedure UnregisterMATTEImage;cdecl;external libmagiccore;
procedure UnregisterMETAImage;cdecl;external libmagiccore;
procedure UnregisterMIFFImage;cdecl;external libmagiccore;
procedure UnregisterMNGImage;cdecl;external libmagiccore;
procedure UnregisterMONOImage;cdecl;external libmagiccore;
procedure UnregisterMPCImage;cdecl;external libmagiccore;
procedure UnregisterMPRImage;cdecl;external libmagiccore;
procedure UnregisterMSLImage;cdecl;external libmagiccore;
procedure UnregisterMTVImage;cdecl;external libmagiccore;
procedure UnregisterMVGImage;cdecl;external libmagiccore;
procedure UnregisterNETSCAPEImage;cdecl;external libmagiccore;
procedure UnregisterNULLImage;cdecl;external libmagiccore;
procedure UnregisterP7Image;cdecl;external libmagiccore;
procedure UnregisterPBMImage;cdecl;external libmagiccore;
procedure UnregisterOTBImage;cdecl;external libmagiccore;
procedure UnregisterPALMImage;cdecl;external libmagiccore;
procedure UnregisterPANGOImage;cdecl;external libmagiccore;
procedure UnregisterPATTERNImage;cdecl;external libmagiccore;
procedure UnregisterPCDImage;cdecl;external libmagiccore;
procedure UnregisterPCDSImage;cdecl;external libmagiccore;
procedure UnregisterPCLImage;cdecl;external libmagiccore;
procedure UnregisterPCTImage;cdecl;external libmagiccore;
procedure UnregisterPCXImage;cdecl;external libmagiccore;
procedure UnregisterPDBImage;cdecl;external libmagiccore;
procedure UnregisterPDFImage;cdecl;external libmagiccore;
procedure UnregisterPESImage;cdecl;external libmagiccore;
procedure UnregisterPGXImage;cdecl;external libmagiccore;
procedure UnregisterPICImage;cdecl;external libmagiccore;
procedure UnregisterPICTImage;cdecl;external libmagiccore;
procedure UnregisterPIXImage;cdecl;external libmagiccore;
procedure UnregisterPLASMAImage;cdecl;external libmagiccore;
procedure UnregisterPGMImage;cdecl;external libmagiccore;
procedure UnregisterPMImage;cdecl;external libmagiccore;
procedure UnregisterPNGImage;cdecl;external libmagiccore;
procedure UnregisterPNMImage;cdecl;external libmagiccore;
procedure UnregisterPPMImage;cdecl;external libmagiccore;
procedure UnregisterPREVIEWImage;cdecl;external libmagiccore;
procedure UnregisterPSImage;cdecl;external libmagiccore;
procedure UnregisterPS2Image;cdecl;external libmagiccore;
procedure UnregisterPS3Image;cdecl;external libmagiccore;
procedure UnregisterPSDImage;cdecl;external libmagiccore;
procedure UnregisterPTIFImage;cdecl;external libmagiccore;
procedure UnregisterPWPImage;cdecl;external libmagiccore;
procedure UnregisterRASImage;cdecl;external libmagiccore;
procedure UnregisterRAWImage;cdecl;external libmagiccore;
procedure UnregisterRGBImage;cdecl;external libmagiccore;
procedure UnregisterRGBAImage;cdecl;external libmagiccore;
procedure UnregisterRGFImage;cdecl;external libmagiccore;
procedure UnregisterRLAImage;cdecl;external libmagiccore;
procedure UnregisterRLEImage;cdecl;external libmagiccore;
procedure UnregisterSCRImage;cdecl;external libmagiccore;
procedure UnregisterSCREENSHOTImage;cdecl;external libmagiccore;
procedure UnregisterSCTImage;cdecl;external libmagiccore;
procedure UnregisterSFWImage;cdecl;external libmagiccore;
procedure UnregisterSGIImage;cdecl;external libmagiccore;
procedure UnregisterSHTMLImage;cdecl;external libmagiccore;
procedure UnregisterSIXELImage;cdecl;external libmagiccore;
procedure UnregisterSTEGANOImage;cdecl;external libmagiccore;
procedure UnregisterSUNImage;cdecl;external libmagiccore;
procedure UnregisterSVGImage;cdecl;external libmagiccore;
procedure UnregisterTEXTImage;cdecl;external libmagiccore;
procedure UnregisterTGAImage;cdecl;external libmagiccore;
procedure UnregisterTHUMBNAILImage;cdecl;external libmagiccore;
procedure UnregisterTIFImage;cdecl;external libmagiccore;
procedure UnregisterTIFFImage;cdecl;external libmagiccore;
procedure UnregisterTILEImage;cdecl;external libmagiccore;
procedure UnregisterTIMImage;cdecl;external libmagiccore;
procedure UnregisterTTFImage;cdecl;external libmagiccore;
procedure UnregisterTXTImage;cdecl;external libmagiccore;
procedure UnregisterUILImage;cdecl;external libmagiccore;
procedure UnregisterURLImage;cdecl;external libmagiccore;
procedure UnregisterUYVYImage;cdecl;external libmagiccore;
procedure UnregisterVDAImage;cdecl;external libmagiccore;
procedure UnregisterVICARImage;cdecl;external libmagiccore;
procedure UnregisterVIDImage;cdecl;external libmagiccore;
procedure UnregisterVIDEOImage;cdecl;external libmagiccore;
procedure UnregisterVIFFImage;cdecl;external libmagiccore;
procedure UnregisterVIPSImage;cdecl;external libmagiccore;
procedure UnregisterVSTImage;cdecl;external libmagiccore;
procedure UnregisterWBMPImage;cdecl;external libmagiccore;
procedure UnregisterWEBPImage;cdecl;external libmagiccore;
procedure UnregisterWMFImage;cdecl;external libmagiccore;
procedure UnregisterWPGImage;cdecl;external libmagiccore;
procedure UnregisterXImage;cdecl;external libmagiccore;
procedure UnregisterXBMImage;cdecl;external libmagiccore;
procedure UnregisterXCImage;cdecl;external libmagiccore;
procedure UnregisterXCFImage;cdecl;external libmagiccore;
procedure UnregisterXPMImage;cdecl;external libmagiccore;
procedure UnregisterXPSImage;cdecl;external libmagiccore;
procedure UnregisterXVImage;cdecl;external libmagiccore;
procedure UnregisterXWDImage;cdecl;external libmagiccore;
procedure UnregisterYCBCRImage;cdecl;external libmagiccore;
procedure UnregisterYUVImage;cdecl;external libmagiccore;
procedure RegisterStaticModules;cdecl;external libmagiccore;
procedure UnregisterStaticModules;cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 14:01:03 ===


implementation



end.
