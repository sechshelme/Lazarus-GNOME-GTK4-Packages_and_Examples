/*
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
*/
#ifndef MAGICKCORE_STATIC_H
#define MAGICKCORE_STATIC_H


extern  MagickBooleanType
  InvokeStaticImageFilter(const char *,Image **,const int,const char **,
    ExceptionInfo *);
extern  MagickBooleanType
  RegisterStaticModule(const char *,ExceptionInfo *exception);
extern  MagickBooleanType
  UnregisterStaticModule(const char *);

extern  size_t
  RegisterAAIImage(void);
extern  size_t
  RegisterARTImage(void);
extern  size_t
  RegisterAVIImage(void);
extern  size_t
  RegisterAVSImage(void);
extern  size_t
  RegisterBIEImage(void);
extern  size_t
  RegisterBGRImage(void);
extern  size_t
  RegisterBMPImage(void);
extern  size_t
  RegisterBRAILLEImage(void);
extern  size_t
  RegisterCALSImage(void);
extern  size_t
  RegisterCAPTIONImage(void);
extern  size_t
  RegisterCINImage(void);
extern  size_t
  RegisterCIPImage(void);
extern  size_t
  RegisterCLIPImage(void);
extern  size_t
  RegisterCLIPBOARDImage(void);
extern  size_t
  RegisterCMYKImage(void);
extern  size_t
  RegisterCUTImage(void);
extern  size_t
  RegisterDCMImage(void);
extern  size_t
  RegisterDCXImage(void);
extern  size_t
  RegisterDDSImage(void);
extern  size_t
  RegisterDEBUGImage(void);
extern  size_t
  RegisterDIBImage(void);
extern  size_t
  RegisterDJVUImage(void);
extern  size_t
  RegisterDNGImage(void);
extern  size_t
  RegisterDOTImage(void);
extern  size_t
  RegisterDPSImage(void);
extern  size_t
  RegisterDPXImage(void);
extern  size_t
  RegisterEMFImage(void);
extern  size_t
  RegisterEPDFImage(void);
extern  size_t
  RegisterEPIImage(void);
extern  size_t
  RegisterEPSImage(void);
extern  size_t
  RegisterEPS2Image(void);
extern  size_t
  RegisterEPSFImage(void);
extern  size_t
  RegisterEPSIImage(void);
extern  size_t
  RegisterEPTImage(void);
extern  size_t
  RegisterEXRImage(void);
extern  size_t
  RegisterFAXImage(void);
extern  size_t
  RegisterFITSImage(void);
extern  size_t
  RegisterFLIFImage(void);
extern  size_t
  RegisterFPXImage(void);
extern  size_t
  RegisterG3Image(void);
extern  size_t
  RegisterGIFImage(void);
extern  size_t
  RegisterGIF87Image(void);
extern  size_t
  RegisterGRADIENTImage(void);
extern  size_t
  RegisterGRANITEImage(void);
extern  size_t
  RegisterGRAYImage(void);
extern  size_t
  RegisterHALDImage(void);
extern  size_t
  RegisterHDRImage(void);
extern  size_t
  RegisterHEICImage(void);
extern  size_t
  RegisterHImage(void);
extern  size_t
  RegisterHISTOGRAMImage(void);
extern  size_t
  RegisterHRZImage(void);
extern  size_t
  RegisterHTMLImage(void);
extern  size_t
  RegisterICBImage(void);
extern  size_t
  RegisterICONImage(void);
extern  size_t
  RegisterINFOImage(void);
extern  size_t
  RegisterINLINEImage(void);
extern  size_t
  RegisterIPLImage(void);
extern  size_t
  RegisterJBGImage(void);
extern  size_t
  RegisterJBIGImage(void);
extern  size_t
  RegisterJNXImage(void);
extern  size_t
  RegisterJPEGImage(void);
extern  size_t
  RegisterJP2Image(void);
extern  size_t
  RegisterJSONImage(void);
extern  size_t
  RegisterLABELImage(void);
extern  size_t
  RegisterMACImage(void);
extern  size_t
  RegisterMAGICKImage(void);
extern  size_t
  RegisterMAPImage(void);
extern  size_t
  RegisterMASKImage(void);
extern  size_t
  RegisterMATImage(void);
extern  size_t
  RegisterMATTEImage(void);
extern  size_t
  RegisterMETAImage(void);
extern  size_t
  RegisterMIFFImage(void);
extern  size_t
  RegisterMNGImage(void);
extern  size_t
  RegisterMONOImage(void);
extern  size_t
  RegisterMPCImage(void);
extern  size_t
  RegisterMPRImage(void);
extern  size_t
  RegisterMSLImage(void);
extern  size_t
  RegisterMTVImage(void);
extern  size_t
  RegisterMVGImage(void);
extern  size_t
  RegisterNETSCAPEImage(void);
extern  size_t
  RegisterNULLImage(void);
extern  size_t
  RegisterP7Image(void);
extern  size_t
  RegisterPBMImage(void);
extern  size_t
  RegisterOTBImage(void);
extern  size_t
  RegisterPALMImage(void);
extern  size_t
  RegisterPANGOImage(void);
extern  size_t
  RegisterPATTERNImage(void);
extern  size_t
  RegisterPCDImage(void);
extern  size_t
  RegisterPCDSImage(void);
extern  size_t
  RegisterPCLImage(void);
extern  size_t
  RegisterPCTImage(void);
extern  size_t
  RegisterPCXImage(void);
extern  size_t
  RegisterPDBImage(void);
extern  size_t
  RegisterPDFImage(void);
extern  size_t
  RegisterPESImage(void);
extern  size_t
  RegisterPGXImage(void);
extern  size_t
  RegisterPICImage(void);
extern  size_t
  RegisterPICTImage(void);
extern  size_t
  RegisterPIXImage(void);
extern  size_t
  RegisterPGMImage(void);
extern  size_t
  RegisterPLASMAImage(void);
extern  size_t
  RegisterPMImage(void);
extern  size_t
  RegisterPNGImage(void);
extern  size_t
  RegisterPNMImage(void);
extern  size_t
  RegisterPPMImage(void);
extern  size_t
  RegisterPREVIEWImage(void);
extern  size_t
  RegisterPSImage(void);
extern  size_t
  RegisterPS2Image(void);
extern  size_t
  RegisterPS3Image(void);
extern  size_t
  RegisterPSDImage(void);
extern  size_t
  RegisterPTIFImage(void);
extern  size_t
  RegisterPWPImage(void);
extern  size_t
  RegisterRASImage(void);
extern  size_t
  RegisterRAWImage(void);
extern  size_t
  RegisterRGBImage(void);
extern  size_t
  RegisterRGBAImage(void);
extern  size_t
  RegisterRGFImage(void);
extern  size_t
  RegisterRLAImage(void);
extern  size_t
  RegisterRLEImage(void);
extern  size_t
  RegisterSCRImage(void);
extern  size_t
  RegisterSCREENSHOTImage(void);
extern  size_t
  RegisterSCTImage(void);
extern  size_t
  RegisterSFWImage(void);
extern  size_t
  RegisterSGIImage(void);
extern  size_t
  RegisterSHTMLImage(void);
extern  size_t
  RegisterSIXELImage(void);
extern  size_t
  RegisterSTEGANOImage(void);
extern  size_t
  RegisterSUNImage(void);
extern  size_t
  RegisterSVGImage(void);
extern  size_t
  RegisterTEXTImage(void);
extern  size_t
  RegisterTGAImage(void);
extern  size_t
  RegisterTHUMBNAILImage(void);
extern  size_t
  RegisterTIFImage(void);
extern  size_t
  RegisterTIFFImage(void);
extern  size_t
  RegisterTILEImage(void);
extern  size_t
  RegisterTIMImage(void);
extern  size_t
  RegisterTTFImage(void);
extern  size_t
  RegisterTXTImage(void);
extern  size_t
  RegisterUILImage(void);
extern  size_t
  RegisterURLImage(void);
extern  size_t
  RegisterUYVYImage(void);
extern  size_t
  RegisterVDAImage(void);
extern  size_t
  RegisterVICARImage(void);
extern  size_t
  RegisterVIDImage(void);
extern  size_t
  RegisterVIDEOImage(void);
extern  size_t
  RegisterVIFFImage(void);
extern  size_t
  RegisterVIPSImage(void);
extern  size_t
  RegisterVSTImage(void);
extern  size_t
  RegisterWBMPImage(void);
extern  size_t
  RegisterWEBPImage(void);
extern  size_t
  RegisterWMFImage(void);
extern  size_t
  RegisterWPGImage(void);
extern  size_t
  RegisterXImage(void);
extern  size_t
  RegisterXBMImage(void);
extern  size_t
  RegisterXCImage(void);
extern  size_t
  RegisterXCFImage(void);
extern  size_t
  RegisterXPMImage(void);
extern  size_t
  RegisterXPSImage(void);
extern  size_t
  RegisterXVImage(void);
extern  size_t
  RegisterXWDImage(void);
extern  size_t
  RegisterYCBCRImage(void);
extern  size_t
  RegisterYUVImage(void);

extern  void
  UnregisterAAIImage(void);
  extern  void
  UnregisterARTImage(void);
  extern  void
  UnregisterAVIImage(void);
  extern  void
  UnregisterAVSImage(void);
  extern  void
  UnregisterBIEImage(void);
  extern  void
  UnregisterBGRImage(void);
  extern  void
  UnregisterBMPImage(void);
  extern  void
  UnregisterBRAILLEImage(void);
  extern  void
  UnregisterCALSImage(void);
  extern  void
  UnregisterCAPTIONImage(void);
  extern  void
  UnregisterCINImage(void);
  extern  void
  UnregisterCIPImage(void);
  extern  void
  UnregisterCLIPImage(void);
  extern  void
  UnregisterCLIPBOARDImage(void);
  extern  void
  UnregisterCMYKImage(void);
  extern  void
  UnregisterCUTImage(void);
  extern  void
  UnregisterDCMImage(void);
  extern  void
  UnregisterDCXImage(void);
  extern  void
  UnregisterDDSImage(void);
  extern  void
  UnregisterDEBUGImage(void);
  extern  void
  UnregisterDIBImage(void);
  extern  void
  UnregisterDJVUImage(void);
  extern  void
  UnregisterDNGImage(void);
  extern  void
  UnregisterDOTImage(void);
  extern  void
  UnregisterDPSImage(void);
  extern  void
  UnregisterDPXImage(void);
  extern  void
  UnregisterEMFImage(void);
  extern  void
  UnregisterEPDFImage(void);
  extern  void
  UnregisterEPIImage(void);
  extern  void
  UnregisterEPSImage(void);
  extern  void
  UnregisterEPS2Image(void);
  extern  void
  UnregisterEPSFImage(void);
  extern  void
  UnregisterEPSIImage(void);
  extern  void
  UnregisterEPTImage(void);
  extern  void
  UnregisterEXRImage(void);
  extern  void
  UnregisterFAXImage(void);
  extern  void
  UnregisterFITSImage(void);
  extern  void
  UnregisterFLIFImage(void);
  extern  void
  UnregisterFPXImage(void);
  extern  void
  UnregisterG3Image(void);
  extern  void
  UnregisterGIFImage(void);
  extern  void
  UnregisterGIF87Image(void);
  extern  void
  UnregisterGRADIENTImage(void);
  extern  void
  UnregisterGRANITEImage(void);
  extern  void
  UnregisterGRAYImage(void);
  extern  void
  UnregisterHALDImage(void);
  extern  void
  UnregisterHDRImage(void);
  extern  void
  UnregisterHEICImage(void);
  extern  void
  UnregisterHImage(void);
  extern  void
  UnregisterHISTOGRAMImage(void);
  extern  void
  UnregisterHRZImage(void);
  extern  void
  UnregisterHTMLImage(void);
  extern  void
  UnregisterICBImage(void);
  extern  void
  UnregisterICONImage(void);
  extern  void
  UnregisterINFOImage(void);
  extern  void
  UnregisterINLINEImage(void);
  extern  void
  UnregisterIPLImage(void);
  extern  void
  UnregisterJBGImage(void);
  extern  void
  UnregisterJBIGImage(void);
  extern  void
  UnregisterJNXImage(void);
  extern  void
  UnregisterJPEGImage(void);
  extern  void
  UnregisterJP2Image(void);
  extern  void
  UnregisterJSONImage(void);
  extern  void
  UnregisterLABELImage(void);
  extern  void
  UnregisterLOCALEImage(void);
  extern  void
  UnregisterMACImage(void);
  extern  void
  UnregisterMAGICKImage(void);
  extern  void
  UnregisterMAPImage(void);
  extern  void
  UnregisterMASKImage(void);
  extern  void
  UnregisterMATImage(void);
  extern  void
  UnregisterMATTEImage(void);
  extern  void
  UnregisterMETAImage(void);
  extern  void
  UnregisterMIFFImage(void);
  extern  void
  UnregisterMNGImage(void);
  extern  void
  UnregisterMONOImage(void);
  extern  void
  UnregisterMPCImage(void);
  extern  void
  UnregisterMPRImage(void);
  extern  void
  UnregisterMSLImage(void);
  extern  void
  UnregisterMTVImage(void);
  extern  void
  UnregisterMVGImage(void);
  extern  void
  UnregisterNETSCAPEImage(void);
  extern  void
  UnregisterNULLImage(void);
  extern  void
  UnregisterP7Image(void);
  extern  void
  UnregisterPBMImage(void);
  extern  void
  UnregisterOTBImage(void);
  extern  void
  UnregisterPALMImage(void);
  extern  void
  UnregisterPANGOImage(void);
  extern  void
  UnregisterPATTERNImage(void);
  extern  void
  UnregisterPCDImage(void);
  extern  void
  UnregisterPCDSImage(void);
  extern  void
  UnregisterPCLImage(void);
  extern  void
  UnregisterPCTImage(void);
  extern  void
  UnregisterPCXImage(void);
  extern  void
  UnregisterPDBImage(void);
  extern  void
  UnregisterPDFImage(void);
  extern  void
  UnregisterPESImage(void);
  extern  void
  UnregisterPGXImage(void);
  extern  void
  UnregisterPICImage(void);
  extern  void
  UnregisterPICTImage(void);
  extern  void
  UnregisterPIXImage(void);
  extern  void
  UnregisterPLASMAImage(void);
  extern  void
  UnregisterPGMImage(void);
  extern  void
  UnregisterPMImage(void);
  extern  void
  UnregisterPNGImage(void);
  extern  void
  UnregisterPNMImage(void);
  extern  void
  UnregisterPPMImage(void);
  extern  void
  UnregisterPREVIEWImage(void);
  extern  void
  UnregisterPSImage(void);
  extern  void
  UnregisterPS2Image(void);
  extern  void
  UnregisterPS3Image(void);
  extern  void
  UnregisterPSDImage(void);
  extern  void
  UnregisterPTIFImage(void);
  extern  void
  UnregisterPWPImage(void);
  extern  void
  UnregisterRASImage(void);
  extern  void
  UnregisterRAWImage(void);
  extern  void
  UnregisterRGBImage(void);
  extern  void
  UnregisterRGBAImage(void);
  extern  void
  UnregisterRGFImage(void);
  extern  void
  UnregisterRLAImage(void);
  extern  void
  UnregisterRLEImage(void);
  extern  void
  UnregisterSCRImage(void);
  extern  void
  UnregisterSCREENSHOTImage(void);
  extern  void
  UnregisterSCTImage(void);
  extern  void
  UnregisterSFWImage(void);
  extern  void
  UnregisterSGIImage(void);
  extern  void
  UnregisterSHTMLImage(void);
  extern  void
  UnregisterSIXELImage(void);
  extern  void
  UnregisterSTEGANOImage(void);
  extern  void
  UnregisterSUNImage(void);
  extern  void
  UnregisterSVGImage(void);
  extern  void
  UnregisterTEXTImage(void);
  extern  void
  UnregisterTGAImage(void);
  extern  void
  UnregisterTHUMBNAILImage(void);
  extern  void
  UnregisterTIFImage(void);
  extern  void
  UnregisterTIFFImage(void);
  extern  void
  UnregisterTILEImage(void);
  extern  void
  UnregisterTIMImage(void);
  extern  void
  UnregisterTTFImage(void);
  extern  void
  UnregisterTXTImage(void);
  extern  void
  UnregisterUILImage(void);
  extern  void
  UnregisterURLImage(void);
  extern  void
  UnregisterUYVYImage(void);
  extern  void
  UnregisterVDAImage(void);
  extern  void
  UnregisterVICARImage(void);
  extern  void
  UnregisterVIDImage(void);
  extern  void
  UnregisterVIDEOImage(void);
  extern  void
  UnregisterVIFFImage(void);
  extern  void
  UnregisterVIPSImage(void);
  extern  void
  UnregisterVSTImage(void);
  extern  void
  UnregisterWBMPImage(void);
  extern  void
  UnregisterWEBPImage(void);
  extern  void
  UnregisterWMFImage(void);
  extern  void
  UnregisterWPGImage(void);
  extern  void
  UnregisterXImage(void);
  extern  void
  UnregisterXBMImage(void);
  extern  void
  UnregisterXCImage(void);
  extern  void
  UnregisterXCFImage(void);
  extern  void
  UnregisterXPMImage(void);
  extern  void
  UnregisterXPSImage(void);
  extern  void
  UnregisterXVImage(void);
  extern  void
  UnregisterXWDImage(void);
  extern  void
  UnregisterYCBCRImage(void);
  extern  void
  UnregisterYUVImage(void);

extern  void
  RegisterStaticModules(void);
  extern  void
  UnregisterStaticModules(void);

#endif
