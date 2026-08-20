unit H5Epubgen;

interface

uses
  fp_hdf5;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Copyright by The HDF Group.                                               *
 * All rights reserved.                                                      *
 *                                                                           *
 * This file is part of HDF5.  The full HDF5 copyright notice, including     *
 * terms governing use, modification, and redistribution, is contained in    *
 * the COPYING file, which can be found at the root of the source code       *
 * distribution tree, or in https://www.hdfgroup.org/licenses.               *
 * If you do not have access to either file, you may request a copy from     *
 * help@hdfgroup.org.                                                        *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  }
{ Generated automatically by bin/make_err -- do not edit  }
{ Add new errors to H5err.txt file  }
{$ifndef H5Epubgen_H}
{$define H5Epubgen_H}
{ C++ extern C conditionnal removed }
{******************* }
{ Major error codes  }
{******************* }
  var
    H5E_FUNC_g : Thid_t;cvar;external libhdf5;
{ Function entry/exit  }
    H5E_FILE_g : Thid_t;cvar;external libhdf5;
{ File accessibility  }
    H5E_SOHM_g : Thid_t;cvar;external libhdf5;
{ Shared Object Header Messages  }
    H5E_SYM_g : Thid_t;cvar;external libhdf5;
{ Symbol table  }
    H5E_PLUGIN_g : Thid_t;cvar;external libhdf5;
{ Plugin for dynamically loaded library  }
    H5E_VFL_g : Thid_t;cvar;external libhdf5;
{ Virtual File Layer  }
    H5E_INTERNAL_g : Thid_t;cvar;external libhdf5;
{ Internal error (too specific to document in detail)  }
    H5E_BTREE_g : Thid_t;cvar;external libhdf5;
{ B-Tree node  }
    H5E_REFERENCE_g : Thid_t;cvar;external libhdf5;
{ References  }
    H5E_DATASPACE_g : Thid_t;cvar;external libhdf5;
{ Dataspace  }
    H5E_RESOURCE_g : Thid_t;cvar;external libhdf5;
{ Resource unavailable  }
    H5E_RS_g : Thid_t;cvar;external libhdf5;
{ Reference Counted Strings  }
    H5E_FARRAY_g : Thid_t;cvar;external libhdf5;
{ Fixed Array  }
    H5E_HEAP_g : Thid_t;cvar;external libhdf5;
{ Heap  }
    H5E_ATTR_g : Thid_t;cvar;external libhdf5;
{ Attribute  }
    H5E_IO_g : Thid_t;cvar;external libhdf5;
{ Low-level I/O  }
    H5E_EFL_g : Thid_t;cvar;external libhdf5;
{ External file list  }
    H5E_TST_g : Thid_t;cvar;external libhdf5;
{ Ternary Search Trees  }
    H5E_PAGEBUF_g : Thid_t;cvar;external libhdf5;
{ Page Buffering  }
    H5E_FSPACE_g : Thid_t;cvar;external libhdf5;
{ Free Space Manager  }
    H5E_DATASET_g : Thid_t;cvar;external libhdf5;
{ Dataset  }
    H5E_STORAGE_g : Thid_t;cvar;external libhdf5;
{ Data storage  }
    H5E_LINK_g : Thid_t;cvar;external libhdf5;
{ Links  }
    H5E_PLIST_g : Thid_t;cvar;external libhdf5;
{ Property lists  }
    H5E_DATATYPE_g : Thid_t;cvar;external libhdf5;
{ Datatype  }
    H5E_OHDR_g : Thid_t;cvar;external libhdf5;
{ Object header  }
    H5E_ATOM_g : Thid_t;cvar;external libhdf5;
{ Object atom  }
    H5E_NONE_MAJOR_g : Thid_t;cvar;external libhdf5;
{ No error  }
    H5E_SLIST_g : Thid_t;cvar;external libhdf5;
{ Skip Lists  }
    H5E_ARGS_g : Thid_t;cvar;external libhdf5;
{ Invalid arguments to routine  }
    H5E_CONTEXT_g : Thid_t;cvar;external libhdf5;
{ API Context  }
    H5E_EARRAY_g : Thid_t;cvar;external libhdf5;
{ Extensible Array  }
    H5E_PLINE_g : Thid_t;cvar;external libhdf5;
{ Data filters  }
    H5E_ERROR_g : Thid_t;cvar;external libhdf5;
{ Error API  }
    H5E_CACHE_g : Thid_t;cvar;external libhdf5;
{ Object cache  }
{******************* }
{ Minor error codes  }
{******************* }
{ Generic low-level file I/O errors  }
    H5E_SEEKERROR_g : Thid_t;cvar;external libhdf5;
{ Seek failed  }
    H5E_READERROR_g : Thid_t;cvar;external libhdf5;
{ Read failed  }
    H5E_WRITEERROR_g : Thid_t;cvar;external libhdf5;
{ Write failed  }
    H5E_CLOSEERROR_g : Thid_t;cvar;external libhdf5;
{ Close failed  }
    H5E_OVERFLOW_g : Thid_t;cvar;external libhdf5;
{ Address overflowed  }
    H5E_FCNTL_g : Thid_t;cvar;external libhdf5;
{ File control (fcntl) failed  }
{ Resource errors  }
    H5E_NOSPACE_g : Thid_t;cvar;external libhdf5;
{ No space available for allocation  }
    H5E_CANTALLOC_g : Thid_t;cvar;external libhdf5;
{ Can't allocate space  }
    H5E_CANTCOPY_g : Thid_t;cvar;external libhdf5;
{ Unable to copy object  }
    H5E_CANTFREE_g : Thid_t;cvar;external libhdf5;
{ Unable to free object  }
    H5E_ALREADYEXISTS_g : Thid_t;cvar;external libhdf5;
{ Object already exists  }
    H5E_CANTLOCK_g : Thid_t;cvar;external libhdf5;
{ Unable to lock object  }
    H5E_CANTUNLOCK_g : Thid_t;cvar;external libhdf5;
{ Unable to unlock object  }
    H5E_CANTGC_g : Thid_t;cvar;external libhdf5;
{ Unable to garbage collect  }
    H5E_CANTGETSIZE_g : Thid_t;cvar;external libhdf5;
{ Unable to compute size  }
    H5E_OBJOPEN_g : Thid_t;cvar;external libhdf5;
{ Object is already open  }
{ Heap errors  }
    H5E_CANTRESTORE_g : Thid_t;cvar;external libhdf5;
{ Can't restore condition  }
    H5E_CANTCOMPUTE_g : Thid_t;cvar;external libhdf5;
{ Can't compute value  }
    H5E_CANTEXTEND_g : Thid_t;cvar;external libhdf5;
{ Can't extend heap's space  }
    H5E_CANTATTACH_g : Thid_t;cvar;external libhdf5;
{ Can't attach object  }
    H5E_CANTUPDATE_g : Thid_t;cvar;external libhdf5;
{ Can't update object  }
    H5E_CANTOPERATE_g : Thid_t;cvar;external libhdf5;
{ Can't operate on object  }
{ Function entry/exit interface errors  }
    H5E_CANTINIT_g : Thid_t;cvar;external libhdf5;
{ Unable to initialize object  }
    H5E_ALREADYINIT_g : Thid_t;cvar;external libhdf5;
{ Object already initialized  }
    H5E_CANTRELEASE_g : Thid_t;cvar;external libhdf5;
{ Unable to release object  }
{ Property list errors  }
    H5E_CANTGET_g : Thid_t;cvar;external libhdf5;
{ Can't get value  }
    H5E_CANTSET_g : Thid_t;cvar;external libhdf5;
{ Can't set value  }
    H5E_DUPCLASS_g : Thid_t;cvar;external libhdf5;
{ Duplicate class name in parent class  }
    H5E_SETDISALLOWED_g : Thid_t;cvar;external libhdf5;
{ Disallowed operation  }
{ Free space errors  }
    H5E_CANTMERGE_g : Thid_t;cvar;external libhdf5;
{ Can't merge objects  }
    H5E_CANTREVIVE_g : Thid_t;cvar;external libhdf5;
{ Can't revive object  }
    H5E_CANTSHRINK_g : Thid_t;cvar;external libhdf5;
{ Can't shrink container  }
{ Object header related errors  }
    H5E_LINKCOUNT_g : Thid_t;cvar;external libhdf5;
{ Bad object header link count  }
    H5E_VERSION_g : Thid_t;cvar;external libhdf5;
{ Wrong version number  }
    H5E_ALIGNMENT_g : Thid_t;cvar;external libhdf5;
{ Alignment error  }
    H5E_BADMESG_g : Thid_t;cvar;external libhdf5;
{ Unrecognized message  }
    H5E_CANTDELETE_g : Thid_t;cvar;external libhdf5;
{ Can't delete message  }
    H5E_BADITER_g : Thid_t;cvar;external libhdf5;
{ Iteration failed  }
    H5E_CANTPACK_g : Thid_t;cvar;external libhdf5;
{ Can't pack messages  }
    H5E_CANTRESET_g : Thid_t;cvar;external libhdf5;
{ Can't reset object  }
    H5E_CANTRENAME_g : Thid_t;cvar;external libhdf5;
{ Unable to rename object  }
{ System level errors  }
    H5E_SYSERRSTR_g : Thid_t;cvar;external libhdf5;
{ System error message  }
{ I/O pipeline errors  }
    H5E_NOFILTER_g : Thid_t;cvar;external libhdf5;
{ Requested filter is not available  }
    H5E_CALLBACK_g : Thid_t;cvar;external libhdf5;
{ Callback failed  }
    H5E_CANAPPLY_g : Thid_t;cvar;external libhdf5;
{ Error from filter 'can apply' callback  }
    H5E_SETLOCAL_g : Thid_t;cvar;external libhdf5;
{ Error from filter 'set local' callback  }
    H5E_NOENCODER_g : Thid_t;cvar;external libhdf5;
{ Filter present but encoding disabled  }
    H5E_CANTFILTER_g : Thid_t;cvar;external libhdf5;
{ Filter operation failed  }
{ Group related errors  }
    H5E_CANTOPENOBJ_g : Thid_t;cvar;external libhdf5;
{ Can't open object  }
    H5E_CANTCLOSEOBJ_g : Thid_t;cvar;external libhdf5;
{ Can't close object  }
    H5E_COMPLEN_g : Thid_t;cvar;external libhdf5;
{ Name component is too long  }
    H5E_PATH_g : Thid_t;cvar;external libhdf5;
{ Problem with path to object  }
{ No error  }
    H5E_NONE_MINOR_g : Thid_t;cvar;external libhdf5;
{ No error  }
{ Plugin errors  }
    H5E_OPENERROR_g : Thid_t;cvar;external libhdf5;
{ Can't open directory or file  }
{ File accessibility errors  }
    H5E_FILEEXISTS_g : Thid_t;cvar;external libhdf5;
{ File already exists  }
    H5E_FILEOPEN_g : Thid_t;cvar;external libhdf5;
{ File already open  }
    H5E_CANTCREATE_g : Thid_t;cvar;external libhdf5;
{ Unable to create file  }
    H5E_CANTOPENFILE_g : Thid_t;cvar;external libhdf5;
{ Unable to open file  }
    H5E_CANTCLOSEFILE_g : Thid_t;cvar;external libhdf5;
{ Unable to close file  }
    H5E_NOTHDF5_g : Thid_t;cvar;external libhdf5;
{ Not an HDF5 file  }
    H5E_BADFILE_g : Thid_t;cvar;external libhdf5;
{ Bad file ID accessed  }
    H5E_TRUNCATED_g : Thid_t;cvar;external libhdf5;
{ File has been truncated  }
    H5E_MOUNT_g : Thid_t;cvar;external libhdf5;
{ File mount error  }
    H5E_CANTLOCKFILE_g : Thid_t;cvar;external libhdf5;
{ Unable to lock file  }
    H5E_CANTUNLOCKFILE_g : Thid_t;cvar;external libhdf5;
{ Unable to unlock file  }
{ Object atom related errors  }
    H5E_BADATOM_g : Thid_t;cvar;external libhdf5;
{ Unable to find atom information (already closed?)  }
    H5E_BADGROUP_g : Thid_t;cvar;external libhdf5;
{ Unable to find ID group information  }
    H5E_CANTREGISTER_g : Thid_t;cvar;external libhdf5;
{ Unable to register new atom  }
    H5E_CANTINC_g : Thid_t;cvar;external libhdf5;
{ Unable to increment reference count  }
    H5E_CANTDEC_g : Thid_t;cvar;external libhdf5;
{ Unable to decrement reference count  }
    H5E_NOIDS_g : Thid_t;cvar;external libhdf5;
{ Out of IDs for group  }
{ Cache related errors  }
    H5E_CANTFLUSH_g : Thid_t;cvar;external libhdf5;
{ Unable to flush data from cache  }
    H5E_CANTUNSERIALIZE_g : Thid_t;cvar;external libhdf5;
{ Unable to mark metadata as unserialized  }
    H5E_CANTSERIALIZE_g : Thid_t;cvar;external libhdf5;
{ Unable to serialize data from cache  }
    H5E_CANTTAG_g : Thid_t;cvar;external libhdf5;
{ Unable to tag metadata in the cache  }
    H5E_CANTLOAD_g : Thid_t;cvar;external libhdf5;
{ Unable to load metadata into cache  }
    H5E_PROTECT_g : Thid_t;cvar;external libhdf5;
{ Protected metadata error  }
    H5E_NOTCACHED_g : Thid_t;cvar;external libhdf5;
{ Metadata not currently cached  }
    H5E_SYSTEM_g : Thid_t;cvar;external libhdf5;
{ Internal error detected  }
    H5E_CANTINS_g : Thid_t;cvar;external libhdf5;
{ Unable to insert metadata into cache  }
    H5E_CANTPROTECT_g : Thid_t;cvar;external libhdf5;
{ Unable to protect metadata  }
    H5E_CANTUNPROTECT_g : Thid_t;cvar;external libhdf5;
{ Unable to unprotect metadata  }
    H5E_CANTPIN_g : Thid_t;cvar;external libhdf5;
{ Unable to pin cache entry  }
    H5E_CANTUNPIN_g : Thid_t;cvar;external libhdf5;
{ Unable to un-pin cache entry  }
    H5E_CANTMARKDIRTY_g : Thid_t;cvar;external libhdf5;
{ Unable to mark a pinned entry as dirty  }
    H5E_CANTMARKCLEAN_g : Thid_t;cvar;external libhdf5;
{ Unable to mark a pinned entry as clean  }
    H5E_CANTMARKUNSERIALIZED_g : Thid_t;cvar;external libhdf5;
{ Unable to mark an entry as unserialized  }
    H5E_CANTMARKSERIALIZED_g : Thid_t;cvar;external libhdf5;
{ Unable to mark an entry as serialized  }
    H5E_CANTDIRTY_g : Thid_t;cvar;external libhdf5;
{ Unable to mark metadata as dirty  }
    H5E_CANTCLEAN_g : Thid_t;cvar;external libhdf5;
{ Unable to mark metadata as clean  }
    H5E_CANTEXPUNGE_g : Thid_t;cvar;external libhdf5;
{ Unable to expunge a metadata cache entry  }
    H5E_CANTRESIZE_g : Thid_t;cvar;external libhdf5;
{ Unable to resize a metadata cache entry  }
    H5E_CANTDEPEND_g : Thid_t;cvar;external libhdf5;
{ Unable to create a flush dependency  }
    H5E_CANTUNDEPEND_g : Thid_t;cvar;external libhdf5;
{ Unable to destroy a flush dependency  }
    H5E_CANTNOTIFY_g : Thid_t;cvar;external libhdf5;
{ Unable to notify object about action  }
    H5E_LOGGING_g : Thid_t;cvar;external libhdf5;
{ Failure in the cache logging framework  }
    H5E_LOGFAIL_g : Thid_t;cvar;external libhdf5;
{ old H5E_LOGGING_g (maintained for binary compatibility)  }
    H5E_CANTCORK_g : Thid_t;cvar;external libhdf5;
{ Unable to cork an object  }
    H5E_CANTUNCORK_g : Thid_t;cvar;external libhdf5;
{ Unable to uncork an object  }
{ Link related errors  }
    H5E_TRAVERSE_g : Thid_t;cvar;external libhdf5;
{ Link traversal failure  }
    H5E_NLINKS_g : Thid_t;cvar;external libhdf5;
{ Too many soft links in path  }
    H5E_NOTREGISTERED_g : Thid_t;cvar;external libhdf5;
{ Link class not registered  }
    H5E_CANTMOVE_g : Thid_t;cvar;external libhdf5;
{ Can't move object  }
    H5E_CANTSORT_g : Thid_t;cvar;external libhdf5;
{ Can't sort objects  }
{ Parallel MPI errors  }
    H5E_MPI_g : Thid_t;cvar;external libhdf5;
{ Some MPI function failed  }
    H5E_MPIERRSTR_g : Thid_t;cvar;external libhdf5;
{ MPI Error String  }
    H5E_CANTRECV_g : Thid_t;cvar;external libhdf5;
{ Can't receive data  }
    H5E_CANTGATHER_g : Thid_t;cvar;external libhdf5;
{ Can't gather data  }
    H5E_NO_INDEPENDENT_g : Thid_t;cvar;external libhdf5;
{ Can't perform independent IO  }
{ Dataspace errors  }
    H5E_CANTCLIP_g : Thid_t;cvar;external libhdf5;
{ Can't clip hyperslab region  }
    H5E_CANTCOUNT_g : Thid_t;cvar;external libhdf5;
{ Can't count elements  }
    H5E_CANTSELECT_g : Thid_t;cvar;external libhdf5;
{ Can't select hyperslab  }
    H5E_CANTNEXT_g : Thid_t;cvar;external libhdf5;
{ Can't move to next iterator location  }
    H5E_BADSELECT_g : Thid_t;cvar;external libhdf5;
{ Invalid selection  }
    H5E_CANTCOMPARE_g : Thid_t;cvar;external libhdf5;
{ Can't compare objects  }
    H5E_INCONSISTENTSTATE_g : Thid_t;cvar;external libhdf5;
{ Internal states are inconsistent  }
    H5E_CANTAPPEND_g : Thid_t;cvar;external libhdf5;
{ Can't append object  }
{ Argument errors  }
    H5E_UNINITIALIZED_g : Thid_t;cvar;external libhdf5;
{ Information is uinitialized  }
    H5E_UNSUPPORTED_g : Thid_t;cvar;external libhdf5;
{ Feature is unsupported  }
    H5E_BADTYPE_g : Thid_t;cvar;external libhdf5;
{ Inappropriate type  }
    H5E_BADRANGE_g : Thid_t;cvar;external libhdf5;
{ Out of range  }
    H5E_BADVALUE_g : Thid_t;cvar;external libhdf5;
{ Bad value  }
{ B-tree related errors  }
    H5E_NOTFOUND_g : Thid_t;cvar;external libhdf5;
{ Object not found  }
    H5E_EXISTS_g : Thid_t;cvar;external libhdf5;
{ Object already exists  }
    H5E_CANTENCODE_g : Thid_t;cvar;external libhdf5;
{ Unable to encode value  }
    H5E_CANTDECODE_g : Thid_t;cvar;external libhdf5;
{ Unable to decode value  }
    H5E_CANTSPLIT_g : Thid_t;cvar;external libhdf5;
{ Unable to split node  }
    H5E_CANTREDISTRIBUTE_g : Thid_t;cvar;external libhdf5;
{ Unable to redistribute records  }
    H5E_CANTSWAP_g : Thid_t;cvar;external libhdf5;
{ Unable to swap records  }
    H5E_CANTINSERT_g : Thid_t;cvar;external libhdf5;
{ Unable to insert object  }
    H5E_CANTLIST_g : Thid_t;cvar;external libhdf5;
{ Unable to list node  }
    H5E_CANTMODIFY_g : Thid_t;cvar;external libhdf5;
{ Unable to modify record  }
    H5E_CANTREMOVE_g : Thid_t;cvar;external libhdf5;
{ Unable to remove object  }
{ Datatype conversion errors  }
    H5E_CANTCONVERT_g : Thid_t;cvar;external libhdf5;
{ Can't convert datatypes  }
    H5E_BADSIZE_g : Thid_t;cvar;external libhdf5;
{ Bad size for object  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ H5Epubgen_H  }

// === Konventiert am: 20-8-26 19:37:19 ===


implementation



end.
