
typedef struct _xmlRelaxNG xmlRelaxNG;
typedef xmlRelaxNG *xmlRelaxNGPtr;


//typedef void ( *xmlRelaxNGValidityErrorFunc) (void *ctx,						      const char *msg,						      ...) ;

//typedef void ( *xmlRelaxNGValidityWarningFunc) (void *ctx,							const char *msg,						...) ;

typedef struct _xmlRelaxNGParserCtxt xmlRelaxNGParserCtxt;
typedef xmlRelaxNGParserCtxt *xmlRelaxNGParserCtxtPtr;

typedef struct _xmlRelaxNGValidCtxt xmlRelaxNGValidCtxt;
typedef xmlRelaxNGValidCtxt *xmlRelaxNGValidCtxtPtr;

typedef enum {
    XML_RELAXNG_OK = 0,
    XML_RELAXNG_ERR_MEMORY,
    XML_RELAXNG_ERR_TYPE,
    XML_RELAXNG_ERR_TYPEVAL,
    XML_RELAXNG_ERR_DUPID,
    XML_RELAXNG_ERR_TYPECMP,
    XML_RELAXNG_ERR_NOSTATE,
    XML_RELAXNG_ERR_NODEFINE,
    XML_RELAXNG_ERR_LISTEXTRA,
    XML_RELAXNG_ERR_LISTEMPTY,
    XML_RELAXNG_ERR_INTERNODATA,
    XML_RELAXNG_ERR_INTERSEQ,
    XML_RELAXNG_ERR_INTEREXTRA,
    XML_RELAXNG_ERR_ELEMNAME,
    XML_RELAXNG_ERR_ATTRNAME,
    XML_RELAXNG_ERR_ELEMNONS,
    XML_RELAXNG_ERR_ATTRNONS,
    XML_RELAXNG_ERR_ELEMWRONGNS,
    XML_RELAXNG_ERR_ATTRWRONGNS,
    XML_RELAXNG_ERR_ELEMEXTRANS,
    XML_RELAXNG_ERR_ATTREXTRANS,
    XML_RELAXNG_ERR_ELEMNOTEMPTY,
    XML_RELAXNG_ERR_NOELEM,
    XML_RELAXNG_ERR_NOTELEM,
    XML_RELAXNG_ERR_ATTRVALID,
    XML_RELAXNG_ERR_CONTENTVALID,
    XML_RELAXNG_ERR_EXTRACONTENT,
    XML_RELAXNG_ERR_INVALIDATTR,
    XML_RELAXNG_ERR_DATAELEM,
    XML_RELAXNG_ERR_VALELEM,
    XML_RELAXNG_ERR_LISTELEM,
    XML_RELAXNG_ERR_DATATYPE,
    XML_RELAXNG_ERR_VALUE,
    XML_RELAXNG_ERR_LIST,
    XML_RELAXNG_ERR_NOGRAMMAR,
    XML_RELAXNG_ERR_EXTRADATA,
    XML_RELAXNG_ERR_LACKDATA,
    XML_RELAXNG_ERR_INTERNAL,
    XML_RELAXNG_ERR_ELEMWRONG,
    XML_RELAXNG_ERR_TEXTWRONG
} xmlRelaxNGValidErr;

typedef enum {
    XML_RELAXNGP_NONE = 0,
    XML_RELAXNGP_FREE_DOC = 1,
    XML_RELAXNGP_CRNG = 2
} xmlRelaxNGParserFlag;

extern int 
		    xmlRelaxNGInitTypes		(void);
extern void 
		    xmlRelaxNGCleanupTypes	(void);

extern xmlRelaxNGParserCtxtPtr 
		    xmlRelaxNGNewParserCtxt	(const char *URL);
extern xmlRelaxNGParserCtxtPtr 
		    xmlRelaxNGNewMemParserCtxt	(const char *buffer,
						 int size);
extern xmlRelaxNGParserCtxtPtr 
		    xmlRelaxNGNewDocParserCtxt	(xmlDocPtr doc);

extern int 
		    xmlRelaxParserSetFlag	(xmlRelaxNGParserCtxtPtr ctxt,
						 int flag);

extern void 
		    xmlRelaxNGFreeParserCtxt	(xmlRelaxNGParserCtxtPtr ctxt);
extern void 
		    xmlRelaxNGSetParserErrors(xmlRelaxNGParserCtxtPtr ctxt,
					 xmlRelaxNGValidityErrorFunc err,
					 xmlRelaxNGValidityWarningFunc warn,
					 void *ctx);
extern int 
		    xmlRelaxNGGetParserErrors(xmlRelaxNGParserCtxtPtr ctxt,
					 xmlRelaxNGValidityErrorFunc *err,
					 xmlRelaxNGValidityWarningFunc *warn,
					 void **ctx);
extern void 
		    xmlRelaxNGSetParserStructuredErrors(
					 xmlRelaxNGParserCtxtPtr ctxt,
					 xmlStructuredErrorFunc serror,
					 void *ctx);
extern xmlRelaxNGPtr 
		    xmlRelaxNGParse		(xmlRelaxNGParserCtxtPtr ctxt);
extern void 
		    xmlRelaxNGFree		(xmlRelaxNGPtr schema);

extern void 
		    xmlRelaxNGDump		(FILE *output,
					 xmlRelaxNGPtr schema);
extern void 
		    xmlRelaxNGDumpTree	(FILE * output,
					 xmlRelaxNGPtr schema);
extern void 
		    xmlRelaxNGSetValidErrors(xmlRelaxNGValidCtxtPtr ctxt,
					 xmlRelaxNGValidityErrorFunc err,
					 xmlRelaxNGValidityWarningFunc warn,
					 void *ctx);
extern int 
		    xmlRelaxNGGetValidErrors(xmlRelaxNGValidCtxtPtr ctxt,
					 xmlRelaxNGValidityErrorFunc *err,
					 xmlRelaxNGValidityWarningFunc *warn,
					 void **ctx);
extern void 
			xmlRelaxNGSetValidStructuredErrors(xmlRelaxNGValidCtxtPtr ctxt,
					  xmlStructuredErrorFunc serror, void *ctx);
extern xmlRelaxNGValidCtxtPtr 
		    xmlRelaxNGNewValidCtxt	(xmlRelaxNGPtr schema);
extern void 
		    xmlRelaxNGFreeValidCtxt	(xmlRelaxNGValidCtxtPtr ctxt);
extern int 
		    xmlRelaxNGValidateDoc	(xmlRelaxNGValidCtxtPtr ctxt,
						 xmlDocPtr doc);
extern int 
		    xmlRelaxNGValidatePushElement	(xmlRelaxNGValidCtxtPtr ctxt,
					 xmlDocPtr doc,
					 xmlNodePtr elem);
extern int 
		    xmlRelaxNGValidatePushCData	(xmlRelaxNGValidCtxtPtr ctxt,
					 const xmlChar *data,
					 int len);
extern int 
		    xmlRelaxNGValidatePopElement	(xmlRelaxNGValidCtxtPtr ctxt,
					 xmlDocPtr doc,
					 xmlNodePtr elem);
extern int 
		    xmlRelaxNGValidateFullElement	(xmlRelaxNGValidCtxtPtr ctxt,
					 xmlDocPtr doc,
					 xmlNodePtr elem);


