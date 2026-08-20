/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Copyright by The HDF Group.                                               *
 * All rights reserved.                                                      *
 *                                                                           *
 * This file is part of HDF5.  The full HDF5 copyright notice, including     *
 * terms governing use, modification, and redistribution, is contained in    *
 * the COPYING file, which can be found at the root of the source code       *
 * distribution tree, or in https://www.hdfgroup.org/licenses.               *
 * If you do not have access to either file, you may request a copy from     *
 * help@hdfgroup.org.                                                        *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Generated automatically by bin/make_err -- do not edit */
/* Add new errors to H5err.txt file */


#ifndef H5Epubgen_H
#define H5Epubgen_H

#ifdef __cplusplus
extern "C" {
#endif

/*********************/
/* Major error codes */
/*********************/

extern hid_t H5E_FUNC_g;          /* Function entry/exit */
extern hid_t H5E_FILE_g;          /* File accessibility */
extern hid_t H5E_SOHM_g;          /* Shared Object Header Messages */
extern hid_t H5E_SYM_g;           /* Symbol table */
extern hid_t H5E_PLUGIN_g;        /* Plugin for dynamically loaded library */
extern hid_t H5E_VFL_g;           /* Virtual File Layer */
extern hid_t H5E_INTERNAL_g;      /* Internal error (too specific to document in detail) */
extern hid_t H5E_BTREE_g;         /* B-Tree node */
extern hid_t H5E_REFERENCE_g;     /* References */
extern hid_t H5E_DATASPACE_g;     /* Dataspace */
extern hid_t H5E_RESOURCE_g;      /* Resource unavailable */
extern hid_t H5E_RS_g;            /* Reference Counted Strings */
extern hid_t H5E_FARRAY_g;        /* Fixed Array */
extern hid_t H5E_HEAP_g;          /* Heap */
extern hid_t H5E_ATTR_g;          /* Attribute */
extern hid_t H5E_IO_g;            /* Low-level I/O */
extern hid_t H5E_EFL_g;           /* External file list */
extern hid_t H5E_TST_g;           /* Ternary Search Trees */
extern hid_t H5E_PAGEBUF_g;       /* Page Buffering */
extern hid_t H5E_FSPACE_g;        /* Free Space Manager */
extern hid_t H5E_DATASET_g;       /* Dataset */
extern hid_t H5E_STORAGE_g;       /* Data storage */
extern hid_t H5E_LINK_g;          /* Links */
extern hid_t H5E_PLIST_g;         /* Property lists */
extern hid_t H5E_DATATYPE_g;      /* Datatype */
extern hid_t H5E_OHDR_g;          /* Object header */
extern hid_t H5E_ATOM_g;          /* Object atom */
extern hid_t H5E_NONE_MAJOR_g;    /* No error */
extern hid_t H5E_SLIST_g;         /* Skip Lists */
extern hid_t H5E_ARGS_g;          /* Invalid arguments to routine */
extern hid_t H5E_CONTEXT_g;       /* API Context */
extern hid_t H5E_EARRAY_g;        /* Extensible Array */
extern hid_t H5E_PLINE_g;         /* Data filters */
extern hid_t H5E_ERROR_g;         /* Error API */
extern hid_t H5E_CACHE_g;         /* Object cache */

/*********************/
/* Minor error codes */
/*********************/

/* Generic low-level file I/O errors */
extern hid_t H5E_SEEKERROR_g;     /* Seek failed */
extern hid_t H5E_READERROR_g;     /* Read failed */
extern hid_t H5E_WRITEERROR_g;    /* Write failed */
extern hid_t H5E_CLOSEERROR_g;    /* Close failed */
extern hid_t H5E_OVERFLOW_g;      /* Address overflowed */
extern hid_t H5E_FCNTL_g;         /* File control (fcntl) failed */

/* Resource errors */
extern hid_t H5E_NOSPACE_g;       /* No space available for allocation */
extern hid_t H5E_CANTALLOC_g;     /* Can't allocate space */
extern hid_t H5E_CANTCOPY_g;      /* Unable to copy object */
extern hid_t H5E_CANTFREE_g;      /* Unable to free object */
extern hid_t H5E_ALREADYEXISTS_g; /* Object already exists */
extern hid_t H5E_CANTLOCK_g;      /* Unable to lock object */
extern hid_t H5E_CANTUNLOCK_g;    /* Unable to unlock object */
extern hid_t H5E_CANTGC_g;        /* Unable to garbage collect */
extern hid_t H5E_CANTGETSIZE_g;   /* Unable to compute size */
extern hid_t H5E_OBJOPEN_g;       /* Object is already open */

/* Heap errors */
extern hid_t H5E_CANTRESTORE_g;   /* Can't restore condition */
extern hid_t H5E_CANTCOMPUTE_g;   /* Can't compute value */
extern hid_t H5E_CANTEXTEND_g;    /* Can't extend heap's space */
extern hid_t H5E_CANTATTACH_g;    /* Can't attach object */
extern hid_t H5E_CANTUPDATE_g;    /* Can't update object */
extern hid_t H5E_CANTOPERATE_g;   /* Can't operate on object */

/* Function entry/exit interface errors */
extern hid_t H5E_CANTINIT_g;      /* Unable to initialize object */
extern hid_t H5E_ALREADYINIT_g;   /* Object already initialized */
extern hid_t H5E_CANTRELEASE_g;   /* Unable to release object */

/* Property list errors */
extern hid_t H5E_CANTGET_g;       /* Can't get value */
extern hid_t H5E_CANTSET_g;       /* Can't set value */
extern hid_t H5E_DUPCLASS_g;      /* Duplicate class name in parent class */
extern hid_t H5E_SETDISALLOWED_g; /* Disallowed operation */

/* Free space errors */
extern hid_t H5E_CANTMERGE_g;     /* Can't merge objects */
extern hid_t H5E_CANTREVIVE_g;    /* Can't revive object */
extern hid_t H5E_CANTSHRINK_g;    /* Can't shrink container */

/* Object header related errors */
extern hid_t H5E_LINKCOUNT_g;     /* Bad object header link count */
extern hid_t H5E_VERSION_g;       /* Wrong version number */
extern hid_t H5E_ALIGNMENT_g;     /* Alignment error */
extern hid_t H5E_BADMESG_g;       /* Unrecognized message */
extern hid_t H5E_CANTDELETE_g;    /* Can't delete message */
extern hid_t H5E_BADITER_g;       /* Iteration failed */
extern hid_t H5E_CANTPACK_g;      /* Can't pack messages */
extern hid_t H5E_CANTRESET_g;     /* Can't reset object */
extern hid_t H5E_CANTRENAME_g;    /* Unable to rename object */

/* System level errors */
extern hid_t H5E_SYSERRSTR_g;     /* System error message */

/* I/O pipeline errors */
extern hid_t H5E_NOFILTER_g;      /* Requested filter is not available */
extern hid_t H5E_CALLBACK_g;      /* Callback failed */
extern hid_t H5E_CANAPPLY_g;      /* Error from filter 'can apply' callback */
extern hid_t H5E_SETLOCAL_g;      /* Error from filter 'set local' callback */
extern hid_t H5E_NOENCODER_g;     /* Filter present but encoding disabled */
extern hid_t H5E_CANTFILTER_g;    /* Filter operation failed */

/* Group related errors */
extern hid_t H5E_CANTOPENOBJ_g;   /* Can't open object */
extern hid_t H5E_CANTCLOSEOBJ_g;  /* Can't close object */
extern hid_t H5E_COMPLEN_g;       /* Name component is too long */
extern hid_t H5E_PATH_g;          /* Problem with path to object */

/* No error */
extern hid_t H5E_NONE_MINOR_g;    /* No error */

/* Plugin errors */
extern hid_t H5E_OPENERROR_g;     /* Can't open directory or file */

/* File accessibility errors */
extern hid_t H5E_FILEEXISTS_g;    /* File already exists */
extern hid_t H5E_FILEOPEN_g;      /* File already open */
extern hid_t H5E_CANTCREATE_g;    /* Unable to create file */
extern hid_t H5E_CANTOPENFILE_g;  /* Unable to open file */
extern hid_t H5E_CANTCLOSEFILE_g; /* Unable to close file */
extern hid_t H5E_NOTHDF5_g;       /* Not an HDF5 file */
extern hid_t H5E_BADFILE_g;       /* Bad file ID accessed */
extern hid_t H5E_TRUNCATED_g;     /* File has been truncated */
extern hid_t H5E_MOUNT_g;         /* File mount error */
extern hid_t H5E_CANTLOCKFILE_g;  /* Unable to lock file */
extern hid_t H5E_CANTUNLOCKFILE_g; /* Unable to unlock file */

/* Object atom related errors */
extern hid_t H5E_BADATOM_g;       /* Unable to find atom information (already closed?) */
extern hid_t H5E_BADGROUP_g;      /* Unable to find ID group information */
extern hid_t H5E_CANTREGISTER_g;  /* Unable to register new atom */
extern hid_t H5E_CANTINC_g;       /* Unable to increment reference count */
extern hid_t H5E_CANTDEC_g;       /* Unable to decrement reference count */
extern hid_t H5E_NOIDS_g;         /* Out of IDs for group */

/* Cache related errors */
extern hid_t H5E_CANTFLUSH_g;     /* Unable to flush data from cache */
extern hid_t H5E_CANTUNSERIALIZE_g; /* Unable to mark metadata as unserialized */
extern hid_t H5E_CANTSERIALIZE_g; /* Unable to serialize data from cache */
extern hid_t H5E_CANTTAG_g;       /* Unable to tag metadata in the cache */
extern hid_t H5E_CANTLOAD_g;      /* Unable to load metadata into cache */
extern hid_t H5E_PROTECT_g;       /* Protected metadata error */
extern hid_t H5E_NOTCACHED_g;     /* Metadata not currently cached */
extern hid_t H5E_SYSTEM_g;        /* Internal error detected */
extern hid_t H5E_CANTINS_g;       /* Unable to insert metadata into cache */
extern hid_t H5E_CANTPROTECT_g;   /* Unable to protect metadata */
extern hid_t H5E_CANTUNPROTECT_g; /* Unable to unprotect metadata */
extern hid_t H5E_CANTPIN_g;       /* Unable to pin cache entry */
extern hid_t H5E_CANTUNPIN_g;     /* Unable to un-pin cache entry */
extern hid_t H5E_CANTMARKDIRTY_g; /* Unable to mark a pinned entry as dirty */
extern hid_t H5E_CANTMARKCLEAN_g; /* Unable to mark a pinned entry as clean */
extern hid_t H5E_CANTMARKUNSERIALIZED_g; /* Unable to mark an entry as unserialized */
extern hid_t H5E_CANTMARKSERIALIZED_g; /* Unable to mark an entry as serialized */
extern hid_t H5E_CANTDIRTY_g;     /* Unable to mark metadata as dirty */
extern hid_t H5E_CANTCLEAN_g;     /* Unable to mark metadata as clean */
extern hid_t H5E_CANTEXPUNGE_g;   /* Unable to expunge a metadata cache entry */
extern hid_t H5E_CANTRESIZE_g;    /* Unable to resize a metadata cache entry */
extern hid_t H5E_CANTDEPEND_g;    /* Unable to create a flush dependency */
extern hid_t H5E_CANTUNDEPEND_g;  /* Unable to destroy a flush dependency */
extern hid_t H5E_CANTNOTIFY_g;    /* Unable to notify object about action */
extern hid_t H5E_LOGGING_g;       /* Failure in the cache logging framework */
extern hid_t H5E_LOGFAIL_g;       /* old H5E_LOGGING_g (maintained for binary compatibility) */
extern hid_t H5E_CANTCORK_g;      /* Unable to cork an object */
extern hid_t H5E_CANTUNCORK_g;    /* Unable to uncork an object */

/* Link related errors */
extern hid_t H5E_TRAVERSE_g;      /* Link traversal failure */
extern hid_t H5E_NLINKS_g;        /* Too many soft links in path */
extern hid_t H5E_NOTREGISTERED_g; /* Link class not registered */
extern hid_t H5E_CANTMOVE_g;      /* Can't move object */
extern hid_t H5E_CANTSORT_g;      /* Can't sort objects */

/* Parallel MPI errors */
extern hid_t H5E_MPI_g;           /* Some MPI function failed */
extern hid_t H5E_MPIERRSTR_g;     /* MPI Error String */
extern hid_t H5E_CANTRECV_g;      /* Can't receive data */
extern hid_t H5E_CANTGATHER_g;    /* Can't gather data */
extern hid_t H5E_NO_INDEPENDENT_g; /* Can't perform independent IO */

/* Dataspace errors */
extern hid_t H5E_CANTCLIP_g;      /* Can't clip hyperslab region */
extern hid_t H5E_CANTCOUNT_g;     /* Can't count elements */
extern hid_t H5E_CANTSELECT_g;    /* Can't select hyperslab */
extern hid_t H5E_CANTNEXT_g;      /* Can't move to next iterator location */
extern hid_t H5E_BADSELECT_g;     /* Invalid selection */
extern hid_t H5E_CANTCOMPARE_g;   /* Can't compare objects */
extern hid_t H5E_INCONSISTENTSTATE_g; /* Internal states are inconsistent */
extern hid_t H5E_CANTAPPEND_g;    /* Can't append object */

/* Argument errors */
extern hid_t H5E_UNINITIALIZED_g; /* Information is uinitialized */
extern hid_t H5E_UNSUPPORTED_g;   /* Feature is unsupported */
extern hid_t H5E_BADTYPE_g;       /* Inappropriate type */
extern hid_t H5E_BADRANGE_g;      /* Out of range */
extern hid_t H5E_BADVALUE_g;      /* Bad value */

/* B-tree related errors */
extern hid_t H5E_NOTFOUND_g;      /* Object not found */
extern hid_t H5E_EXISTS_g;        /* Object already exists */
extern hid_t H5E_CANTENCODE_g;    /* Unable to encode value */
extern hid_t H5E_CANTDECODE_g;    /* Unable to decode value */
extern hid_t H5E_CANTSPLIT_g;     /* Unable to split node */
extern hid_t H5E_CANTREDISTRIBUTE_g; /* Unable to redistribute records */
extern hid_t H5E_CANTSWAP_g;      /* Unable to swap records */
extern hid_t H5E_CANTINSERT_g;    /* Unable to insert object */
extern hid_t H5E_CANTLIST_g;      /* Unable to list node */
extern hid_t H5E_CANTMODIFY_g;    /* Unable to modify record */
extern hid_t H5E_CANTREMOVE_g;    /* Unable to remove object */

/* Datatype conversion errors */
extern hid_t H5E_CANTCONVERT_g;   /* Can't convert datatypes */
extern hid_t H5E_BADSIZE_g;       /* Bad size for object */

#ifdef __cplusplus
}
#endif

#endif /* H5Epubgen_H */
