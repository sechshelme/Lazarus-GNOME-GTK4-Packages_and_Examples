/*
 * << Haru Free PDF Library 2.0.8 >> -- hpdf.h
 *
 * URL http://libharu.org/
 *
 * Copyright (c) 1999-2006 Takeshi Kanno
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.
 * It is provided "as is" without express or implied warranty.
 *
 */

#ifndef _HPDF_H
#define _HPDF_H


typedef void         *HPDF_HANDLE;
typedef HPDF_HANDLE   HPDF_Boolean;
typedef HPDF_HANDLE   HPDF_Doc;
typedef HPDF_HANDLE   HPDF_Page;
typedef HPDF_HANDLE   HPDF_Pages;
typedef HPDF_HANDLE   HPDF_Stream;
typedef HPDF_HANDLE   HPDF_Image;
typedef HPDF_HANDLE   HPDF_Font;
typedef HPDF_HANDLE   HPDF_Outline;
typedef HPDF_HANDLE   HPDF_Encoder;
typedef HPDF_HANDLE   HPDF_3DMeasure;
typedef HPDF_HANDLE   HPDF_ExData;
typedef HPDF_HANDLE   HPDF_Destination;
typedef HPDF_HANDLE   HPDF_XObject;
typedef HPDF_HANDLE   HPDF_Annotation;
typedef HPDF_HANDLE   HPDF_ExtGState;
typedef HPDF_HANDLE   HPDF_FontDef;
typedef HPDF_HANDLE   HPDF_U3D;
typedef HPDF_HANDLE   HPDF_JavaScript;
typedef HPDF_HANDLE   HPDF_Error;
typedef HPDF_HANDLE   HPDF_MMgr;
typedef HPDF_HANDLE   HPDF_Dict;
typedef HPDF_HANDLE   HPDF_EmbeddedFile;
typedef HPDF_HANDLE   HPDF_OutputIntent;
typedef HPDF_HANDLE   HPDF_Xref;
typedef HPDF_HANDLE   HPDF_Shading;


extern char *
HPDF_GetVersion  (void);


extern HPDF_Doc
HPDF_NewEx  (HPDF_Error_Handler   user_error_fn,
             HPDF_Alloc_Func      user_alloc_fn,
             HPDF_Free_Func       user_free_fn,
             HPDF_UINT            mem_pool_buf_size,
             void                *user_data);

extern HPDF_Doc
HPDF_New  (HPDF_Error_Handler   user_error_fn,
           void                *user_data);


extern HPDF_STATUS
HPDF_SetErrorHandler  (HPDF_Doc            pdf,
                       HPDF_Error_Handler  user_error_fn);


extern void
HPDF_Free  (HPDF_Doc  pdf);

extern HPDF_MMgr
HPDF_GetDocMMgr  (HPDF_Doc doc);

extern HPDF_STATUS
HPDF_NewDoc  (HPDF_Doc  pdf);


extern void
HPDF_FreeDoc  (HPDF_Doc  pdf);


extern HPDF_BOOL
HPDF_HasDoc  (HPDF_Doc  pdf);


extern void
HPDF_FreeDocAll  (HPDF_Doc  pdf);


extern HPDF_STATUS
HPDF_SaveToStream  (HPDF_Doc   pdf);

extern HPDF_STATUS
HPDF_GetContents   (HPDF_Doc   pdf,
                   HPDF_BYTE  *buf,
                 HPDF_UINT32  *size);

extern HPDF_UINT32
HPDF_GetStreamSize  (HPDF_Doc   pdf);


extern HPDF_STATUS
HPDF_ReadFromStream  (HPDF_Doc       pdf,
                      HPDF_BYTE     *buf,
                      HPDF_UINT32   *size);


extern HPDF_STATUS
HPDF_ResetStream  (HPDF_Doc     pdf);


extern HPDF_STATUS
HPDF_SaveToFile  (HPDF_Doc     pdf,
                  const char  *file_name);


extern HPDF_STATUS
HPDF_GetError  (HPDF_Doc   pdf);


extern HPDF_STATUS
HPDF_GetErrorDetail  (HPDF_Doc   pdf);

extern void
HPDF_ResetError  (HPDF_Doc   pdf);


extern HPDF_STATUS
HPDF_CheckError  (HPDF_Error   error);


extern HPDF_STATUS
HPDF_SetPagesConfiguration  (HPDF_Doc    pdf,
                             HPDF_UINT   page_per_pages);


extern HPDF_Page
HPDF_GetPageByIndex  (HPDF_Doc    pdf,
                      HPDF_UINT   index);


extern HPDF_STATUS
HPDF_SetPDFAConformance  (HPDF_Doc      pdf,
                          HPDF_PDFAType pdfa_type);

extern HPDF_STATUS
HPDF_AddPDFAXmpExtension  (HPDF_Doc      pdf,
                             const char   *xmp_description);

extern HPDF_STATUS
HPDF_AppendOutputIntents(HPDF_Doc pdf, const char *iccname, HPDF_Dict iccdict);

/*---------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------*/

extern HPDF_MMgr
HPDF_GetPageMMgr    (HPDF_Page  page);

extern HPDF_PageLayout
HPDF_GetPageLayout  (HPDF_Doc   pdf);


extern HPDF_STATUS
HPDF_SetPageLayout  (HPDF_Doc          pdf,
                     HPDF_PageLayout   layout);


extern HPDF_PageMode
HPDF_GetPageMode  (HPDF_Doc   pdf);


extern HPDF_STATUS
HPDF_SetPageMode  (HPDF_Doc        pdf,
                   HPDF_PageMode   mode);


extern HPDF_UINT
HPDF_GetViewerPreference  (HPDF_Doc   pdf);


extern HPDF_STATUS
HPDF_SetViewerPreference  (HPDF_Doc     pdf,
                           HPDF_UINT    value);


extern HPDF_STATUS
HPDF_SetOpenAction  (HPDF_Doc           pdf,
                     HPDF_Destination   open_action);


/*---------------------------------------------------------------------------*/
/*----- page handling -------------------------------------------------------*/


extern HPDF_Page
HPDF_GetCurrentPage  (HPDF_Doc  pdf);


extern HPDF_Page
HPDF_AddPage  (HPDF_Doc   pdf);


extern HPDF_Page
HPDF_InsertPage  (HPDF_Doc    pdf,
                  HPDF_Page   page);


extern HPDF_STATUS
HPDF_Page_SetWidth  (HPDF_Page   page,
                     HPDF_REAL   value);


extern HPDF_STATUS
HPDF_Page_SetHeight  (HPDF_Page   page,
                      HPDF_REAL   value);

extern HPDF_STATUS
HPDF_Page_SetBoundary  (HPDF_Page           page,
                        HPDF_PageBoundary   boundary,
                        HPDF_REAL           left,
                        HPDF_REAL           bottom,
                        HPDF_REAL           right,
                        HPDF_REAL           top);

extern HPDF_STATUS
HPDF_Page_SetSize  (HPDF_Page            page,
                    HPDF_PageSizes       size,
                    HPDF_PageDirection   direction);

extern HPDF_STATUS
HPDF_Page_SetRotate  (HPDF_Page     page,
                      HPDF_UINT16   angle);

extern HPDF_STATUS
HPDF_Page_SetZoom  (HPDF_Page     page,
                    HPDF_REAL     zoom);

/*---------------------------------------------------------------------------*/
/*----- font handling -------------------------------------------------------*/


extern HPDF_Font
HPDF_GetFont  (HPDF_Doc     pdf,
               const char  *font_name,
               const char  *encoding_name);


extern char*
HPDF_LoadType1FontFromFile  (HPDF_Doc     pdf,
                             const char  *afm_file_name,
                             const char  *data_file_name);


extern HPDF_FontDef
HPDF_GetTTFontDefFromFile (HPDF_Doc     pdf,
                           const char  *file_name,
                           HPDF_BOOL    embedding);

extern char*
HPDF_LoadTTFontFromFile (HPDF_Doc     pdf,
                         const char  *file_name,
                         HPDF_BOOL    embedding);


extern char*
HPDF_LoadTTFontFromFile2 (HPDF_Doc     pdf,
                          const char  *file_name,
                          HPDF_UINT    index,
                          HPDF_BOOL    embedding);

extern char*
HPDF_LoadTTFontFromMemory (HPDF_Doc         pdf,
                           const HPDF_BYTE *buffer,
                           HPDF_UINT        size,
                           HPDF_BOOL        embedding);

extern HPDF_STATUS
HPDF_AddPageLabel  (HPDF_Doc            pdf,
                    HPDF_UINT           page_num,
                    HPDF_PageNumStyle   style,
                    HPDF_UINT           first_page,
                    const char         *prefix);


extern HPDF_STATUS
HPDF_UseJPFonts   (HPDF_Doc   pdf);


extern HPDF_STATUS
HPDF_UseKRFonts   (HPDF_Doc   pdf);


extern HPDF_STATUS
HPDF_UseCNSFonts   (HPDF_Doc   pdf);


extern HPDF_STATUS
HPDF_UseCNTFonts   (HPDF_Doc   pdf);


/*--------------------------------------------------------------------------*/
/*----- outline ------------------------------------------------------------*/


extern HPDF_Outline
HPDF_CreateOutline  (HPDF_Doc       pdf,
                     HPDF_Outline   parent,
                     const char    *title,
                     HPDF_Encoder   encoder);


extern HPDF_STATUS
HPDF_Outline_SetOpened  (HPDF_Outline  outline,
                         HPDF_BOOL     opened);


extern HPDF_STATUS
HPDF_Outline_SetDestination (HPDF_Outline      outline,
                             HPDF_Destination  dst);


/*--------------------------------------------------------------------------*/
/*----- destination --------------------------------------------------------*/

extern HPDF_Destination
HPDF_Page_CreateDestination  (HPDF_Page   page);


extern HPDF_STATUS
HPDF_Destination_SetXYZ  (HPDF_Destination  dst,
                          HPDF_REAL         left,
                          HPDF_REAL         top,
                          HPDF_REAL         zoom);


extern HPDF_STATUS
HPDF_Destination_SetFit  (HPDF_Destination  dst);


extern HPDF_STATUS
HPDF_Destination_SetFitH  (HPDF_Destination  dst,
                           HPDF_REAL         top);


extern HPDF_STATUS
HPDF_Destination_SetFitV  (HPDF_Destination  dst,
                           HPDF_REAL         left);


extern HPDF_STATUS
HPDF_Destination_SetFitR  (HPDF_Destination  dst,
                           HPDF_REAL         left,
                           HPDF_REAL         bottom,
                           HPDF_REAL         right,
                           HPDF_REAL         top);


extern HPDF_STATUS
HPDF_Destination_SetFitB  (HPDF_Destination  dst);


extern HPDF_STATUS
HPDF_Destination_SetFitBH  (HPDF_Destination  dst,
                            HPDF_REAL         top);


extern HPDF_STATUS
HPDF_Destination_SetFitBV  (HPDF_Destination  dst,
                            HPDF_REAL         left);

/*--------------------------------------------------------------------------*/
/*----- encoder ------------------------------------------------------------*/

extern HPDF_Encoder
HPDF_GetEncoder  (HPDF_Doc     pdf,
                  const char  *encoding_name);


extern HPDF_Encoder
HPDF_GetCurrentEncoder  (HPDF_Doc   pdf);


extern HPDF_STATUS
HPDF_SetCurrentEncoder  (HPDF_Doc     pdf,
                         const char  *encoding_name);


extern HPDF_EncoderType
HPDF_Encoder_GetType  (HPDF_Encoder   encoder);


extern HPDF_ByteType
HPDF_Encoder_GetByteType  (HPDF_Encoder    encoder,
                           const char     *text,
                           HPDF_UINT       index);


extern HPDF_UNICODE
HPDF_Encoder_GetUnicode  (HPDF_Encoder   encoder,
                          HPDF_UINT16    code);


extern HPDF_WritingMode
HPDF_Encoder_GetWritingMode (HPDF_Encoder   encoder);


extern HPDF_STATUS
HPDF_UseJPEncodings   (HPDF_Doc   pdf);



extern HPDF_STATUS
HPDF_UseKREncodings   (HPDF_Doc   pdf);



extern HPDF_STATUS
HPDF_UseCNSEncodings   (HPDF_Doc   pdf);



extern HPDF_STATUS
HPDF_UseCNTEncodings   (HPDF_Doc   pdf);


extern HPDF_STATUS
HPDF_UseUTFEncodings   (HPDF_Doc   pdf);


/*--------------------------------------------------------------------------*/
/*----- XObject ------------------------------------------------------------*/

extern HPDF_XObject
HPDF_Page_CreateXObjectFromImage    (HPDF_Doc       pdf,
                                     HPDF_Page      page,
                                     HPDF_Rect      rect,
                                     HPDF_Image     image,
                                     HPDF_BOOL      zoom);

extern HPDF_XObject
HPDF_Page_CreateXObjectAsWhiteRect  (HPDF_Doc   pdf,
                                     HPDF_Page  page,
                                     HPDF_Rect  rect);

/*--------------------------------------------------------------------------*/
/*----- annotation ---------------------------------------------------------*/

extern HPDF_Annotation
HPDF_Page_Create3DAnnot    (HPDF_Page       page,
                            HPDF_Rect       rect,
                            HPDF_BOOL       tb,
                            HPDF_BOOL       np,
                            HPDF_U3D        u3d,
                            HPDF_Image      ap);

extern HPDF_Annotation
HPDF_Page_CreateTextAnnot  (HPDF_Page       page,
                            HPDF_Rect       rect,
                            const char     *text,
                            HPDF_Encoder    encoder);

extern HPDF_Annotation
HPDF_Page_CreateFreeTextAnnot  (HPDF_Page       page,
                                HPDF_Rect       rect,
                                const char     *text,
                                HPDF_Encoder    encoder);

extern HPDF_Annotation
HPDF_Page_CreateLineAnnot  (HPDF_Page       page,
                            const char     *text,
                            HPDF_Encoder    encoder);

extern HPDF_Annotation
HPDF_Page_CreateWidgetAnnot_WhiteOnlyWhilePrint (HPDF_Doc   pdf,
                                                 HPDF_Page  page,
                                                 HPDF_Rect  rect);

extern HPDF_Annotation
HPDF_Page_CreateWidgetAnnot (HPDF_Page  page,
                             HPDF_Rect  rect);

extern HPDF_Annotation
HPDF_Page_CreateLinkAnnot  (HPDF_Page          page,
                            HPDF_Rect          rect,
                            HPDF_Destination   dst);


extern HPDF_Annotation
HPDF_Page_CreateURILinkAnnot  (HPDF_Page     page,
                               HPDF_Rect     rect,
                               const char   *uri);


HPDF_Annotation
HPDF_Page_CreateTextMarkupAnnot (HPDF_Page      page,
                                 HPDF_Rect      rect,
                                 const char    *text,
                                 HPDF_Encoder   encoder,
                                 HPDF_AnnotType subType);

extern HPDF_Annotation
HPDF_Page_CreateHighlightAnnot  (HPDF_Page    page,
                                 HPDF_Rect    rect,
                                 const char  *text,
                                 HPDF_Encoder encoder);

extern HPDF_Annotation
HPDF_Page_CreateUnderlineAnnot (HPDF_Page    page,
                                HPDF_Rect    rect,
                                const char  *text,
                                HPDF_Encoder encoder);

extern HPDF_Annotation
HPDF_Page_CreateSquigglyAnnot  (HPDF_Page    page,
                                HPDF_Rect    rect,
                                const char  *text,
                                HPDF_Encoder encoder);

extern HPDF_Annotation
HPDF_Page_CreateStrikeOutAnnot  (HPDF_Page   page,
                                 HPDF_Rect    rect,
                                 const char  *text,
                                 HPDF_Encoder encoder);

extern HPDF_Annotation
HPDF_Page_CreatePopupAnnot  (HPDF_Page          page,
                             HPDF_Rect          rect,
                             HPDF_Annotation    parent);

extern HPDF_Annotation
HPDF_Page_CreateStampAnnot  (HPDF_Page           page,
                             HPDF_Rect           rect,
                             HPDF_StampAnnotName name,
                             const char*         text,
                             HPDF_Encoder        encoder);

extern HPDF_Annotation
HPDF_Page_CreateProjectionAnnot(HPDF_Page    page,
                                HPDF_Rect    rect,
                                const char  *text,
                                HPDF_Encoder encoder);

extern HPDF_Annotation
HPDF_Page_CreateSquareAnnot (HPDF_Page          page,
                             HPDF_Rect          rect,
                             const char        *text,
                             HPDF_Encoder       encoder);

extern HPDF_Annotation
HPDF_Page_CreateCircleAnnot (HPDF_Page          page,
                             HPDF_Rect          rect,
                             const char        *text,
                             HPDF_Encoder       encoder);

extern HPDF_STATUS
HPDF_LinkAnnot_SetHighlightMode  (HPDF_Annotation           annot,
                                  HPDF_AnnotHighlightMode   mode);

extern HPDF_STATUS
HPDF_LinkAnnot_SetJavaScript(HPDF_Annotation    annot,
                             HPDF_JavaScript    javascript);

extern HPDF_STATUS
HPDF_LinkAnnot_SetBorderStyle  (HPDF_Annotation  annot,
                                HPDF_REAL        width,
                                HPDF_UINT16      dash_on,
                                HPDF_UINT16      dash_off);


extern HPDF_STATUS
HPDF_TextAnnot_SetIcon  (HPDF_Annotation   annot,
                         HPDF_AnnotIcon    icon);


extern HPDF_STATUS
HPDF_TextAnnot_SetOpened  (HPDF_Annotation   annot,
                          HPDF_BOOL          opened);

extern HPDF_STATUS
HPDF_Annot_SetRGBColor (HPDF_Annotation annot, HPDF_RGBColor color);

extern HPDF_STATUS
HPDF_Annot_SetCMYKColor (HPDF_Annotation annot, HPDF_CMYKColor color);

extern HPDF_STATUS
HPDF_Annot_SetGrayColor (HPDF_Annotation annot, HPDF_REAL color);

extern HPDF_STATUS
HPDF_Annot_SetNoColor (HPDF_Annotation annot);

extern HPDF_STATUS
HPDF_MarkupAnnot_SetTitle (HPDF_Annotation annot, const char* name);

extern HPDF_STATUS
HPDF_MarkupAnnot_SetSubject (HPDF_Annotation annot, const char* name);

extern HPDF_STATUS
HPDF_MarkupAnnot_SetCreationDate (HPDF_Annotation annot, HPDF_Date value);

extern HPDF_STATUS
HPDF_MarkupAnnot_SetTransparency (HPDF_Annotation annot, HPDF_REAL value);

extern HPDF_STATUS
HPDF_MarkupAnnot_SetIntent (HPDF_Annotation  annot, HPDF_AnnotIntent  intent);

extern HPDF_STATUS
HPDF_MarkupAnnot_SetPopup (HPDF_Annotation annot, HPDF_Annotation popup);

extern HPDF_STATUS
HPDF_MarkupAnnot_SetRectDiff (HPDF_Annotation  annot, HPDF_Rect  rect); /* RD entry */

extern HPDF_STATUS
HPDF_MarkupAnnot_SetCloudEffect (HPDF_Annotation  annot, HPDF_INT cloudIntensity); /* BE entry */

extern HPDF_STATUS
HPDF_MarkupAnnot_SetInteriorRGBColor (HPDF_Annotation  annot, HPDF_RGBColor color); /* IC with RGB entry */

extern HPDF_STATUS
HPDF_MarkupAnnot_SetInteriorCMYKColor (HPDF_Annotation  annot, HPDF_CMYKColor color); /* IC with CMYK entry */

extern HPDF_STATUS
HPDF_MarkupAnnot_SetInteriorGrayColor (HPDF_Annotation  annot, HPDF_REAL color); /* IC with Gray entry */

extern HPDF_STATUS
HPDF_MarkupAnnot_SetInteriorTransparent (HPDF_Annotation  annot); /* IC with No Color entry */

extern HPDF_STATUS
HPDF_TextMarkupAnnot_SetQuadPoints ( HPDF_Annotation annot, HPDF_Point lb, HPDF_Point rb, HPDF_Point rt, HPDF_Point lt); /* l-left, r-right, b-bottom, t-top positions */

extern HPDF_STATUS
HPDF_Annot_Set3DView  (HPDF_MMgr          mmgr,
                       HPDF_Annotation    annot,
                       HPDF_Annotation    annot3d,
                       HPDF_Dict          view);

extern HPDF_STATUS
HPDF_PopupAnnot_SetOpened  (HPDF_Annotation   annot,
                            HPDF_BOOL         opened);

extern HPDF_STATUS
HPDF_FreeTextAnnot_SetLineEndingStyle (HPDF_Annotation annot, HPDF_LineAnnotEndingStyle startStyle, HPDF_LineAnnotEndingStyle endStyle);

extern HPDF_STATUS
HPDF_FreeTextAnnot_Set3PointCalloutLine (HPDF_Annotation annot, HPDF_Point startPoint, HPDF_Point kneePoint, HPDF_Point endPoint); /* Callout line will be in default user space */

extern HPDF_STATUS
HPDF_FreeTextAnnot_Set2PointCalloutLine (HPDF_Annotation annot, HPDF_Point startPoint, HPDF_Point endPoint); /* Callout line will be in default user space */

extern HPDF_STATUS
HPDF_FreeTextAnnot_SetDefaultStyle (HPDF_Annotation  annot, const char* style);

extern HPDF_STATUS
HPDF_LineAnnot_SetPosition (HPDF_Annotation annot,
                            HPDF_Point startPoint, HPDF_LineAnnotEndingStyle startStyle,
                            HPDF_Point endPoint, HPDF_LineAnnotEndingStyle endStyle);

extern HPDF_STATUS
HPDF_LineAnnot_SetLeader (HPDF_Annotation annot, HPDF_INT leaderLen, HPDF_INT leaderExtLen, HPDF_INT leaderOffsetLen);

extern HPDF_STATUS
HPDF_LineAnnot_SetCaption (HPDF_Annotation annot, HPDF_BOOL showCaption, HPDF_LineAnnotCapPosition position, HPDF_INT horzOffset, HPDF_INT vertOffset);

extern HPDF_STATUS
HPDF_Annotation_SetBorderStyle  (HPDF_Annotation  annot,
                                 HPDF_BSSubtype   subtype,
                                 HPDF_REAL        width,
                                 HPDF_UINT16      dash_on,
                                 HPDF_UINT16      dash_off,
                                 HPDF_UINT16      dash_phase);

extern HPDF_STATUS
HPDF_ProjectionAnnot_SetExData(HPDF_Annotation annot, HPDF_ExData exdata);


/*--------------------------------------------------------------------------*/
/*----- 3D Measure ---------------------------------------------------------*/
extern HPDF_3DMeasure
HPDF_Page_Create3DC3DMeasure(HPDF_Page       page,
                             HPDF_Point3D    firstanchorpoint,
                             HPDF_Point3D    textanchorpoint
                             );

extern HPDF_3DMeasure
HPDF_Page_CreatePD33DMeasure(HPDF_Page       page,
                             HPDF_Point3D    annotationPlaneNormal,
                             HPDF_Point3D    firstAnchorPoint,
                             HPDF_Point3D    secondAnchorPoint,
                             HPDF_Point3D    leaderLinesDirection,
                             HPDF_Point3D    measurementValuePoint,
                             HPDF_Point3D    textYDirection,
                             HPDF_REAL       value,
                             const char*     unitsString
                             );

extern HPDF_STATUS
HPDF_3DMeasure_SetName(HPDF_3DMeasure measure,
                       const char*    name);

extern HPDF_STATUS
HPDF_3DMeasure_SetColor(HPDF_3DMeasure measure,
                        HPDF_RGBColor color);

extern HPDF_STATUS
HPDF_3DMeasure_SetTextSize(HPDF_3DMeasure measure,
                           HPDF_REAL      textsize);

extern HPDF_STATUS
HPDF_3DC3DMeasure_SetTextBoxSize(HPDF_3DMeasure measure,
                                 HPDF_INT32 x,
                                 HPDF_INT32 y);

extern HPDF_STATUS
HPDF_3DC3DMeasure_SetText(HPDF_3DMeasure measure,
                          const char*    text,
                          HPDF_Encoder   encoder);

extern HPDF_STATUS
HPDF_3DC3DMeasure_SetProjectionAnotation(HPDF_3DMeasure measure,
                                         HPDF_Annotation projectionanotation);

/*--------------------------------------------------------------------------*/
/*----- External Data ---------------------------------------------------------*/

extern HPDF_ExData
HPDF_Page_Create3DAnnotExData(HPDF_Page       page );

extern HPDF_STATUS
HPDF_3DAnnotExData_Set3DMeasurement(HPDF_ExData exdata, HPDF_3DMeasure measure);

/*--------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------*/
/*----- 3D View ---------------------------------------------------------*/

extern HPDF_Dict
HPDF_Page_Create3DView    (HPDF_Page       page,
                           HPDF_U3D        u3d,
                           HPDF_Annotation annot3d,
                           const char     *name);

extern HPDF_STATUS
HPDF_3DView_Add3DC3DMeasure(HPDF_Dict       view,
                            HPDF_3DMeasure  measure);

/*--------------------------------------------------------------------------*/
/*----- image data ---------------------------------------------------------*/

extern HPDF_Image
HPDF_LoadPngImageFromMem  (HPDF_Doc     pdf,
                    const HPDF_BYTE    *buffer,
                          HPDF_UINT     size);

extern HPDF_Image
HPDF_LoadPngImageFromFile (HPDF_Doc      pdf,
                           const char   *filename);


extern HPDF_Image
HPDF_LoadPngImageFromFile2 (HPDF_Doc      pdf,
                            const char   *filename);


extern HPDF_Image
HPDF_LoadJpegImageFromFile (HPDF_Doc      pdf,
                            const char   *filename);

extern HPDF_Image
HPDF_LoadJpegImageFromMem   (HPDF_Doc      pdf,
                      const HPDF_BYTE     *buffer,
                            HPDF_UINT      size);

extern HPDF_Image
HPDF_LoadU3DFromFile (HPDF_Doc      pdf,
                      const char   *filename);

extern HPDF_Image
HPDF_LoadU3DFromMem  (HPDF_Doc      pdf,
               const HPDF_BYTE     *buffer,
                     HPDF_UINT      size);

extern HPDF_Image
HPDF_Image_LoadRaw1BitImageFromMem  (HPDF_Doc           pdf,
                           const HPDF_BYTE   *buf,
                          HPDF_UINT          width,
                          HPDF_UINT          height,
                          HPDF_UINT          line_width,
                          HPDF_BOOL          black_is1,
                          HPDF_BOOL          top_is_first);


extern HPDF_Image
HPDF_LoadRawImageFromFile  (HPDF_Doc           pdf,
                            const char        *filename,
                            HPDF_UINT          width,
                            HPDF_UINT          height,
                            HPDF_ColorSpace    color_space);


extern HPDF_Image
HPDF_LoadRawImageFromMem  (HPDF_Doc           pdf,
                           const HPDF_BYTE   *buf,
                           HPDF_UINT          width,
                           HPDF_UINT          height,
                           HPDF_ColorSpace    color_space,
                           HPDF_UINT          bits_per_component);

extern HPDF_STATUS
HPDF_Image_AddSMask  (HPDF_Image    image,
                      HPDF_Image    smask);

extern HPDF_Point
HPDF_Image_GetSize (HPDF_Image  image);


extern HPDF_STATUS
HPDF_Image_GetSize2 (HPDF_Image  image, HPDF_Point *size);


extern HPDF_UINT
HPDF_Image_GetWidth  (HPDF_Image   image);


extern HPDF_UINT
HPDF_Image_GetHeight  (HPDF_Image   image);


extern HPDF_UINT
HPDF_Image_GetBitsPerComponent (HPDF_Image  image);


extern char*
HPDF_Image_GetColorSpace (HPDF_Image  image);


extern HPDF_STATUS
HPDF_Image_SetColorMask (HPDF_Image   image,
                         HPDF_UINT    rmin,
                         HPDF_UINT    rmax,
                         HPDF_UINT    gmin,
                         HPDF_UINT    gmax,
                         HPDF_UINT    bmin,
                         HPDF_UINT    bmax);


extern HPDF_STATUS
HPDF_Image_SetMaskImage  (HPDF_Image   image,
                          HPDF_Image   mask_image);


/*--------------------------------------------------------------------------*/
/*----- info dictionary ----------------------------------------------------*/


extern HPDF_STATUS
HPDF_SetInfoAttr (HPDF_Doc        pdf,
                  HPDF_InfoType   type,
                  const char     *value);


extern char*
HPDF_GetInfoAttr (HPDF_Doc        pdf,
                  HPDF_InfoType   type);


extern HPDF_STATUS
HPDF_SetInfoDateAttr (HPDF_Doc        pdf,
                      HPDF_InfoType   type,
                      HPDF_Date       value);


/*--------------------------------------------------------------------------*/
/*----- encryption ---------------------------------------------------------*/

extern HPDF_STATUS
HPDF_SetPassword  (HPDF_Doc      pdf,
                   const char   *owner_passwd,
                   const char   *user_passwd);


extern HPDF_STATUS
HPDF_SetPermission  (HPDF_Doc    pdf,
                     HPDF_UINT   permission);


extern HPDF_STATUS
HPDF_SetEncryptionMode  (HPDF_Doc           pdf,
                         HPDF_EncryptMode   mode,
                         HPDF_UINT          key_len);


/*--------------------------------------------------------------------------*/
/*----- compression --------------------------------------------------------*/

extern HPDF_STATUS
HPDF_SetCompressionMode  (HPDF_Doc    pdf,
                          HPDF_UINT   mode);


/*--------------------------------------------------------------------------*/
/*----- font ---------------------------------------------------------------*/

extern char*
HPDF_Font_GetFontName  (HPDF_Font    font);


extern char*
HPDF_Font_GetEncodingName  (HPDF_Font    font);


extern HPDF_INT
HPDF_Font_GetUnicodeWidth  (HPDF_Font       font,
                            HPDF_UNICODE    code);

extern HPDF_Box
HPDF_Font_GetBBox  (HPDF_Font    font);


extern HPDF_INT
HPDF_Font_GetAscent  (HPDF_Font  font);


extern HPDF_INT
HPDF_Font_GetDescent  (HPDF_Font  font);


extern HPDF_UINT
HPDF_Font_GetXHeight  (HPDF_Font  font);


extern HPDF_UINT
HPDF_Font_GetCapHeight  (HPDF_Font  font);


extern HPDF_TextWidth
HPDF_Font_TextWidth  (HPDF_Font          font,
                      const HPDF_BYTE   *text,
                      HPDF_UINT          len);


extern HPDF_UINT
HPDF_Font_MeasureText (HPDF_Font          font,
                       const HPDF_BYTE   *text,
                       HPDF_UINT          len,
                       HPDF_REAL          width,
                       HPDF_REAL          font_size,
                       HPDF_REAL          char_space,
                       HPDF_REAL          word_space,
                       HPDF_BOOL          wordwrap,
                       HPDF_REAL         *real_width);


/*--------------------------------------------------------------------------*/
/*----- attachments -------------------------------------------------------*/

extern HPDF_EmbeddedFile
HPDF_AttachFile  (HPDF_Doc    pdf,
                  const char *file);

extern HPDF_STATUS
HPDF_EmbeddedFile_SetName  (HPDF_EmbeddedFile  emfile,
                            const char        *name);

extern HPDF_STATUS
HPDF_EmbeddedFile_SetDescription (HPDF_EmbeddedFile  emfile,
                                  const char        *new_description);

extern HPDF_STATUS
HPDF_EmbeddedFile_SetSubtype  (HPDF_EmbeddedFile  emfile,
                               const char        *subtype);

extern HPDF_STATUS
HPDF_EmbeddedFile_SetAFRelationship  (HPDF_EmbeddedFile    emfile,
                                      HPDF_AFRelationship  relationship);

extern HPDF_STATUS
HPDF_EmbeddedFile_SetSize  (HPDF_EmbeddedFile  emfile,
                            HPDF_UINT64        size);

extern HPDF_STATUS
HPDF_EmbeddedFile_SetCreationDate  (HPDF_EmbeddedFile  emfile,
                                    HPDF_Date          creationDate);

extern HPDF_STATUS
HPDF_EmbeddedFile_SetLastModificationDate  (HPDF_EmbeddedFile  emfile,
                                            HPDF_Date          lastModificationDate);


/*--------------------------------------------------------------------------*/
/*----- extended graphics state --------------------------------------------*/

extern HPDF_ExtGState
HPDF_CreateExtGState  (HPDF_Doc  pdf);


extern HPDF_STATUS
HPDF_ExtGState_SetAlphaStroke  (HPDF_ExtGState   ext_gstate,
                                HPDF_REAL        value);


extern HPDF_STATUS
HPDF_ExtGState_SetAlphaFill  (HPDF_ExtGState   ext_gstate,
                              HPDF_REAL        value);



extern HPDF_STATUS
HPDF_ExtGState_SetBlendMode  (HPDF_ExtGState   ext_gstate,
                              HPDF_BlendMode   mode);


/*--------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------*/

extern HPDF_REAL
HPDF_Page_TextWidth  (HPDF_Page    page,
                      const char  *text);


extern HPDF_UINT
HPDF_Page_MeasureText  (HPDF_Page    page,
                        const char  *text,
                        HPDF_REAL    width,
                        HPDF_BOOL    wordwrap,
                        HPDF_REAL   *real_width);


extern HPDF_REAL
HPDF_Page_GetWidth  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetHeight  (HPDF_Page   page);


extern HPDF_UINT16
HPDF_Page_GetGMode  (HPDF_Page   page);


extern HPDF_Point
HPDF_Page_GetCurrentPos  (HPDF_Page   page);


extern HPDF_STATUS
HPDF_Page_GetCurrentPos2  (HPDF_Page    page,
                           HPDF_Point  *pos);


extern HPDF_Point
HPDF_Page_GetCurrentTextPos (HPDF_Page   page);


extern HPDF_STATUS
HPDF_Page_GetCurrentTextPos2  (HPDF_Page    page,
                               HPDF_Point  *pos);


extern HPDF_Font
HPDF_Page_GetCurrentFont  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetCurrentFontSize  (HPDF_Page   page);


extern HPDF_TransMatrix
HPDF_Page_GetTransMatrix  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetLineWidth  (HPDF_Page   page);


extern HPDF_LineCap
HPDF_Page_GetLineCap  (HPDF_Page   page);


extern HPDF_LineJoin
HPDF_Page_GetLineJoin  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetMiterLimit  (HPDF_Page   page);


extern HPDF_DashMode
HPDF_Page_GetDash  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetFlat  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetCharSpace  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetWordSpace  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetHorizontalScalling  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetTextLeading  (HPDF_Page   page);


extern HPDF_TextRenderingMode
HPDF_Page_GetTextRenderingMode  (HPDF_Page   page);


/* This function is obsolete. Use HPDF_Page_GetTextRise.  */
extern HPDF_REAL
HPDF_Page_GetTextRaise  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetTextRise  (HPDF_Page   page);


extern HPDF_RGBColor
HPDF_Page_GetRGBFill  (HPDF_Page   page);


extern HPDF_RGBColor
HPDF_Page_GetRGBStroke  (HPDF_Page   page);


extern HPDF_CMYKColor
HPDF_Page_GetCMYKFill  (HPDF_Page   page);


extern HPDF_CMYKColor
HPDF_Page_GetCMYKStroke  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetGrayFill  (HPDF_Page   page);


extern HPDF_REAL
HPDF_Page_GetGrayStroke  (HPDF_Page   page);


extern HPDF_ColorSpace
HPDF_Page_GetStrokingColorSpace (HPDF_Page   page);


extern HPDF_ColorSpace
HPDF_Page_GetFillingColorSpace (HPDF_Page   page);


extern HPDF_TransMatrix
HPDF_Page_GetTextMatrix  (HPDF_Page   page);


extern HPDF_UINT
HPDF_Page_GetGStateDepth  (HPDF_Page   page);


/*--------------------------------------------------------------------------*/
/*----- GRAPHICS OPERATORS -------------------------------------------------*/


/*--- General graphics state ---------------------------------------------*/

/* w */
extern HPDF_STATUS
HPDF_Page_SetLineWidth  (HPDF_Page  page,
                         HPDF_REAL  line_width);

/* J */
extern HPDF_STATUS
HPDF_Page_SetLineCap  (HPDF_Page     page,
                       HPDF_LineCap  line_cap);

/* j */
extern HPDF_STATUS
HPDF_Page_SetLineJoin  (HPDF_Page      page,
                        HPDF_LineJoin  line_join);

/* M */
extern HPDF_STATUS
HPDF_Page_SetMiterLimit  (HPDF_Page  page,
                          HPDF_REAL  miter_limit);

/* d */
extern HPDF_STATUS
HPDF_Page_SetDash  (HPDF_Page           page,
                    const HPDF_REAL  *dash_ptn,
                    HPDF_UINT           num_param,
                    HPDF_REAL           phase);



/* ri --not implemented yet */

/* i */
extern HPDF_STATUS
HPDF_Page_SetFlat  (HPDF_Page    page,
                    HPDF_REAL    flatness);

/* gs */

extern HPDF_STATUS
HPDF_Page_SetExtGState  (HPDF_Page        page,
                         HPDF_ExtGState   ext_gstate);

/* sh */
extern HPDF_STATUS
HPDF_Page_SetShading  (HPDF_Page    page,
                       HPDF_Shading shading);


/*--- Special graphic state operator --------------------------------------*/

/* q */
extern HPDF_STATUS
HPDF_Page_GSave  (HPDF_Page    page);

/* Q */
extern HPDF_STATUS
HPDF_Page_GRestore  (HPDF_Page    page);

/* cm */
extern HPDF_STATUS
HPDF_Page_Concat  (HPDF_Page    page,
                   HPDF_REAL    a,
                   HPDF_REAL    b,
                   HPDF_REAL    c,
                   HPDF_REAL    d,
                   HPDF_REAL    x,
                   HPDF_REAL    y);

/*--- Path construction operator ------------------------------------------*/

/* m */
extern HPDF_STATUS
HPDF_Page_MoveTo  (HPDF_Page    page,
                   HPDF_REAL    x,
                   HPDF_REAL    y);

/* l */
extern HPDF_STATUS
HPDF_Page_LineTo  (HPDF_Page    page,
                   HPDF_REAL    x,
                   HPDF_REAL    y);

/* c */
extern HPDF_STATUS
HPDF_Page_CurveTo  (HPDF_Page    page,
                    HPDF_REAL    x1,
                    HPDF_REAL    y1,
                    HPDF_REAL    x2,
                    HPDF_REAL    y2,
                    HPDF_REAL    x3,
                    HPDF_REAL    y3);

/* v */
extern HPDF_STATUS
HPDF_Page_CurveTo2  (HPDF_Page    page,
                     HPDF_REAL    x2,
                     HPDF_REAL    y2,
                     HPDF_REAL    x3,
                     HPDF_REAL    y3);

/* y */
extern HPDF_STATUS
HPDF_Page_CurveTo3  (HPDF_Page  page,
                     HPDF_REAL  x1,
                     HPDF_REAL  y1,
                     HPDF_REAL  x3,
                     HPDF_REAL  y3);

/* h */
extern HPDF_STATUS
HPDF_Page_ClosePath  (HPDF_Page  page);

/* re */
extern HPDF_STATUS
HPDF_Page_Rectangle  (HPDF_Page  page,
                      HPDF_REAL  x,
                      HPDF_REAL  y,
                      HPDF_REAL  width,
                      HPDF_REAL  height);


/*--- Path painting operator ---------------------------------------------*/

/* S */
extern HPDF_STATUS
HPDF_Page_Stroke  (HPDF_Page  page);

/* s */
extern HPDF_STATUS
HPDF_Page_ClosePathStroke  (HPDF_Page  page);

/* f */
extern HPDF_STATUS
HPDF_Page_Fill  (HPDF_Page  page);

/* f* */
extern HPDF_STATUS
HPDF_Page_Eofill  (HPDF_Page  page);

/* B */
extern HPDF_STATUS
HPDF_Page_FillStroke  (HPDF_Page  page);

/* B* */
extern HPDF_STATUS
HPDF_Page_EofillStroke  (HPDF_Page  page);

/* b */
extern HPDF_STATUS
HPDF_Page_ClosePathFillStroke  (HPDF_Page  page);

/* b* */
extern HPDF_STATUS
HPDF_Page_ClosePathEofillStroke  (HPDF_Page  page);

/* n */
extern HPDF_STATUS
HPDF_Page_EndPath  (HPDF_Page  page);


/*--- Clipping paths operator --------------------------------------------*/

/* W */
extern HPDF_STATUS
HPDF_Page_Clip  (HPDF_Page  page);

/* W* */
extern HPDF_STATUS
HPDF_Page_Eoclip  (HPDF_Page  page);


/*--- Text object operator -----------------------------------------------*/

/* BT */
extern HPDF_STATUS
HPDF_Page_BeginText  (HPDF_Page  page);

/* ET */
extern HPDF_STATUS
HPDF_Page_EndText  (HPDF_Page  page);

/*--- Text state ---------------------------------------------------------*/

/* Tc */
extern HPDF_STATUS
HPDF_Page_SetCharSpace  (HPDF_Page  page,
                         HPDF_REAL  value);

/* Tw */
extern HPDF_STATUS
HPDF_Page_SetWordSpace  (HPDF_Page  page,
                         HPDF_REAL  value);

/* Tz */
extern HPDF_STATUS
HPDF_Page_SetHorizontalScalling  (HPDF_Page  page,
                                  HPDF_REAL  value);

/* TL */
extern HPDF_STATUS
HPDF_Page_SetTextLeading  (HPDF_Page  page,
                           HPDF_REAL  value);

/* Tf */
extern HPDF_STATUS
HPDF_Page_SetFontAndSize  (HPDF_Page  page,
                           HPDF_Font  font,
                           HPDF_REAL  size);

/* Tr */
extern HPDF_STATUS
HPDF_Page_SetTextRenderingMode  (HPDF_Page               page,
                                 HPDF_TextRenderingMode  mode);

/* Ts */
extern HPDF_STATUS
HPDF_Page_SetTextRise  (HPDF_Page   page,
                        HPDF_REAL   value);

/* This function is obsolete. Use HPDF_Page_SetTextRise.  */
extern HPDF_STATUS
HPDF_Page_SetTextRaise  (HPDF_Page   page,
                         HPDF_REAL   value);

/*--- Text positioning ---------------------------------------------------*/

/* Td */
extern HPDF_STATUS
HPDF_Page_MoveTextPos  (HPDF_Page   page,
                        HPDF_REAL   x,
                        HPDF_REAL   y);

/* TD */
extern HPDF_STATUS
HPDF_Page_MoveTextPos2  (HPDF_Page  page,
                         HPDF_REAL   x,
                         HPDF_REAL   y);

/* Tm */
extern HPDF_STATUS
HPDF_Page_SetTextMatrix  (HPDF_Page         page,
                          HPDF_REAL    a,
                          HPDF_REAL    b,
                          HPDF_REAL    c,
                          HPDF_REAL    d,
                          HPDF_REAL    x,
                          HPDF_REAL    y);


/* T* */
extern HPDF_STATUS
HPDF_Page_MoveToNextLine  (HPDF_Page  page);

/*--- Text showing -------------------------------------------------------*/

/* Tj */
extern HPDF_STATUS
HPDF_Page_ShowText  (HPDF_Page    page,
                     const char  *text);

/* TJ */

/* ' */
extern HPDF_STATUS
HPDF_Page_ShowTextNextLine  (HPDF_Page    page,
                             const char  *text);

/* " */
extern HPDF_STATUS
HPDF_Page_ShowTextNextLineEx  (HPDF_Page    page,
                               HPDF_REAL    word_space,
                               HPDF_REAL    char_space,
                               const char  *text);


/*--- Color showing ------------------------------------------------------*/

/* cs --not implemented yet */
/* CS --not implemented yet */
/* sc --not implemented yet */
/* scn --not implemented yet */
/* SC --not implemented yet */
/* SCN --not implemented yet */

/* g */
extern HPDF_STATUS
HPDF_Page_SetGrayFill  (HPDF_Page   page,
                        HPDF_REAL   gray);

/* G */
extern HPDF_STATUS
HPDF_Page_SetGrayStroke  (HPDF_Page   page,
                          HPDF_REAL   gray);

/* rg */
extern HPDF_STATUS
HPDF_Page_SetRGBFill  (HPDF_Page  page,
                       HPDF_REAL  r,
                       HPDF_REAL  g,
                       HPDF_REAL  b);

/* RG */
extern HPDF_STATUS
HPDF_Page_SetRGBStroke  (HPDF_Page  page,
                         HPDF_REAL  r,
                         HPDF_REAL  g,
                         HPDF_REAL  b);

/* k */
extern HPDF_STATUS
HPDF_Page_SetCMYKFill  (HPDF_Page  page,
                        HPDF_REAL  c,
                        HPDF_REAL  m,
                        HPDF_REAL  y,
                        HPDF_REAL  k);

/* K */
extern HPDF_STATUS
HPDF_Page_SetCMYKStroke  (HPDF_Page  page,
                          HPDF_REAL  c,
                          HPDF_REAL  m,
                          HPDF_REAL  y,
                          HPDF_REAL  k);

/*--- Shading patterns ---------------------------------------------------*/

/* Notes for docs:
 * - ShadingType must be HPDF_SHADING_FREE_FORM_TRIANGLE_MESH (the only
 *   defined option...)
 * - colorSpace must be HPDF_CS_DEVICE_RGB for now.
 */
extern HPDF_Shading
HPDF_Shading_New  (HPDF_Doc         pdf,
                   HPDF_ShadingType type,
                   HPDF_ColorSpace  colorSpace,
                   HPDF_REAL xMin, HPDF_REAL xMax,
                   HPDF_REAL yMin, HPDF_REAL yMax);

extern HPDF_STATUS
HPDF_Shading_AddVertexRGB(HPDF_Shading shading,
                          HPDF_Shading_FreeFormTriangleMeshEdgeFlag edgeFlag,
                          HPDF_REAL x, HPDF_REAL y,
                          HPDF_UINT8 r, HPDF_UINT8 g, HPDF_UINT8 b);

/*--- In-line images -----------------------------------------------------*/

/* BI --not implemented yet */
/* ID --not implemented yet */
/* EI --not implemented yet */

/*--- XObjects -----------------------------------------------------------*/

/* Do */
extern HPDF_STATUS
HPDF_Page_ExecuteXObject  (HPDF_Page     page,
                           HPDF_XObject  obj);

/*--- Content streams ----------------------------------------------------*/

extern HPDF_STATUS
HPDF_Page_New_Content_Stream  (HPDF_Page page,
                               HPDF_Dict* new_stream);

extern HPDF_STATUS
HPDF_Page_Insert_Shared_Content_Stream  (HPDF_Page page,
                                         HPDF_Dict shared_stream);


/*--- Marked content -----------------------------------------------------*/

/* BMC --not implemented yet */
/* BDC --not implemented yet */
/* EMC --not implemented yet */
/* MP --not implemented yet */
/* DP --not implemented yet */

/*--- Compatibility ------------------------------------------------------*/

/* BX --not implemented yet */
/* EX --not implemented yet */

extern HPDF_STATUS
HPDF_Page_DrawImage  (HPDF_Page    page,
                      HPDF_Image   image,
                      HPDF_REAL    x,
                      HPDF_REAL    y,
                      HPDF_REAL    width,
                      HPDF_REAL    height);


extern HPDF_STATUS
HPDF_Page_Circle  (HPDF_Page     page,
                   HPDF_REAL     x,
                   HPDF_REAL     y,
                   HPDF_REAL     ray);


extern HPDF_STATUS
HPDF_Page_Ellipse  (HPDF_Page   page,
                    HPDF_REAL   x,
                    HPDF_REAL   y,
                    HPDF_REAL  xray,
                    HPDF_REAL  yray);


extern HPDF_STATUS
HPDF_Page_Arc  (HPDF_Page    page,
                HPDF_REAL    x,
                HPDF_REAL    y,
                HPDF_REAL    ray,
                HPDF_REAL    ang1,
                HPDF_REAL    ang2);


extern HPDF_STATUS
HPDF_Page_TextOut  (HPDF_Page    page,
                    HPDF_REAL    xpos,
                    HPDF_REAL    ypos,
                    const char  *text);


extern HPDF_STATUS
HPDF_Page_TextRect  (HPDF_Page            page,
                     HPDF_REAL            left,
                     HPDF_REAL            top,
                     HPDF_REAL            right,
                     HPDF_REAL            bottom,
                     const char          *text,
                     HPDF_TextAlignment   align,
                     HPDF_UINT           *len);


extern HPDF_STATUS
HPDF_Page_SetSlideShow  (HPDF_Page              page,
                         HPDF_TransitionStyle   type,
                         HPDF_REAL              disp_time,
                         HPDF_REAL              trans_time);


extern HPDF_OutputIntent
HPDF_ICC_LoadIccFromMem (HPDF_Doc   pdf,
                        HPDF_MMgr   mmgr,
                        HPDF_Stream iccdata,
                        HPDF_Xref   xref,
                        int         numcomponent);

extern HPDF_OutputIntent
HPDF_LoadIccProfileFromFile  (HPDF_Doc    pdf,
                              const char* icc_file_name,
                              int         numcomponent);


