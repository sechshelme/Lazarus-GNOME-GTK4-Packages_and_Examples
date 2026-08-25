unit fp_mpi;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  OPAL_BUILD_PLATFORM_COMPILER_FAMILYID = 1;  
  OPAL_BUILD_PLATFORM_COMPILER_VERSION = 852480;
  OPAL_STDC_HEADERS = 1;
  OPAL_HAVE_ATTRIBUTE_DEPRECATED = 1;
  OPAL_HAVE_ATTRIBUTE_DEPRECATED_ARGUMENT = 1;
  OPAL_HAVE_ATTRIBUTE_ERROR = 1;
  OPAL_HAVE_SYS_TIME_H = 1;
  OPAL_HAVE_LONG_LONG = 1;
  OPAL_MAX_DATAREP_STRING = 128;
  OPAL_MAX_ERROR_STRING = 256;
  OPAL_MAX_INFO_KEY = 36;
  OPAL_MAX_INFO_VAL = 256;
  OPAL_MAX_OBJECT_NAME = 64;
  OPAL_MAX_PORT_NAME = 1024;
  OPAL_MAX_PROCESSOR_NAME = 256;
  OMPI_FORTRAN_STATUS_SIZE = 6;
  OMPI_HAVE_FORTRAN_LOGICAL1 = 1;
  OMPI_HAVE_FORTRAN_LOGICAL2 = 1;
  OMPI_HAVE_FORTRAN_LOGICAL4 = 1;
  OMPI_HAVE_FORTRAN_LOGICAL8 = 1;
  OMPI_HAVE_FORTRAN_INTEGER1 = 1;
  OMPI_HAVE_FORTRAN_INTEGER16 = 0;
  OMPI_HAVE_FORTRAN_INTEGER2 = 1;
  OMPI_HAVE_FORTRAN_INTEGER4 = 1;
  OMPI_HAVE_FORTRAN_INTEGER8 = 1;
  OMPI_HAVE_FORTRAN_REAL16 = 1;
  OMPI_HAVE_FORTRAN_REAL2 = 0;
  OMPI_HAVE_FORTRAN_REAL4 = 1;
  OMPI_HAVE_FORTRAN_REAL8 = 1;
  OMPI_ENABLE_MPI1_COMPAT = 0;
  HAVE_FLOAT__COMPLEX = 1;
  HAVE_DOUBLE__COMPLEX = 1;
  HAVE_LONG_DOUBLE__COMPLEX = 1;
  OMPI_MPI_OFFSET_SIZE = 8;
  OMPI_BUILD_CXX_BINDINGS = 1;
  OMPI_WANT_MPI_CXX_SEEK = 1;
  OMPI_CXX_SUPPORTS_2D_CONST_CAST = 1;
  OMPI_PARAM_CHECK = 1;

  type
  OMPI_MPI_AINT_TYPE = PtrInt;
  OMPI_MPI_OFFSET_TYPE = int64;
  OMPI_OFFSET_DATATYPE = Int64;
  OMPI_MPI_COUNT_TYPE = int64;


const
  OMPI_WANT_MPI_INTERFACE_WARNING = 1;  

const
  OMPI_HAVE_CXX_EXCEPTION_SUPPORT = 0;  
  OMPI_MAJOR_VERSION = 4;
  OMPI_MINOR_VERSION = 1;  
  OMPI_RELEASE_VERSION = 6;  
  OPAL_C_HAVE_VISIBILITY = 1;


type
ompi_fortran_bogus_type_t = longint;
ompi_fortran_integer_t = longint;

const
  OMPI_BUILDING = 0;  

const
  OPEN_MPI = 1;  
  MPI_VERSION = 3;
  MPI_SUBVERSION = 1;  

//const
//  MPIO_Request = MPI_Request;  
//  MPIO_Test = MPI_Test;  
//  MPIO_Wait = MPI_Wait;  
//
//type
//  PMPI_Aint = ^TMPI_Aint;
//  TMPI_Aint = TOMPI_MPI_AINT_TYPE;
//
//  PMPI_Offset = ^TMPI_Offset;
//  TMPI_Offset = TOMPI_MPI_OFFSET_TYPE;
//
//  PMPI_Count = ^TMPI_Count;
//  TMPI_Count = TOMPI_MPI_COUNT_TYPE;
//
//  PMPI_Comm = ^TMPI_Comm;
//  TMPI_Comm = Pompi_communicator_t;
//
//  PMPI_Datatype = ^TMPI_Datatype;
//  TMPI_Datatype = Pompi_datatype_t;
//
//  PMPI_Errhandler = ^TMPI_Errhandler;
//  TMPI_Errhandler = Pompi_errhandler_t;
//
//  PMPI_File = ^TMPI_File;
//  TMPI_File = Pompi_file_t;
//
//  PMPI_Group = ^TMPI_Group;
//  TMPI_Group = Pompi_group_t;
//
//  PMPI_Info = ^TMPI_Info;
//  TMPI_Info = Pompi_info_t;
//
//  PMPI_Op = ^TMPI_Op;
//  TMPI_Op = Pompi_op_t;
//
//  PMPI_Request = ^TMPI_Request;
//  TMPI_Request = Pompi_request_t;
//
//  PMPI_Message = ^TMPI_Message;
//  TMPI_Message = Pompi_message_t;
//  Tompi_status_public_t = TMPI_Status;
//
//  PMPI_Win = ^TMPI_Win;
//  TMPI_Win = Pompi_win_t;
//
//  PMPI_T_enum = ^TMPI_T_enum;
//  TMPI_T_enum = Pmca_base_var_enum_t;
//
//  PMPI_T_cvar_handle = ^TMPI_T_cvar_handle;
//  TMPI_T_cvar_handle = Pompi_mpit_cvar_handle_t;
//
//  PMPI_T_pvar_handle = ^TMPI_T_pvar_handle;
//  TMPI_T_pvar_handle = Pmca_base_pvar_handle_t;
//
//  PMPI_T_pvar_session = ^TMPI_T_pvar_session;
//  TMPI_T_pvar_session = Pmca_base_pvar_session_t;
//
//  Pompi_status_public_t = ^Tompi_status_public_t;
//  Tompi_status_public_t = record
//      MPI_SOURCE : longint;
//      MPI_TAG : longint;
//      MPI_ERROR : longint;
//      _cancelled : longint;
//      _ucount : Tsize_t;
//    end;
//

  //PMPI_Comm_errhandler_fn = ^TMPI_Comm_errhandler_fn;
  //TMPI_Comm_errhandler_fn = TMPI_Comm_errhandler_function;
  //
  //PMPI_File_errhandler_fn = ^TMPI_File_errhandler_fn;
  //TMPI_File_errhandler_fn = Tompi_file_errhandler_fn;
  //
  //PMPI_File_errhandler_function = ^TMPI_File_errhandler_function;
  //TMPI_File_errhandler_function = Tompi_file_errhandler_fn;
  //
  //PMPI_Win_errhandler_fn = ^TMPI_Win_errhandler_fn;
  //TMPI_Win_errhandler_fn = TMPI_Win_errhandler_function;

const
  MPI_ANY_SOURCE = -(1);  
{ rank of null process  }
  MPI_PROC_NULL = -(2);  
{ special value for intercomms  }
  MPI_ROOT = -(4);  
{ match any message tag  }
  MPI_ANY_TAG = -(1);  
{ max proc. name length  }
  MPI_MAX_PROCESSOR_NAME = OPAL_MAX_PROCESSOR_NAME;  
{ max error message length  }
  MPI_MAX_ERROR_STRING = OPAL_MAX_ERROR_STRING;  
{ max object name length  }
  MPI_MAX_OBJECT_NAME = OPAL_MAX_OBJECT_NAME;  
{ max length of library version string  }
  MPI_MAX_LIBRARY_VERSION_STRING = 256;  
{ undefined stuff  }
  MPI_UNDEFINED = -(32766);  
{ dist graph topology  }
  MPI_DIST_GRAPH = 3;  
{ cartesian topology  }
  MPI_CART = 1;  
{ graph topology  }
  MPI_GRAPH = 2;  
{ invalid key value  }
  MPI_KEYVAL_INVALID = -(1);  
{
 * More constants
  }
{ unweighted graph  }

{ was #define dname def_expr }
function MPI_UNWEIGHTED : Plongint;  

{ empty weights  }
{ was #define dname def_expr }
function MPI_WEIGHTS_EMPTY : Plongint;  

{ base reference address  }
{ was #define dname def_expr }
function MPI_BOTTOM : pointer;  

{ in place buffer  }
{ was #define dname def_expr }
function MPI_IN_PLACE : pointer;  

{ size of bsend header + ptr  }
const
  MPI_BSEND_OVERHEAD = 128;  
{ max info key length  }
  MPI_MAX_INFO_KEY = OPAL_MAX_INFO_KEY;  
{ max info value length  }
  MPI_MAX_INFO_VAL = OPAL_MAX_INFO_VAL;  
{xxxxxxxx#define MPI_ARGV_NULL            ((char **) 0)         /* NULL argument vector */ }
{xxxxxxxx#define MPI_ARGVS_NULL           ((char ***) 0)        /* NULL argument vectors */ }
{ don't return error codes  }

{ was #define dname def_expr }
function MPI_ERRCODES_IGNORE : Plongint;  

{ max port name length  }
const
  MPI_MAX_PORT_NAME = OPAL_MAX_PORT_NAME;  
{ C row major order  }
  MPI_ORDER_C = 0;  
{ Fortran column major order  }
  MPI_ORDER_FORTRAN = 1;  
{ block distribution  }
  MPI_DISTRIBUTE_BLOCK = 0;  
{ cyclic distribution  }
  MPI_DISTRIBUTE_CYCLIC = 1;  
{ not distributed  }
  MPI_DISTRIBUTE_NONE = 2;  
{ default distribution arg  }
  MPI_DISTRIBUTE_DFLT_DARG = -(1);  
{
 * Constants for C code to access elements in Fortran MPI status array.
 *
 * NOTE: The MPI_F_SOURCE, MPI_F_TAG, MPI_F_ERROR are intentionally 1
 * smaller than their Fortran equivalents in mpif-values.pl (because C
 * is 0-indexed and Fortran is 1-indexed).
  }
{ Size of Fortran MPI status array  }
  MPI_F_STATUS_SIZE = OMPI_FORTRAN_STATUS_SIZE;  
{ Index for MPI_SOURCE  }
  MPI_F_SOURCE = 0;  
{ Index for MPI_TAG  }
  MPI_F_TAG = 1;  
{ Index for MPI_ERROR  }
  MPI_F_ERROR = 2;  
{
 * Since these values are arbitrary to Open MPI, we might as well make
 * them the same as ROMIO for ease of mapping.  These values taken
 * from ROMIO's mpio.h file.
  }
{ ADIO_CREATE  }
  MPI_MODE_CREATE = 1;  
{ ADIO_RDONLY  }
  MPI_MODE_RDONLY = 2;  
{ ADIO_WRONLY   }
  MPI_MODE_WRONLY = 4;  
{ ADIO_RDWR   }
  MPI_MODE_RDWR = 8;  
{ ADIO_DELETE_ON_CLOSE  }
  MPI_MODE_DELETE_ON_CLOSE = 16;  
{ ADIO_UNIQUE_OPEN  }
  MPI_MODE_UNIQUE_OPEN = 32;  
{ ADIO_EXCL  }
  MPI_MODE_EXCL = 64;  
{ ADIO_APPEND  }
  MPI_MODE_APPEND = 128;  
{ ADIO_SEQUENTIAL  }
  MPI_MODE_SEQUENTIAL = 256;  
  MPI_DISPLACEMENT_CURRENT = -(54278278);  
  MPI_SEEK_SET = 600;  
  MPI_SEEK_CUR = 602;  
  MPI_SEEK_END = 604;  
{ Max data representation length  }
  MPI_MAX_DATAREP_STRING = OPAL_MAX_DATAREP_STRING;  
{
 * MPI-2 One-Sided Communications asserts
  }
  MPI_MODE_NOCHECK = 1;  
  MPI_MODE_NOPRECEDE = 2;  
  MPI_MODE_NOPUT = 4;  
  MPI_MODE_NOSTORE = 8;  
  MPI_MODE_NOSUCCEED = 16;  
  MPI_LOCK_EXCLUSIVE = 1;  
  MPI_LOCK_SHARED = 2;  
  MPI_WIN_FLAVOR_CREATE = 1;  
  MPI_WIN_FLAVOR_ALLOCATE = 2;  
  MPI_WIN_FLAVOR_DYNAMIC = 3;  
  MPI_WIN_FLAVOR_SHARED = 4;  
  MPI_WIN_UNIFIED = 0;  
  MPI_WIN_SEPARATE = 1;  
{
 * Predefined attribute keyvals
 *
 * DO NOT CHANGE THE ORDER WITHOUT ALSO CHANGING THE ORDER IN
 * ompi/attribute/attribute_predefined.c and mpif-constants.h (which
 * is included by mpif.h.in).
  }
{ MPI-1  }
{ MPI-2  }
{ Even though these four are IMPI attributes, they need to be there
       for all MPI jobs  }
type
  Txxxxxx =  Longint;
  Const
    MPI_TAG_UB = 0;
    MPI_HOST = 1;
    MPI_IO = 2;
    MPI_WTIME_IS_GLOBAL = 3;
    MPI_APPNUM = 4;
    MPI_LASTUSEDCODE = 5;
    MPI_UNIVERSE_SIZE = 6;
    MPI_WIN_BASE = 7;
    MPI_WIN_SIZE = 8;
    MPI_WIN_DISP_UNIT = 9;
    MPI_WIN_CREATE_FLAVOR = 10;
    MPI_WIN_MODEL = 11;
    IMPI_CLIENT_SIZE = 12;
    IMPI_CLIENT_COLOR = 13;
    IMPI_HOST_SIZE = 14;
    IMPI_HOST_COLOR = 15;

{
 * Error classes and codes
 * Do not change the values of these without also modifying mpif.h.in.
  }
  MPI_SUCCESS = 0;  
  MPI_ERR_BUFFER = 1;  
  MPI_ERR_COUNT = 2;  
  MPI_ERR_TYPE = 3;  
  MPI_ERR_TAG = 4;  
  MPI_ERR_COMM = 5;  
  MPI_ERR_RANK = 6;  
  MPI_ERR_REQUEST = 7;  
  MPI_ERR_ROOT = 8;  
  MPI_ERR_GROUP = 9;  
  MPI_ERR_OP = 10;  
  MPI_ERR_TOPOLOGY = 11;  
  MPI_ERR_DIMS = 12;  
  MPI_ERR_ARG = 13;  
  MPI_ERR_UNKNOWN = 14;  
  MPI_ERR_TRUNCATE = 15;  
  MPI_ERR_OTHER = 16;  
  MPI_ERR_INTERN = 17;  
  MPI_ERR_IN_STATUS = 18;  
  MPI_ERR_PENDING = 19;  
  MPI_ERR_ACCESS = 20;  
  MPI_ERR_AMODE = 21;  
  MPI_ERR_ASSERT = 22;  
  MPI_ERR_BAD_FILE = 23;  
  MPI_ERR_BASE = 24;  
  MPI_ERR_CONVERSION = 25;  
  MPI_ERR_DISP = 26;  
  MPI_ERR_DUP_DATAREP = 27;  
  MPI_ERR_FILE_EXISTS = 28;  
  MPI_ERR_FILE_IN_USE = 29;  
  MPI_ERR_FILE = 30;  
  MPI_ERR_INFO_KEY = 31;  
  MPI_ERR_INFO_NOKEY = 32;  
  MPI_ERR_INFO_VALUE = 33;  
  MPI_ERR_INFO = 34;  
  MPI_ERR_IO = 35;  
  MPI_ERR_KEYVAL = 36;  
  MPI_ERR_LOCKTYPE = 37;  
  MPI_ERR_NAME = 38;  
  MPI_ERR_NO_MEM = 39;  
  MPI_ERR_NOT_SAME = 40;  
  MPI_ERR_NO_SPACE = 41;  
  MPI_ERR_NO_SUCH_FILE = 42;  
  MPI_ERR_PORT = 43;  
  MPI_ERR_QUOTA = 44;  
  MPI_ERR_READ_ONLY = 45;  
  MPI_ERR_RMA_CONFLICT = 46;  
  MPI_ERR_RMA_SYNC = 47;  
  MPI_ERR_SERVICE = 48;  
  MPI_ERR_SIZE = 49;  
  MPI_ERR_SPAWN = 50;  
  MPI_ERR_UNSUPPORTED_DATAREP = 51;  
  MPI_ERR_UNSUPPORTED_OPERATION = 52;  
  MPI_ERR_WIN = 53;  
  MPI_T_ERR_MEMORY = 54;  
  MPI_T_ERR_NOT_INITIALIZED = 55;  
  MPI_T_ERR_CANNOT_INIT = 56;  
  MPI_T_ERR_INVALID_INDEX = 57;  
  MPI_T_ERR_INVALID_ITEM = 58;  
  MPI_T_ERR_INVALID_HANDLE = 59;  
  MPI_T_ERR_OUT_OF_HANDLES = 60;  
  MPI_T_ERR_OUT_OF_SESSIONS = 61;  
  MPI_T_ERR_INVALID_SESSION = 62;  
  MPI_T_ERR_CVAR_SET_NOT_NOW = 63;  
  MPI_T_ERR_CVAR_SET_NEVER = 64;  
  MPI_T_ERR_PVAR_NO_STARTSTOP = 65;  
  MPI_T_ERR_PVAR_NO_WRITE = 66;  
  MPI_T_ERR_PVAR_NO_ATOMIC = 67;  
  MPI_ERR_RMA_RANGE = 68;  
  MPI_ERR_RMA_ATTACH = 69;  
  MPI_ERR_RMA_FLAVOR = 70;  
  MPI_ERR_RMA_SHARED = 71;  
  MPI_T_ERR_INVALID = 72;  
  MPI_T_ERR_INVALID_NAME = 73;  
{ Per MPI-3 p349 47, MPI_ERR_LASTCODE must be >= the last predefined
   MPI_ERR_<foo> code. Set the last code to allow some room for adding
   error codes without breaking ABI.  }
  MPI_ERR_LASTCODE = 92;  
{
 * Comparison results.  Don't change the order of these, the group
 * comparison functions rely on it.
 * Do not change the order of these without also modifying
 * mpif-values.pl.
  }
  Const
    MPI_IDENT = 0;
    MPI_CONGRUENT = 1;
    MPI_SIMILAR = 2;
    MPI_UNEQUAL = 3;

{
 * MPI_Init_thread constants
 * Do not change the order of these without also modifying
 * mpif-values.pl.
  }
  Const
    MPI_THREAD_SINGLE = 0;
    MPI_THREAD_FUNNELED = 1;
    MPI_THREAD_SERIALIZED = 2;
    MPI_THREAD_MULTIPLE = 3;

  Const
    MPI_COMBINER_NAMED = 0;
    MPI_COMBINER_DUP = 1;
    MPI_COMBINER_CONTIGUOUS = 2;
    MPI_COMBINER_VECTOR = 3;
    MPI_COMBINER_HVECTOR_INTEGER = 4;
    OMPI_WAS_MPI_COMBINER_HVECTOR_INTEGER = 5;
    MPI_COMBINER_HVECTOR = 6;
    MPI_COMBINER_INDEXED = 7;
    MPI_COMBINER_HINDEXED_INTEGER = 8;
    OMPI_WAS_MPI_COMBINER_HINDEXED_INTEGER = 9;
    MPI_COMBINER_HINDEXED = 10;
    MPI_COMBINER_INDEXED_BLOCK = 11;
    MPI_COMBINER_STRUCT_INTEGER = 12;
    OMPI_WAS_MPI_COMBINER_STRUCT_INTEGER = 13;
    MPI_COMBINER_STRUCT = 14;
    MPI_COMBINER_SUBARRAY = 15;
    MPI_COMBINER_DARRAY = 16;
    MPI_COMBINER_F90_REAL = 17;
    MPI_COMBINER_F90_COMPLEX = 18;
    MPI_COMBINER_F90_INTEGER = 19;
    MPI_COMBINER_RESIZED = 20;
    MPI_COMBINER_HINDEXED_BLOCK = 21;

  Const
    MPI_COMM_TYPE_SHARED = 0;
    OMPI_COMM_TYPE_HWTHREAD = 1;
    OMPI_COMM_TYPE_CORE = 2;
    OMPI_COMM_TYPE_L1CACHE = 3;
    OMPI_COMM_TYPE_L2CACHE = 4;
    OMPI_COMM_TYPE_L3CACHE = 5;
    OMPI_COMM_TYPE_SOCKET = 6;
    OMPI_COMM_TYPE_NUMA = 7;
    OMPI_COMM_TYPE_BOARD = 8;
    OMPI_COMM_TYPE_HOST = 9;
    OMPI_COMM_TYPE_CU = 10;
    OMPI_COMM_TYPE_CLUSTER = 11;

  OMPI_COMM_TYPE_NODE = MPI_COMM_TYPE_SHARED;  

  Const
    MPI_T_VERBOSITY_USER_BASIC = 0;
    MPI_T_VERBOSITY_USER_DETAIL = 1;
    MPI_T_VERBOSITY_USER_ALL = 2;
    MPI_T_VERBOSITY_TUNER_BASIC = 3;
    MPI_T_VERBOSITY_TUNER_DETAIL = 4;
    MPI_T_VERBOSITY_TUNER_ALL = 5;
    MPI_T_VERBOSITY_MPIDEV_BASIC = 6;
    MPI_T_VERBOSITY_MPIDEV_DETAIL = 7;
    MPI_T_VERBOSITY_MPIDEV_ALL = 8;

  Const
    MPI_T_SCOPE_CONSTANT = 0;
    MPI_T_SCOPE_READONLY = 1;
    MPI_T_SCOPE_LOCAL = 2;
    MPI_T_SCOPE_GROUP = 3;
    MPI_T_SCOPE_GROUP_EQ = 4;
    MPI_T_SCOPE_ALL = 5;
    MPI_T_SCOPE_ALL_EQ = 6;

  Const
    MPI_T_BIND_NO_OBJECT = 0;
    MPI_T_BIND_MPI_COMM = 1;
    MPI_T_BIND_MPI_DATATYPE = 2;
    MPI_T_BIND_MPI_ERRHANDLER = 3;
    MPI_T_BIND_MPI_FILE = 4;
    MPI_T_BIND_MPI_GROUP = 5;
    MPI_T_BIND_MPI_OP = 6;
    MPI_T_BIND_MPI_REQUEST = 7;
    MPI_T_BIND_MPI_WIN = 8;
    MPI_T_BIND_MPI_MESSAGE = 9;
    MPI_T_BIND_MPI_INFO = 10;

  Const
    MPI_T_PVAR_CLASS_STATE = 0;
    MPI_T_PVAR_CLASS_LEVEL = 1;
    MPI_T_PVAR_CLASS_SIZE = 2;
    MPI_T_PVAR_CLASS_PERCENTAGE = 3;
    MPI_T_PVAR_CLASS_HIGHWATERMARK = 4;
    MPI_T_PVAR_CLASS_LOWWATERMARK = 5;
    MPI_T_PVAR_CLASS_COUNTER = 6;
    MPI_T_PVAR_CLASS_AGGREGATE = 7;
    MPI_T_PVAR_CLASS_TIMER = 8;
    MPI_T_PVAR_CLASS_GENERIC = 9;



function OMPI_C_MPI_TYPE_NULL_DELETE_FN(datatype:TMPI_Datatype; type_keyval:longint; attribute_val_out:pointer; extra_state:pointer):longint;cdecl;external libhdf5;
function OMPI_C_MPI_TYPE_NULL_COPY_FN(datatype:TMPI_Datatype; type_keyval:longint; extra_state:pointer; attribute_val_in:pointer; attribute_val_out:pointer; 
           flag:Plongint):longint;cdecl;external libhdf5;
function OMPI_C_MPI_TYPE_DUP_FN(datatype:TMPI_Datatype; type_keyval:longint; extra_state:pointer; attribute_val_in:pointer; attribute_val_out:pointer; 
           flag:Plongint):longint;cdecl;external libhdf5;
function OMPI_C_MPI_COMM_NULL_DELETE_FN(comm:TMPI_Comm; comm_keyval:longint; attribute_val_out:pointer; extra_state:pointer):longint;cdecl;external libhdf5;
function OMPI_C_MPI_COMM_NULL_COPY_FN(comm:TMPI_Comm; comm_keyval:longint; extra_state:pointer; attribute_val_in:pointer; attribute_val_out:pointer; 
           flag:Plongint):longint;cdecl;external libhdf5;
function OMPI_C_MPI_COMM_DUP_FN(comm:TMPI_Comm; comm_keyval:longint; extra_state:pointer; attribute_val_in:pointer; attribute_val_out:pointer; 
           flag:Plongint):longint;cdecl;external libhdf5;
function OMPI_C_MPI_WIN_NULL_DELETE_FN(window:TMPI_Win; win_keyval:longint; attribute_val_out:pointer; extra_state:pointer):longint;cdecl;external libhdf5;
function OMPI_C_MPI_WIN_NULL_COPY_FN(window:TMPI_Win; win_keyval:longint; extra_state:pointer; attribute_val_in:pointer; attribute_val_out:pointer; 
           flag:Plongint):longint;cdecl;external libhdf5;
function OMPI_C_MPI_WIN_DUP_FN(window:TMPI_Win; win_keyval:longint; extra_state:pointer; attribute_val_in:pointer; attribute_val_out:pointer; 
           flag:Plongint):longint;cdecl;external libhdf5;
{
 * External variables
 *
 * The below externs use the ompi_predefined_xxx_t structures to maintain
 * back compatibility between MPI library versions.
 * See ompi/communicator/communicator.h comments with struct ompi_communicator_t
 * for full explanation why we chose to use the ompi_predefined_xxx_t structure.
  }
  var
    ompi_mpi_comm_world : Tompi_predefined_communicator_t;cvar;external libhdf5;
    ompi_mpi_comm_self : Tompi_predefined_communicator_t;cvar;external libhdf5;
    ompi_mpi_comm_null : Tompi_predefined_communicator_t;cvar;external libhdf5;
    ompi_mpi_group_empty : Tompi_predefined_group_t;cvar;external libhdf5;
    ompi_mpi_group_null : Tompi_predefined_group_t;cvar;external libhdf5;
    ompi_request_null : Tompi_predefined_request_t;cvar;external libhdf5;
    ompi_message_null : Tompi_predefined_message_t;cvar;external libhdf5;
    ompi_message_no_proc : Tompi_predefined_message_t;cvar;external libhdf5;
    ompi_mpi_op_null : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_min : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_max : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_sum : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_prod : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_land : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_band : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_lor : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_bor : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_lxor : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_bxor : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_maxloc : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_minloc : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_replace : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_op_no_op : Tompi_predefined_op_t;cvar;external libhdf5;
    ompi_mpi_datatype_null : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_char : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_signed_char : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_unsigned_char : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_byte : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_short : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_unsigned_short : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_int : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_unsigned : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_long : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_unsigned_long : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_long_long_int : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_unsigned_long_long : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_float : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_double : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_long_double : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_wchar : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_packed : Tompi_predefined_datatype_t;cvar;external libhdf5;
{
 * Following are the C++/C99 datatypes
  }
    ompi_mpi_cxx_bool : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_cxx_cplex : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_cxx_dblcplex : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_cxx_ldblcplex : Tompi_predefined_datatype_t;cvar;external libhdf5;
{
 * Following are the Fortran datatypes
  }
    ompi_mpi_logical : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_character : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_integer : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_real : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_dblprec : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_cplex : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_dblcplex : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_ldblcplex : Tompi_predefined_datatype_t;cvar;external libhdf5;
{ Aggregate struct datatypes are not const  }
    ompi_mpi_2int : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_2integer : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_2real : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_2dblprec : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_2cplex : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_2dblcplex : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_float_int : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_double_int : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_longdbl_int : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_short_int : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_long_int : Tompi_predefined_datatype_t;cvar;external libhdf5;
{ Optional MPI2 datatypes, always declared and defined, but not "exported" as MPI_LOGICAL1  }
    ompi_mpi_logical1 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_logical2 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_logical4 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_logical8 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_integer1 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_integer2 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_integer4 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_integer8 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_integer16 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_real2 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_real4 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_real8 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_real16 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_complex8 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_complex16 : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_complex32 : Tompi_predefined_datatype_t;cvar;external libhdf5;
{ New datatypes from the MPI 2.2 standard  }
    ompi_mpi_int8_t : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_uint8_t : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_int16_t : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_uint16_t : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_int32_t : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_uint32_t : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_int64_t : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_uint64_t : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_aint : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_offset : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_count : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_c_bool : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_c_float_complex : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_c_double_complex : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_c_long_double_complex : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_errhandler_null : Tompi_predefined_errhandler_t;cvar;external libhdf5;
    ompi_mpi_errors_are_fatal : Tompi_predefined_errhandler_t;cvar;external libhdf5;
    ompi_mpi_errors_return : Tompi_predefined_errhandler_t;cvar;external libhdf5;
    ompi_mpi_win_null : Tompi_predefined_win_t;cvar;external libhdf5;
    ompi_mpi_file_null : Tompi_predefined_file_t;cvar;external libhdf5;
    ompi_mpi_info_null : Tompi_predefined_info_t;cvar;external libhdf5;
    ompi_mpi_info_env : Tompi_predefined_info_t;cvar;external libhdf5;
    MPI_F_STATUS_IGNORE : PMPI_Fint;cvar;external libhdf5;
    MPI_F_STATUSES_IGNORE : PMPI_Fint;cvar;external libhdf5;
{
 * Removed datatypes.  These datatypes are only available if Open MPI
 * was configured with --enable-mpi1-compatibility.
 *
 * These datatypes were formally removed from the MPI specification
 * and should no longer be used in MPI applications.
  }
    ompi_mpi_lb : Tompi_predefined_datatype_t;cvar;external libhdf5;
    ompi_mpi_ub : Tompi_predefined_datatype_t;cvar;external libhdf5;

function MPI_Abort(comm:TMPI_Comm; errorcode:longint):longint;cdecl;external libhdf5;
function MPI_Accumulate(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_count:longint; target_datatype:TMPI_Datatype; op:TMPI_Op; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Add_error_class(errorclass:Plongint):longint;cdecl;external libhdf5;
function MPI_Add_error_code(errorclass:longint; errorcode:Plongint):longint;cdecl;external libhdf5;
function MPI_Add_error_string(errorcode:longint; _string:Pchar):longint;cdecl;external libhdf5;
function MPI_Allgather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Iallgather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Allgatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Iallgatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Alloc_mem(size:TMPI_Aint; info:TMPI_Info; baseptr:pointer):longint;cdecl;external libhdf5;
function MPI_Allreduce(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Iallreduce(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Alltoall(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ialltoall(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Alltoallv(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ialltoallv(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Alltoallw(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtypes:PMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtypes:PMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ialltoallw(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtypes:PMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtypes:PMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Barrier(comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ibarrier(comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Bcast(buffer:pointer; count:longint; datatype:TMPI_Datatype; root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Bsend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ibcast(buffer:pointer; count:longint; datatype:TMPI_Datatype; root:longint; comm:TMPI_Comm; 
           request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Bsend_init(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Buffer_attach(buffer:pointer; size:longint):longint;cdecl;external libhdf5;
function MPI_Buffer_detach(buffer:pointer; size:Plongint):longint;cdecl;external libhdf5;
function MPI_Cancel(request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Cart_coords(comm:TMPI_Comm; rank:longint; maxdims:longint; coords:Plongint):longint;cdecl;external libhdf5;
function MPI_Cart_create(old_comm:TMPI_Comm; ndims:longint; dims:Plongint; periods:Plongint; reorder:longint; 
           comm_cart:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Cart_get(comm:TMPI_Comm; maxdims:longint; dims:Plongint; periods:Plongint; coords:Plongint):longint;cdecl;external libhdf5;
function MPI_Cart_map(comm:TMPI_Comm; ndims:longint; dims:Plongint; periods:Plongint; newrank:Plongint):longint;cdecl;external libhdf5;
function MPI_Cart_rank(comm:TMPI_Comm; coords:Plongint; rank:Plongint):longint;cdecl;external libhdf5;
function MPI_Cart_shift(comm:TMPI_Comm; direction:longint; disp:longint; rank_source:Plongint; rank_dest:Plongint):longint;cdecl;external libhdf5;
function MPI_Cart_sub(comm:TMPI_Comm; remain_dims:Plongint; new_comm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Cartdim_get(comm:TMPI_Comm; ndims:Plongint):longint;cdecl;external libhdf5;
function MPI_Close_port(port_name:Pchar):longint;cdecl;external libhdf5;
function MPI_Comm_accept(port_name:Pchar; info:TMPI_Info; root:longint; comm:TMPI_Comm; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_c2f(comm:TMPI_Comm):TMPI_Fint;cdecl;external libhdf5;
function MPI_Comm_call_errhandler(comm:TMPI_Comm; errorcode:longint):longint;cdecl;external libhdf5;
function MPI_Comm_compare(comm1:TMPI_Comm; comm2:TMPI_Comm; result:Plongint):longint;cdecl;external libhdf5;
function MPI_Comm_connect(port_name:Pchar; info:TMPI_Info; root:longint; comm:TMPI_Comm; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_create_errhandler(_function:PMPI_Comm_errhandler_function; errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function MPI_Comm_create_keyval(comm_copy_attr_fn:PMPI_Comm_copy_attr_function; comm_delete_attr_fn:PMPI_Comm_delete_attr_function; comm_keyval:Plongint; extra_state:pointer):longint;cdecl;external libhdf5;
function MPI_Comm_create_group(comm:TMPI_Comm; group:TMPI_Group; tag:longint; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_create(comm:TMPI_Comm; group:TMPI_Group; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_delete_attr(comm:TMPI_Comm; comm_keyval:longint):longint;cdecl;external libhdf5;
function MPI_Comm_disconnect(comm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_dup(comm:TMPI_Comm; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_idup(comm:TMPI_Comm; newcomm:PMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Comm_dup_with_info(comm:TMPI_Comm; info:TMPI_Info; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_f2c(comm:TMPI_Fint):TMPI_Comm;cdecl;external libhdf5;
function MPI_Comm_free_keyval(comm_keyval:Plongint):longint;cdecl;external libhdf5;
function MPI_Comm_free(comm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_get_attr(comm:TMPI_Comm; comm_keyval:longint; attribute_val:pointer; flag:Plongint):longint;cdecl;external libhdf5;
function MPI_Dist_graph_create(comm_old:TMPI_Comm; n:longint; nodes:Plongint; degrees:Plongint; targets:Plongint; 
           weights:Plongint; info:TMPI_Info; reorder:longint; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Dist_graph_create_adjacent(comm_old:TMPI_Comm; indegree:longint; sources:Plongint; sourceweights:Plongint; outdegree:longint; 
           destinations:Plongint; destweights:Plongint; info:TMPI_Info; reorder:longint; comm_dist_graph:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Dist_graph_neighbors(comm:TMPI_Comm; maxindegree:longint; sources:Plongint; sourceweights:Plongint; maxoutdegree:longint; 
           destinations:Plongint; destweights:Plongint):longint;cdecl;external libhdf5;
function MPI_Dist_graph_neighbors_count(comm:TMPI_Comm; inneighbors:Plongint; outneighbors:Plongint; weighted:Plongint):longint;cdecl;external libhdf5;
function MPI_Comm_get_errhandler(comm:TMPI_Comm; erhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function MPI_Comm_get_info(comm:TMPI_Comm; info_used:PMPI_Info):longint;cdecl;external libhdf5;
function MPI_Comm_get_name(comm:TMPI_Comm; comm_name:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function MPI_Comm_get_parent(parent:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_group(comm:TMPI_Comm; group:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_Comm_join(fd:longint; intercomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_rank(comm:TMPI_Comm; rank:Plongint):longint;cdecl;external libhdf5;
function MPI_Comm_remote_group(comm:TMPI_Comm; group:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_Comm_remote_size(comm:TMPI_Comm; size:Plongint):longint;cdecl;external libhdf5;
function MPI_Comm_set_attr(comm:TMPI_Comm; comm_keyval:longint; attribute_val:pointer):longint;cdecl;external libhdf5;
function MPI_Comm_set_errhandler(comm:TMPI_Comm; errhandler:TMPI_Errhandler):longint;cdecl;external libhdf5;
function MPI_Comm_set_info(comm:TMPI_Comm; info:TMPI_Info):longint;cdecl;external libhdf5;
function MPI_Comm_set_name(comm:TMPI_Comm; comm_name:Pchar):longint;cdecl;external libhdf5;
function MPI_Comm_size(comm:TMPI_Comm; size:Plongint):longint;cdecl;external libhdf5;
function MPI_Comm_spawn(command:Pchar; argv:PPchar; maxprocs:longint; info:TMPI_Info; root:longint; 
           comm:TMPI_Comm; intercomm:PMPI_Comm; array_of_errcodes:Plongint):longint;cdecl;external libhdf5;
function MPI_Comm_spawn_multiple(count:longint; array_of_commands:PPchar; array_of_argv:PPPchar; array_of_maxprocs:Plongint; array_of_info:PMPI_Info; 
           root:longint; comm:TMPI_Comm; intercomm:PMPI_Comm; array_of_errcodes:Plongint):longint;cdecl;external libhdf5;
function MPI_Comm_split(comm:TMPI_Comm; color:longint; key:longint; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_split_type(comm:TMPI_Comm; split_type:longint; key:longint; info:TMPI_Info; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Comm_test_inter(comm:TMPI_Comm; flag:Plongint):longint;cdecl;external libhdf5;
function MPI_Compare_and_swap(origin_addr:pointer; compare_addr:pointer; result_addr:pointer; datatype:TMPI_Datatype; target_rank:longint; 
           target_disp:TMPI_Aint; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Dims_create(nnodes:longint; ndims:longint; dims:Plongint):longint;cdecl;external libhdf5;
function MPI_Errhandler_c2f(errhandler:TMPI_Errhandler):TMPI_Fint;cdecl;external libhdf5;
function MPI_Errhandler_f2c(errhandler:TMPI_Fint):TMPI_Errhandler;cdecl;external libhdf5;
function MPI_Errhandler_free(errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function MPI_Error_class(errorcode:longint; errorclass:Plongint):longint;cdecl;external libhdf5;
function MPI_Error_string(errorcode:longint; _string:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function MPI_Exscan(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Fetch_and_op(origin_addr:pointer; result_addr:pointer; datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           op:TMPI_Op; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Iexscan(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_File_c2f(file:TMPI_File):TMPI_Fint;cdecl;external libhdf5;
function MPI_File_f2c(file:TMPI_Fint):TMPI_File;cdecl;external libhdf5;
function MPI_File_call_errhandler(fh:TMPI_File; errorcode:longint):longint;cdecl;external libhdf5;
function MPI_File_create_errhandler(_function:PMPI_File_errhandler_function; errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function MPI_File_set_errhandler(file:TMPI_File; errhandler:TMPI_Errhandler):longint;cdecl;external libhdf5;
function MPI_File_get_errhandler(file:TMPI_File; errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function MPI_File_open(comm:TMPI_Comm; filename:Pchar; amode:longint; info:TMPI_Info; fh:PMPI_File):longint;cdecl;external libhdf5;
function MPI_File_close(fh:PMPI_File):longint;cdecl;external libhdf5;
function MPI_File_delete(filename:Pchar; info:TMPI_Info):longint;cdecl;external libhdf5;
function MPI_File_set_size(fh:TMPI_File; size:TMPI_Offset):longint;cdecl;external libhdf5;
function MPI_File_preallocate(fh:TMPI_File; size:TMPI_Offset):longint;cdecl;external libhdf5;
function MPI_File_get_size(fh:TMPI_File; size:PMPI_Offset):longint;cdecl;external libhdf5;
function MPI_File_get_group(fh:TMPI_File; group:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_File_get_amode(fh:TMPI_File; amode:Plongint):longint;cdecl;external libhdf5;
function MPI_File_set_info(fh:TMPI_File; info:TMPI_Info):longint;cdecl;external libhdf5;
function MPI_File_get_info(fh:TMPI_File; info_used:PMPI_Info):longint;cdecl;external libhdf5;
function MPI_File_set_view(fh:TMPI_File; disp:TMPI_Offset; etype:TMPI_Datatype; filetype:TMPI_Datatype; datarep:Pchar; 
           info:TMPI_Info):longint;cdecl;external libhdf5;
function MPI_File_get_view(fh:TMPI_File; disp:PMPI_Offset; etype:PMPI_Datatype; filetype:PMPI_Datatype; datarep:Pchar):longint;cdecl;external libhdf5;
function MPI_File_read_at(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_read_at_all(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_write_at(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_write_at_all(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_iread_at(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_File_iwrite_at(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_File_iread_at_all(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_File_iwrite_at_all(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_File_read(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_read_all(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_write(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_write_all(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_iread(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_File_iwrite(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_File_iread_all(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_File_iwrite_all(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_File_seek(fh:TMPI_File; offset:TMPI_Offset; whence:longint):longint;cdecl;external libhdf5;
function MPI_File_get_position(fh:TMPI_File; offset:PMPI_Offset):longint;cdecl;external libhdf5;
function MPI_File_get_byte_offset(fh:TMPI_File; offset:TMPI_Offset; disp:PMPI_Offset):longint;cdecl;external libhdf5;
function MPI_File_read_shared(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_write_shared(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_iread_shared(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_File_iwrite_shared(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_File_read_ordered(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_write_ordered(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_seek_shared(fh:TMPI_File; offset:TMPI_Offset; whence:longint):longint;cdecl;external libhdf5;
function MPI_File_get_position_shared(fh:TMPI_File; offset:PMPI_Offset):longint;cdecl;external libhdf5;
function MPI_File_read_at_all_begin(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_File_read_at_all_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_write_at_all_begin(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_File_write_at_all_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_read_all_begin(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_File_read_all_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_write_all_begin(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_File_write_all_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_read_ordered_begin(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_File_read_ordered_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_write_ordered_begin(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_File_write_ordered_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_File_get_type_extent(fh:TMPI_File; datatype:TMPI_Datatype; extent:PMPI_Aint):longint;cdecl;external libhdf5;
function MPI_File_set_atomicity(fh:TMPI_File; flag:longint):longint;cdecl;external libhdf5;
function MPI_File_get_atomicity(fh:TMPI_File; flag:Plongint):longint;cdecl;external libhdf5;
function MPI_File_sync(fh:TMPI_File):longint;cdecl;external libhdf5;
function MPI_Finalize:longint;cdecl;external libhdf5;
function MPI_Finalized(flag:Plongint):longint;cdecl;external libhdf5;
function MPI_Free_mem(base:pointer):longint;cdecl;external libhdf5;
function MPI_Gather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Igather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Gatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Igatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Get_address(location:pointer; address:PMPI_Aint):longint;cdecl;external libhdf5;
function MPI_Get_count(status:PMPI_Status; datatype:TMPI_Datatype; count:Plongint):longint;cdecl;external libhdf5;
function MPI_Get_elements(status:PMPI_Status; datatype:TMPI_Datatype; count:Plongint):longint;cdecl;external libhdf5;
function MPI_Get_elements_x(status:PMPI_Status; datatype:TMPI_Datatype; count:PMPI_Count):longint;cdecl;external libhdf5;
function MPI_Get(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_count:longint; target_datatype:TMPI_Datatype; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Get_accumulate(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; result_addr:pointer; result_count:longint; 
           result_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; target_count:longint; target_datatype:TMPI_Datatype; 
           op:TMPI_Op; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Get_library_version(version:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function MPI_Get_processor_name(name:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function MPI_Get_version(version:Plongint; subversion:Plongint):longint;cdecl;external libhdf5;
function MPI_Graph_create(comm_old:TMPI_Comm; nnodes:longint; index:Plongint; edges:Plongint; reorder:longint; 
           comm_graph:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Graph_get(comm:TMPI_Comm; maxindex:longint; maxedges:longint; index:Plongint; edges:Plongint):longint;cdecl;external libhdf5;
function MPI_Graph_map(comm:TMPI_Comm; nnodes:longint; index:Plongint; edges:Plongint; newrank:Plongint):longint;cdecl;external libhdf5;
function MPI_Graph_neighbors_count(comm:TMPI_Comm; rank:longint; nneighbors:Plongint):longint;cdecl;external libhdf5;
function MPI_Graph_neighbors(comm:TMPI_Comm; rank:longint; maxneighbors:longint; neighbors:Plongint):longint;cdecl;external libhdf5;
function MPI_Graphdims_get(comm:TMPI_Comm; nnodes:Plongint; nedges:Plongint):longint;cdecl;external libhdf5;
function MPI_Grequest_complete(request:TMPI_Request):longint;cdecl;external libhdf5;
function MPI_Grequest_start(query_fn:PMPI_Grequest_query_function; free_fn:PMPI_Grequest_free_function; cancel_fn:PMPI_Grequest_cancel_function; extra_state:pointer; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Group_c2f(group:TMPI_Group):TMPI_Fint;cdecl;external libhdf5;
function MPI_Group_compare(group1:TMPI_Group; group2:TMPI_Group; result:Plongint):longint;cdecl;external libhdf5;
function MPI_Group_difference(group1:TMPI_Group; group2:TMPI_Group; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_Group_excl(group:TMPI_Group; n:longint; ranks:Plongint; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_Group_f2c(group:TMPI_Fint):TMPI_Group;cdecl;external libhdf5;
function MPI_Group_free(group:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_Group_incl(group:TMPI_Group; n:longint; ranks:Plongint; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_Group_intersection(group1:TMPI_Group; group2:TMPI_Group; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_Group_range_excl(group:TMPI_Group; n:longint; ranges:Parray[0..2] of longint; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_Group_range_incl(group:TMPI_Group; n:longint; ranges:Parray[0..2] of longint; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_Group_rank(group:TMPI_Group; rank:Plongint):longint;cdecl;external libhdf5;
function MPI_Group_size(group:TMPI_Group; size:Plongint):longint;cdecl;external libhdf5;
function MPI_Group_translate_ranks(group1:TMPI_Group; n:longint; ranks1:Plongint; group2:TMPI_Group; ranks2:Plongint):longint;cdecl;external libhdf5;
function MPI_Group_union(group1:TMPI_Group; group2:TMPI_Group; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_Ibsend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Improbe(source:longint; tag:longint; comm:TMPI_Comm; flag:Plongint; message:PMPI_Message; 
           status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Imrecv(buf:pointer; count:longint; _type:TMPI_Datatype; message:PMPI_Message; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Info_c2f(info:TMPI_Info):TMPI_Fint;cdecl;external libhdf5;
function MPI_Info_create(info:PMPI_Info):longint;cdecl;external libhdf5;
function MPI_Info_delete(info:TMPI_Info; key:Pchar):longint;cdecl;external libhdf5;
function MPI_Info_dup(info:TMPI_Info; newinfo:PMPI_Info):longint;cdecl;external libhdf5;
function MPI_Info_f2c(info:TMPI_Fint):TMPI_Info;cdecl;external libhdf5;
function MPI_Info_free(info:PMPI_Info):longint;cdecl;external libhdf5;
function MPI_Info_get(info:TMPI_Info; key:Pchar; valuelen:longint; value:Pchar; flag:Plongint):longint;cdecl;external libhdf5;
function MPI_Info_get_nkeys(info:TMPI_Info; nkeys:Plongint):longint;cdecl;external libhdf5;
function MPI_Info_get_nthkey(info:TMPI_Info; n:longint; key:Pchar):longint;cdecl;external libhdf5;
function MPI_Info_get_valuelen(info:TMPI_Info; key:Pchar; valuelen:Plongint; flag:Plongint):longint;cdecl;external libhdf5;
function MPI_Info_set(info:TMPI_Info; key:Pchar; value:Pchar):longint;cdecl;external libhdf5;
function MPI_Init(argc:Plongint; argv:PPPchar):longint;cdecl;external libhdf5;
function MPI_Initialized(flag:Plongint):longint;cdecl;external libhdf5;
function MPI_Init_thread(argc:Plongint; argv:PPPchar; required:longint; provided:Plongint):longint;cdecl;external libhdf5;
function MPI_Intercomm_create(local_comm:TMPI_Comm; local_leader:longint; bridge_comm:TMPI_Comm; remote_leader:longint; tag:longint; 
           newintercomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Intercomm_merge(intercomm:TMPI_Comm; high:longint; newintercomm:PMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Iprobe(source:longint; tag:longint; comm:TMPI_Comm; flag:Plongint; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Irecv(buf:pointer; count:longint; datatype:TMPI_Datatype; source:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Irsend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Isend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Issend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Is_thread_main(flag:Plongint):longint;cdecl;external libhdf5;
function MPI_Lookup_name(service_name:Pchar; info:TMPI_Info; port_name:Pchar):longint;cdecl;external libhdf5;
function MPI_Message_c2f(message:TMPI_Message):TMPI_Fint;cdecl;external libhdf5;
function MPI_Message_f2c(message:TMPI_Fint):TMPI_Message;cdecl;external libhdf5;
function MPI_Mprobe(source:longint; tag:longint; comm:TMPI_Comm; message:PMPI_Message; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Mrecv(buf:pointer; count:longint; _type:TMPI_Datatype; message:PMPI_Message; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Neighbor_allgather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ineighbor_allgather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Neighbor_allgatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ineighbor_allgatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Neighbor_alltoall(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ineighbor_alltoall(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Neighbor_alltoallv(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ineighbor_alltoallv(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Neighbor_alltoallw(sendbuf:pointer; sendcounts:Plongint; sdispls:PMPI_Aint; sendtypes:PMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:PMPI_Aint; recvtypes:PMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ineighbor_alltoallw(sendbuf:pointer; sendcounts:Plongint; sdispls:PMPI_Aint; sendtypes:PMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:PMPI_Aint; recvtypes:PMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Op_c2f(op:TMPI_Op):TMPI_Fint;cdecl;external libhdf5;
function MPI_Op_commutative(op:TMPI_Op; commute:Plongint):longint;cdecl;external libhdf5;
function MPI_Op_create(_function:PMPI_User_function; commute:longint; op:PMPI_Op):longint;cdecl;external libhdf5;
function MPI_Open_port(info:TMPI_Info; port_name:Pchar):longint;cdecl;external libhdf5;
function MPI_Op_f2c(op:TMPI_Fint):TMPI_Op;cdecl;external libhdf5;
function MPI_Op_free(op:PMPI_Op):longint;cdecl;external libhdf5;
function MPI_Pack_external(datarep:Pchar; inbuf:pointer; incount:longint; datatype:TMPI_Datatype; outbuf:pointer; 
           outsize:TMPI_Aint; position:PMPI_Aint):longint;cdecl;external libhdf5;
function MPI_Pack_external_size(datarep:Pchar; incount:longint; datatype:TMPI_Datatype; size:PMPI_Aint):longint;cdecl;external libhdf5;
function MPI_Pack(inbuf:pointer; incount:longint; datatype:TMPI_Datatype; outbuf:pointer; outsize:longint; 
           position:Plongint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Pack_size(incount:longint; datatype:TMPI_Datatype; comm:TMPI_Comm; size:Plongint):longint;cdecl;external libhdf5;
function MPI_Pcontrol(level:longint; args:array of const):longint;cdecl;external libhdf5;
function MPI_Pcontrol(level:longint):longint;cdecl;external libhdf5;
function MPI_Probe(source:longint; tag:longint; comm:TMPI_Comm; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Publish_name(service_name:Pchar; info:TMPI_Info; port_name:Pchar):longint;cdecl;external libhdf5;
function MPI_Put(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_count:longint; target_datatype:TMPI_Datatype; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Query_thread(provided:Plongint):longint;cdecl;external libhdf5;
function MPI_Raccumulate(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_count:longint; target_datatype:TMPI_Datatype; op:TMPI_Op; win:TMPI_Win; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Recv_init(buf:pointer; count:longint; datatype:TMPI_Datatype; source:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Recv(buf:pointer; count:longint; datatype:TMPI_Datatype; source:longint; tag:longint; 
           comm:TMPI_Comm; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Reduce(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ireduce(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           root:longint; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Reduce_local(inbuf:pointer; inoutbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op):longint;cdecl;external libhdf5;
function MPI_Reduce_scatter(sendbuf:pointer; recvbuf:pointer; recvcounts:Plongint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ireduce_scatter(sendbuf:pointer; recvbuf:pointer; recvcounts:Plongint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Reduce_scatter_block(sendbuf:pointer; recvbuf:pointer; recvcount:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Ireduce_scatter_block(sendbuf:pointer; recvbuf:pointer; recvcount:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Register_datarep(datarep:Pchar; read_conversion_fn:PMPI_Datarep_conversion_function; write_conversion_fn:PMPI_Datarep_conversion_function; dtype_file_extent_fn:PMPI_Datarep_extent_function; extra_state:pointer):longint;cdecl;external libhdf5;
function MPI_Request_c2f(request:TMPI_Request):TMPI_Fint;cdecl;external libhdf5;
function MPI_Request_f2c(request:TMPI_Fint):TMPI_Request;cdecl;external libhdf5;
function MPI_Request_free(request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Request_get_status(request:TMPI_Request; flag:Plongint; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Rget(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_count:longint; target_datatype:TMPI_Datatype; win:TMPI_Win; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Rget_accumulate(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; result_addr:pointer; result_count:longint; 
           result_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; target_count:longint; target_datatype:TMPI_Datatype; 
           op:TMPI_Op; win:TMPI_Win; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Rput(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_cout:longint; target_datatype:TMPI_Datatype; win:TMPI_Win; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Rsend(ibuf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Rsend_init(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Scan(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Iscan(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Scatter(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Iscatter(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Scatterv(sendbuf:pointer; sendcounts:Plongint; displs:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcount:longint; recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Iscatterv(sendbuf:pointer; sendcounts:Plongint; displs:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcount:longint; recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Send_init(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Send(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Sendrecv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; dest:longint; sendtag:longint; 
           recvbuf:pointer; recvcount:longint; recvtype:TMPI_Datatype; source:longint; recvtag:longint; 
           comm:TMPI_Comm; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Sendrecv_replace(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; sendtag:longint; 
           source:longint; recvtag:longint; comm:TMPI_Comm; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Ssend_init(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Ssend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Start(request:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Startall(count:longint; array_of_requests:PMPI_Request):longint;cdecl;external libhdf5;
function MPI_Status_c2f(c_status:PMPI_Status; f_status:PMPI_Fint):longint;cdecl;external libhdf5;
function MPI_Status_f2c(f_status:PMPI_Fint; c_status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Status_set_cancelled(status:PMPI_Status; flag:longint):longint;cdecl;external libhdf5;
function MPI_Status_set_elements(status:PMPI_Status; datatype:TMPI_Datatype; count:longint):longint;cdecl;external libhdf5;
function MPI_Status_set_elements_x(status:PMPI_Status; datatype:TMPI_Datatype; count:TMPI_Count):longint;cdecl;external libhdf5;
function MPI_Testall(count:longint; array_of_requests:PMPI_Request; flag:Plongint; array_of_statuses:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Testany(count:longint; array_of_requests:PMPI_Request; index:Plongint; flag:Plongint; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Test(request:PMPI_Request; flag:Plongint; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Test_cancelled(status:PMPI_Status; flag:Plongint):longint;cdecl;external libhdf5;
function MPI_Testsome(incount:longint; array_of_requests:PMPI_Request; outcount:Plongint; array_of_indices:Plongint; array_of_statuses:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Topo_test(comm:TMPI_Comm; status:Plongint):longint;cdecl;external libhdf5;
function MPI_Type_c2f(datatype:TMPI_Datatype):TMPI_Fint;cdecl;external libhdf5;
function MPI_Type_commit(_type:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_contiguous(count:longint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_create_darray(size:longint; rank:longint; ndims:longint; gsize_array:Plongint; distrib_array:Plongint; 
           darg_array:Plongint; psize_array:Plongint; order:longint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_create_f90_complex(p:longint; r:longint; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_create_f90_integer(r:longint; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_create_f90_real(p:longint; r:longint; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_create_hindexed_block(count:longint; blocklength:longint; array_of_displacements:PMPI_Aint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_create_hindexed(count:longint; array_of_blocklengths:Plongint; array_of_displacements:PMPI_Aint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_create_hvector(count:longint; blocklength:longint; stride:TMPI_Aint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_create_keyval(type_copy_attr_fn:PMPI_Type_copy_attr_function; type_delete_attr_fn:PMPI_Type_delete_attr_function; type_keyval:Plongint; extra_state:pointer):longint;cdecl;external libhdf5;
function MPI_Type_create_indexed_block(count:longint; blocklength:longint; array_of_displacements:Plongint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_create_struct(count:longint; array_of_block_lengths:Plongint; array_of_displacements:PMPI_Aint; array_of_types:PMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_create_subarray(ndims:longint; size_array:Plongint; subsize_array:Plongint; start_array:Plongint; order:longint; 
           oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_create_resized(oldtype:TMPI_Datatype; lb:TMPI_Aint; extent:TMPI_Aint; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_delete_attr(_type:TMPI_Datatype; type_keyval:longint):longint;cdecl;external libhdf5;
function MPI_Type_dup(_type:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_free(_type:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_free_keyval(type_keyval:Plongint):longint;cdecl;external libhdf5;
function MPI_Type_f2c(datatype:TMPI_Fint):TMPI_Datatype;cdecl;external libhdf5;
function MPI_Type_get_attr(_type:TMPI_Datatype; type_keyval:longint; attribute_val:pointer; flag:Plongint):longint;cdecl;external libhdf5;
function MPI_Type_get_contents(mtype:TMPI_Datatype; max_integers:longint; max_addresses:longint; max_datatypes:longint; array_of_integers:Plongint; 
           array_of_addresses:PMPI_Aint; array_of_datatypes:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_get_envelope(_type:TMPI_Datatype; num_integers:Plongint; num_addresses:Plongint; num_datatypes:Plongint; combiner:Plongint):longint;cdecl;external libhdf5;
function MPI_Type_get_extent(_type:TMPI_Datatype; lb:PMPI_Aint; extent:PMPI_Aint):longint;cdecl;external libhdf5;
function MPI_Type_get_extent_x(_type:TMPI_Datatype; lb:PMPI_Count; extent:PMPI_Count):longint;cdecl;external libhdf5;
function MPI_Type_get_name(_type:TMPI_Datatype; type_name:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function MPI_Type_get_true_extent(datatype:TMPI_Datatype; true_lb:PMPI_Aint; true_extent:PMPI_Aint):longint;cdecl;external libhdf5;
function MPI_Type_get_true_extent_x(datatype:TMPI_Datatype; true_lb:PMPI_Count; true_extent:PMPI_Count):longint;cdecl;external libhdf5;
function MPI_Type_indexed(count:longint; array_of_blocklengths:Plongint; array_of_displacements:Plongint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_match_size(typeclass:longint; size:longint; _type:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Type_set_attr(_type:TMPI_Datatype; type_keyval:longint; attr_val:pointer):longint;cdecl;external libhdf5;
function MPI_Type_set_name(_type:TMPI_Datatype; type_name:Pchar):longint;cdecl;external libhdf5;
function MPI_Type_size(_type:TMPI_Datatype; size:Plongint):longint;cdecl;external libhdf5;
function MPI_Type_size_x(_type:TMPI_Datatype; size:PMPI_Count):longint;cdecl;external libhdf5;
function MPI_Type_vector(count:longint; blocklength:longint; stride:longint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Unpack(inbuf:pointer; insize:longint; position:Plongint; outbuf:pointer; outcount:longint; 
           datatype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function MPI_Unpublish_name(service_name:Pchar; info:TMPI_Info; port_name:Pchar):longint;cdecl;external libhdf5;
function MPI_Unpack_external(datarep:Pchar; inbuf:pointer; insize:TMPI_Aint; position:PMPI_Aint; outbuf:pointer; 
           outcount:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function MPI_Waitall(count:longint; array_of_requests:PMPI_Request; array_of_statuses:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Waitany(count:longint; array_of_requests:PMPI_Request; index:Plongint; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Wait(request:PMPI_Request; status:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Waitsome(incount:longint; array_of_requests:PMPI_Request; outcount:Plongint; array_of_indices:Plongint; array_of_statuses:PMPI_Status):longint;cdecl;external libhdf5;
function MPI_Win_allocate(size:TMPI_Aint; disp_unit:longint; info:TMPI_Info; comm:TMPI_Comm; baseptr:pointer; 
           win:PMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_allocate_shared(size:TMPI_Aint; disp_unit:longint; info:TMPI_Info; comm:TMPI_Comm; baseptr:pointer; 
           win:PMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_attach(win:TMPI_Win; base:pointer; size:TMPI_Aint):longint;cdecl;external libhdf5;
function MPI_Win_c2f(win:TMPI_Win):TMPI_Fint;cdecl;external libhdf5;
function MPI_Win_call_errhandler(win:TMPI_Win; errorcode:longint):longint;cdecl;external libhdf5;
function MPI_Win_complete(win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_create(base:pointer; size:TMPI_Aint; disp_unit:longint; info:TMPI_Info; comm:TMPI_Comm; 
           win:PMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_create_dynamic(info:TMPI_Info; comm:TMPI_Comm; win:PMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_create_errhandler(_function:PMPI_Win_errhandler_function; errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function MPI_Win_create_keyval(win_copy_attr_fn:PMPI_Win_copy_attr_function; win_delete_attr_fn:PMPI_Win_delete_attr_function; win_keyval:Plongint; extra_state:pointer):longint;cdecl;external libhdf5;
function MPI_Win_delete_attr(win:TMPI_Win; win_keyval:longint):longint;cdecl;external libhdf5;
function MPI_Win_detach(win:TMPI_Win; base:pointer):longint;cdecl;external libhdf5;
function MPI_Win_f2c(win:TMPI_Fint):TMPI_Win;cdecl;external libhdf5;
function MPI_Win_fence(assert:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_flush(rank:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_flush_all(win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_flush_local(rank:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_flush_local_all(win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_free(win:PMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_free_keyval(win_keyval:Plongint):longint;cdecl;external libhdf5;
function MPI_Win_get_attr(win:TMPI_Win; win_keyval:longint; attribute_val:pointer; flag:Plongint):longint;cdecl;external libhdf5;
function MPI_Win_get_errhandler(win:TMPI_Win; errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function MPI_Win_get_group(win:TMPI_Win; group:PMPI_Group):longint;cdecl;external libhdf5;
function MPI_Win_get_info(win:TMPI_Win; info_used:PMPI_Info):longint;cdecl;external libhdf5;
function MPI_Win_get_name(win:TMPI_Win; win_name:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function MPI_Win_lock(lock_type:longint; rank:longint; assert:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_lock_all(assert:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_post(group:TMPI_Group; assert:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_set_attr(win:TMPI_Win; win_keyval:longint; attribute_val:pointer):longint;cdecl;external libhdf5;
function MPI_Win_set_errhandler(win:TMPI_Win; errhandler:TMPI_Errhandler):longint;cdecl;external libhdf5;
function MPI_Win_set_info(win:TMPI_Win; info:TMPI_Info):longint;cdecl;external libhdf5;
function MPI_Win_set_name(win:TMPI_Win; win_name:Pchar):longint;cdecl;external libhdf5;
function MPI_Win_shared_query(win:TMPI_Win; rank:longint; size:PMPI_Aint; disp_unit:Plongint; baseptr:pointer):longint;cdecl;external libhdf5;
function MPI_Win_start(group:TMPI_Group; assert:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_sync(win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_test(win:TMPI_Win; flag:Plongint):longint;cdecl;external libhdf5;
function MPI_Win_unlock(rank:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_unlock_all(win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Win_wait(win:TMPI_Win):longint;cdecl;external libhdf5;
function MPI_Wtick:Tdouble;cdecl;external libhdf5;
function MPI_Wtime:Tdouble;cdecl;external libhdf5;
{
   * Profiling MPI API
    }
function PMPI_Abort(comm:TMPI_Comm; errorcode:longint):longint;cdecl;external libhdf5;
function PMPI_Accumulate(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_count:longint; target_datatype:TMPI_Datatype; op:TMPI_Op; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Add_error_class(errorclass:Plongint):longint;cdecl;external libhdf5;
function PMPI_Add_error_code(errorclass:longint; errorcode:Plongint):longint;cdecl;external libhdf5;
function PMPI_Add_error_string(errorcode:longint; _string:Pchar):longint;cdecl;external libhdf5;
function PMPI_Allgather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Iallgather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Allgatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Iallgatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Alloc_mem(size:TMPI_Aint; info:TMPI_Info; baseptr:pointer):longint;cdecl;external libhdf5;
function PMPI_Allreduce(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Iallreduce(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Alltoall(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ialltoall(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Alltoallv(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ialltoallv(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Alltoallw(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtypes:PMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtypes:PMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ialltoallw(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtypes:PMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtypes:PMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Dist_graph_create(comm_old:TMPI_Comm; n:longint; nodes:Plongint; degrees:Plongint; targets:Plongint; 
           weights:Plongint; info:TMPI_Info; reorder:longint; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Dist_graph_create_adjacent(comm_old:TMPI_Comm; indegree:longint; sources:Plongint; sourceweights:Plongint; outdegree:longint; 
           destinations:Plongint; destweights:Plongint; info:TMPI_Info; reorder:longint; comm_dist_graph:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Dist_graph_neighbors(comm:TMPI_Comm; maxindegree:longint; sources:Plongint; sourceweights:Plongint; maxoutdegree:longint; 
           destinations:Plongint; destweights:Plongint):longint;cdecl;external libhdf5;
function PMPI_Dist_graph_neighbors_count(comm:TMPI_Comm; inneighbors:Plongint; outneighbors:Plongint; weighted:Plongint):longint;cdecl;external libhdf5;
function PMPI_Barrier(comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ibarrier(comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Bcast(buffer:pointer; count:longint; datatype:TMPI_Datatype; root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ibcast(buffer:pointer; count:longint; datatype:TMPI_Datatype; root:longint; comm:TMPI_Comm; 
           request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Bsend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Bsend_init(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Buffer_attach(buffer:pointer; size:longint):longint;cdecl;external libhdf5;
function PMPI_Buffer_detach(buffer:pointer; size:Plongint):longint;cdecl;external libhdf5;
function PMPI_Cancel(request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Cart_coords(comm:TMPI_Comm; rank:longint; maxdims:longint; coords:Plongint):longint;cdecl;external libhdf5;
function PMPI_Cart_create(old_comm:TMPI_Comm; ndims:longint; dims:Plongint; periods:Plongint; reorder:longint; 
           comm_cart:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Cart_get(comm:TMPI_Comm; maxdims:longint; dims:Plongint; periods:Plongint; coords:Plongint):longint;cdecl;external libhdf5;
function PMPI_Cart_map(comm:TMPI_Comm; ndims:longint; dims:Plongint; periods:Plongint; newrank:Plongint):longint;cdecl;external libhdf5;
function PMPI_Cart_rank(comm:TMPI_Comm; coords:Plongint; rank:Plongint):longint;cdecl;external libhdf5;
function PMPI_Cart_shift(comm:TMPI_Comm; direction:longint; disp:longint; rank_source:Plongint; rank_dest:Plongint):longint;cdecl;external libhdf5;
function PMPI_Cart_sub(comm:TMPI_Comm; remain_dims:Plongint; new_comm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Cartdim_get(comm:TMPI_Comm; ndims:Plongint):longint;cdecl;external libhdf5;
function PMPI_Close_port(port_name:Pchar):longint;cdecl;external libhdf5;
function PMPI_Comm_accept(port_name:Pchar; info:TMPI_Info; root:longint; comm:TMPI_Comm; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_c2f(comm:TMPI_Comm):TMPI_Fint;cdecl;external libhdf5;
function PMPI_Comm_call_errhandler(comm:TMPI_Comm; errorcode:longint):longint;cdecl;external libhdf5;
function PMPI_Comm_compare(comm1:TMPI_Comm; comm2:TMPI_Comm; result:Plongint):longint;cdecl;external libhdf5;
function PMPI_Comm_connect(port_name:Pchar; info:TMPI_Info; root:longint; comm:TMPI_Comm; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_create_errhandler(_function:PMPI_Comm_errhandler_function; errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function PMPI_Comm_create_keyval(comm_copy_attr_fn:PMPI_Comm_copy_attr_function; comm_delete_attr_fn:PMPI_Comm_delete_attr_function; comm_keyval:Plongint; extra_state:pointer):longint;cdecl;external libhdf5;
function PMPI_Comm_create_group(comm:TMPI_Comm; group:TMPI_Group; tag:longint; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_create(comm:TMPI_Comm; group:TMPI_Group; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_delete_attr(comm:TMPI_Comm; comm_keyval:longint):longint;cdecl;external libhdf5;
function PMPI_Comm_disconnect(comm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_dup(comm:TMPI_Comm; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_idup(comm:TMPI_Comm; newcomm:PMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Comm_dup_with_info(comm:TMPI_Comm; info:TMPI_Info; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_f2c(comm:TMPI_Fint):TMPI_Comm;cdecl;external libhdf5;
function PMPI_Comm_free_keyval(comm_keyval:Plongint):longint;cdecl;external libhdf5;
function PMPI_Comm_free(comm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_get_attr(comm:TMPI_Comm; comm_keyval:longint; attribute_val:pointer; flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_Comm_get_errhandler(comm:TMPI_Comm; erhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function PMPI_Comm_get_info(comm:TMPI_Comm; info_used:PMPI_Info):longint;cdecl;external libhdf5;
function PMPI_Comm_get_name(comm:TMPI_Comm; comm_name:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function PMPI_Comm_get_parent(parent:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_group(comm:TMPI_Comm; group:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_Comm_join(fd:longint; intercomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_rank(comm:TMPI_Comm; rank:Plongint):longint;cdecl;external libhdf5;
function PMPI_Comm_remote_group(comm:TMPI_Comm; group:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_Comm_remote_size(comm:TMPI_Comm; size:Plongint):longint;cdecl;external libhdf5;
function PMPI_Comm_set_attr(comm:TMPI_Comm; comm_keyval:longint; attribute_val:pointer):longint;cdecl;external libhdf5;
function PMPI_Comm_set_errhandler(comm:TMPI_Comm; errhandler:TMPI_Errhandler):longint;cdecl;external libhdf5;
function PMPI_Comm_set_info(comm:TMPI_Comm; info:TMPI_Info):longint;cdecl;external libhdf5;
function PMPI_Comm_set_name(comm:TMPI_Comm; comm_name:Pchar):longint;cdecl;external libhdf5;
function PMPI_Comm_size(comm:TMPI_Comm; size:Plongint):longint;cdecl;external libhdf5;
function PMPI_Comm_spawn(command:Pchar; argv:PPchar; maxprocs:longint; info:TMPI_Info; root:longint; 
           comm:TMPI_Comm; intercomm:PMPI_Comm; array_of_errcodes:Plongint):longint;cdecl;external libhdf5;
function PMPI_Comm_spawn_multiple(count:longint; array_of_commands:PPchar; array_of_argv:PPPchar; array_of_maxprocs:Plongint; array_of_info:PMPI_Info; 
           root:longint; comm:TMPI_Comm; intercomm:PMPI_Comm; array_of_errcodes:Plongint):longint;cdecl;external libhdf5;
function PMPI_Comm_split(comm:TMPI_Comm; color:longint; key:longint; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_split_type(comm:TMPI_Comm; split_type:longint; key:longint; info:TMPI_Info; newcomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Comm_test_inter(comm:TMPI_Comm; flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_Compare_and_swap(origin_addr:pointer; compare_addr:pointer; result_addr:pointer; datatype:TMPI_Datatype; target_rank:longint; 
           target_disp:TMPI_Aint; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Dims_create(nnodes:longint; ndims:longint; dims:Plongint):longint;cdecl;external libhdf5;
function PMPI_Errhandler_c2f(errhandler:TMPI_Errhandler):TMPI_Fint;cdecl;external libhdf5;
function PMPI_Errhandler_f2c(errhandler:TMPI_Fint):TMPI_Errhandler;cdecl;external libhdf5;
function PMPI_Errhandler_free(errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function PMPI_Error_class(errorcode:longint; errorclass:Plongint):longint;cdecl;external libhdf5;
function PMPI_Error_string(errorcode:longint; _string:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function PMPI_Exscan(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Fetch_and_op(origin_addr:pointer; result_addr:pointer; datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           op:TMPI_Op; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Iexscan(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_File_c2f(file:TMPI_File):TMPI_Fint;cdecl;external libhdf5;
function PMPI_File_f2c(file:TMPI_Fint):TMPI_File;cdecl;external libhdf5;
function PMPI_File_call_errhandler(fh:TMPI_File; errorcode:longint):longint;cdecl;external libhdf5;
function PMPI_File_create_errhandler(_function:PMPI_File_errhandler_function; errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function PMPI_File_set_errhandler(file:TMPI_File; errhandler:TMPI_Errhandler):longint;cdecl;external libhdf5;
function PMPI_File_get_errhandler(file:TMPI_File; errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function PMPI_File_open(comm:TMPI_Comm; filename:Pchar; amode:longint; info:TMPI_Info; fh:PMPI_File):longint;cdecl;external libhdf5;
function PMPI_File_close(fh:PMPI_File):longint;cdecl;external libhdf5;
function PMPI_File_delete(filename:Pchar; info:TMPI_Info):longint;cdecl;external libhdf5;
function PMPI_File_set_size(fh:TMPI_File; size:TMPI_Offset):longint;cdecl;external libhdf5;
function PMPI_File_preallocate(fh:TMPI_File; size:TMPI_Offset):longint;cdecl;external libhdf5;
function PMPI_File_get_size(fh:TMPI_File; size:PMPI_Offset):longint;cdecl;external libhdf5;
function PMPI_File_get_group(fh:TMPI_File; group:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_File_get_amode(fh:TMPI_File; amode:Plongint):longint;cdecl;external libhdf5;
function PMPI_File_set_info(fh:TMPI_File; info:TMPI_Info):longint;cdecl;external libhdf5;
function PMPI_File_get_info(fh:TMPI_File; info_used:PMPI_Info):longint;cdecl;external libhdf5;
function PMPI_File_set_view(fh:TMPI_File; disp:TMPI_Offset; etype:TMPI_Datatype; filetype:TMPI_Datatype; datarep:Pchar; 
           info:TMPI_Info):longint;cdecl;external libhdf5;
function PMPI_File_get_view(fh:TMPI_File; disp:PMPI_Offset; etype:PMPI_Datatype; filetype:PMPI_Datatype; datarep:Pchar):longint;cdecl;external libhdf5;
function PMPI_File_read_at(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_read_at_all(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_write_at(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_write_at_all(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_iread_at(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_File_iwrite_at(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_File_iread_at_all(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_File_iwrite_at_all(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype; 
           request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_File_read(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_read_all(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_write(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_write_all(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_iread(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_File_iwrite(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_File_iread_all(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_File_iwrite_all(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_File_seek(fh:TMPI_File; offset:TMPI_Offset; whence:longint):longint;cdecl;external libhdf5;
function PMPI_File_get_position(fh:TMPI_File; offset:PMPI_Offset):longint;cdecl;external libhdf5;
function PMPI_File_get_byte_offset(fh:TMPI_File; offset:TMPI_Offset; disp:PMPI_Offset):longint;cdecl;external libhdf5;
function PMPI_File_read_shared(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_write_shared(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_iread_shared(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_File_iwrite_shared(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_File_read_ordered(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_write_ordered(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_seek_shared(fh:TMPI_File; offset:TMPI_Offset; whence:longint):longint;cdecl;external libhdf5;
function PMPI_File_get_position_shared(fh:TMPI_File; offset:PMPI_Offset):longint;cdecl;external libhdf5;
function PMPI_File_read_at_all_begin(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_File_read_at_all_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_write_at_all_begin(fh:TMPI_File; offset:TMPI_Offset; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_File_write_at_all_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_read_all_begin(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_File_read_all_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_write_all_begin(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_File_write_all_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_read_ordered_begin(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_File_read_ordered_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_write_ordered_begin(fh:TMPI_File; buf:pointer; count:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_File_write_ordered_end(fh:TMPI_File; buf:pointer; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_File_get_type_extent(fh:TMPI_File; datatype:TMPI_Datatype; extent:PMPI_Aint):longint;cdecl;external libhdf5;
function PMPI_File_set_atomicity(fh:TMPI_File; flag:longint):longint;cdecl;external libhdf5;
function PMPI_File_get_atomicity(fh:TMPI_File; flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_File_sync(fh:TMPI_File):longint;cdecl;external libhdf5;
function PMPI_Finalize:longint;cdecl;external libhdf5;
function PMPI_Finalized(flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_Free_mem(base:pointer):longint;cdecl;external libhdf5;
function PMPI_Gather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Igather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Gatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Igatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Get_address(location:pointer; address:PMPI_Aint):longint;cdecl;external libhdf5;
function PMPI_Get_count(status:PMPI_Status; datatype:TMPI_Datatype; count:Plongint):longint;cdecl;external libhdf5;
function PMPI_Get_elements(status:PMPI_Status; datatype:TMPI_Datatype; count:Plongint):longint;cdecl;external libhdf5;
function PMPI_Get_elements_x(status:PMPI_Status; datatype:TMPI_Datatype; count:PMPI_Count):longint;cdecl;external libhdf5;
function PMPI_Get(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_count:longint; target_datatype:TMPI_Datatype; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Get_accumulate(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; result_addr:pointer; result_count:longint; 
           result_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; target_count:longint; target_datatype:TMPI_Datatype; 
           op:TMPI_Op; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Get_library_version(version:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function PMPI_Get_processor_name(name:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function PMPI_Get_version(version:Plongint; subversion:Plongint):longint;cdecl;external libhdf5;
function PMPI_Graph_create(comm_old:TMPI_Comm; nnodes:longint; index:Plongint; edges:Plongint; reorder:longint; 
           comm_graph:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Graph_get(comm:TMPI_Comm; maxindex:longint; maxedges:longint; index:Plongint; edges:Plongint):longint;cdecl;external libhdf5;
function PMPI_Graph_map(comm:TMPI_Comm; nnodes:longint; index:Plongint; edges:Plongint; newrank:Plongint):longint;cdecl;external libhdf5;
function PMPI_Graph_neighbors_count(comm:TMPI_Comm; rank:longint; nneighbors:Plongint):longint;cdecl;external libhdf5;
function PMPI_Graph_neighbors(comm:TMPI_Comm; rank:longint; maxneighbors:longint; neighbors:Plongint):longint;cdecl;external libhdf5;
function PMPI_Graphdims_get(comm:TMPI_Comm; nnodes:Plongint; nedges:Plongint):longint;cdecl;external libhdf5;
function PMPI_Grequest_complete(request:TMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Grequest_start(query_fn:PMPI_Grequest_query_function; free_fn:PMPI_Grequest_free_function; cancel_fn:PMPI_Grequest_cancel_function; extra_state:pointer; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Group_c2f(group:TMPI_Group):TMPI_Fint;cdecl;external libhdf5;
function PMPI_Group_compare(group1:TMPI_Group; group2:TMPI_Group; result:Plongint):longint;cdecl;external libhdf5;
function PMPI_Group_difference(group1:TMPI_Group; group2:TMPI_Group; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_Group_excl(group:TMPI_Group; n:longint; ranks:Plongint; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_Group_f2c(group:TMPI_Fint):TMPI_Group;cdecl;external libhdf5;
function PMPI_Group_free(group:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_Group_incl(group:TMPI_Group; n:longint; ranks:Plongint; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_Group_intersection(group1:TMPI_Group; group2:TMPI_Group; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_Group_range_excl(group:TMPI_Group; n:longint; ranges:Parray[0..2] of longint; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_Group_range_incl(group:TMPI_Group; n:longint; ranges:Parray[0..2] of longint; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_Group_rank(group:TMPI_Group; rank:Plongint):longint;cdecl;external libhdf5;
function PMPI_Group_size(group:TMPI_Group; size:Plongint):longint;cdecl;external libhdf5;
function PMPI_Group_translate_ranks(group1:TMPI_Group; n:longint; ranks1:Plongint; group2:TMPI_Group; ranks2:Plongint):longint;cdecl;external libhdf5;
function PMPI_Group_union(group1:TMPI_Group; group2:TMPI_Group; newgroup:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_Ibsend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Improbe(source:longint; tag:longint; comm:TMPI_Comm; flag:Plongint; message:PMPI_Message; 
           status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Imrecv(buf:pointer; count:longint; _type:TMPI_Datatype; message:PMPI_Message; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Info_c2f(info:TMPI_Info):TMPI_Fint;cdecl;external libhdf5;
function PMPI_Info_create(info:PMPI_Info):longint;cdecl;external libhdf5;
function PMPI_Info_delete(info:TMPI_Info; key:Pchar):longint;cdecl;external libhdf5;
function PMPI_Info_dup(info:TMPI_Info; newinfo:PMPI_Info):longint;cdecl;external libhdf5;
function PMPI_Info_f2c(info:TMPI_Fint):TMPI_Info;cdecl;external libhdf5;
function PMPI_Info_free(info:PMPI_Info):longint;cdecl;external libhdf5;
function PMPI_Info_get(info:TMPI_Info; key:Pchar; valuelen:longint; value:Pchar; flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_Info_get_nkeys(info:TMPI_Info; nkeys:Plongint):longint;cdecl;external libhdf5;
function PMPI_Info_get_nthkey(info:TMPI_Info; n:longint; key:Pchar):longint;cdecl;external libhdf5;
function PMPI_Info_get_valuelen(info:TMPI_Info; key:Pchar; valuelen:Plongint; flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_Info_set(info:TMPI_Info; key:Pchar; value:Pchar):longint;cdecl;external libhdf5;
function PMPI_Init(argc:Plongint; argv:PPPchar):longint;cdecl;external libhdf5;
function PMPI_Initialized(flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_Init_thread(argc:Plongint; argv:PPPchar; required:longint; provided:Plongint):longint;cdecl;external libhdf5;
function PMPI_Intercomm_create(local_comm:TMPI_Comm; local_leader:longint; bridge_comm:TMPI_Comm; remote_leader:longint; tag:longint; 
           newintercomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Intercomm_merge(intercomm:TMPI_Comm; high:longint; newintercomm:PMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Iprobe(source:longint; tag:longint; comm:TMPI_Comm; flag:Plongint; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Irecv(buf:pointer; count:longint; datatype:TMPI_Datatype; source:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Irsend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Isend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Issend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Is_thread_main(flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_Lookup_name(service_name:Pchar; info:TMPI_Info; port_name:Pchar):longint;cdecl;external libhdf5;
function PMPI_Message_c2f(message:TMPI_Message):TMPI_Fint;cdecl;external libhdf5;
function PMPI_Message_f2c(message:TMPI_Fint):TMPI_Message;cdecl;external libhdf5;
function PMPI_Mprobe(source:longint; tag:longint; comm:TMPI_Comm; message:PMPI_Message; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Mrecv(buf:pointer; count:longint; _type:TMPI_Datatype; message:PMPI_Message; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Neighbor_allgather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ineighbor_allgather(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Neighbor_allgatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ineighbor_allgatherv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcounts:Plongint; 
           displs:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Neighbor_alltoall(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ineighbor_alltoall(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Neighbor_alltoallv(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ineighbor_alltoallv(sendbuf:pointer; sendcounts:Plongint; sdispls:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:Plongint; recvtype:TMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Neighbor_alltoallw(sendbuf:pointer; sendcounts:Plongint; sdispls:PMPI_Aint; sendtypes:PMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:PMPI_Aint; recvtypes:PMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ineighbor_alltoallw(sendbuf:pointer; sendcounts:Plongint; sdispls:PMPI_Aint; sendtypes:PMPI_Datatype; recvbuf:pointer; 
           recvcounts:Plongint; rdispls:PMPI_Aint; recvtypes:PMPI_Datatype; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Op_c2f(op:TMPI_Op):TMPI_Fint;cdecl;external libhdf5;
function PMPI_Op_commutative(op:TMPI_Op; commute:Plongint):longint;cdecl;external libhdf5;
function PMPI_Op_create(_function:PMPI_User_function; commute:longint; op:PMPI_Op):longint;cdecl;external libhdf5;
function PMPI_Open_port(info:TMPI_Info; port_name:Pchar):longint;cdecl;external libhdf5;
function PMPI_Op_f2c(op:TMPI_Fint):TMPI_Op;cdecl;external libhdf5;
function PMPI_Op_free(op:PMPI_Op):longint;cdecl;external libhdf5;
function PMPI_Pack_external(datarep:Pchar; inbuf:pointer; incount:longint; datatype:TMPI_Datatype; outbuf:pointer; 
           outsize:TMPI_Aint; position:PMPI_Aint):longint;cdecl;external libhdf5;
function PMPI_Pack_external_size(datarep:Pchar; incount:longint; datatype:TMPI_Datatype; size:PMPI_Aint):longint;cdecl;external libhdf5;
function PMPI_Pack(inbuf:pointer; incount:longint; datatype:TMPI_Datatype; outbuf:pointer; outsize:longint; 
           position:Plongint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Pack_size(incount:longint; datatype:TMPI_Datatype; comm:TMPI_Comm; size:Plongint):longint;cdecl;external libhdf5;
function PMPI_Pcontrol(level:longint; args:array of const):longint;cdecl;external libhdf5;
function PMPI_Pcontrol(level:longint):longint;cdecl;external libhdf5;
function PMPI_Probe(source:longint; tag:longint; comm:TMPI_Comm; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Publish_name(service_name:Pchar; info:TMPI_Info; port_name:Pchar):longint;cdecl;external libhdf5;
function PMPI_Put(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_count:longint; target_datatype:TMPI_Datatype; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Query_thread(provided:Plongint):longint;cdecl;external libhdf5;
function PMPI_Raccumulate(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_count:longint; target_datatype:TMPI_Datatype; op:TMPI_Op; win:TMPI_Win; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Recv_init(buf:pointer; count:longint; datatype:TMPI_Datatype; source:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Recv(buf:pointer; count:longint; datatype:TMPI_Datatype; source:longint; tag:longint; 
           comm:TMPI_Comm; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Reduce(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ireduce(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           root:longint; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Reduce_local(inbuf:pointer; inoutbuf:pointer; count:longint; datatype:TMPI_Datatype; para5:TMPI_Op):longint;cdecl;external libhdf5;
function PMPI_Reduce_scatter(sendbuf:pointer; recvbuf:pointer; recvcounts:Plongint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ireduce_scatter(sendbuf:pointer; recvbuf:pointer; recvcounts:Plongint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Reduce_scatter_block(sendbuf:pointer; recvbuf:pointer; recvcount:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Ireduce_scatter_block(sendbuf:pointer; recvbuf:pointer; recvcount:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Register_datarep(datarep:Pchar; read_conversion_fn:PMPI_Datarep_conversion_function; write_conversion_fn:PMPI_Datarep_conversion_function; dtype_file_extent_fn:PMPI_Datarep_extent_function; extra_state:pointer):longint;cdecl;external libhdf5;
function PMPI_Request_c2f(request:TMPI_Request):TMPI_Fint;cdecl;external libhdf5;
function PMPI_Request_f2c(request:TMPI_Fint):TMPI_Request;cdecl;external libhdf5;
function PMPI_Request_free(request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Request_get_status(request:TMPI_Request; flag:Plongint; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Rget(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_count:longint; target_datatype:TMPI_Datatype; win:TMPI_Win; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Rget_accumulate(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; result_addr:pointer; result_count:longint; 
           result_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; target_count:longint; target_datatype:TMPI_Datatype; 
           op:TMPI_Op; win:TMPI_Win; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Rput(origin_addr:pointer; origin_count:longint; origin_datatype:TMPI_Datatype; target_rank:longint; target_disp:TMPI_Aint; 
           target_cout:longint; target_datatype:TMPI_Datatype; win:TMPI_Win; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Rsend(ibuf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Rsend_init(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Scan(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Iscan(sendbuf:pointer; recvbuf:pointer; count:longint; datatype:TMPI_Datatype; op:TMPI_Op; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Scatter(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Iscatter(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; recvbuf:pointer; recvcount:longint; 
           recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Scatterv(sendbuf:pointer; sendcounts:Plongint; displs:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcount:longint; recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Iscatterv(sendbuf:pointer; sendcounts:Plongint; displs:Plongint; sendtype:TMPI_Datatype; recvbuf:pointer; 
           recvcount:longint; recvtype:TMPI_Datatype; root:longint; comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Send_init(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Send(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Sendrecv(sendbuf:pointer; sendcount:longint; sendtype:TMPI_Datatype; dest:longint; sendtag:longint; 
           recvbuf:pointer; recvcount:longint; recvtype:TMPI_Datatype; source:longint; recvtag:longint; 
           comm:TMPI_Comm; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Sendrecv_replace(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; sendtag:longint; 
           source:longint; recvtag:longint; comm:TMPI_Comm; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Ssend_init(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm; request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Ssend(buf:pointer; count:longint; datatype:TMPI_Datatype; dest:longint; tag:longint; 
           comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Start(request:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Startall(count:longint; array_of_requests:PMPI_Request):longint;cdecl;external libhdf5;
function PMPI_Status_c2f(c_status:PMPI_Status; f_status:PMPI_Fint):longint;cdecl;external libhdf5;
function PMPI_Status_f2c(f_status:PMPI_Fint; c_status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Status_set_cancelled(status:PMPI_Status; flag:longint):longint;cdecl;external libhdf5;
function PMPI_Status_set_elements(status:PMPI_Status; datatype:TMPI_Datatype; count:longint):longint;cdecl;external libhdf5;
function PMPI_Status_set_elements_x(status:PMPI_Status; datatype:TMPI_Datatype; count:TMPI_Count):longint;cdecl;external libhdf5;
function PMPI_Testall(count:longint; array_of_requests:PMPI_Request; flag:Plongint; array_of_statuses:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Testany(count:longint; array_of_requests:PMPI_Request; index:Plongint; flag:Plongint; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Test(request:PMPI_Request; flag:Plongint; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Test_cancelled(status:PMPI_Status; flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_Testsome(incount:longint; array_of_requests:PMPI_Request; outcount:Plongint; array_of_indices:Plongint; array_of_statuses:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Topo_test(comm:TMPI_Comm; status:Plongint):longint;cdecl;external libhdf5;
function PMPI_Type_c2f(datatype:TMPI_Datatype):TMPI_Fint;cdecl;external libhdf5;
function PMPI_Type_commit(_type:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_contiguous(count:longint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_create_darray(size:longint; rank:longint; ndims:longint; gsize_array:Plongint; distrib_array:Plongint; 
           darg_array:Plongint; psize_array:Plongint; order:longint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_create_f90_complex(p:longint; r:longint; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_create_f90_integer(r:longint; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_create_f90_real(p:longint; r:longint; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_create_hindexed(count:longint; array_of_blocklengths:Plongint; array_of_displacements:PMPI_Aint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_create_hvector(count:longint; blocklength:longint; stride:TMPI_Aint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_create_keyval(type_copy_attr_fn:PMPI_Type_copy_attr_function; type_delete_attr_fn:PMPI_Type_delete_attr_function; type_keyval:Plongint; extra_state:pointer):longint;cdecl;external libhdf5;
function PMPI_Type_create_hindexed_block(count:longint; blocklength:longint; array_of_displacements:PMPI_Aint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_create_indexed_block(count:longint; blocklength:longint; array_of_displacements:Plongint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_create_struct(count:longint; array_of_block_lengths:Plongint; array_of_displacements:PMPI_Aint; array_of_types:PMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_create_subarray(ndims:longint; size_array:Plongint; subsize_array:Plongint; start_array:Plongint; order:longint; 
           oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_create_resized(oldtype:TMPI_Datatype; lb:TMPI_Aint; extent:TMPI_Aint; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_delete_attr(_type:TMPI_Datatype; type_keyval:longint):longint;cdecl;external libhdf5;
function PMPI_Type_dup(_type:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_free(_type:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_free_keyval(type_keyval:Plongint):longint;cdecl;external libhdf5;
function PMPI_Type_f2c(datatype:TMPI_Fint):TMPI_Datatype;cdecl;external libhdf5;
function PMPI_Type_get_attr(_type:TMPI_Datatype; type_keyval:longint; attribute_val:pointer; flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_Type_get_contents(mtype:TMPI_Datatype; max_integers:longint; max_addresses:longint; max_datatypes:longint; array_of_integers:Plongint; 
           array_of_addresses:PMPI_Aint; array_of_datatypes:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_get_envelope(_type:TMPI_Datatype; num_integers:Plongint; num_addresses:Plongint; num_datatypes:Plongint; combiner:Plongint):longint;cdecl;external libhdf5;
function PMPI_Type_get_extent(_type:TMPI_Datatype; lb:PMPI_Aint; extent:PMPI_Aint):longint;cdecl;external libhdf5;
function PMPI_Type_get_extent_x(_type:TMPI_Datatype; lb:PMPI_Count; extent:PMPI_Count):longint;cdecl;external libhdf5;
function PMPI_Type_get_name(_type:TMPI_Datatype; type_name:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function PMPI_Type_get_true_extent(datatype:TMPI_Datatype; true_lb:PMPI_Aint; true_extent:PMPI_Aint):longint;cdecl;external libhdf5;
function PMPI_Type_get_true_extent_x(datatype:TMPI_Datatype; true_lb:PMPI_Count; true_extent:PMPI_Count):longint;cdecl;external libhdf5;
function PMPI_Type_indexed(count:longint; array_of_blocklengths:Plongint; array_of_displacements:Plongint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_match_size(typeclass:longint; size:longint; _type:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Type_set_attr(_type:TMPI_Datatype; type_keyval:longint; attr_val:pointer):longint;cdecl;external libhdf5;
function PMPI_Type_set_name(_type:TMPI_Datatype; type_name:Pchar):longint;cdecl;external libhdf5;
function PMPI_Type_size(_type:TMPI_Datatype; size:Plongint):longint;cdecl;external libhdf5;
function PMPI_Type_size_x(_type:TMPI_Datatype; size:PMPI_Count):longint;cdecl;external libhdf5;
function PMPI_Type_vector(count:longint; blocklength:longint; stride:longint; oldtype:TMPI_Datatype; newtype:PMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Unpack(inbuf:pointer; insize:longint; position:Plongint; outbuf:pointer; outcount:longint; 
           datatype:TMPI_Datatype; comm:TMPI_Comm):longint;cdecl;external libhdf5;
function PMPI_Unpublish_name(service_name:Pchar; info:TMPI_Info; port_name:Pchar):longint;cdecl;external libhdf5;
function PMPI_Unpack_external(datarep:Pchar; inbuf:pointer; insize:TMPI_Aint; position:PMPI_Aint; outbuf:pointer; 
           outcount:longint; datatype:TMPI_Datatype):longint;cdecl;external libhdf5;
function PMPI_Waitall(count:longint; array_of_requests:PMPI_Request; array_of_statuses:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Waitany(count:longint; array_of_requests:PMPI_Request; index:Plongint; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Wait(request:PMPI_Request; status:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Waitsome(incount:longint; array_of_requests:PMPI_Request; outcount:Plongint; array_of_indices:Plongint; array_of_statuses:PMPI_Status):longint;cdecl;external libhdf5;
function PMPI_Win_allocate(size:TMPI_Aint; disp_unit:longint; info:TMPI_Info; comm:TMPI_Comm; baseptr:pointer; 
           win:PMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_allocate_shared(size:TMPI_Aint; disp_unit:longint; info:TMPI_Info; comm:TMPI_Comm; baseptr:pointer; 
           win:PMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_attach(win:TMPI_Win; base:pointer; size:TMPI_Aint):longint;cdecl;external libhdf5;
function PMPI_Win_c2f(win:TMPI_Win):TMPI_Fint;cdecl;external libhdf5;
function PMPI_Win_call_errhandler(win:TMPI_Win; errorcode:longint):longint;cdecl;external libhdf5;
function PMPI_Win_complete(win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_create(base:pointer; size:TMPI_Aint; disp_unit:longint; info:TMPI_Info; comm:TMPI_Comm; 
           win:PMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_create_dynamic(info:TMPI_Info; comm:TMPI_Comm; win:PMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_create_errhandler(_function:PMPI_Win_errhandler_function; errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function PMPI_Win_create_keyval(win_copy_attr_fn:PMPI_Win_copy_attr_function; win_delete_attr_fn:PMPI_Win_delete_attr_function; win_keyval:Plongint; extra_state:pointer):longint;cdecl;external libhdf5;
function PMPI_Win_delete_attr(win:TMPI_Win; win_keyval:longint):longint;cdecl;external libhdf5;
function PMPI_Win_detach(win:TMPI_Win; base:pointer):longint;cdecl;external libhdf5;
function PMPI_Win_f2c(win:TMPI_Fint):TMPI_Win;cdecl;external libhdf5;
function PMPI_Win_fence(assert:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_flush(rank:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_flush_all(win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_flush_local(rank:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_flush_local_all(win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_free(win:PMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_free_keyval(win_keyval:Plongint):longint;cdecl;external libhdf5;
function PMPI_Win_get_attr(win:TMPI_Win; win_keyval:longint; attribute_val:pointer; flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_Win_get_errhandler(win:TMPI_Win; errhandler:PMPI_Errhandler):longint;cdecl;external libhdf5;
function PMPI_Win_get_group(win:TMPI_Win; group:PMPI_Group):longint;cdecl;external libhdf5;
function PMPI_Win_get_info(win:TMPI_Win; info_used:PMPI_Info):longint;cdecl;external libhdf5;
function PMPI_Win_get_name(win:TMPI_Win; win_name:Pchar; resultlen:Plongint):longint;cdecl;external libhdf5;
function PMPI_Win_lock(lock_type:longint; rank:longint; assert:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_lock_all(assert:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_post(group:TMPI_Group; assert:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_set_attr(win:TMPI_Win; win_keyval:longint; attribute_val:pointer):longint;cdecl;external libhdf5;
function PMPI_Win_set_errhandler(win:TMPI_Win; errhandler:TMPI_Errhandler):longint;cdecl;external libhdf5;
function PMPI_Win_set_info(win:TMPI_Win; info:TMPI_Info):longint;cdecl;external libhdf5;
function PMPI_Win_set_name(win:TMPI_Win; win_name:Pchar):longint;cdecl;external libhdf5;
function PMPI_Win_shared_query(win:TMPI_Win; rank:longint; size:PMPI_Aint; disp_unit:Plongint; baseptr:pointer):longint;cdecl;external libhdf5;
function PMPI_Win_start(group:TMPI_Group; assert:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_sync(win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_test(win:TMPI_Win; flag:Plongint):longint;cdecl;external libhdf5;
function PMPI_Win_unlock(rank:longint; win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_unlock_all(win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Win_wait(win:TMPI_Win):longint;cdecl;external libhdf5;
function PMPI_Wtick:Tdouble;cdecl;external libhdf5;
function PMPI_Wtime:Tdouble;cdecl;external libhdf5;
function PMPI_T_init_thread(required:longint; provided:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_finalize:longint;cdecl;external libhdf5;
function PMPI_T_cvar_get_num(num_cvar:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_cvar_get_info(cvar_index:longint; name:Pchar; name_len:Plongint; verbosity:Plongint; datatype:PMPI_Datatype; 
           enumtype:PMPI_T_enum; desc:Pchar; desc_len:Plongint; bind:Plongint; scope:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_cvar_get_index(name:Pchar; cvar_index:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_cvar_handle_alloc(cvar_index:longint; obj_handle:pointer; handle:PMPI_T_cvar_handle; count:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_cvar_handle_free(handle:PMPI_T_cvar_handle):longint;cdecl;external libhdf5;
function PMPI_T_cvar_read(handle:TMPI_T_cvar_handle; buf:pointer):longint;cdecl;external libhdf5;
function PMPI_T_cvar_write(handle:TMPI_T_cvar_handle; buf:pointer):longint;cdecl;external libhdf5;
function PMPI_T_category_get_num(num_cat:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_category_get_info(cat_index:longint; name:Pchar; name_len:Plongint; desc:Pchar; desc_len:Plongint; 
           num_cvars:Plongint; num_pvars:Plongint; num_categories:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_category_get_index(name:Pchar; category_index:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_category_get_cvars(cat_index:longint; len:longint; indices:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_category_get_pvars(cat_index:longint; len:longint; indices:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_category_get_categories(cat_index:longint; len:longint; indices:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_category_changed(stamp:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_pvar_get_num(num_pvar:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_pvar_get_info(pvar_index:longint; name:Pchar; name_len:Plongint; verbosity:Plongint; var_class:Plongint; 
           datatype:PMPI_Datatype; enumtype:PMPI_T_enum; desc:Pchar; desc_len:Plongint; bind:Plongint; 
           readonly:Plongint; continuous:Plongint; atomic:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_pvar_get_index(name:Pchar; var_class:longint; pvar_index:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_pvar_session_create(session:PMPI_T_pvar_session):longint;cdecl;external libhdf5;
function PMPI_T_pvar_session_free(session:PMPI_T_pvar_session):longint;cdecl;external libhdf5;
function PMPI_T_pvar_handle_alloc(session:TMPI_T_pvar_session; pvar_index:longint; obj_handle:pointer; handle:PMPI_T_pvar_handle; count:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_pvar_handle_free(session:TMPI_T_pvar_session; handle:PMPI_T_pvar_handle):longint;cdecl;external libhdf5;
function PMPI_T_pvar_start(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle):longint;cdecl;external libhdf5;
function PMPI_T_pvar_stop(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle):longint;cdecl;external libhdf5;
function PMPI_T_pvar_read(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle; buf:pointer):longint;cdecl;external libhdf5;
function PMPI_T_pvar_write(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle; buf:pointer):longint;cdecl;external libhdf5;
function PMPI_T_pvar_reset(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle):longint;cdecl;external libhdf5;
function PMPI_T_pvar_readreset(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle; buf:pointer):longint;cdecl;external libhdf5;
function PMPI_T_enum_get_info(enumtype:TMPI_T_enum; num:Plongint; name:Pchar; name_len:Plongint):longint;cdecl;external libhdf5;
function PMPI_T_enum_get_item(enumtype:TMPI_T_enum; index:longint; value:Plongint; name:Pchar; name_len:Plongint):longint;cdecl;external libhdf5;
{
   * Tool MPI API
    }
function MPI_T_init_thread(required:longint; provided:Plongint):longint;cdecl;external libhdf5;
function MPI_T_finalize:longint;cdecl;external libhdf5;
function MPI_T_cvar_get_num(num_cvar:Plongint):longint;cdecl;external libhdf5;
function MPI_T_cvar_get_info(cvar_index:longint; name:Pchar; name_len:Plongint; verbosity:Plongint; datatype:PMPI_Datatype; 
           enumtype:PMPI_T_enum; desc:Pchar; desc_len:Plongint; bind:Plongint; scope:Plongint):longint;cdecl;external libhdf5;
function MPI_T_cvar_get_index(name:Pchar; cvar_index:Plongint):longint;cdecl;external libhdf5;
function MPI_T_cvar_handle_alloc(cvar_index:longint; obj_handle:pointer; handle:PMPI_T_cvar_handle; count:Plongint):longint;cdecl;external libhdf5;
function MPI_T_cvar_handle_free(handle:PMPI_T_cvar_handle):longint;cdecl;external libhdf5;
function MPI_T_cvar_read(handle:TMPI_T_cvar_handle; buf:pointer):longint;cdecl;external libhdf5;
function MPI_T_cvar_write(handle:TMPI_T_cvar_handle; buf:pointer):longint;cdecl;external libhdf5;
function MPI_T_category_get_num(num_cat:Plongint):longint;cdecl;external libhdf5;
function MPI_T_category_get_info(cat_index:longint; name:Pchar; name_len:Plongint; desc:Pchar; desc_len:Plongint; 
           num_cvars:Plongint; num_pvars:Plongint; num_categories:Plongint):longint;cdecl;external libhdf5;
function MPI_T_category_get_index(name:Pchar; category_index:Plongint):longint;cdecl;external libhdf5;
function MPI_T_category_get_cvars(cat_index:longint; len:longint; indices:Plongint):longint;cdecl;external libhdf5;
function MPI_T_category_get_pvars(cat_index:longint; len:longint; indices:Plongint):longint;cdecl;external libhdf5;
function MPI_T_category_get_categories(cat_index:longint; len:longint; indices:Plongint):longint;cdecl;external libhdf5;
function MPI_T_category_changed(stamp:Plongint):longint;cdecl;external libhdf5;
function MPI_T_pvar_get_num(num_pvar:Plongint):longint;cdecl;external libhdf5;
function MPI_T_pvar_get_info(pvar_index:longint; name:Pchar; name_len:Plongint; verbosity:Plongint; var_class:Plongint; 
           datatype:PMPI_Datatype; enumtype:PMPI_T_enum; desc:Pchar; desc_len:Plongint; bind:Plongint; 
           readonly:Plongint; continuous:Plongint; atomic:Plongint):longint;cdecl;external libhdf5;
function MPI_T_pvar_get_index(name:Pchar; var_class:longint; pvar_index:Plongint):longint;cdecl;external libhdf5;
function MPI_T_pvar_session_create(session:PMPI_T_pvar_session):longint;cdecl;external libhdf5;
function MPI_T_pvar_session_free(session:PMPI_T_pvar_session):longint;cdecl;external libhdf5;
function MPI_T_pvar_handle_alloc(session:TMPI_T_pvar_session; pvar_index:longint; obj_handle:pointer; handle:PMPI_T_pvar_handle; count:Plongint):longint;cdecl;external libhdf5;
function MPI_T_pvar_handle_free(session:TMPI_T_pvar_session; handle:PMPI_T_pvar_handle):longint;cdecl;external libhdf5;
function MPI_T_pvar_start(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle):longint;cdecl;external libhdf5;
function MPI_T_pvar_stop(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle):longint;cdecl;external libhdf5;
function MPI_T_pvar_read(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle; buf:pointer):longint;cdecl;external libhdf5;
function MPI_T_pvar_write(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle; buf:pointer):longint;cdecl;external libhdf5;
function MPI_T_pvar_reset(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle):longint;cdecl;external libhdf5;
function MPI_T_pvar_readreset(session:TMPI_T_pvar_session; handle:TMPI_T_pvar_handle; buf:pointer):longint;cdecl;external libhdf5;
function MPI_T_enum_get_info(enumtype:TMPI_T_enum; num:Plongint; name:Pchar; name_len:Plongint):longint;cdecl;external libhdf5;
function MPI_T_enum_get_item(enumtype:TMPI_T_enum; index:longint; value:Plongint; name:Pchar; name_len:Plongint):longint;cdecl;external libhdf5;
{
 * Deprecated prototypes.  Usage is discouraged, as these may be
 * deleted in future versions of the MPI Standard.
  }
function MPI_Attr_delete(comm:TMPI_Comm; keyval:longint):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx          __mpi_interface_deprecated__("MPI_Attr_delete was deprecated in MPI-2.0; use MPI_Comm_delete_attr instead"); }
function PMPI_Attr_delete(comm:TMPI_Comm; keyval:longint):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("PMPI_Attr_delete was deprecated in MPI-2.0; use PMPI_Comm_delete_attr instead"); }
function MPI_Attr_get(comm:TMPI_Comm; keyval:longint; attribute_val:pointer; flag:Plongint):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("MPI_Attr_get was deprecated in MPI-2.0; use MPI_Comm_get_attr instead"); }
function PMPI_Attr_get(comm:TMPI_Comm; keyval:longint; attribute_val:pointer; flag:Plongint):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("PMPI_Attr_get was deprecated in MPI-2.0; use PMPI_Comm_get_attr instead"); }
function MPI_Attr_put(comm:TMPI_Comm; keyval:longint; attribute_val:pointer):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("MPI_Attr_put was deprecated in MPI-2.0; use MPI_Comm_set_attr instead"); }
function PMPI_Attr_put(comm:TMPI_Comm; keyval:longint; attribute_val:pointer):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("PMPI_Attr_put was deprecated in MPI-2.0; use PMPI_Comm_set_attr instead"); }
{
 * Even though MPI_Copy_function and MPI_Delete_function are
 * deprecated, we do not use the attributes marking them as such,
 * because otherwise the compiler will warn for all the functions that
 * are declared using them (e.g., MPI_Keyval_create).
  }
type
{ MPI_Copy_function was deprecated in MPI-2.0; use MPI_Comm_copy_attr_function instead.  }
{ MPI_Delete_function was deprecated in MPI-2.0; use MPI_Comm_delete_attr_function instead.  }

function MPI_Keyval_create(copy_fn:PMPI_Copy_function; delete_fn:PMPI_Delete_function; keyval:Plongint; extra_state:pointer):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("MPI_Keyval_create was deprecated in MPI-2.0; use MPI_Comm_create_keyval instead."); }
function PMPI_Keyval_create(copy_fn:PMPI_Copy_function; delete_fn:PMPI_Delete_function; keyval:Plongint; extra_state:pointer):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("PMPI_Keyval_create was deprecated in MPI-2.0; use PMPI_Comm_create_keyval instead."); }
function MPI_Keyval_free(keyval:Plongint):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("MPI_Keyval_free was deprecated in MPI-2.0; MPI_Comm_free_keyval instead."); }
function PMPI_Keyval_free(keyval:Plongint):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("PMPI_Keyval_free was deprecated in MPI-2.0; PMPI_Comm_free_keyval instead."); }
{$if !defined(OMPI_COMPILING_FORTRAN_WRAPPERS)}

const
  MPI_DUP_FN = OMPI_C_MPI_DUP_FN;  
{$endif}

function OMPI_C_MPI_DUP_FN(comm:TMPI_Comm; comm_keyval:longint; extra_state:pointer; attribute_val_in:pointer; attribute_val_out:pointer; 
           flag:Plongint):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("MPI_DUP_FN was deprecated in MPI-2.0; use MPI_COMM_DUP_FN instead."); }
{$if !defined(OMPI_COMPILING_FORTRAN_WRAPPERS)}

const
  MPI_NULL_COPY_FN = OMPI_C_MPI_NULL_COPY_FN;  
{$endif}

function OMPI_C_MPI_NULL_COPY_FN(comm:TMPI_Comm; comm_keyval:longint; extra_state:pointer; attribute_val_in:pointer; attribute_val_out:pointer; 
           flag:Plongint):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("MPI_NULL_COPY_FN was deprecated in MPI-2.0; use MPI_COMM_NULL_COPY_FN instead."); }
{$if !defined(OMPI_COMPILING_FORTRAN_WRAPPERS)}

const
  MPI_NULL_DELETE_FN = OMPI_C_MPI_NULL_DELETE_FN;  
{$endif}

function OMPI_C_MPI_NULL_DELETE_FN(comm:TMPI_Comm; comm_keyval:longint; attribute_val_out:pointer; extra_state:pointer):longint;cdecl;external libhdf5;
{xxxxxxxxxxxxxxxx            __mpi_interface_deprecated__("MPI_NULL_DELETE_FN was deprecated in MPI-2.0; use MPI_COMM_NULL_DELETE_FN instead."); }
{$if (!OMPI_OMIT_MPI1_COMPAT_DECLS || OMPI_BUILDING)}
{
 * Removed typedefs.  These typedefs are only available if Open MPI
 * was configured with --enable-mpi1-compatibility.
 *
 * These typedefs were formally removed from the MPI specification
 * and should no longer be used in MPI applications.
 *
 * Even though MPI_Handler_function is removed, we do not use the
 * attributes marking it as such, because otherwise the compiler
 * will warn for all the functions that are declared using them
 * (e.g., MPI_Errhandler_create).
  }
type
{ MPI_Handler_function was removed in MPI-3.0; use MPI_Comm_use_errhandler_function instead.  }
{
 * Removed prototypes.  These prototypes are only available if Open
 * MPI was configured with --enable-mpi1-compatibility.
 *
 * These functions were formally removed from the MPI specification
 * and should no longer be used in MPI applications.
  }
{
 * Conditional MPI 2 C++ bindings support.  Include if:
 *   - The user does not explicitly request us to skip it (when a C++ compiler
 *       is used to compile C code).
 *   - We want C++ bindings support
 *   - We are not building OMPI itself
 *   - We are using a C++ compiler
  }
{$if !defined(OMPI_SKIP_MPICXX) && OMPI_BUILD_CXX_BINDINGS && !OMPI_BUILDING}
{$if defined(c_plusplus) || defined(__cplusplus)}
{$include "openmpi/ompi/mpi/cxx/mpicxx.h"}
{$endif}
{$endif}
{$endif}
{ OMPI_MPI_H  }

// === Konventiert am: 25-8-26 19:52:04 ===


implementation


{ was #define dname def_expr }
function MPI_UNWEIGHTED : Plongint;
  begin
    MPI_UNWEIGHTED:=Plongint(2);
  end;

{ was #define dname def_expr }
function MPI_WEIGHTS_EMPTY : Plongint;
  begin
    MPI_WEIGHTS_EMPTY:=Plongint(3);
  end;

{ was #define dname def_expr }
function MPI_BOTTOM : pointer;
  begin
    MPI_BOTTOM:=pointer(0);
  end;

{ was #define dname def_expr }
function MPI_IN_PLACE : pointer;
  begin
    MPI_IN_PLACE:=pointer(1);
  end;

{ was #define dname def_expr }
function MPI_ERRCODES_IGNORE : Plongint;
  begin
    MPI_ERRCODES_IGNORE:=Plongint(0);
  end;

{ was #define dname def_expr }
function MPI_T_PVAR_ALL_HANDLES : TMPI_T_pvar_handle;
  begin
    MPI_T_PVAR_ALL_HANDLES:=TMPI_T_pvar_handle(-(1));
  end;

{ was #define dname def_expr }
function MPI_T_PVAR_HANDLE_NULL : TMPI_T_pvar_handle;
  begin
    MPI_T_PVAR_HANDLE_NULL:=TMPI_T_pvar_handle(0);
  end;

{ was #define dname def_expr }
function MPI_T_PVAR_SESSION_NULL : TMPI_T_pvar_session;
  begin
    MPI_T_PVAR_SESSION_NULL:=TMPI_T_pvar_session(0);
  end;

{ was #define dname def_expr }
function MPI_T_CVAR_HANDLE_NULL : TMPI_T_cvar_handle;
  begin
    MPI_T_CVAR_HANDLE_NULL:=TMPI_T_cvar_handle(0);
  end;

{ was #define dname def_expr }
function MPI_CONVERSION_FN_NULL : PMPI_Datarep_conversion_function;
  begin
    MPI_CONVERSION_FN_NULL:=PMPI_Datarep_conversion_function(0);
  end;


end.
