
unit Eet;
interface

{
  Automatically converted by H2Pas 1.0.0 from Eet.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Eet.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdword  = ^dword;
PEet_Colorspace  = ^Eet_Colorspace;
PEet_Compression  = ^Eet_Compression;
PEet_Connection  = ^Eet_Connection;
PEet_Data_Descriptor  = ^Eet_Data_Descriptor;
PEet_Data_Descriptor_Class  = ^Eet_Data_Descriptor_Class;
PEet_Descriptor_Array_Alloc_Callback  = ^Eet_Descriptor_Array_Alloc_Callback;
PEet_Descriptor_Hash_Add_Callback  = ^Eet_Descriptor_Hash_Add_Callback;
PEet_Descriptor_List_Append_Callback  = ^Eet_Descriptor_List_Append_Callback;
PEet_Descriptor_List_Data_Callback  = ^Eet_Descriptor_List_Data_Callback;
PEet_Descriptor_List_Free_Callback  = ^Eet_Descriptor_List_Free_Callback;
PEet_Descriptor_List_Next_Callback  = ^Eet_Descriptor_List_Next_Callback;
PEet_Descriptor_Mem_Alloc_Callback  = ^Eet_Descriptor_Mem_Alloc_Callback;
PEet_Descriptor_Str_Alloc_Callback  = ^Eet_Descriptor_Str_Alloc_Callback;
PEet_Descriptor_Str_Direct_Alloc_Callback  = ^Eet_Descriptor_Str_Direct_Alloc_Callback;
PEet_Descriptor_Type_Get_Callback  = ^Eet_Descriptor_Type_Get_Callback;
PEet_Dictionary  = ^Eet_Dictionary;
PEet_Entry  = ^Eet_Entry;
PEet_Error  = ^Eet_Error;
PEet_File  = ^Eet_File;
PEet_File_Mode  = ^Eet_File_Mode;
PEet_Image_Encoding  = ^Eet_Image_Encoding;
PEet_Key  = ^Eet_Key;
PEet_Node  = ^Eet_Node;
PEet_Node_Data  = ^Eet_Node_Data;
PEet_Node_Walk  = ^Eet_Node_Walk;
PEet_Node_Walk_Array_Callback  = ^Eet_Node_Walk_Array_Callback;
PEet_Node_Walk_Hash_Callback  = ^Eet_Node_Walk_Hash_Callback;
PEet_Node_Walk_List_Callback  = ^Eet_Node_Walk_List_Callback;
PEet_Node_Walk_Simple_Callback  = ^Eet_Node_Walk_Simple_Callback;
PEet_Node_Walk_Struct_Alloc_Callback  = ^Eet_Node_Walk_Struct_Alloc_Callback;
PEet_Read_Cb  = ^Eet_Read_Cb;
PEet_Version  = ^Eet_Version;
PEet_Write_Cb  = ^Eet_Write_Cb;
PEina_Bool  = ^Eina_Bool;
PEina_File  = ^Eina_File;
PEina_Iterator  = ^Eina_Iterator;
PEina_List  = ^Eina_List;
PFILE  = ^FILE;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
   @brief Eet Data Handling Library Public API Calls.

   These routines are used for Eet Library interaction.

   @page eet_main Eet

   @date 2000 (created)

   @section eet_toc Table of Contents

   @li @ref eet_main_intro
   @li @ref eet_main_compiling
   @li @ref eet_main_next_steps
   @li @ref eet_main_intro_example

   @section eet_main_intro Introduction

   It is a tiny library designed to write an arbitrary set of chunks of data
   to a file and optionally compress each chunk (very much like a zip file)
   and allow fast random-access reading of the file later on. It does not
   do zip as a zip itself has more complexity than is needed, and it was much
   simpler to implement this once here.

   Eet is extremely fast, small and simple. Eet files can be very small and
   highly compressed, making them very optimal for just sending across the
   internet without having to archive, compress or decompress and install them.
   They allow for lightning-fast random-access reads once created, making them
   perfect for storing data that is written once (or rarely) and read many
   times, but the program does not want to have to read it all in at once.

   It also can encode and decode data structures in memory, as well as image
   data for saving to Eet files or sending across the network to other
   machines, or just writing to arbitrary files on the system. All data is
   encoded in a platform independent way and can be written and read by any
   architecture.

   @section eet_main_compiling How to compile

   Eet is a library your application links to. The procedure for this is very
   simple. You simply have to compile your application with the appropriate
   compiler flags that the @p pkg-config script outputs. For example:

   Compiling C or C++ files into object files:

   @verbatim
   gcc -c -o main.o main.c `pkg-config --cflags eet`
   @endverbatim

   Linking object files into a binary executable:

   @verbatim
   gcc -o my_application main.o `pkg-config --libs eet`
   @endverbatim

   See @ref pkgconfig

   @section eet_main_next_steps Next Steps

   After you understood what Eet is and installed it in your system
   you should proceed understanding the programming interface. We'd
   recommend you to take a while to learn @ref Eina as it is very
   convenient and optimized, and Eet provides integration with it.

   Recommended reading:

   @li @ref Eet_File_Group to know the basics to open and save files.
   @li @ref Eet_Data_Group to know the convenient way to serialize and
    parse your data structures automatically. Just create your
    descriptors and let Eet do the work for you.

   @section eet_main_intro_example Introductory Examples

   Here is a simple example on how to use Eet to save a series of strings to a
   file and load them again. The advantage of using Eet over just
   fprintf() and
   fscanf() is that not only can these entries be strings, they need no special
   parsing to handle delimiter characters or escaping, they can be binary data,
   image data, data structures containing integers, strings, other data
   structures, linked lists and much more, without the programmer having to
   worry about parsing, and best of all, Eet is very fast.

   This is just a very simple example that doesn't show all of the capabilities
   of Eet, but it serves to illustrate its simplicity.

   @include eet-basic.c

   More examples can be found at @ref eet_examples.

   @todo Document data format for images and data structures.

  }
{$ifndef _EET_H}
{$define _EET_H}
{$include <stdlib.h>}
{$include <stdio.h>}
{$include <Efl_Config.h>}
{$include <Eina.h>}
{$include <Emile.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{ C++ extern C conditionnal removed }
{ ifdef __cplusplus  }
{*
 * @file Eet.h
 * @brief The file that provides the eet functions.
 *
 * This header provides the Eet management functions.
 *
  }
{*
 * @def EET_VERSION_MAJOR
 * The major number of eet version.
  }

const
  EET_VERSION_MAJOR = EFL_VERSION_MAJOR;  
{*
 * @def EET_VERSION_MINOR
 * The minor number of eet version.
  }
  EET_VERSION_MINOR = EFL_VERSION_MINOR;  
{*
 * @typedef Eet_Version
 *
 * This is the Eet version information structure that can be used at
 * runtime to detect which version of eet is being used and adapt
 * appropriately as follows for example:
 *
 * @code
 * #if defined(EET_VERSION_MAJOR) && (EET_VERSION_MAJOR >= 1) && defined(EET_VERSION_MINOR) && (EET_VERSION_MINOR > 2)
 * printf("Eet version: %i.%i.%i\n",
 *        eet_version->major,
 *        eet_version->minor,
 *        eet_version->micro);
 * if (eet_version->revision > 0)
 *   
 *     printf("  Built from SVN revision # %i\n", eet_version->revision);
 *   
 * #endif
 * @endcode
 *
 * Note the \#if check can be dropped if your program refuses to compile or
 * work with an Eet version less than 1.3.0.
  }
{* < major (binary or source incompatible changes)  }
{* < minor (new features, bugfixes, major improvements version)  }
{* < micro (bugfix, internal improvements, no new features version)  }
{* < svn revision (0 if a proper release or the svn revision number Eet is built from)  }
type
  PEet_Version = ^TEet_Version;
  TEet_Version = record
      major : longint;
      minor : longint;
      micro : longint;
      revision : longint;
    end;
{*
 * @defgroup Eet_Group Top level functions
 * @ingroup Eet
 * Functions that affect Eet as a whole.
 *
 * @
  }
{*
 * Eet Version Information
  }
  var
    eet_version : PEet_Version;cvar;external;
{*
 * @enum _Eet_Error
 * All the error identifiers known by Eet.
  }
{*< No error, it's all fine!  }
{*< Given object or handle is NULL or invalid  }
{*< There was nothing to do  }
{*< Could not write to file or file is #EET_FILE_MODE_READ  }
{*< Could not allocate memory  }
{*< Failed to write data to destination  }
{*< Failed to write file since it is too big  }
{*< Failed to write due a generic Input/Output error  }
{*< Failed to write due out of space  }
{*< Failed to write because file was closed  }
{*< Could not mmap file  }
{*< Could not encode using X509  }
{*< Could not validate signature  }
{*< Signature is invalid  }
{*< File or contents are not signed  }
{*< Function is not implemented  }
{*< Could not introduce random seed  }
{*< Could not encrypt contents  }
{*< Could not decrypt contents  }
type
  PEet_Error = ^TEet_Error;
  TEet_Error =  Longint;
  Const
    EET_ERROR_NONE = 0;
    EET_ERROR_BAD_OBJECT = 1;
    EET_ERROR_EMPTY = 2;
    EET_ERROR_NOT_WRITABLE = 3;
    EET_ERROR_OUT_OF_MEMORY = 4;
    EET_ERROR_WRITE_ERROR = 5;
    EET_ERROR_WRITE_ERROR_FILE_TOO_BIG = 6;
    EET_ERROR_WRITE_ERROR_IO_ERROR = 7;
    EET_ERROR_WRITE_ERROR_OUT_OF_SPACE = 8;
    EET_ERROR_WRITE_ERROR_FILE_CLOSED = 9;
    EET_ERROR_MMAP_FAILED = 10;
    EET_ERROR_X509_ENCODING_FAILED = 11;
    EET_ERROR_SIGNATURE_FAILED = 12;
    EET_ERROR_INVALID_SIGNATURE = 13;
    EET_ERROR_NOT_SIGNED = 14;
    EET_ERROR_NOT_IMPLEMENTED = 15;
    EET_ERROR_PRNG_NOT_SEEDED = 16;
    EET_ERROR_ENCRYPT_FAILED = 17;
    EET_ERROR_DECRYPT_FAILED = 18;
;
{*< Eet error identifiers  }
{*
 * @
  }
{*
 * @defgroup Eet_Compression Eet Compression Levels
 * @ingroup Eet
 * Compression modes/levels supported by Eet.
 *
 * @
  }
{*
 * @enum _Eet_Compression
 * All the compression modes known by Eet.
  }
{*< No compression at all @since 1.7  }
{*< Default compression (Zlib) @since 1.7  }
{*< Fast but minimal compression (Zlib) @since 1.7  }
{*< Medium compression level (Zlib) @since 1.7  }
{*< Slow but high compression level (Zlib) @since 1.7  }
{*< Very fast, but lower compression ratio (LZ4HC) @since 1.7  }
{*< Very fast, but lower compression ratio (faster to compress than EET_COMPRESSION_VERYFAST)  (LZ4) @since 1.7  }
{*< Space filler for compatibility. Don't use it @since 1.7  }
{*< Space filler for compatibility. Don't use it @since 1.7  }
{*< Space filler for compatibility. Don't use it @since 1.7  }
{*< Space filler for compatibility. Don't use it @since 1.7  }
{*< Space filler for compatibility. Don't use it @since 1.7  }
type
  PEet_Compression = ^TEet_Compression;
  TEet_Compression =  Longint;
  Const
    EET_COMPRESSION_NONE = 0;
    EET_COMPRESSION_DEFAULT = 1;
    EET_COMPRESSION_LOW = 2;
    EET_COMPRESSION_MED = 6;
    EET_COMPRESSION_HI = 9;
    EET_COMPRESSION_VERYFAST = 10;
    EET_COMPRESSION_SUPERFAST = 11;
    EET_COMPRESSION_LOW2 = 3;
    EET_COMPRESSION_MED1 = 4;
    EET_COMPRESSION_MED2 = 5;
    EET_COMPRESSION_HI1 = 7;
    EET_COMPRESSION_HI2 = 8;
;
{*< Eet compression modes @since 1.7  }
{*
 * @
  }
{*
 * @ingroup Eet_Group
 * @brief Initializes the EET library.
 *
 * The first time this function is called, it will perform all the internal
 * initialization required for the library to function properly and increment
 * the initialization counter. Any subsequent call only increment this counter
 * and return its new value, so it's safe to call this function more than once.
 *
 * @return The new init count. Will be @c 0 if initialization failed.
 *
 * @since 1.0.0
  }

function eet_init:longint;cdecl;external;
{*
 * @ingroup Eet_Group
 * @brief Shuts down the EET library.
 *
 * If eet_init() was called more than once for the running application,
 * eet_shutdown() will decrement the initialization counter and return its
 * new value, without doing anything else. When the counter reaches 0, all
 * of the internal elements will be shutdown and any memory used freed.
 *
 * @return The new init count.
 *
 * @since 1.0.0
  }
function eet_shutdown:longint;cdecl;external;
{*
 * @ingroup Eet_Group
 * @brief Clears eet cache.
 *
 * For a faster access to previously accessed data, Eet keeps an internal
 * cache of files. These files will be freed automatically only when
 * they are unused and the cache gets full, in order based on the last time
 * they were used.
 * On systems with little memory this may present an unnecessary constraint,
 * so eet_clearcache() is available for users to reclaim the memory used by
 * files that are no longer needed. Those that were open using
 * ::EET_FILE_MODE_WRITE or ::EET_FILE_MODE_READ_WRITE and have modifications,
 * will be written down to disk before flushing them from memory.
 *
 * @since 1.0.0
  }
procedure eet_clearcache;cdecl;external;
{*
 * @defgroup Eet_File_Group Eet File Main Functions
 * @ingroup Eet
 *
 * Functions to create, destroy and do basic manipulation of
 * #Eet_File handles.
 *
 * This section explains how to use the most basic Eet functions, which
 * are used to work with eet files, read data from them, store it back in or
 * take a look at what entries it contains, without making use of the
 * serialization capabilities explained in @ref Eet_Data_Group.
 *
 * The following example will serve as an introduction to most, if not all,
 * of these functions.
 *
 * If you are only using Eet, this is the only header you need to include.
 * @dontinclude eet-file.c
 * @skipline Eet.h
 *
 * Now let's create ourselves an eet file to play with. The following function
 * shows step by step how to open a file and write some data in it.
 * First, we define our file handler and some other things we'll put in it.
 * @line static int
 * @skip Eet_File
 * @until ";
 * @skip eet_open
 *
 * We open a new file in write mode, and if it fails, we just return, since
 * there's not much more we can do about it..
 * @until return
 *
 * Now, we need to write some data in our file. For now, strings will suffice,
 * so let's just dump a bunch of them in there.
 * @until 
 *
 * As you can see, we copied a string into our static buffer, which is a bit
 * bigger than the full length of the string, and then told Eet to write it
 * into the file, compressed, returning the size of the data written into the
 * file.
 * This is all to show that Eet treats data as just data. It doesn't matter
 * what that data represents (for now), it's all just bytes for it. As running
 * the following code will show, we took a string of around 30 bytes and put it
 * in a buffer of 1024 bytes, but the returned size won't be any of those.
 * @until printf
 *
 * Next, we copy into our buffer our set of strings, including their null
 * terminators and write them into the file. No error checking for the sake
 * of brevity. And a call to eet_sync() to make sure all out data is
 * properly written down to disk, even though we haven't yet closed the file.
 * @until eet_sync
 *
 * One more write, this time our large array of binary data and... well, I
 * couldn't come up with a valid use of the last set of strings we stored,
 * so let's take it out from the file with eet_delete().
 * @until eet_delete
 *
 * Finally, we close the file, saving any changes back to disk and return.
 * Notice how, if there's any error closing the file or saving its contents,
 * the return value from the function will be a false one, which later on
 * will make the program exit with an error code.
 * @until return
 *
 * Moving onto our main function, we will open the same file and read it back.
 * Trivial, but it'll show how we can do so in more than one way. We'll skip
 * the variable declarations, as they aren't very different from what we've
 * seen already.
 *
 * We start from the beginning by initializing Eet so things in general work.
 * Forgetting to do so will result in weird results or crashes when calling
 * any eet function, so if you experience something like that, the first thing
 * to look at is whether eet_init() is missing.
 * Then we call our @p create_eet_file function, described above, to make
 * sure we have something to work with. If the function fails it will return
 * 0 and we just exit, since nothing from here onwards will work anyway.
 * @skip eet_init
 * @until return
 *
 * Let's take a look now at what entries our file has. For this, we use
 * eet_list(), which will return a list of strings, each being the name of
 * one entry. Since we skipped before, it may be worth noting that @p list
 * is declared as a @p char **.
 * The @p num parameter will, of course, have the number of entries contained
 * in our file.
 * If everything's fine, we'll get our list and print it to the screen, and
 * once done with it, we free the list. That's just the list, not its contents,
 * as they are internal strings used by Eet and trying to free them will surely
 * break things.
 * @until 
 *
 * Reading back plain data is simple. Just a call to eet_read() with the file
 * to read from, and the name of the entry we are interested in. We get back
 * our data and the passed @p size parameter will contain the size of it. If
 * the data was stored compressed, it will decompressed first.
 * @until 
 *
 * Another simple read for the set of strings from before, except those were
 * deleted, so we should get a NULL return and continue normally.
 * @until 
 *
 * Finally, we'll get our binary data in the same way we got the strings. Once
 * again, it makes no difference for Eet what the data is, it's up to us to
 * know how to handle it.
 * @until 
 *
 * Now some cheating, we know that this data is an Eet file because, well...
 * we just know it. So we are going to open it and take a look at its insides.
 * For this, eet_open() won't work, as it needs to have a file on disk to read
 * from and all we have is some data in RAM.
 *
 * So how do we do? One way would be to create a normal file and write down
 * our data, then open it with eet_open(). Another, faster and more efficient
 * if all we want to do is read the file, is to use eet_memopen_read().
 * @until memopen
 *
 * As you can see, the size we got from our previous read was put to good use
 * this time. Unlike the first one where all we had were strings, the size
 * of the data read only serves to demonstrate that we are reading back the
 * entire size of our original @p buf variable.
 *
 * A little peeking to see how many entries the file has and to make an
 * example of eet_num_entries() to get that number when we don't care about
 * their names.
 * @until printf
 *
 * More cheating follows. Just like we knew this was an Eet file, we also know
 * what key to read from, and on top of that we know that the data in it is not
 * compressed.
 * Knowing all this allows us to take some shortcuts.
 * @until read_direct
 *
 * That's a direct print of our data, whatever that data is. We don't want
 * to worry about having to free it later, so we just used eet_direct_read()
 * to tell Eet to gives a pointer to the internal data in the file, without
 * duplicating it. Since we said that data was not compressed, we shouldn't
 * worry about printing garbage to the screen (and yes, we also know the data
 * is yet another string).
 * We also don't care about the size of the data as it was stored in the file,
 * so we passed NULL as the size parameter.
 * One very important note about this, however, is that we don't care about
 * the size parameter because the data in the file contains the null
 * terminator for the string. So when using Eet to store strings this way,
 * it's very important to consider whether you will keep that final null
 * byte, or to always get the size read and do the necessary checks and copies.
 * It's up to the user and the particular use cases to decide how this will
 * be done.
 *
 * With everything done, close this second file and free the data used to open
 * it. And this is important, we can't free that data until we are done with
 * the file, as Eet is using it. When opening with eet_memopen_read(), the data
 * passed to it must be available for as long as the the file is open.
 * @until 
 *
 * Finally, we close the first file, shutdown all internal resources used by
 * Eet and leave our main function, thus terminating our program.
 * @until return
 *
 * You can look at the full code of the example @ref eet-file.c "here".
 * @
  }
{*
 * @enum _Eet_File_Mode
 * Modes that a file can be opened.
  }
{*< File is read-only.  }
{*< File is write-only.  }
{*< File is for both read and write  }
type
  PEet_File_Mode = ^TEet_File_Mode;
  TEet_File_Mode =  Longint;
  Const
    EET_FILE_MODE_INVALID = -(1);
    EET_FILE_MODE_READ = (-(1))+1;
    EET_FILE_MODE_WRITE = (-(1))+2;
    EET_FILE_MODE_READ_WRITE = (-(1))+3;
;
{*< Modes that a file can be opened.  }
{*
 * @typedef Eet_Image_Encoding
 * Specify lossy encoding for image
 * @since 1.10
  }
type
  PEet_Image_Encoding = ^TEet_Image_Encoding;
  TEet_Image_Encoding = TEmile_Image_Encoding;

const
  EET_IMAGE_LOSSLESS = EMILE_IMAGE_LOSSLESS;  
  EET_IMAGE_JPEG = EMILE_IMAGE_JPEG;  
  EET_IMAGE_ETC1 = EMILE_IMAGE_ETC1;  
  EET_IMAGE_ETC2_RGB = EMILE_IMAGE_ETC2_RGB;  
  EET_IMAGE_ETC2_RGBA = EMILE_IMAGE_ETC2_RGBA;  
  EET_IMAGE_ETC1_ALPHA = EMILE_IMAGE_ETC1_ALPHA;  
{*
 * @typedef Eet_Colorspace
 * Specify colorspace for image
 * @since 1.10
  }
type
  PEet_Colorspace = ^TEet_Colorspace;
  TEet_Colorspace = TEmile_Colorspace;

const
  EET_COLORSPACE_ARGB8888 = EMILE_COLORSPACE_ARGB8888;  
  EET_COLORSPACE_GRY8 = EMILE_COLORSPACE_GRY8;  
  EET_COLORSPACE_AGRY88 = EMILE_COLORSPACE_AGRY88;  
  EET_COLORSPACE_ETC1 = EMILE_COLORSPACE_ETC1;  
  EET_COLORSPACE_RGB8_ETC2 = EMILE_COLORSPACE_RGB8_ETC2;  
  EET_COLORSPACE_RGBA8_ETC2_EAC = EMILE_COLORSPACE_RGBA8_ETC2_EAC;  
  EET_COLORSPACE_ETC1_ALPHA = EMILE_COLORSPACE_ETC1_ALPHA;  
{*
 * @typedef Eet_File
 * Opaque handle that defines an Eet file (or memory).
 *
 * This handle will be returned by the functions eet_open() and
 * eet_memopen_read() and is used by every other function that affects the
 * file in any way. When you are done with it, call eet_close() to close it
 * and, if the file was open for writing, write down to disk any changes made
 * to it.
 *
 * @see eet_open()
 * @see eet_memopen_read()
 * @see eet_close()
  }
type
{*
 * @typedef Eet_Dictionary
 * Opaque handle that defines a file-backed (mmaped) dictionary of strings.
  }
{*
 * @typedef Eet_Entry
 * Eet files may contains multiple Entries per file, this handle describe them. You can get that handle from an iterator given by eet_list_entries().
 *
 * @see eet_list_entries()
 * @since 1.8.0
  }
(* Const before type ignored *)
{*< The entry name  }
{*< Where it start in the file   }
{*< The size on disk  }
{*< The decompressed size if relevant  }
{*< Is this data compressed ?  }
{*< Is it ciphered ?  }
{*< Is it an alias ?  }
  PEet_Entry = ^TEet_Entry;
  TEet_Entry = record
      name : Pchar;
      offset : longint;
      size : longint;
      data_size : longint;
      compression : TEina_Bool;
      ciphered : TEina_Bool;
      alias : TEina_Bool;
    end;

{*
 * @
  }
{*
 * @ingroup Eet_File_Group
 * @brief Opens an eet file on disk, and returns a handle to it.
 * @param file The file path to the eet file. eg: @c "/tmp/file.eet".
 * @param mode The mode for opening. Either #EET_FILE_MODE_READ,
 *        #EET_FILE_MODE_WRITE or #EET_FILE_MODE_READ_WRITE.
 * @return An opened eet file handle.
 *
 * This function will open an exiting eet file for reading, and build
 * the directory table in memory and return a handle to the file, if it
 * exists and can be read, and no memory errors occur on the way, otherwise
 * NULL will be returned.
 *
 * It will also open an eet file for writing. This will, if successful,
 * delete the original file and replace it with a new empty file, till
 * the eet file handle is closed or flushed. If it cannot be opened for
 * writing or a memory error occurs, NULL is returned.
 *
 * You can also open the file for read/write. If you then write a key that
 * does not exist it will be created, if the key exists it will be replaced
 * by the new data.
 *
 * If the same file is opened multiple times, then the same file handle will
 * be returned as eet maintains an internal list of all currently open
 * files. Note that it considers files opened for read only and those opened
 * for read/write and write only as 2 separate sets. Those that do not write
 * to the file and those that do. Eet will allow 2 handles to the same file
 * if they are in the 2 separate lists/groups. That means opening a file for
 * read only looks in the read only set, and returns a handle to that file
 * handle and increments its reference count. If you open a file for read/write
 * or write only it looks in the write set and returns a handle after
 * incrementing the reference count. You need to close an eet file handle
 * as many times as it has been opened to maintain correct reference counts.
 * Files whose modified timestamp or size do not match those of the existing
 * referenced file handles will not be returned and a new handle will be
 * returned instead.
 *
 * @since 1.0.0
  }
(* Const before type ignored *)

function eet_open(file:Pchar; mode:TEet_File_Mode):PEet_File;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Opens an eet file on disk from an Eina_File handle, and returns a handle to it.
 * @param file The Eina_File handle to map to an eet file.
 * @return An opened eet file handle.
 *
 * This function will open an exiting eet file for reading, and build
 * the directory table in memory and return a handle to the file, if it
 * exists and can be read, and no memory errors occur on the way, otherwise
 * NULL will be returned.
 *
 * This function can't open file for writing only read only mode is supported for now.
 *
 * If the same file is opened multiple times, then the same file handle will
 * be returned as eet maintains an internal list of all currently open
 * files. That means opening a file for read only looks in the read only set,
 * and returns a handle to that file handle and increments its reference count.
 * You need to close an eet file handle as many times as it has been opened to
 * maintain correct reference counts.
 *
 * @since 1.8.0
  }
(* Const before type ignored *)
function eet_mmap(file:PEina_File):PEet_File;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * Opens an eet file directly from a memory location. The data is not copied,
 * so you must keep it around as long as the eet file is open. There is
 * currently no cache for this kind of Eet_File, so it's reopened every time
 * you use eet_memopen_read.
 * @param data Address of file in memory.
 * @param size Size of memory to be read.
 * @return A handle to the file.
 *
 * Files opened this way will always be in read-only mode.
 *
 * @since 1.1.0
  }
(* Const before type ignored *)
function eet_memopen_read(data:pointer; size:Tsize_t):PEet_File;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Gets the mode an Eet_File was opened with.
 * @param ef A valid eet file handle.
 * @return The mode ef was opened with.
 *
 * @since 1.0.0
  }
function eet_mode_get(ef:PEet_File):TEet_File_Mode;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Closes an eet file handle and flush pending writes.
 * @param ef A valid eet file handle.
 * @return An eet error identifier.
 *
 * This function will flush any pending writes to disk if the eet file
 * was opened for write, and free all data associated with the file handle
 * and file, and close the file. If it was opened for read (or read/write),
 * the file handle may still be held open internally for caching purposes.
 * To flush speculatively held eet file handles use eet_clearcache().
 *
 * If the eet file handle is not valid nothing will be done.
 *
 * @since 1.0.0
 *
 * @see eet_clearcache()
  }
function eet_close(ef:PEet_File):TEet_Error;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Syncs content of an eet file handle, flushing pending writes.
 * @param ef A valid eet file handle.
 * @return An eet error identifier.
 *
 * This function will flush any pending writes to disk. The eet file must
 * be opened for write.
 *
 * If the eet file handle is not valid nothing will be done.
 *
 * @since 1.2.4
  }
function eet_sync(ef:PEet_File):TEet_Error;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief does exactly what eet_xunc() does but also fsyncs file data
 * @param ef A valid eet file handle.
 * @return An eet error identifier.
 *
 * This function does everything eet_xunc() does with one addition - it
 * ensures data is written to/synced to disk (as best is possible) by
 * calling fdatasync() on the file before writes are all queued/done.
 *
 * If the eet file handle is not valid nothing will be done.
 *
 * @since 1.27
  }
function eet_sync_sync(ef:PEet_File):TEet_Error;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Returns a handle to the shared string dictionary of the Eet file
 * @param ef A valid eet file handle.
 * @return A handle to the dictionary of the file
 *
 * This function returns a handle to the dictionary of an Eet file whose
 * handle is @p ef, if a dictionary exists. NULL is returned otherwise or
 * if the file handle is known to be invalid.
 *
 * @see eet_dictionary_string_check() to know if given string came
 *      from the dictionary or it was dynamically allocated using
 *      the #Eet_Data_Descriptor_Class instructions.
 *
 * @since 1.0.0
  }
function eet_dictionary_get(ef:PEet_File):PEet_Dictionary;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Checks if a given string comes from a given dictionary
 * @param ed A valid dictionary handle
 * @param string A valid 0 byte terminated C string
 * @return @c 1 if it is in the dictionary, @c 0 otherwise
 *
 * This checks the given dictionary to see if the given string is actually
 * inside that dictionary (i.e. comes from it) and returns @c 1 if it does.
 * If the dictionary handle is invalid, the string is NULL or the string is
 * not in the dictionary, @c 0 is returned.
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_dictionary_string_check(ed:PEet_Dictionary; _string:Pchar):longint;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Returns the number of strings inside a dictionary.
 * @param ed A valid dictionary handle
 * @return the number of strings inside a dictionary
 *
 * @since 1.6.0
  }
(* Const before type ignored *)
function eet_dictionary_count(ed:PEet_Dictionary):longint;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Reads a specified entry from an eet file and return data.
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param size_ret Number of bytes read from entry and returned.
 * @return The data stored in that entry in the eet file.
 *
 * This function finds an entry in the eet file that is stored under the
 * name specified, and returns that data, decompressed, if successful.
 * NULL is returned if the lookup fails or if memory errors are
 * encountered. It is the job of the calling program to call free() on
 * the returned data. The number of bytes in the returned data chunk are
 * placed in size_ret.
 *
 * If the eet file handle is not valid NULL is returned and size_ret is
 * filled with @c 0.
 *
 * @see eet_read_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_read(ef:PEet_File; name:Pchar; size_ret:Plongint):pointer;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Reads a specified entry from an eet file and return data.
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param size_ret Number of bytes read from entry and returned.
 * @return The data stored in that entry in the eet file.
 *
 * This function finds an entry in the eet file that is stored under the
 * name specified, and returns that data if not compressed and successful.
 * NULL is returned if the lookup fails or if memory errors are
 * encountered or if the data is compressed. The calling program must never
 * call free() on the returned data. The number of bytes in the returned
 * data chunk are placed in size_ret.
 *
 * If the eet file handle is not valid NULL is returned and size_ret is
 * filled with @c 0.
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_read_direct(ef:PEet_File; name:Pchar; size_ret:Plongint):pointer;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Write a specified entry to an eet file handle.
 * @param ef A valid eet file handle opened for writing.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param data Pointer to the data to be stored.
 * @param size Length in bytes in the data to be stored.
 * @param compress Compression flags (1 == compress, 0 = don't compress).
 * @return bytes written on successful write, 0 on failure.
 *
 * This function will write the specified chunk of data to the eet file
 * and return greater than 0 on success. 0 will be returned on failure.
 *
 * The eet file handle must be a valid file handle for an eet file opened
 * for writing. If it is not, 0 will be returned and no action will be
 * performed.
 *
 * Name, and data must not be NULL, and size must be > 0. If these
 * conditions are not met, 0 will be returned.
 *
 * The data will be copied (and optionally compressed) in ram, pending
 * a flush to disk (it will stay in ram till the eet file handle is
 * closed though).
 *
 * @see eet_write_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_write(ef:PEet_File; name:Pchar; data:pointer; size:longint; compress:longint):longint;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Deletes a specified entry from an Eet file being written or re-written.
 * @param ef A valid eet file handle opened for writing.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @return Success or failure of the delete.
 *
 * This function will delete the specified chunk of data from the eet file
 * and return greater than 0 on success. 0 will be returned on failure.
 *
 * The eet file handle must be a valid file handle for an eet file opened
 * for writing. If it is not, 0 will be returned and no action will be
 * performed.
 *
 * Name, must not be NULL, otherwise 0 will be returned.
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_delete(ef:PEet_File; name:Pchar):longint;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Alias a specific section to another one. Destination may exist or not,
 * no checks are done.
 * @param ef A valid eet file handle opened for writing.
 * @param name Name of the new entry. eg: "/base/file_i_want".
 * @param destination Actual source of the aliased entry eg: "/base/the_real_stuff_i_want".
 * @param compress Compression flags (1 == compress, 0 = don't compress).
 * @return EINA_TRUE on success, EINA_FALSE on failure.
 *
 * Name and Destination must not be NULL, otherwise EINA_FALSE will be returned.
 * The equivalent of this would be calling 'ln -s destination name'
 *
 * @since 1.3.3
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_alias(ef:PEet_File; name:Pchar; destination:Pchar; compress:longint):TEina_Bool;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Retrieves the filename of an Eet_File.
 * @param ef A valid eet file handle opened for writing.
 * @return The stringshared file string opened with eet_open(), or NULL on error
 *
 * @note This function will return NULL for files opened with eet_memopen_read()
 *
 * @since 1.6
  }
(* Const before type ignored *)
function eet_file_get(ef:PEet_File):Pchar;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Retrieves the destination name of an alias.
 * @param ef A valid eet file handle opened for writing
 * @param name Name of the entry. eg: "/base/file_i_want"
 * @return Destination of the alias. eg: "/base/the_real_stuff_i_want", NULL on failure
 *
 * Name must not be NULL, otherwise NULL will be returned.
 *
 * @since 1.5
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_alias_get(ef:PEet_File; name:Pchar):Pchar;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Lists all entries in eet file matching shell glob.
 * @param ef A valid eet file handle.
 * @param glob A shell glob to match against.
 * @param count_ret Number of entries found to match.
 * @return Pointer to an array of strings.
 *
 * This function will list all entries in the eet file matching the
 * supplied shell glob and return an allocated list of their names, if
 * there are any, and if no memory errors occur.
 *
 * The eet file handle must be valid and glob must not be NULL, or NULL
 * will be returned and count_ret will be filled with @c 0.
 *
 * The calling program must call free() on the array returned, but NOT
 * on the string pointers in the array. They are taken as read-only
 * internals from the eet file handle. They are only valid as long as
 * the file handle is not closed. When it is closed those pointers in the
 * array are now not valid and should not be used.
 *
 * On success, the array returned will have a list of string pointers
 * that are the names of the entries that matched, and count_ret will have
 * the number of entries in this array placed in it.
 *
 * Hint: an easy way to list all entries in an eet file is to use a glob
 * value of "*".
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_list(ef:PEet_File; glob:Pchar; count_ret:Plongint):^Pchar;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Returns an iterator that will describe each entry of an Eet_File.
 * @param ef A valid eet file handle.
 * @return An iterator of Eet_Entry.
 *
 * @since 1.8.0
  }
function eet_list_entries(ef:PEet_File):PEina_Iterator;cdecl;external;
{*
 * @ingroup Eet_File_Group
 * @brief Returns the number of entries in the specified eet file.
 * @param ef A valid eet file handle.
 * @return Number of entries in ef or @c -1 if the number of entries
 *         cannot be read due to open mode restrictions.
 *
 * @since 1.0.0
  }
function eet_num_entries(ef:PEet_File):longint;cdecl;external;
{*
 * @defgroup Eet_File_Cipher_Group Eet File Ciphered Main Functions
 * @ingroup Eet_File_Group
 *
 * Most of the @ref Eet_File_Group have alternative versions that
 * accounts for ciphers to protect their content.
 *
 * @see @ref Eet_Cipher_Group
 *
  }
{*
 * @ingroup Eet_File_Cipher_Group
 * @brief Reads a specified entry from an eet file and return data using a cipher.
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param size_ret Number of bytes read from entry and returned.
 * @param cipher_key The key to use as cipher.
 * @return The data stored in that entry in the eet file.
 *
 * This function finds an entry in the eet file that is stored under the
 * name specified, and returns that data, decompressed, if successful.
 * NULL is returned if the lookup fails or if memory errors are
 * encountered. It is the job of the calling program to call free() on
 * the returned data. The number of bytes in the returned data chunk are
 * placed in size_ret.
 *
 * If the eet file handle is not valid NULL is returned and size_ret is
 * filled with @c 0.
 *
 * @see eet_read()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_read_cipher(ef:PEet_File; name:Pchar; size_ret:Plongint; cipher_key:Pchar):pointer;cdecl;external;
{*
 * @ingroup Eet_File_Cipher_Group
 * @brief Writes a specified entry to an eet file handle using a cipher.
 * @param ef A valid eet file handle opened for writing.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param data Pointer to the data to be stored.
 * @param size Length in bytes in the data to be stored.
 * @param compress Compression flags (1 == compress, 0 = don't compress).
 * @param cipher_key The key to use as cipher.
 * @return Bytes written on successful write, @c 0 on failure.
 *
 * This function will write the specified chunk of data to the eet file
 * and return greater than @c 0 on success. 0 will be returned on failure.
 *
 * The eet file handle must be a valid file handle for an eet file opened
 * for writing. If it is not, @c 0 will be returned and no action will be
 * performed.
 *
 * Name, and data must not be NULL, and size must be > 0. If these
 * conditions are not met, 0 will be returned.
 *
 * The data will be copied (and optionally compressed) in ram, pending
 * a flush to disk (it will stay in ram till the eet file handle is
 * closed though).
 *
 * @see eet_write()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eet_write_cipher(ef:PEet_File; name:Pchar; data:pointer; size:longint; compress:longint; 
           cipher_key:Pchar):longint;cdecl;external;
{*
 * @defgroup Eet_File_Image_Group Image Store and Load
 * @ingroup Eet
 *
 * Eet efficiently stores and loads images, including alpha
 * channels and lossy compressions.
 *
 * Eet can handle both lossy compression with different levels of quality and
 * non-lossy compression with different compression levels. It's also possible,
 * given an image data, to only read its header to get the image information
 * without decoding the entire content for it.
 *
 * The encode family of functions will take an image raw buffer and its
 * parameters and compress it in memory, returning the new buffer.
 * Likewise, the decode functions will read from the given location in memory
 * and return the uncompressed image.
 *
 * The read and write functions will, respectively, encode and decode to or
 * from an Eet file, under the specified key.
 *
 * These functions are fairly low level and the same functionality can be
 * achieved using Evas and Edje, making it much easier to work with images
 * as well as not needing to worry about things like scaling them.
  }
{*
 * @ingroup Eet_File_Image_Group
 * @brief Reads just the header data for an image and dont decode the pixels.
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param w A pointer to the unsigned int to hold the width in pixels.
 * @param h A pointer to the unsigned int to hold the height in pixels.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return @c 1 on successful decode, @c 0 otherwise
 *
 * Reads and decodes the image header data stored under the given key and
 * Eet file.
 *
 * The information decoded is placed in each of the parameters, which must be
 * provided. The width and height, measured in pixels, will be stored under
 * the variables pointed by @p w and @p h, respectively. If the read or
 * decode of the header fails, this values will be 0. The @p alpha parameter
 * will be 1 or 0, denoting if the alpha channel of the image is used or not.
 * If the image was losslessly compressed, the @p compress parameter will hold
 * the compression amount used, ranging from 0 to 9 and @p lossy will be 0.
 * In the case of lossy compression, @p lossy will be 1, and the compression
 * quality will be placed under @p quality, with a value ranging from 0 to 100.
 *
 * @see eet_data_image_header_decode()
 * @see eet_data_image_header_read_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_data_image_header_read(ef:PEet_File; name:Pchar; w:Pdword; h:Pdword; alpha:Plongint; 
           compress:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Group
 * @brief Reads image data from the named key in the eet file.
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param w A pointer to the unsigned int to hold the width in pixels.
 * @param h A pointer to the unsigned int to hold the height in pixels.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return The image pixel data decoded
 *
 * Reads and decodes the image stored in the given Eet file under the named
 * key.
 *
 * The returned pixel data is a linear array of pixels starting from the
 * top-left of the image, scanning row by row from left to right. Each pile
 * is a 32bit value, with the high byte being the alpha channel, the next being
 * red, then green, and the low byte being blue.
 *
 * The rest of the parameters are the same as in eet_data_image_header_read().
 *
 * On success the function returns a pointer to the image data decoded. The
 * calling application is responsible for calling free() on the image data
 * when it is done with it. On failure NULL is returned and the parameter
 * values may not contain any sensible data.
 *
 * @see eet_data_image_header_read()
 * @see eet_data_image_decode()
 * @see eet_data_image_read_cipher()
 * @see eet_data_image_read_to_surface()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_data_image_read(ef:PEet_File; name:Pchar; w:Pdword; h:Pdword; alpha:Plongint; 
           compress:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):pointer;cdecl;external;
{*
 * @ingroup Eet_File_Image_Group
 * @brief Reads image data from the named key in the eet file and store it in the given buffer.
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param src_x The starting x coordinate from where to dump the stream.
 * @param src_y The starting y coordinate from where to dump the stream.
 * @param d A pointer to the pixel surface.
 * @param w The expected width in pixels of the pixel surface to decode.
 * @param h The expected height in pixels of the pixel surface to decode.
 * @param row_stride The length of a pixels line in the destination surface.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return @c 1 on success, @c 0 otherwise.
 *
 * Reads and decodes the image stored in the given Eet file, placing the
 * resulting pixel data in the buffer pointed by the user.
 *
 * Like eet_data_image_read(), it takes the image data stored under the
 * @p name key in the @p ef file, but instead of returning a new buffer with
 * the pixel data, it places the result in the buffer pointed by @p d, which
 * must be provided by the user and of sufficient size to hold the requested
 * portion of the image.
 *
 * The @p src_x and @p src_y parameters indicate the top-left corner of the
 * section of the image to decode. These have to be higher or equal than 0 and
 * less than the respective total width and height of the image. The width
 * and height of the section of the image to decode are given in @p w and @p h
 * and also can't be higher than the total width and height of the image.
 *
 * The @p row_stride parameter indicates the length in bytes of each line in
 * the destination buffer and it has to be at least @p w * 4.
 *
 * All the other parameters are the same as in eet_data_image_read().
 *
 * On success the function returns 1, and 0 on failure. On failure the
 * parameter values may not contain any sensible data.
 *
 * @see eet_data_image_read()
 * @see eet_data_image_decode()
 * @see eet_data_image_decode_to_surface()
 * @see eet_data_image_read_to_surface_cipher()
 * @see eet_data_image_decode_to_cspace_surface_cipher()
 *
 * @since 1.0.2
  }
(* Const before type ignored *)
function eet_data_image_read_to_surface(ef:PEet_File; name:Pchar; src_x:dword; src_y:dword; d:Pdword; 
           w:dword; h:dword; row_stride:dword; alpha:Plongint; compress:Plongint; 
           quality:Plongint; lossy:PEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Group
 * @brief Writes image data to the named key in an eet file.
 * @param ef A valid eet file handle opened for writing.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param data A pointer to the image pixel data.
 * @param w The width of the image in pixels.
 * @param h The height of the image in pixels.
 * @param alpha The alpha channel flag.
 * @param compress The compression amount.
 * @param quality The quality encoding amount.
 * @param lossy The lossiness flag.
 * @return Success if the data was encoded and written or not.
 *
 * This function takes image pixel data and encodes it in an eet file
 * stored under the supplied name key, and returns how many bytes were
 * actually written to encode the image data.
 *
 * The data expected is the same format as returned by eet_data_image_read.
 * If this is not the case weird things may happen. Width and height must
 * be between 1 and 8000 pixels. The alpha flags can be 0 or 1 (0 meaning
 * the alpha values are not useful and 1 meaning they are). Compress can
 * be from 0 to 9 (0 meaning no compression, 9 meaning full compression).
 * This is only used if the image is not lossily encoded. Quality is used on
 * lossy compression and should be a value from 0 to 100. The lossy flag
 * can be 0 or 1. 0 means encode losslessly and 1 means to encode with
 * image quality loss (but then have a much smaller encoding).
 *
 * On success this function returns the number of bytes that were required
 * to encode the image data, or on failure it returns 0.
 *
 * @see eet_data_image_read()
 * @see eet_data_image_encode()
 * @see eet_data_image_write_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_write(ef:PEet_File; name:Pchar; data:pointer; w:dword; h:dword; 
           alpha:longint; compress:longint; quality:longint; lossy:TEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Group
 * @brief Decodes Image data header only to get information.
 * @param data The encoded pixel data.
 * @param size The size, in bytes, of the encoded pixel data.
 * @param w A pointer to the unsigned int to hold the width in pixels.
 * @param h A pointer to the unsigned int to hold the height in pixels.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return @c 1 on success, @c 0 on failure.
 *
 * This function works exactly like eet_data_image_header_read(), but instead
 * of reading from an Eet file, it takes the buffer of size @p size pointed
 * by @p data, which must be a valid Eet encoded image.
 *
 * On success the function returns @c 1 indicating the header was read and
 * decoded properly, or @c 0 on failure.
 *
 * @see eet_data_image_header_read()
 * @see eet_data_image_header_decode_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_data_image_header_decode(data:pointer; size:longint; w:Pdword; h:Pdword; alpha:Plongint; 
           compress:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Group
 * @brief Decodes Image data into pixel data.
 * @param data The encoded pixel data.
 * @param size The size, in bytes, of the encoded pixel data.
 * @param w A pointer to the unsigned int to hold the width in pixels.
 * @param h A pointer to the unsigned int to hold the height in pixels.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return The image pixel data decoded
 *
 * This function takes encoded pixel data and decodes it into raw RGBA
 * pixels on success.
 *
 * It works exactly like eet_data_image_read(), but it takes the encoded
 * data in the @p data buffer of size @p size, instead of reading from a file.
 * All the others parameters are also the same.
 *
 * On success the function returns a pointer to the image data decoded. The
 * calling application is responsible for calling free() on the image data
 * when it is done with it. On failure NULL is returned and the parameter
 * values may not contain any sensible data.
 *
 * @see eet_data_image_read()
 * @see eet_data_image_decode_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_data_image_decode(data:pointer; size:longint; w:Pdword; h:Pdword; alpha:Plongint; 
           compress:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):pointer;cdecl;external;
{*
 * @ingroup Eet_File_Image_Group
 * @brief Decodes Image data into pixel data and stores in the given buffer.
 * @param data The encoded pixel data.
 * @param size The size, in bytes, of the encoded pixel data.
 * @param src_x The starting x coordinate from where to dump the stream.
 * @param src_y The starting y coordinate from where to dump the stream.
 * @param d A pointer to the pixel surface.
 * @param w The expected width in pixels of the pixel surface to decode.
 * @param h The expected height in pixels of the pixel surface to decode.
 * @param row_stride The length of a pixels line in the destination surface.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return @c 1 on success, @c 0 otherwise.
 *
 * Like eet_data_image_read_to_surface(), but reading the given @p data buffer
 * instead of a file.
 *
 * On success the function returns 1, and 0 on failure. On failure the
 * parameter values may not contain any sensible data.
 *
 * @see eet_data_image_read_to_surface()
 * @see eet_data_image_decode_to_surface_cipher()
 *
 * @since 1.0.2
  }
(* Const before type ignored *)
function eet_data_image_decode_to_surface(data:pointer; size:longint; src_x:dword; src_y:dword; d:Pdword; 
           w:dword; h:dword; row_stride:dword; alpha:Plongint; compress:Plongint; 
           quality:Plongint; lossy:PEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Group
 * @brief Encodes image data for storage or transmission.
 * @param data A pointer to the image pixel data.
 * @param size_ret A pointer to an int to hold the size of the returned data.
 * @param w The width of the image in pixels.
 * @param h The height of the image in pixels.
 * @param alpha The alpha channel flag.
 * @param compress The compression amount.
 * @param quality The quality encoding amount.
 * @param lossy The lossiness flag.
 * @return The encoded image data.
 *
 * This function stakes image pixel data and encodes it with compression and
 * possible loss of quality (as a trade off for size) for storage or
 * transmission to another system.
 *
 * It works like eet_data_image_write(), but instead of writing the encoded
 * image into an Eet file, it allocates a new buffer of the size required and
 * returns the encoded data in it.
 *
 * On success this function returns a pointer to the encoded data that you
 * can free with free() when no longer needed.
 *
 * @see eet_data_image_write()
 * @see eet_data_image_read()
 * @see eet_data_image_encode_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_data_image_encode(data:pointer; size_ret:Plongint; w:dword; h:dword; alpha:longint; 
           compress:longint; quality:longint; lossy:TEet_Image_Encoding):pointer;cdecl;external;
{*
 * @defgroup Eet_File_Image_Cipher_Group Image Store and Load using a Cipher
 * @ingroup Eet_File_Image_Group
 *
 * Most of the @ref Eet_File_Image_Group have alternative versions
 * that accounts for ciphers to protect their content.
 *
 * @see @ref Eet_Cipher_Group
 *
  }
{*
 * @ingroup Eet_File_Image_Cipher_Group
 * @brief Reads just the header data for an image and dont decode the pixels using a cipher.
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param cipher_key The key to use as cipher.
 * @param w A pointer to the unsigned int to hold the width in pixels.
 * @param h A pointer to the unsigned int to hold the height in pixels.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return @c 1 on successful decode, @c 0 otherwise
 *
 * This function reads an image from an eet file stored under the named
 * key in the eet file and return a pointer to the decompressed pixel data.
 *
 * The other parameters of the image (width, height etc.) are placed into
 * the values pointed to (they must be supplied). The pixel data is a linear
 * array of pixels starting from the top-left of the image scanning row by
 * row from left to right. Each pixel is a 32bit value, with the high byte
 * being the alpha channel, the next being red, then green, and the low byte
 * being blue. The width and height are measured in pixels and will be
 * greater than 0 when returned. The alpha flag is either 0 or 1. 0 denotes
 * that the alpha channel is not used. 1 denotes that it is significant.
 * Compress is filled with the compression value/amount the image was
 * stored with. The quality value is filled with the quality encoding of
 * the image file (0 - 100). The lossy flags is either 0 or 1 as to if
 * the image was encoded lossily or not.
 *
 * On success the function returns @c 1 indicating the header was read and
 * decoded properly, or @c 0 on failure.
 *
 * @see eet_data_image_header_read()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_header_read_cipher(ef:PEet_File; name:Pchar; cipher_key:Pchar; w:Pdword; h:Pdword; 
           alpha:Plongint; compress:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Group
 * @brief Gets the colorspace Eet can decode into of a given eet image resource.
 *
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param cipher_key The key to use as cipher.
 * @param cspaces Returned pointer by Eet to a list of possible decoding colorspace finished by @c EET_COLORSPACE_ARGB8888. If @c NULL, only EET_COLORSPACE_ARGB8888 is supported.
 * @return 1 on successful get, 0 otherwise.
 *
 * @since 1.10.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_colorspace_get(ef:PEet_File; name:Pchar; cipher_key:Pchar; cspaces:PPEet_Colorspace):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Cipher_Group
 * @brief Reads image data from the named key in the eet file using a cipher.
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param cipher_key The key to use as cipher.
 * @param w A pointer to the unsigned int to hold the width in pixels.
 * @param h A pointer to the unsigned int to hold the height in pixels.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return The image pixel data decoded
 *
 * This function reads an image from an eet file stored under the named
 * key in the eet file and return a pointer to the decompressed pixel data.
 *
 * The other parameters of the image (width, height etc.) are placed into
 * the values pointed to (they must be supplied). The pixel data is a linear
 * array of pixels starting from the top-left of the image scanning row by
 * row from left to right. Each pixel is a 32bit value, with the high byte
 * being the alpha channel, the next being red, then green, and the low byte
 * being blue. The width and height are measured in pixels and will be
 * greater than 0 when returned. The alpha flag is either 0 or 1. 0 denotes
 * that the alpha channel is not used. 1 denotes that it is significant.
 * Compress is filled with the compression value/amount the image was
 * stored with. The quality value is filled with the quality encoding of
 * the image file (0 - 100). The lossy flags is either 0 or 1 as to if
 * the image was encoded lossily or not.
 *
 * On success the function returns a pointer to the image data decoded. The
 * calling application is responsible for calling free() on the image data
 * when it is done with it. On failure NULL is returned and the parameter
 * values may not contain any sensible data.
 *
 * @see eet_data_image_read()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_read_cipher(ef:PEet_File; name:Pchar; cipher_key:Pchar; w:Pdword; h:Pdword; 
           alpha:Plongint; compress:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):pointer;cdecl;external;
{*
 * @ingroup Eet_File_Image_Cipher_Group
 * @brief Reads image data from the named key in the eet file using a cipher.
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param cipher_key The key to use as cipher.
 * @param src_x The starting x coordinate from where to dump the stream.
 * @param src_y The starting y coordinate from where to dump the stream.
 * @param d A pointer to the pixel surface.
 * @param w The expected width in pixels of the pixel surface to decode.
 * @param h The expected height in pixels of the pixel surface to decode.
 * @param row_stride The length of a pixels line in the destination surface.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return @c 1 on success, @c 0 otherwise.
 *
 * This function reads an image from an eet file stored under the named
 * key in the eet file and store the decompressed pixel data in the provided
 * surface with an @c EET_COLORSPACE_ARGB8888 colorspace.
 *
 * The other parameters of the image (width, height etc.) are placed into
 * the values pointed to (they must be supplied). The pixel data is a linear
 * array of pixels starting from the top-left of the image scanning row by
 * row from left to right. Each pixel is a 32bit value, with the high byte
 * being the alpha channel, the next being red, then green, and the low byte
 * being blue. The width and height are measured in pixels and will be
 * greater than 0 when returned. The alpha flag is either 0 or 1. 0 denotes
 * that the alpha channel is not used. 1 denotes that it is significant.
 * Compress is filled with the compression value/amount the image was
 * stored with. The quality value is filled with the quality encoding of
 * the image file (0 - 100). The lossy flags is either 0 or 1 as to if
 * the image was encoded lossily or not.
 *
 * On success the function returns 1, and 0 on failure. On failure the
 * parameter values may not contain any sensible data.
 *
 * @see eet_data_image_read_to_surface()
 * @see eet_data_image_decode_to_cspace_surface_cipher()
 *
 * @since 1.0.2
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_read_to_surface_cipher(ef:PEet_File; name:Pchar; cipher_key:Pchar; src_x:dword; src_y:dword; 
           d:Pdword; w:dword; h:dword; row_stride:dword; alpha:Plongint; 
           compress:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Cipher_Group
 * @brief Reads image data from the named key in the eet file using a cipher.
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param cipher_key The key to use as cipher.
 * @param src_x The starting x coordinate from where to dump the stream.
 * @param src_y The starting y coordinate from where to dump the stream.
 * @param d A pointer to the pixel surface.
 * @param w The expected width in pixels of the pixel surface to decode.
 * @param h The expected height in pixels of the pixel surface to decode.
 * @param row_stride The length of a pixels line in the destination surface.
 * @param cspace The color space of the pixels surface.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param comp A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return @c 1 on success, @c 0 otherwise.
 *
 * This function reads an image from an eet file stored under the named
 * key in the eet file and store the decompressed pixel data in the provided
 * surface colorspace.
 *
 * The other parameters of the image (width, height etc.) are placed into
 * the values pointed to (they must be supplied). The pixel data is a linear
 * array of pixels starting from the top-left of the image scanning row by
 * row from left to right. Each pixel is a 32bit value, with the high byte
 * being the alpha channel, the next being red, then green, and the low byte
 * being blue. The width and height are measured in pixels and will be
 * greater than 0 when returned. The alpha flag is either 0 or 1. 0 denotes
 * that the alpha channel is not used. 1 denotes that it is significant.
 * Compress is filled with the compression value/amount the image was
 * stored with. The quality value is filled with the quality encoding of
 * the image file (0 - 100). The lossy flags is either 0 or 1 as to if
 * the image was encoded lossily or not.
 *
 * On success the function returns 1, and 0 on failure. On failure the
 * parameter values may not contain any sensible data.
 *
 * @see eet_data_image_read_to_surface()
 * @see eet_data_image_decode_to_cspace_surface_cipher()
 * @see eet_data_image_read_to_surface_cipher()
 *
 * @since 1.10.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_read_to_cspace_surface_cipher(ef:PEet_File; name:Pchar; cipher_key:Pchar; src_x:dword; src_y:dword; 
           d:Pdword; w:dword; h:dword; row_stride:dword; cspace:TEet_Colorspace; 
           alpha:Plongint; comp:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Cipher_Group
 * @brief Reads image data from the named key in the eet file using a cipher.
 * @param data The encoded pixel data.
 * @param cipher_key The key to use as cipher.
 * @param size The size, in bytes, of the encoded pixel data.
 * @param src_x The starting x coordinate from where to dump the stream.
 * @param src_y The starting y coordinate from where to dump the stream.
 * @param d A pointer to the pixel surface.
 * @param w The expected width in pixels of the pixel surface to decode.
 * @param h The expected height in pixels of the pixel surface to decode.
 * @param row_stride The length of a pixels line in the destination surface.
 * @param cspace The color space of the pixel surface
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param comp A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return @c 1 on success, @c 0 otherwise.
 *
 * This function reads an image from an eet file stored under the named
 * key in the eet file and store the decompressed pixels in the specified
 * color space inside the given surface.
 *
 * The other parameters of the image (width, height etc.) are placed into
 * the values pointed to (they must be supplied). The pixel data is a linear
 * array of pixels starting from the top-left of the image scanning row by
 * row from left to right. Each pixel is a 32bit value, with the high byte
 * being the alpha channel, the next being red, then green, and the low byte
 * being blue. The width and height are measured in pixels and will be
 * greater than 0 when returned. The alpha flag is either 0 or 1. 0 denotes
 * that the alpha channel is not used. 1 denotes that it is significant.
 * Compress is filled with the compression value/amount the image was
 * stored with. The quality value is filled with the quality encoding of
 * the image file (0 - 100). The lossy flags is either 0 or 1 as to if
 * the image was encoded lossily or not.
 *
 * On success the function returns 1, and 0 on failure. On failure the
 * parameter values may not contain any sensible data.
 *
 * @see eet_data_image_read_to_surface()
 * @see eet_data_image_read_to_surface_cipher()
 *
 * @since 1.10.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_decode_to_cspace_surface_cipher(data:pointer; cipher_key:Pchar; size:longint; src_x:dword; src_y:dword; 
           d:Pdword; w:dword; h:dword; row_stride:dword; cspace:TEet_Colorspace; 
           alpha:Plongint; comp:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Cipher_Group
 * @brief Writes image data to the named key in an eet file using a cipher.
 * @param ef A valid eet file handle opened for writing.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param cipher_key The key to use as cipher.
 * @param data A pointer to the image pixel data.
 * @param w The width of the image in pixels.
 * @param h The height of the image in pixels.
 * @param alpha The alpha channel flag.
 * @param compress The compression amount.
 * @param quality The quality encoding amount.
 * @param lossy The lossiness flag.
 * @return Success if the data was encoded and written or not.
 *
 * This function takes image pixel data and encodes it in an eet file
 * stored under the supplied name key, and returns how many bytes were
 * actually written to encode the image data.
 *
 * The data expected is the same format as returned by eet_data_image_read.
 * If this is not the case weird things may happen. Width and height must
 * be between 1 and 8000 pixels. The alpha flags can be 0 or 1 (0 meaning
 * the alpha values are not useful and 1 meaning they are). Compress can
 * be from 0 to 9 (0 meaning no compression, 9 meaning full compression).
 * This is only used if the image is not lossily encoded. Quality is used on
 * lossy compression and should be a value from 0 to 100. The lossy flag
 * can be 0 or 1. 0 means encode losslessly and 1 means to encode with
 * image quality loss (but then have a much smaller encoding).
 *
 * On success this function returns the number of bytes that were required
 * to encode the image data, or on failure it returns 0.
 *
 * @see eet_data_image_write()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_write_cipher(ef:PEet_File; name:Pchar; cipher_key:Pchar; data:pointer; w:dword; 
           h:dword; alpha:longint; compress:longint; quality:longint; lossy:TEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Cipher_Group
 * @brief Decodes Image data header only to get information using a cipher.
 * @param data The encoded pixel data.
 * @param cipher_key The key to use as cipher.
 * @param size The size, in bytes, of the encoded pixel data.
 * @param w A pointer to the unsigned int to hold the width in pixels.
 * @param h A pointer to the unsigned int to hold the height in pixels.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return @c 1 on success, @c 0 on failure.
 *
 * This function takes encoded pixel data and decodes it into raw RGBA
 * pixels on success.
 *
 * The other parameters of the image (width, height etc.) are placed into
 * the values pointed to (they must be supplied). The pixel data is a linear
 * array of pixels starting from the top-left of the image scanning row by
 * row from left to right. Each pixel is a 32bit value, with the high byte
 * being the alpha channel, the next being red, then green, and the low byte
 * being blue. The width and height are measured in pixels and will be
 * greater than 0 when returned. The alpha flag is either 0 or 1. 0 denotes
 * that the alpha channel is not used. 1 denotes that it is significant.
 * Compress is filled with the compression value/amount the image was
 * stored with. The quality value is filled with the quality encoding of
 * the image file (0 - 100). The lossy flags is either 0 or 1 as to if
 * the image was encoded lossily or not.
 *
 * On success the function returns 1 indicating the header was read and
 * decoded properly, or 0 on failure.
 *
 * @see eet_data_image_header_decode()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_header_decode_cipher(data:pointer; cipher_key:Pchar; size:longint; w:Pdword; h:Pdword; 
           alpha:Plongint; compress:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Cipher_Group
 * @brief Decodes Image data into pixel data using a cipher.
 * @param data The encoded pixel data.
 * @param cipher_key The key to use as cipher.
 * @param size The size, in bytes, of the encoded pixel data.
 * @param w A pointer to the unsigned int to hold the width in pixels.
 * @param h A pointer to the unsigned int to hold the height in pixels.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return The image pixel data decoded
 *
 * This function takes encoded pixel data and decodes it into raw RGBA
 * pixels on success.
 *
 * The other parameters of the image (width, height etc.) are placed into
 * the values pointed to (they must be supplied). The pixel data is a linear
 * array of pixels starting from the top-left of the image scanning row by
 * row from left to right. Each pixel is a 32bit value, with the high byte
 * being the alpha channel, the next being red, then green, and the low byte
 * being blue. The width and height are measured in pixels and will be
 * greater than 0 when returned. The alpha flag is either 0 or 1. 0 denotes
 * that the alpha channel is not used. 1 denotes that it is significant.
 * Compress is filled with the compression value/amount the image was
 * stored with. The quality value is filled with the quality encoding of
 * the image file (0 - 100). The lossy flags is either 0 or 1 as to if
 * the image was encoded lossily or not.
 *
 * On success the function returns a pointer to the image data decoded. The
 * calling application is responsible for calling free() on the image data
 * when it is done with it. On failure NULL is returned and the parameter
 * values may not contain any sensible data.
 *
 * @see eet_data_image_decode()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_decode_cipher(data:pointer; cipher_key:Pchar; size:longint; w:Pdword; h:Pdword; 
           alpha:Plongint; compress:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):pointer;cdecl;external;
{*
 * @ingroup Eet_File_Image_Cipher_Group
 * @brief Decodes Image data into pixel data using a cipher.
 * @param data The encoded pixel data.
 * @param cipher_key The key to use as cipher.
 * @param size The size, in bytes, of the encoded pixel data.
 * @param src_x The starting x coordinate from where to dump the stream.
 * @param src_y The starting y coordinate from where to dump the stream.
 * @param d A pointer to the pixel surface.
 * @param w The expected width in pixels of the pixel surface to decode.
 * @param h The expected height in pixels of the pixel surface to decode.
 * @param row_stride The length of a pixels line in the destination surface.
 * @param alpha A pointer to the int to hold the alpha flag.
 * @param compress A pointer to the int to hold the compression amount.
 * @param quality A pointer to the int to hold the quality amount.
 * @param lossy A pointer to the int to hold the lossiness flag.
 * @return @c 1 on success, @c 0 otherwise.
 *
 * This function takes encoded pixel data and decodes it into raw RGBA
 * pixels on success.
 *
 * The other parameters of the image (alpha, compress etc.) are placed into
 * the values pointed to (they must be supplied). The pixel data is a linear
 * array of pixels starting from the top-left of the image scanning row by
 * row from left to right. Each pixel is a 32bit value, with the high byte
 * being the alpha channel, the next being red, then green, and the low byte
 * being blue. The width and height are measured in pixels and will be
 * greater than 0 when returned. The alpha flag is either 0 or 1. 0 denotes
 * that the alpha channel is not used. 1 denotes that it is significant.
 * Compress is filled with the compression value/amount the image was
 * stored with. The quality value is filled with the quality encoding of
 * the image file (0 - 100). The lossy flags is either 0 or 1 as to if
 * the image was encoded lossily or not.
 *
 * On success the function returns 1, and 0 on failure. On failure the
 * parameter values may not contain any sensible data.
 *
 * @see eet_data_image_decode_to_surface()
 *
 * @since 1.0.2
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_decode_to_surface_cipher(data:pointer; cipher_key:Pchar; size:longint; src_x:dword; src_y:dword; 
           d:Pdword; w:dword; h:dword; row_stride:dword; alpha:Plongint; 
           compress:Plongint; quality:Plongint; lossy:PEet_Image_Encoding):longint;cdecl;external;
{*
 * @ingroup Eet_File_Image_Cipher_Group
 * @brief Encodes image data for storage or transmission using a cipher.
 * @param data A pointer to the image pixel data.
 * @param cipher_key The key to use as cipher.
 * @param size_ret A pointer to an int to hold the size of the returned data.
 * @param w The width of the image in pixels.
 * @param h The height of the image in pixels.
 * @param alpha The alpha channel flag.
 * @param compress The compression amount.
 * @param quality The quality encoding amount.
 * @param lossy The lossiness flag.
 * @return The encoded image data.
 *
 * This function stakes image pixel data and encodes it with compression and
 * possible loss of quality (as a trade off for size) for storage or
 * transmission to another system.
 *
 * The data expected is the same format as returned by eet_data_image_read.
 * If this is not the case weird things may happen. Width and height must
 * be between 1 and 8000 pixels. The alpha flags can be 0 or 1 (0 meaning
 * the alpha values are not useful and 1 meaning they are). Compress can
 * be from 0 to 9 (0 meaning no compression, 9 meaning full compression).
 * This is only used if the image is not lossily encoded. Quality is used on
 * lossy compression and should be a value from 0 to 100. The lossy flag
 * can be 0 or 1. 0 means encode losslessly and 1 means to encode with
 * image quality loss (but then have a much smaller encoding).
 *
 * On success this function returns a pointer to the encoded data that you
 * can free with free() when no longer needed.
 *
 * @see eet_data_image_encode()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_image_encode_cipher(data:pointer; cipher_key:Pchar; w:dword; h:dword; alpha:longint; 
           compress:longint; quality:longint; lossy:TEet_Image_Encoding; size_ret:Plongint):pointer;cdecl;external;
{*
 * @defgroup Eet_Cipher_Group Cipher, Identity and Protection Mechanisms
 * @ingroup Eet
 *
 * Eet allows one to protect entries of an #Eet_File
 * individually. This may be used to ensure data was not tampered or
 * that third party does not read your data.
 *
 * @see @ref Eet_File_Cipher_Group
 * @see @ref Eet_File_Image_Cipher_Group
 *
 * @
  }
{*
 * @typedef Eet_Key
 * Opaque handle that defines an identity (also known as key)
 * in Eet's cipher system.
  }
type
{*
 * @
  }
{*
 * @ingroup Eet_Cipher_Group
 * @brief Callback used to request if needed the password of a private key.
 *
 * @param buffer the buffer where to store the password.
 * @param size the maximum password size (size of buffer, including '@\0').
 * @param rwflag if the buffer is also readable or just writable.
 * @param data currently unused, may contain some context in future.
 * @return @c 1 on success and password was set to @p buffer, @c 0 on failure.
 *
 * @since 1.2.0
  }

  TEet_Key_Password_Callback = function (buffer:Pchar; size:longint; rwflag:longint; data:pointer):longint;cdecl;
{*
 * @ingroup Eet_Cipher_Group
 * @brief Creates an Eet_Key needed for signing an eet file.
 *
 * The certificate should provide the public that match the private key.
 * No verification is done to ensure that.
 *
 * @param certificate_file The file where to find the certificate.
 * @param private_key_file The file that contains the private key.
 * @param cb Function to callback if password is required to unlock
 *        private key.
 * @return A key handle to use, or @c NULL on failure.
 *
 * @see eet_identity_close()
 *
 * @warning You need to compile signature support in EET.
 * @since 1.2.0
  }
(* Const before type ignored *)
(* Const before type ignored *)

function eet_identity_open(certificate_file:Pchar; private_key_file:Pchar; cb:TEet_Key_Password_Callback):PEet_Key;cdecl;external;
{*
 * @ingroup Eet_Cipher_Group
 * @brief Close and release all resource used by an Eet_Key.
 * A reference counter prevent it from being freed until all file
 * using it are also closed.
 *
 * @param key the key handle to close and free resources.
 *
 * @since 1.2.0
  }
procedure eet_identity_close(key:PEet_Key);cdecl;external;
{*
 * @ingroup Eet_Cipher_Group
 * @brief Sets a key to sign a file.
 *
 * @param ef the file to set the identity.
 * @param key the key handle to set as identity.
 * @return #EET_ERROR_BAD_OBJECT if @p ef is invalid or
 *         #EET_ERROR_NONE on success.
 *
 * @since 1.2.0
  }
function eet_identity_set(ef:PEet_File; key:PEet_Key):TEet_Error;cdecl;external;
{*
 * @ingroup Eet_Cipher_Group
 * @brief Displays both private and public key of an Eet_Key.
 *
 * @param key the handle to print.
 * @param out where to print.
 *
 * @warning You need to compile signature support in EET.
 * @since 1.2.0
  }
procedure eet_identity_print(key:PEet_Key; out:PFILE);cdecl;external;
{*
 * @ingroup Eet_Cipher_Group
 * @brief Compares the identify certificate of an eet file against a stored one
 *
 * @param ef The file handle to check the identify of
 * @param certificate_file The path to the certificate file
 * @return @c EINA_TRUE if the certificates match, otherwise @c EINA_FALSE
 *
 * The @p ef file handle mus be valid, and a signed file, otherwise
 * checking will fail. The path to the certificate file must be a valid
 * file path to a 'pem' format file (the same used for siging with
 * eet_identity_open() as a certificate file).
 *
 * @note This function can not be used to provide any security mechanism. You
 * need to check your x509 certificate against a chain of trust to have a proper
 * security. This is just a convenience test function.
 * @warning You need to compile signature support in EET.
 * @since 1.13
  }
(* Const before type ignored *)
function eet_identity_verify(ef:PEet_File; certificate_file:Pchar):TEina_Bool;cdecl;external;
{*
 * @ingroup Eet_Cipher_Group
 * @brief Gets the x509 der certificate associated with an Eet_File. Will return NULL
 * if the file is not signed.
 *
 * @param ef The file handle to query.
 * @param der_length The length of returned data, may be @c NULL.
 * @return the x509 certificate or @c NULL on error.
 *
 * @since 1.2.0
  }
(* Const before type ignored *)
function eet_identity_x509(ef:PEet_File; der_length:Plongint):pointer;cdecl;external;
{*
 * @ingroup Eet_Cipher_Group
 * @brief Gets the raw signature associated with an Eet_File. Will return NULL
 * if the file is not signed.
 *
 * @param ef The file handle to query.
 * @param signature_length The length of returned data, may be @c NULL.
 * @return The raw signature or @c NULL on error.
 *
  }
(* Const before type ignored *)
function eet_identity_signature(ef:PEet_File; signature_length:Plongint):pointer;cdecl;external;
{*
 * @ingroup Eet_Cipher_Group
 * @brief Gets the SHA1 associated with a file. Could be the one used to
 * sign the data or if the data where not signed, it will be the
 * SHA1 of the file.
 *
 * @param ef The file handle to query.
 * @param sha1_length The length of returned data, may be @c NULL.
 * @return the associated SHA1 or @c NULL on error.
 *
 * @since 1.2.0
  }
(* Const before type ignored *)
function eet_identity_sha1(ef:PEet_File; sha1_length:Plongint):pointer;cdecl;external;
{*
 * @ingroup Eet_Cipher_Group
 * @brief Displays the x509 der certificate to out.
 *
 * @param certificate the x509 certificate to print
 * @param der_length The length the certificate.
 * @param out where to print.
 *
 * @warning You need to compile signature support in EET.
 * @since 1.2.0
  }
(* Const before type ignored *)
procedure eet_identity_certificate_print(certificate:Pbyte; der_length:longint; out:PFILE);cdecl;external;
{*
 * @defgroup Eet_Data_Group Eet Data Serialization
 * @ingroup Eet
 *
 * Convenience functions to serialize and parse complex data
 * structures to binary blobs.
 *
 * While Eet core just handles binary blobs, it is often required
 * to save some structured data of different types, such as
 * strings, integers, lists, hashes and so on.
 *
 * Eet can serialize and then parse data types given some
 * construction instructions. These are defined in two levels:
 *
 * - #Eet_Data_Descriptor_Class to tell generic memory handling,
 *   such as the size of the type, how to allocate memory, strings,
 *   lists, hashes and so on.
 *
 * - #Eet_Data_Descriptor to tell inside such type, the members and
 *   their offsets inside the memory blob, their types and
 *   names. These members can be simple types or other
 *   #Eet_Data_Descriptor, allowing hierarchical types to be
 *   defined.
 *
 * Given that C provides no introspection, this process can be
 * quite cumbersome, so we provide lots of macros and convenience
 * functions to aid creating the types.
 *
 * We make now a quick overview of some of the most commonly used elements
 * of this part of the library. A simple example of a configuration system
 * will work as a somewhat real life example that is still simple enough to
 * follow.
 * Only the relevant sections will be shown here, but you can get the full
 * code @ref eet-data-simple.c "here".
 *
 * Ignoring the included headers, we'll begin by defining our configuration
 * struct.
 * @dontinclude eet-data-simple.c
 * @skip typedef
 * @until 
 *
 * When using Eet, you don't think in matters of what data the program needs
 * to run and which you would like to store. It's all the same and if it makes
 * more sense to keep them together, it's perfectly fine to do so. At the time
 * of telling Eet how your data is comprised you can leave out the things
 * that are runtime only and let Eet take care of the rest for you.
 *
 * The key used to store the config follows, as well as the variable used to
 * store our data descriptor.
 * This last one is very important. It's the one thing that Eet will use to
 * identify your data, both at the time of writing it to the file and when
 * loading from it.
 * @skipline MY_CONF
 * @skipline Eet_Data_Descriptor
 *
 * Now we'll see how to create this descriptor, so Eet knows how to handle
 * our data later on.
 * Begin our function by declaring an Eet_Data_Descriptor_Class, which is
 * used to create the actual descriptor. This class contains the name of
 * our data type, its size and several functions that dictate how Eet should
 * handle memory to allocate the necessary bits to bring our data to life.
 * You, as a user, will very hardly set this class' contents directly. The
 * most common scenario is to use one of the provided macros that set it using
 * the Eina data types, so that's what we'll be doing across all our examples.
 * @skip static void
 * @until eet_data_descriptor_stream_new
 *
 * Now that we have our descriptor, we need to make it describe something.
 * We do so by telling it which members of our struct we want it to know about
 * and their types.
 * The eet_data_descriptor_element_add() function takes care of this, but it's
 * too cumbersome for normal use, so several macros are provided that make
 * it easier to handle. Even with them, however, code can get very repetitive
 * and it's not uncommon to define custom macros using them to save on typing.
 * @skip #define
 * @until 
 *
 * Now our descriptor knows about the parts of our structure that we are
 * interesting in saving. You can see that not all of them are there, yet Eet
 * will find those that need saving and do the right thing. When loading our
 * data, any non-described fields in the structure will be zeroed, so there's
 * no need to worry about garbage memory in them.
 * Refer to the documentation of #EET_DATA_DESCRIPTOR_ADD_BASIC to understand
 * what our macro does.
 *
 * We are done with our descriptor init function and it's proper to have the
 * relevant shutdown. Proper coding guidelines indiciate that all memory
 * allocated should be freed when the program ends, and since you will most
 * likely keep your descriptor around for the life or your application, it's
 * only right to free it at the end.
 * @skip static void
 * @until 
 *
 * Not listed here, but included in the full example are functions to create
 * a blank configuration and free it. The first one will only be used when
 * no file exists to load from, or nothing is found in it, but the latter is
 * used regardless of where our data comes from. Unless you are reading direct
 * data from the Eet file, you will be in charge of freeing anything loaded
 * from it.
 *
 * Now it's time to look at how we can load our config from some file.
 * Begin by opening the Eet file normally.
 * @skip static My_Conf_Type
 * @until 
 *
 * And now we need to read the data from the file and decode it using our
 * descriptor. Fortunately, that's all done in one single step.
 * @until goto
 *
 * And that's it for all Eet cares about. But since we are dealing with a
 * common case, as is save and load of user configurations, the next fragment
 * of code shows why we have a version field in our struct, and how you can
 * use it to load older configuration files and update them as needed.
 * @until 
 *
 * Finally, close the file and return the newly loaded config data.
 * @until 
 *
 * Saving data is just as easy. The full version of the following function
 * includes code to save to a temporary file first, so you can be sure not
 * to lose all your data in the case of a failure mid-writing. You can look
 * at it @ref eet-data-simple.c "here".
 * @skip static Eina_Bool
 * @until 
 * @skipline Eina_Bool ret
 * @skip eet_open
 * @until eet_close
 * @skip return
 * @until 
 *
 * To close, our main function, which doesn't do much. Just take some arguments
 * from the command line with the name of the file to load and another one
 * where to save again. If input file doesn't exist, a new config structure
 * will be created and saved to our output file.
 * @skip int main
 * @until return ret
 * @until 
 *
 * The following is a list of more advanced and detailed examples.
 * @li @ref eet_data_nested_example
 * @li @ref eet_data_file_descriptor
 * @li @ref Example_Eet_Data_File_Descriptor_02
 * @li @ref Example_Eet_Data_Cipher_Decipher
  }
{*
 * @page eet_data_nested_example Nested structures and Eet Data Descriptors
 *
 * We've seen already a simple example of how to use Eet Data Descriptors
 * to handle our structures, but it didn't show how this works when you
 * have structures inside other structures.
 *
 * Now, there's a very simple case of this, for when you have inline structs
 * to keep your big structure more organized, you don't need anything else
 * besides what @ref eet-data-simple.c "this simple example does".
 * Just use something like @p some_struct.sub_struct.member when adding the
 * member to the descriptor and it will work.
 *
 * For example:
 * @code
 * typedef struct
 * 
 *    int a_number;
 *    char *a_string;
 *    struct 
 *       int other_num;
 *       int one_more;
 *     sub;
 *  some_struct;
 *
 * void some_function()
 * 
 *    ...
 *    my_desc = eet_data_descriptor_stream_new(&eddc);
 *    EET_DATA_DESCRIPTOR_ADD_BASIC(my_desc, some_struct, "a_number",
 *                                  a_number, EET_T_INT);
 *    EET_DATA_DESCRIPTOR_ADD_BASIC(my_desc, some_struct, "a_string",
 *                                  a_string, EET_T_STRING);
 *    EET_DATA_DESCRIPTOR_ADD_BASIC(my_desc, some_struct, "sub.other_num",
 *                                  sub.other_num, EET_T_INT);
 *    EET_DATA_DESCRIPTOR_ADD_BASIC(my_desc, some_struct, "sub.one_more",
 *                                  sub.one_more, EET_T_INT);
 *    ...
 * 
 * @endcode
 *
 * But this is not what we are here for today. When we talk about nested
 * structures, what we really want are things like lists and hashes to be
 * taken into consideration automatically, and all their contents saved and
 * loaded just like ordinary integers and strings are.
 *
 * And of course, Eet can do that, and considering the work it saves you as a
 * programmer, we could say it's even easier to do than handling just integers.
 *
 * Let's begin with our example then, which is not all too different from the
 * simple one introduced earlier.
 *
 * We won't ignore the headers this time to show how easy it is to use Eina
 * data types with Eet, but we'll still skip most of the code that is not
 * pertinent to what we want to show now, but as usual, you can get it full
 * by following @ref eet-data-nested.c "this link".
 *
 * @dontinclude eet-data-nested.c
 * @skipline Eina.h
 * @skipline Eet.h
 * @skip typedef struct
 * @until  My_Conf_Subtype
 *
 * Extremely similar to our previous example. Just a new struct in there, and
 * a pointer to a list in the one we already had. Handling a list of subtypes
 * is easy on our program, but now we'll see what Eet needs to work with them
 * (Hint: it's easy too).
 * @skip _my_conf_descriptor
 * @until _my_conf_sub_descriptor
 *
 * Since we have two structures now, it's only natural that we'll need two
 * descriptors. One for each, which will be defined exactly as before.
 * @skip static void
 * @until eddc
 * @skip EET_EINA_STREAM_DATA_DESCRIPTOR_CLASS_SET
 * @until _my_conf_sub_descriptor
 *
 * We create our descriptors, each for one type, and as before, we are going to
 * use a simple macro to set their contents, to save on typing.
 * @skip #define
 * @until EET_T_UCHAR
 *
 * So far, nothing new. We have our descriptors and we know already how to
 * save them separately. But what we want is to link them together, and even
 * more so, we want our main type to hold a list of more than one of the new
 * sub type. So how do we do that?
 *
 * Simple enough, we tell Eet that our main descriptor will hold a list, of
 * which each node will point to some type described by our new descriptor.
 * @skip EET_DATA_DESCRIPTOR_ADD_LIST
 * @until _my_conf_sub_descriptor
 *
 * And that's all. We are closing the function now so as to not leave dangling
 * curly braces, but there's nothing more to show in this example. Only other
 * additions are the necessary code to free our new data, but you can see it
 * in the full code listing.
 * @until 
  }
{*
 * @page eet_data_file_descriptor Advanced use of Eet Data Descriptors
 *
 * A real life example is usually the best way to see how things are used,
 * but they also involve a lot more code than what needs to be shown, so
 * instead of going that way, we'll be borrowing some pieces from one in
 * the following example. It's been slightly modified from the original
 * source to show more of the varied ways in which Eet can handle our data.
 *
 * @ref eet-data-file_descriptor_01.c "This example" shows a cache of user
 * accounts and messages received, and it's a bit more interactive than
 * previous examples.
 *
 * Let's begin by looking at the structures we'll be using. First we have
 * one to define the messages the user receives and one for the one he posts.
 * Straight forward and nothing new here.
 * @dontinclude eet-data-file_descriptor_01.c
 * @skip typedef
 * @until My_Post
 *
 * One more to declare the account itself. This one will contain a list of
 * all messages received, and the posts we make ourselves will be kept in an
 * array. No special reason other than to show how to use arrays with Eet.
 * @until My_Account
 *
 * Finally, the main structure to hold our cache of accounts. We'll be looking
 * for these accounts by their names, so let's keep them in a hash, using
 * that name as the key.
 * @until My_Cache
 *
 * As explained before, we need one descriptor for each struct we want Eet
 * to handle, but this time we also want to keep around our Eet file and its
 * string dictionary. You will see why in a moment.
 * @skip Eet_Data_Descriptor
 * @until _my_post_descriptor
 * @skip Eet_File
 * @until Eet_Dictionary
 *
 * The differences begin now. They aren't much, but we'll be creating our
 * descriptors differently. Things can be added to our cache, but we won't
 * be modifying the current contents, so we can consider the data read from
 * it to be read-only, and thus allow Eet to save time and memory by not
 * duplicating thins unnecessary.
 * @skip static void
 * @until _my_post_descriptor
 *
 * As the comment in the code explains, we are asking Eet to give us strings
 * directly from the mapped file, which avoids having to load it in memory
 * and data duplication.
 * Of course, there are things to take into account when doing things this
 * way, and they will be mentioned as we encounter those special cases.
 *
 * Next comes the actual description of our data, just like we did in the
 * previous examples.
 * @skip #define
 * @until #undef
 * @until #define
 * @until #undef
 *
 * And the account struct's description doesn't add much new, but it's worth
 * commenting on it.
 * @skip #define
 * @until _my_post_descriptor
 *
 * How to add a list we've seen before, but now we are also adding an array.
 * There's nothing really special about it, but it's important to note that
 * the EET_DATA_DESCRIPTOR_ADD_VAR_ARRAY is used to add arrays of variable
 * length to a descriptor. That is, arrays just like the one we defined.
 * Since there's no way in C to know how long they are, we need to keep
 * track of the count ourselves and Eet needs to know how to do so as well.
 * That's what the @p posts_count member of our struct is for. When adding
 * our array member, this macro will look for another variable in the struct
 * named just like the array, but with @p _count attached to the end.
 * When saving our data, Eet will know how many elements the array contains
 * by looking into this count variable. When loading back from a file, this
 * variable will be set to the right number of elements.
 *
 * Another option for arrays is to use EET_DATA_DESCRIPTOR_ADD_ARRAY, which
 * takes care of fixed sized arrays.
 * For example, let's suppose that we want to keep track of only the last
 * ten posts the user sent, and we declare our account struct as follows
 * @code
 * typedef struct
 * 
 *    unsigned int id;
 *    const char  *name;
 *    Eina_List   *messages;
 *    My_Post      posts[10];
 *  My_Account;
 * @endcode
 * Then we would add the array to our descriptor with
 * @code
 * EET_DATA_DESCRIPTOR_ADD_ARRAY(_my_account_descriptor, My_Account, "posts",
 *                               posts, _my_post_descriptor);
 * @endcode
 *
 * Notice how this time we don't have a @p posts_count variable in our struct.
 * We could have it for the program to keep track of how many posts the
 * array actually contains, but Eet no longer needs it. Being defined that
 * way the array is already taking up all the memory needed for the ten
 * elements, and it is possible in C to determine how much it is in code.
 * When saving our data, Eet will just dump the entire memory blob into the
 * file, regardless of how much of it is really used. So it's important to
 * take into consideration this kind of things when defining your data types.
 * Each has its uses, its advantages and disadvantages and it's up to you
 * to decide which to use.
 *
 * Now, going back to our example, we have to finish adding our data to the
 * descriptors. We are only missing the main one for the cache, which
 * contains our hash of accounts.
 * Unless you are using your own hash functions when setting the descriptor
 * class, always use hashes with string type keys.
 * @skip #define
 * @until 
 *
 * If you remember, we told Eet not to duplicate memory when possible at the
 * time of loading back our data. But this doesn't mean everything will be
 * loaded straight from disk and we don't have to worry about freeing it.
 * Data in the Eet file is compressed and encoded, so it still needs to be
 * decoded and memory will be allocated to convert it back into something we
 * can use. We also need to take care of anything we add in the current
 * instance of the program.
 * To summarize, any string we get from Eet is likely to be a pointer to the
 * internal dictionary, and trying to free it will, in the best case, crash
 * our application right away.
 *
 * So how do we know if we have to free a string? We check if it's part of
 * the dictionary, and if it's not there we can be sure it's safe to get
 * rid of it.
 * @skip static void
 * @skip 
 * @skip static void
 * @until 
 *
 * See how this is used when adding a new message to our cache.
 * @skip static My_Message
 * @until return msg
 * @until free(msg)
 * @until 
 *
 * Skipping all the utility functions used by our program (remember you can
 * look at the full example @ref eet-data-file_descriptor_01.c "here") we get to
 * our cache loading code. Nothing out of the ordinary at first, just the
 * same old open file, read data using our main descriptor to decode it
 * into something we can use and check version of loaded data and if it doesn't
 * match, do something accordingly.
 * @skip static My_Cache
 * @until 
 * @until 
 * @until 
 *
 * Then comes the interesting part. Remember how we kept two more global
 * variables with our descriptors? One of them we already used to check if
 * it was right to free a string or not, but we didn't know where it came from.
 * Loading our data straight from the mmapped file means that we can't close
 * it until we are done using it, so we need to keep its handler around until
 * then. It also means that any changes done to the file can, and will,
 * invalidate all our pointers to the file backed data, so if we add something
 * and save the file, we need to reload our cache.
 *
 * Thus our load function checks if we had an open file, if there is it gets
 * closed and our variable is updated to the new handler. Then we get the
 * string dictionary we use to check if a string is part of it or not.
 * Updating any references to the cache data is up you as a programmer to
 * handle properly, there's nothing Eet can do in this situation.
 * @until 
 *
 * The save function doesn't have anything new, and all that's left after it
 * is the main program, which doesn't really have anything of interest within
 * the scope of what we are learning.
  }
{*
 * @addtogroup Eet_Data_Group
 * @
  }
{*< Unknown data encoding type  }
const
  EET_T_UNKNOW = 0;  
{*< Data type: char  }
  EET_T_CHAR = 1;  
{*< Data type: short  }
  EET_T_SHORT = 2;  
{*< Data type: int  }
  EET_T_INT = 3;  
{*< Data type: long long  }
  EET_T_LONG_LONG = 4;  
{*< Data type: float  }
  EET_T_FLOAT = 5;  
{*< Data type: double  }
  EET_T_DOUBLE = 6;  
{*< Data type: unsigned char  }
  EET_T_UCHAR = 7;  
{*< Data type: unsigned short  }
  EET_T_USHORT = 8;  
{*< Data type: unsigned int  }
  EET_T_UINT = 9;  
{*< Data type: unsigned long long  }
  EET_T_ULONG_LONG = 10;  
{*< Data type: char *  }
  EET_T_STRING = 11;  
{*< Data type: char * (but compressed inside the resulting eet)  }
  EET_T_INLINED_STRING = 12;  
{*< Data type: (void *) (only use it if you know why)  }
  EET_T_NULL = 13;  
{*< Data type: fixed point 32.32  }
  EET_T_F32P32 = 14;  
{*< Data type: fixed point 16.16  }
  EET_T_F16P16 = 15;  
{*< Data type: fixed point 8.24  }
  EET_T_F8P24 = 16;  
{*< Data type: pointer to Eina_Value @since 1.8  }
  EET_T_VALUE = 17;  
{*< Last data type  }
  EET_T_LAST = 18;  
{*< Unknown group data encoding type  }
  EET_G_UNKNOWN = 100;  
{*< Fixed size array group type  }
  EET_G_ARRAY = 101;  
{*< Variable size array group type  }
  EET_G_VAR_ARRAY = 102;  
{*< Linked list group type  }
  EET_G_LIST = 103;  
{*< Hash table group type  }
  EET_G_HASH = 104;  
{*< Union group type  }
  EET_G_UNION = 105;  
{*< Selectable subtype group  }
  EET_G_VARIANT = 106;  
{*< Unknown nested group type. @since 1.8  }
  EET_G_UNKNOWN_NESTED = 107;  
{*< Last group type  }
  EET_G_LAST = 108;  
{*< Other type exist but are reserved for internal purpose.  }
  EET_I_LIMIT = 128;  
{*
 * @typedef Eet_Data_Descriptor
 *
 * Opaque handle that have information on a type members.
 *
 * Descriptors are created using an #Eet_Data_Descriptor_Class, and they
 * describe the contents of the structure that will be serialized by Eet.
 * Not all members need be described by it, just those that should be handled
 * by Eet. This way it's possible to have one structure with both data to be
 * saved to a file, like application configuration, and runtime information
 * that would be meaningless to store, but is appropriate to keep together
 * during the program execution.
 * The members are added by means of
 * EET_DATA_DESCRIPTOR_ADD_BASIC(), EET_DATA_DESCRIPTOR_ADD_SUB(),
 * EET_DATA_DESCRIPTOR_ADD_LIST(), EET_DATA_DESCRIPTOR_ADD_HASH()
 * or eet_data_descriptor_element_add().
 *
 * @see eet_data_descriptor_stream_new()
 * @see eet_data_descriptor_file_new()
 * @see eet_data_descriptor_free()
  }
type
{*
 * @def EET_DATA_DESCRIPTOR_CLASS_VERSION
 * The version of #Eet_Data_Descriptor_Class at the time of the
 * distribution of the sources. One should define this to its
 * version member so it is compatible with abi changes, or at least
 * will not crash with them.
  }

const
  EET_DATA_DESCRIPTOR_CLASS_VERSION = 4;  
{*
 * @typedef Eet_Data_Descriptor_Class
 *
 * Instructs Eet about memory management for different needs under
 * serialization and parse process.
  }
type
{*
 * @typedef (*Eet_Descriptor_Hash_Foreach_Callback_Callback)
 *
 * Callback prototype for Eet_Descriptor_Hash_Foreach_Callback
 * @param h The hash
 * @param k The key
 * @param dt The data
 * @param fdt The data passed to the callback
 * @return An integer
  }
(* Const before type ignored *)

  TEet_Descriptor_Hash_Foreach_Callback_Callback = function (h:pointer; k:Pchar; dt:pointer; fdt:pointer):longint;cdecl;
{*
 * @typedef (*Eet_Descriptor_Mem_Alloc_Callback)
 *
 * Callback prototype for Eet_Descriptor_Mem_Alloc.
 * @param size Is the size of memory to alloc on call of the callback
  }

  PEet_Descriptor_Mem_Alloc_Callback = ^TEet_Descriptor_Mem_Alloc_Callback;
  TEet_Descriptor_Mem_Alloc_Callback = function (size:Tsize_t):pointer;cdecl;
{*
 * @typedef (*Eet_Descriptor_Mem_Free_Callback)
 *
 * Callback prototype for Eet_Descriptor_Mem_Alloc
 * @param mem Must be a pointer to free on call of the callback
  }

  TEet_Descriptor_Mem_Free_Callback = procedure (mem:pointer);cdecl;
{*
 * @typedef (*Eet_Descriptor_Str_Alloc_Callback)
 *
 * Callback prototype for Eet_Descriptor_Str_Alloc
 * @param str Must be the string to alloc
 * @return have Must be an allocated char * for the given string
  }
(* Const before type ignored *)

  PEet_Descriptor_Str_Alloc_Callback = ^TEet_Descriptor_Str_Alloc_Callback;
  TEet_Descriptor_Str_Alloc_Callback = function (str:Pchar):Pchar;cdecl;
{*
 * @typedef (*Eet_Descriptor_Str_Free_Callback)
 *
 * Callback prototype for Eet_Descriptor_Str_Free
 * @param str Must be an allocated string to free
  }
(* Const before type ignored *)

  TEet_Descriptor_Str_Free_Callback = procedure (str:Pchar);cdecl;
{*
 * @typedef (*Eet_Descriptor_List_Next_Callback)
 *
 * Callback prototype for Eet_Descriptor_List_Next
 * @param l Must be a pointer to the list
 * @return Must be a pointer to the list
  }

  PEet_Descriptor_List_Next_Callback = ^TEet_Descriptor_List_Next_Callback;
  TEet_Descriptor_List_Next_Callback = function (l:pointer):pointer;cdecl;
{*
 * @typedef (*Eet_Descriptor_List_Append_Callback)
 *
 * Callback prototype for Eet_Descriptor_List_Append
 * @param l Must be a pointer to the list
 * @param d The data to append to the list
 * @return Must be a pointer to the list
  }

  PEet_Descriptor_List_Append_Callback = ^TEet_Descriptor_List_Append_Callback;
  TEet_Descriptor_List_Append_Callback = function (l:pointer; d:pointer):pointer;cdecl;
{*
 * @typedef (*Eet_Descriptor_List_Data_Callback)
 *
 * Callback prototype for Eet_Descriptor_List_Data
 * @param l Must be a pointer to the list
 * @return Must be a pointer to the list
  }

  PEet_Descriptor_List_Data_Callback = ^TEet_Descriptor_List_Data_Callback;
  TEet_Descriptor_List_Data_Callback = function (l:pointer):pointer;cdecl;
{*
 * @typedef (*Eet_Descriptor_List_Free_Callback)
 *
 * Callback prototype for Eet_Descriptor_List_Free
 * @param l Must be a pointer to the list to free
  }

  PEet_Descriptor_List_Free_Callback = ^TEet_Descriptor_List_Free_Callback;
  TEet_Descriptor_List_Free_Callback = function (l:pointer):pointer;cdecl;
{*
 * @typedef (*Eet_Descriptor_Hash_Foreach_Callback)
 *
 * Callback for Eet_Descriptor_Hash_Foreach
 * @param h The hash
 * @param func The function callback to call on each iteration
 * @param fdt The data to pass to the callbac setted in param func
  }

  TEet_Descriptor_Hash_Foreach_Callback = procedure (h:pointer; func:TEet_Descriptor_Hash_Foreach_Callback_Callback; fdt:pointer);cdecl;
{*
 * @typedef (*Eet_Descriptor_Hash_Add_Callback)
 *
 * Callback prototype for Eet_Descriptor_Hash_Add
 * @param h The hash
 * @param k The key
 * @param d The data to associate with the 'k' key
  }
(* Const before type ignored *)

  PEet_Descriptor_Hash_Add_Callback = ^TEet_Descriptor_Hash_Add_Callback;
  TEet_Descriptor_Hash_Add_Callback = function (h:pointer; k:Pchar; d:pointer):pointer;cdecl;
{*
 * @typedef (*Eet_Descriptor_Hash_Free_Callback)
 *
 * Callback prototype for Eet_Descriptor_Hash_Free
 * @param h The hash to free
  }

  TEet_Descriptor_Hash_Free_Callback = procedure (h:pointer);cdecl;
{*
 * @typedef (*Eet_Descriptor_Str_Alloc_Callback)
 *
 * Callback prototype for Eet_Descriptor_Str_Alloc
 * @param str The string to allocate
 * @return An allocated pointer to the string
  }
(* Const before type ignored *)

  PEet_Descriptor_Str_Direct_Alloc_Callback = ^TEet_Descriptor_Str_Direct_Alloc_Callback;
  TEet_Descriptor_Str_Direct_Alloc_Callback = function (str:Pchar):Pchar;cdecl;
{*
 * @typedef (*Eet_Descriptor_Str_Free_Callback)
 *
 * Callback prototype for Eet_Descriptor_Str_Free
 * @param str The string to free
  }
(* Const before type ignored *)

  TEet_Descriptor_Str_Direct_Free_Callback = procedure (str:Pchar);cdecl;
{*
 * @typedef (*Eet_Descriptor_Type_Get_Callback)
 *
 * Callback prototype for Eet_Descriptor_Type_Get
 * @param data Data to pass to the callback
 * @param unknow Eina_Bool __FIXME__
  }
(* Const before type ignored *)
(* Const before type ignored *)

  PEet_Descriptor_Type_Get_Callback = ^TEet_Descriptor_Type_Get_Callback;
  TEet_Descriptor_Type_Get_Callback = function (data:pointer; unknow:PEina_Bool):Pchar;cdecl;
{*
 * @typedef (*Eet_Descriptor_Type_Set_Callback)
 *
 * Callback prototype for Eet_Descriptor_Type_Set
 * @param type The type to set
 * @param data To pass to the callback
 * @param unknow Eina_Bool __FIXME__
  }
(* Const before type ignored *)

  TEet_Descriptor_Type_Set_Callback = function (_type:Pchar; data:pointer; unknow:TEina_Bool):TEina_Bool;cdecl;
{*
 * @typedef (*Eet_Descriptor_Array_Alloc_Callback)
 *
 * Callback prototype for Eet_Descriptor_Array_Alloc
 * @param size The size of the array
  }

  PEet_Descriptor_Array_Alloc_Callback = ^TEet_Descriptor_Array_Alloc_Callback;
  TEet_Descriptor_Array_Alloc_Callback = function (size:Tsize_t):pointer;cdecl;
{*
 * @typedef (*Eet_Descriptor_Array_Free_Callback)
 *
 * Callback prototype for Eet_Descriptor_Array_Free
 * @param size The size of the array
  }

  TEet_Descriptor_Array_Free_Callback = procedure (mem:pointer);cdecl;
{*
 * @struct _Eet_Data_Descriptor_Class
 *
 * Instructs Eet about memory management for different needs under
 * serialization and parse process.
 *
 * The list and hash methods match the Eina API, so for a more detailed
 * reference on them, look at the Eina_List and Eina_Hash documentation,
 * respectively.
 * For the most part these will be used with the standard Eina functions,
 * so using EET_EINA_STREAM_DATA_DESCRIPTOR_CLASS_SET() and
 * EET_EINA_FILE_DATA_DESCRIPTOR_CLASS_SET() will set up everything
 * accordingly.
  }
{*< ABI version. Should always be set to #EET_DATA_DESCRIPTOR_CLASS_VERSION  }
(* Const before type ignored *)
{*< Name of the user data type to be serialized  }
{*< Size in bytes of the user data type to be serialized  }
{*< how to allocate memory (usually malloc())  }
{*< how to free memory (usually free())  }
{*< how to allocate a string  }
{*< how to free a string  }
{*< how to iterate to the next element of a list. Receives and should return the list node.  }
{*< how to append data @p d to list which head node is @p l  }
{*< retrieves the data from node @p l  }
{*< free all the nodes from the list which head node is @p l  }
{*< iterates over all elements in the hash @p h in no specific order  }
{*< add a new data @p d with key @p k in hash @p h  }
{*< free all entries from the hash @p h  }
{*< how to allocate a string directly from file backed/mmaped region pointed by @p str  }
{*< how to free a string returned by str_direct_alloc  }
{*< get the type, as used in the union or variant mapping, that should be used to store the given data into the eet file.  }
{*< called when loading a mapped type with the given @p type used to describe the type in the descriptor  }
{*< how to allocate memory for array (usually malloc())  }
{*< how to free memory for array (usually free())  }
  PEet_Data_Descriptor_Class = ^TEet_Data_Descriptor_Class;
  TEet_Data_Descriptor_Class = record
      version : longint;cdecl;
      name : Pchar;
      size : longint;
      func : record
          mem_alloc : TEet_Descriptor_Mem_Alloc_Callback;
          mem_free : TEet_Descriptor_Mem_Free_Callback;
          str_alloc : TEet_Descriptor_Str_Alloc_Callback;
          str_free : TEet_Descriptor_Str_Free_Callback;
          list_next : TEet_Descriptor_List_Next_Callback;
          list_append : TEet_Descriptor_List_Append_Callback;
          list_data : TEet_Descriptor_List_Data_Callback;
          list_free : TEet_Descriptor_List_Free_Callback;
          hash_foreach : TEet_Descriptor_Hash_Foreach_Callback;
          hash_add : TEet_Descriptor_Hash_Add_Callback;
          hash_free : TEet_Descriptor_Hash_Free_Callback;
          str_direct_alloc : TEet_Descriptor_Str_Direct_Alloc_Callback;
          str_direct_free : TEet_Descriptor_Str_Direct_Free_Callback;
          type_get : TEet_Descriptor_Type_Get_Callback;
          type_set : TEet_Descriptor_Type_Set_Callback;
          array_alloc : TEet_Descriptor_Array_Alloc_Callback;
          array_free : TEet_Descriptor_Array_Free_Callback;
        end;
    end;

{*
 * @
  }
{*
 *
 * @ingroup Eet_Data_Group
 * @deprecated use eet_data_descriptor_stream_new() or
 *             eet_data_descriptor_file_new()
 * @brief Creates a new empty data structure descriptor.
 * @param name The string name of this data structure (most be a
 *        global constant and never change).
 * @param size The size of the struct (in bytes).
 * @param func_list_next The function to get the next list node.
 * @param func_list_append The function to append a member to a list.
 * @param func_list_data The function to get the data from a list node.
 * @param func_list_free The function to free an entire linked list.
 * @param func_hash_foreach The function to iterate through all
 *        hash table entries.
 * @param func_hash_add The function to add a member to a hash table.
 * @param func_hash_free The function to free an entire hash table.
 * @return A new empty data descriptor.
 *
 * This function creates a new data descriptor and returns a handle to the
 * new data descriptor. On creation it will be empty, containing no contents
 * describing anything other than the shell of the data structure.
 *
 * You add structure members to the data descriptor using the macros
 * EET_DATA_DESCRIPTOR_ADD_BASIC(), EET_DATA_DESCRIPTOR_ADD_SUB() and
 * EET_DATA_DESCRIPTOR_ADD_LIST(), depending on what type of member you are
 * adding to the description.
 *
 * Once you have described all the members of a struct you want loaded, or
 * saved eet can load and save those members for you, encode them into
 * endian-independent serialised data chunks for transmission across a
 * a network or more.
 *
 * The function pointers to the list and hash table functions are only
 * needed if you use those data types, else you can pass NULL instead.
 *
 * @since 1.0.0
 *
  }
{xxxxxxxxxx    EINA_DEPRECATED }(* Const before type ignored *)

function eet_data_descriptor_new(name:Pchar; size:longint; func_list_next:TEet_Descriptor_List_Next_Callback; func_list_append:TEet_Descriptor_List_Append_Callback; func_list_data:TEet_Descriptor_List_Data_Callback; 
           func_list_free:TEet_Descriptor_List_Free_Callback; func_hash_foreach:TEet_Descriptor_Hash_Foreach_Callback; func_hash_add:TEet_Descriptor_Hash_Add_Callback; func_hash_free:TEet_Descriptor_Hash_Free_Callback):PEet_Data_Descriptor;cdecl;external;
{
 * FIXME:
 *
 * moving to this api from the old above. this will break things when the
 * move happens - but be warned
  }
{xxxxxxxxxx    EINA_DEPRECATED }(* Const before type ignored *)
function eet_data_descriptor2_new(eddc:PEet_Data_Descriptor_Class):PEet_Data_Descriptor;cdecl;external;
{xxxxxxxxxx    EINA_DEPRECATED }(* Const before type ignored *)
function eet_data_descriptor3_new(eddc:PEet_Data_Descriptor_Class):PEet_Data_Descriptor;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * This function creates a new data descriptor and returns a handle to the
 * new data descriptor. On creation it will be empty, containing no contents
 * describing anything other than the shell of the data structure.
 * @param eddc The class from where to create the data descriptor.
 * @return A handle to the new data descriptor.
 *
 * You add structure members to the data descriptor using the macros
 * EET_DATA_DESCRIPTOR_ADD_BASIC(), EET_DATA_DESCRIPTOR_ADD_SUB() and
 * EET_DATA_DESCRIPTOR_ADD_LIST(), depending on what type of member you are
 * adding to the description.
 *
 * Once you have described all the members of a struct you want loaded or
 * saved, eet can load and save those members for you, encode them into
 * endian-independent serialised data chunks for transmission across a
 * network or more.
 *
 * This function specially ignores str_direct_alloc and str_direct_free. It
 * is useful when the eet_data you are reading doesn't have a dictionary,
 * like network stream or IPC. It also mean that all string will be allocated
 * and duplicated in memory.
 *
 * @since 1.2.3
  }
(* Const before type ignored *)
function eet_data_descriptor_stream_new(eddc:PEet_Data_Descriptor_Class):PEet_Data_Descriptor;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * This function creates a new data descriptor and returns a handle to the
 * new data descriptor. On creation it will be empty, containing no contents
 * describing anything other than the shell of the data structure.
 * @param eddc The class from where to create the data descriptor.
 * @return A handle to the new data descriptor.
 *
 * You add structure members to the data descriptor using the macros
 * EET_DATA_DESCRIPTOR_ADD_BASIC(), EET_DATA_DESCRIPTOR_ADD_SUB() and
 * EET_DATA_DESCRIPTOR_ADD_LIST(), depending on what type of member you are
 * adding to the description.
 *
 * Once you have described all the members of a struct you want loaded or
 * saved, eet can load and save those members for you, encode them into
 * endian-independent serialised data chunks for transmission across a
 * a network or more.
 *
 * This function uses str_direct_alloc and str_direct_free. It is
 * useful when the eet_data you are reading come from a file and
 * have a dictionary. This will reduce memory use and improve the
 * possibility for the OS to page this string out.
 * However, the load speed and memory saving comes with some drawbacks to keep
 * in mind. If you never modify the contents of the structures loaded from
 * the file, all you need to remember is that closing the eet file will make
 * the strings go away. On the other hand, should you need to free a string,
 * before doing so you have to verify that it's not part of the eet dictionary.
 * You can do this in the following way, assuming @p ef is a valid Eet_File
 * and @p str is a string loaded from said file.
 *
 * @code
 * void eet_string_free(Eet_File *ef, const char *str)
 * 
 *    Eet_Dictionary *dict = eet_dictionary_get(ef);
 *    if (dict && eet_dictionary_string_check(dict, str))
 *      
 *         // The file contains a dictionary and the given string is a part of
 *         // of it, so we can't free it, just return.
 *         return;
 *      
 *    // We assume eina_stringshare was used on the descriptor
 *    eina_stringshare_del(str);
 * 
 * @endcode
 *
 * @since 1.2.3
  }
(* Const before type ignored *)
function eet_data_descriptor_file_new(eddc:PEet_Data_Descriptor_Class):PEet_Data_Descriptor;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * This function is an helper that set all the parameters of an
 * Eet_Data_Descriptor_Class correctly when you use Eina data type
 * with a stream.
 * @param eddc The Eet_Data_Descriptor_Class you want to set.
 * @param eddc_size The size of the Eet_Data_Descriptor_Class at the compilation time.
 * @param name The name of the structure described by this class.
 * @param size The size of the structure described by this class.
 * @return @c EINA_TRUE if the structure was correctly set (The only
 *         reason that could make it fail is if you did give wrong
 *         parameter).
 *
 * @note Unless there's a very specific reason to use this function directly,
 * the EET_EINA_STREAM_DATA_DESCRIPTOR_CLASS_SET macro is recommended.
 *
 * @since 1.2.3
  }
(* Const before type ignored *)
function eet_eina_stream_data_descriptor_class_set(eddc:PEet_Data_Descriptor_Class; eddc_size:dword; name:Pchar; size:longint):TEina_Bool;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * This macro is an helper that set all the parameter of an
 * Eet_Data_Descriptor_Class correctly when you use Eina data type
 * with stream.
 * @param clas The Eet_Data_Descriptor_Class you want to set.
 * @param type The type of the structure described by this class.
 * @return EINA_TRUE if the structure was correctly set (The only
 *         reason that could make it fail is if you did give wrong
 *         parameter).
 *
 * @see eet_data_descriptor_stream_new
 * @since 1.2.3
  }
{*
 * @ingroup Eet_Data_Group
 * This function is an helper that set all the parameter of an
 * Eet_Data_Descriptor_Class correctly when you use Eina data type
 * with a file.
 * @param eddc The Eet_Data_Descriptor_Class you want to set.
 * @param eddc_size The size of the Eet_Data_Descriptor_Class at the compilation time.
 * @param name The name of the structure described by this class.
 * @param size The size of the structure described by this class.
 * @return @c EINA_TRUE if the structure was correctly set (The only
 *         reason that could make it fail is if you did give wrong
 *         parameter).
 *
 * @note Unless there's a very specific reason to use this function directly,
 * the EET_EINA_FILE_DATA_DESCRIPTOR_CLASS_SET macro is recommended.
 *
 * @since 1.2.3
  }
(* Const before type ignored *)
function eet_eina_file_data_descriptor_class_set(eddc:PEet_Data_Descriptor_Class; eddc_size:dword; name:Pchar; size:longint):TEina_Bool;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * This macro is an helper that set all the parameter of an
 * Eet_Data_Descriptor_Class correctly when you use Eina data type
 * with file.
 * @param clas The Eet_Data_Descriptor_Class you want to set.
 * @param type The type of the structure described by this class.
 * @return @c EINA_TRUE if the structure was correctly set (The only
 *         reason that could make it fail is if you did give wrong
 *         parameter).
 *
 * @see eet_data_descriptor_file_new
 * @since 1.2.3
  }
{*
 * @ingroup Eet_Data_Group
 * @brief This function frees a data descriptor when it is not needed anymore.
 * @param edd The data descriptor to free.
 *
 * This function takes a data descriptor handle as a parameter and frees all
 * data allocated for the data descriptor and the handle itself. After this
 * call the descriptor is no longer valid.
 *
 * @since 1.0.0
  }
procedure eet_data_descriptor_free(edd:PEet_Data_Descriptor);cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * @brief This function returns the name of a data descriptor.
 * @param edd The data descriptor to get name.
 * @return The name of the data descriptor.
 *
 * @since 1.8.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_descriptor_name_get(edd:PEet_Data_Descriptor):Pchar;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * @brief This function is an internal used by macros.
 *
 * This function is used by macros EET_DATA_DESCRIPTOR_ADD_BASIC(),
 * EET_DATA_DESCRIPTOR_ADD_SUB() and EET_DATA_DESCRIPTOR_ADD_LIST(). It is
 * complex to use by hand and should be left to be used by the macros, and
 * thus is not documented.
 *
 * @param edd The data descriptor handle to add element (member).
 * @param name The name of element to be serialized.
 * @param type The type of element to be serialized, like
 *        #EET_T_INT. If #EET_T_UNKNOW, then it is considered to be a
 *        group, list or hash.
 * @param group_type If element type is #EET_T_UNKNOW, then the @p
 *        group_type will specify if it is a list (#EET_G_LIST),
 *        array (#EET_G_ARRAY) and so on. If #EET_G_UNKNOWN, then
 *        the member is a subtype (pointer to another type defined by
 *        another #Eet_Data_Descriptor).
 * @param offset byte offset inside the source memory to be serialized.
 * @param count number of elements (if #EET_G_ARRAY or #EET_G_VAR_ARRAY).
 * @param counter_name variable that defines the name of number of elements.
 * @param subtype If contains a subtype, then its data descriptor.
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
{ int                  count_offset,  }
(* Const before type ignored *)
procedure eet_data_descriptor_element_add(edd:PEet_Data_Descriptor; name:Pchar; _type:longint; group_type:longint; offset:longint; 
            count:longint; counter_name:Pchar; subtype:PEet_Data_Descriptor);cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * @brief Reads a data structure from an eet file and decodes it.
 * @param ef The eet file handle to read from.
 * @param edd The data descriptor handle to use when decoding.
 * @param name The key the data is stored under in the eet file.
 * @return A pointer to the decoded data structure.
 *
 * This function decodes a data structure stored in an eet file, returning
 * a pointer to it if it decoded successfully, or NULL on failure. This
 * can save a programmer dozens of hours of work in writing configuration
 * file parsing and writing code, as eet does all that work for the program
 * and presents a program-friendly data structure, just as the programmer
 * likes. Eet can handle members being added or deleted from the data in
 * storage and safely zero-fills unfilled members if they were not found
 * in the data. It checks sizes and headers whenever it reads data, allowing
 * the programmer to not worry about corrupt data.
 *
 * Once a data structure has been described by the programmer with the
 * fields they wish to save or load, storing or retrieving a data structure
 * from an eet file, or from a chunk of memory is as simple as a single
 * function call.
 *
 * @see eet_data_read_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_data_read(ef:PEet_File; edd:PEet_Data_Descriptor; name:Pchar):pointer;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * @brief Writes a data structure from memory and store in an eet file.
 * @param ef The eet file handle to write to.
 * @param edd The data descriptor to use when encoding.
 * @param name The key to store the data under in the eet file.
 * @param data A pointer to the data structure to save and encode.
 * @param compress Compression flags for storage.
 * @return bytes Written on successful write, @c 0 on failure.
 *
 * This function is the reverse of eet_data_read(), saving a data structure
 * to an eet file. The file must have been opening in write mode and the data
 * will be kept in memory until the file is either closed or eet_sync() is
 * called to flush any unwritten changes.
 *
 * @see eet_data_write_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_write(ef:PEet_File; edd:PEet_Data_Descriptor; name:Pchar; data:pointer; compress:longint):longint;cdecl;external;
{*
 *  @typedef Eet_Data_Descriptor_Class
 *
 * Callback protoype for Eet_Dump
 *
 * @param data To passe to the callback
 * @param str The string to dump
 *
  }
(* Const before type ignored *)
type

  TEet_Dump_Callback = procedure (data:pointer; str:Pchar);cdecl;
{*
 * @ingroup Eet_Data_Group
 * @brief Dumps an eet encoded data structure into ascii text
 * @param data_in The pointer to the data to decode into a struct.
 * @param size_in The size of the data pointed to in bytes.
 * @param dumpfunc The function to call passed a string when new
 *        data is converted to text
 * @param dumpdata The data to pass to the @p dumpfunc callback.
 * @return @c 1 on success, @c 0 on failure
 *
 * This function will take a chunk of data encoded by
 * eet_data_descriptor_encode() and convert it into human readable
 * ascii text.  It does this by calling the @p dumpfunc callback
 * for all new text that is generated. This callback should append
 * to any existing text buffer and will be passed the pointer @p
 * dumpdata as a parameter as well as a string with new text to be
 * appended.
 *
 * Example:
 *
 * @code
 * void output(void *data, const char *string)
 * 
 *   printf("%s", string);
 * 
 *
 * void dump(const char *file)
 * 
 *   FILE *f;
 *   int len;
 *   void *data;
 *
 *   f = fopen(file, "rb");
 *   fseek(f, 0, SEEK_END);
 *   len = ftell(f);
 *   rewind(f);
 *   data = malloc(len);
 *   fread(data, len, 1, f);
 *   fclose(f);
 *   eet_data_text_dump(data, len, output, NULL);
 * 
 * @endcode
 *
 * @see eet_data_text_dump_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)

function eet_data_text_dump(data_in:pointer; size_in:longint; dumpfunc:TEet_Dump_Callback; dumpdata:pointer):longint;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * @brief Takes an ascii encoding from eet_data_text_dump() and re-encode in binary.
 * @param text The pointer to the string data to parse and encode.
 * @param textlen The size of the string in bytes (not including 0
 *        byte terminator).
 * @param size_ret This gets filled in with the encoded data blob
 *        size in bytes.
 * @return The encoded data on success, NULL on failure.
 *
 * This function will parse the string pointed to by @p text and return
 * an encoded data lump the same way eet_data_descriptor_encode() takes an
 * in-memory data struct and encodes into a binary blob. @p text is a normal
 * C string.
 *
 * @see eet_data_text_undump_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_data_text_undump(text:Pchar; textlen:longint; size_ret:Plongint):pointer;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * @brief Dumps an eet encoded data structure from an eet file into ascii text.
 * @param ef A valid eet file handle.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param dumpfunc The function to call passed a string when new
 *        data is converted to text
 * @param dumpdata The data to pass to the @p dumpfunc callback.
 * @return @c 1 on success, @c 0 on failure
 *
 * This function will take an open and valid eet file from
 * eet_open() request the data encoded by
 * eet_data_descriptor_encode() corresponding to the key @p name
 * and convert it into human readable ascii text. It does this by
 * calling the @p dumpfunc callback for all new text that is
 * generated. This callback should append to any existing text
 * buffer and will be passed the pointer @p dumpdata as a parameter
 * as well as a string with new text to be appended.
 *
 * @see eet_data_dump_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_data_dump(ef:PEet_File; name:Pchar; dumpfunc:TEet_Dump_Callback; dumpdata:pointer):longint;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * @brief Takes an ascii encoding from eet_data_dump() and re-encode in binary.
 * @param ef A valid eet file handle.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param text The pointer to the string data to parse and encode.
 * @param textlen The size of the string in bytes (not including 0
 *        byte terminator).
 * @param compress Compression flags (1 == compress, 0 = don't compress).
 * @return @c 1 on success, @c 0 on failure
 *
 * This function will parse the string pointed to by @p text,
 * encode it the same way eet_data_descriptor_encode() takes an
 * in-memory data struct and encodes into a binary blob.
 *
 * The data (optionally compressed) will be in ram, pending a flush to
 * disk (it will stay in ram till the eet file handle is closed though).
 *
 * @see eet_data_undump_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_undump(ef:PEet_File; name:Pchar; text:Pchar; textlen:longint; compress:longint):longint;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * @brief Decodes a data structure from an arbitrary location in memory.
 * @param edd The data descriptor to use when decoding.
 * @param data_in The pointer to the data to decode into a struct.
 * @param size_in The size of the data pointed to in bytes.
 * @return NULL on failure, or a valid decoded struct pointer on success.
 *
 * This function will decode a data structure that has been encoded using
 * eet_data_descriptor_encode(), and return a data structure with all its
 * elements filled out, if successful, or NULL on failure.
 *
 * The data to be decoded is stored at the memory pointed to by @p data_in,
 * and is described by the descriptor pointed to by @p edd. The data size is
 * passed in as the value to @p size_in, and must be greater than 0 to
 * succeed.
 *
 * This function is useful for decoding data structures delivered to the
 * application by means other than an eet file, such as an IPC or socket
 * connection, raw files, shared memory etc.
 *
 * Please see eet_data_read() for more information.
 *
 * @see eet_data_descriptor_decode_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_data_descriptor_decode(edd:PEet_Data_Descriptor; data_in:pointer; size_in:longint):pointer;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * @brief Encodes a dsata struct to memory and return that encoded data.
 * @param edd The data descriptor to use when encoding.
 * @param data_in The pointer to the struct to encode into data.
 * @param size_ret pointer to the an int to be filled with the decoded size.
 * @return NULL on failure, or a valid encoded data chunk on success.
 *
 * This function takes a data structure in memory and encodes it into a
 * serialised chunk of data that can be decoded again by
 * eet_data_descriptor_decode(). This is useful for being able to transmit
 * data structures across sockets, pipes, IPC or shared file mechanisms,
 * without having to worry about memory space, machine type, endianness etc.
 *
 * The parameter @p edd must point to a valid data descriptor, and
 * @p data_in must point to the right data structure to encode. If not, the
 * encoding may fail.
 *
 * On success a non NULL valid pointer is returned and what @p size_ret
 * points to is set to the size of this decoded data, in bytes. When the
 * encoded data is no longer needed, call free() on it. On failure NULL is
 * returned and what @p size_ret points to is set to 0.
 *
 * Please see eet_data_write() for more information.
 *
 * @see eet_data_descriptor_encode_cipher()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
function eet_data_descriptor_encode(edd:PEet_Data_Descriptor; data_in:pointer; size_ret:Plongint):pointer;cdecl;external;
{*
 * @ingroup Eet_Data_Group
 * @brief Adds a basic data element to a data descriptor.
 * @param edd The data descriptor to add the type to.
 * @param struct_type The type of the struct.
 * @param name The string name to use to encode/decode this member
 *        (must be a constant global and never change).
 * @param member The struct member itself to be encoded.
 * @param type The type of the member to encode.
 *
 * This macro is a convenience macro provided to add a member to
 * the data descriptor @p edd. The type of the structure is
 * provided as the @p struct_type parameter (for example: struct
 * my_struct). The @p name parameter defines a string that will be
 * used to uniquely name that member of the struct (it is suggested
 * to use the struct member itself).  The @p member parameter is
 * the actual struct member itself (for example: values), and @p type is the
 * basic data type of the member which must be one of: EET_T_CHAR, EET_T_SHORT,
 * EET_T_INT, EET_T_LONG_LONG, EET_T_FLOAT, EET_T_DOUBLE, EET_T_UCHAR,
 * EET_T_USHORT, EET_T_UINT, EET_T_ULONG_LONG or EET_T_STRING.
 *
 * @since 1.0.0
  }
{*
 * @ingroup Eet_Data_Group
 * @brief Adds a sub-element type to a data descriptor.
 * @param edd The data descriptor to add the type to.
 * @param struct_type The type of the struct.
 * @param name The string name to use to encode/decode this member
 *        (must be a constant global and never change).
 * @param member The struct member itself to be encoded.
 * @param subtype The type of sub-type struct to add.
 *
 * This macro lets you easily add a sub-type (a struct that's pointed to
 * by this one). All the parameters are the same as for
 * EET_DATA_DESCRIPTOR_ADD_BASIC(), with the @p subtype being the exception.
 * This must be the data descriptor of the struct that is pointed to by
 * this element.
 *
 * @since 1.0.0
  }
{*
 * @defgroup Eet_Data_Cipher_Group Eet Data Serialization using A Ciphers
 * @ingroup Eet_Data_Group
 *
 * Most of the @ref Eet_Data_Group have alternative versions that
 * accounts for ciphers to protect their content.
 *
 * @see @ref Eet_Cipher_Group
 *
  }
{*
 * @ingroup Eet_Data_Cipher_Group
 * @brief Reads a data structure from an eet file and decodes it using a cipher.
 * @param ef The eet file handle to read from.
 * @param edd The data descriptor handle to use when decoding.
 * @param name The key the data is stored under in the eet file.
 * @param cipher_key The key to use as cipher.
 * @return A pointer to the decoded data structure.
 *
 * This function decodes a data structure stored in an eet file, returning
 * a pointer to it if it decoded successfully, or NULL on failure. This
 * can save a programmer dozens of hours of work in writing configuration
 * file parsing and writing code, as eet does all that work for the program
 * and presents a program-friendly data structure, just as the programmer
 * likes. Eet can handle members being added or deleted from the data in
 * storage and safely zero-fills unfilled members if they were not found
 * in the data. It checks sizes and headers whenever it reads data, allowing
 * the programmer to not worry about corrupt data.
 *
 * Once a data structure has been described by the programmer with the
 * fields they wish to save or load, storing or retrieving a data structure
 * from an eet file, or from a chunk of memory is as simple as a single
 * function call.
 *
 * @see eet_data_read()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_read_cipher(ef:PEet_File; edd:PEet_Data_Descriptor; name:Pchar; cipher_key:Pchar):pointer;cdecl;external;
{*
 * @ingroup Eet_Data_Cipher_Group
 * @brief Reads a data structure from an eet file and decodes it into a buffer using a cipher.
 * @param ef The eet file handle to read from.
 * @param edd The data descriptor handle to use when decoding.
 * @param name The key the data is stored under in the eet file.
 * @param cipher_key The key to use as cipher.
 * @param buffer Buffer.
 * @param buffer_size The buffer size.
 * @return A pointer to buffer if successful, and NULL on error.
 *
 * This function decodes a data structure stored in an eet file, returning
 * a pointer to it if it decoded successfully, or NULL on failure. This
 * can save a programmer dozens of hours of work in writing configuration
 * file parsing and writing code, as eet does all that work for the program
 * and presents a program-friendly data structure, just as the programmer
 * likes. Eet can handle members being added or deleted from the data in
 * storage and safely zero-fills unfilled members if they were not found
 * in the data. It checks sizes and headers whenever it reads data, allowing
 * the programmer to not worry about corrupt data.
 *
 * Once a data structure has been described by the programmer with the
 * fields they wish to save or load, storing or retrieving a data structure
 * from an eet file, or from a chunk of memory is as simple as a single
 * function call.
 *
 * @see eet_data_read_cipher()
 *
 * @since 1.10.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_read_cipher_buffer(ef:PEet_File; edd:PEet_Data_Descriptor; name:Pchar; cipher_key:Pchar; buffer:Pchar; 
           buffer_size:longint):pointer;cdecl;external;
{*
 * @ingroup Eet_Data_Cipher_Group
 * @brief Reads a data structure from an eet extended attribute and decodes it using a cipher.
 * @param filename The file to extract the extended attribute from.
 * @param attribute The attribute to get the data from.
 * @param edd The data descriptor handle to use when decoding.
 * @param cipher_key The key to use as cipher.
 * @return A pointer to the decoded data structure.
 *
 * This function decodes a data structure stored in an eet extended attribute,
 * returning a pointer to it if it decoded successfully, or NULL on failure.
 * Eet can handle members being added or deleted from the data in
 * storage and safely zero-fills unfilled members if they were not found
 * in the data. It checks sizes and headers whenever it reads data, allowing
 * the programmer to not worry about corrupt data.
 *
 * Once a data structure has been described by the programmer with the
 * fields they wish to save or load, storing or retrieving a data structure
 * from an eet file, from a chunk of memory or from an extended attribute
 * is as simple as a single function call.
 *
 * @since 1.5.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_xattr_cipher_get(filename:Pchar; attribute:Pchar; edd:PEet_Data_Descriptor; cipher_key:Pchar):pointer;cdecl;external;
{*
 * @ingroup Eet_Data_Cipher_Group
 * @brief Writes a data structure from memory and store in an eet file
 * using a cipher.
 * @param ef The eet file handle to write to.
 * @param edd The data descriptor to use when encoding.
 * @param name The key to store the data under in the eet file.
 * @param cipher_key The key to use as cipher.
 * @param data A pointer to the data structure to save and encode.
 * @param compress Compression flags for storage.
 * @return bytes written on successful write, 0 on failure.
 *
 * This function is the reverse of eet_data_read_cipher(), saving a data structure
 * to an eet file.
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_write_cipher(ef:PEet_File; edd:PEet_Data_Descriptor; name:Pchar; cipher_key:Pchar; data:pointer; 
           compress:longint):longint;cdecl;external;
{*
 * @ingroup Eet_Data_Cipher_Group
 * @brief Writes a data structure from memory and store in an eet extended attribute
 * using a cipher.
 * @param filename The file to write the extended attribute to.
 * @param attribute The attribute to store the data to.
 * @param edd The data descriptor to use when encoding.
 * @param cipher_key The key to use as cipher.
 * @param data A pointer to the data structure to save and encode.
 * @param flags The policy to use when setting the data.
 * @return EINA_TRUE on success, EINA_FALSE on failure.
 *
 * This function is the reverse of eet_data_xattr_cipher_get(), saving a data structure
 * to an eet extended attribute.
 *
 * @since 1.5.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_xattr_cipher_set(filename:Pchar; attribute:Pchar; edd:PEet_Data_Descriptor; cipher_key:Pchar; data:pointer; 
           flags:TEina_Xattr_Flags):TEina_Bool;cdecl;external;
{*
 * @ingroup Eet_Data_Cipher_Group
 * @brief Dumps an eet encoded data structure into ascii text using a cipher.
 * @param data_in The pointer to the data to decode into a struct.
 * @param cipher_key The key to use as cipher.
 * @param size_in The size of the data pointed to in bytes.
 * @param dumpfunc The function to call passed a string when new
 *        data is converted to text
 * @param dumpdata The data to pass to the @p dumpfunc callback.
 * @return @c 1 on success, @c 0 on failure
 *
 * This function will take a chunk of data encoded by
 * eet_data_descriptor_encode() and convert it into human readable
 * ascii text.  It does this by calling the @p dumpfunc callback
 * for all new text that is generated. This callback should append
 * to any existing text buffer and will be passed the pointer @p
 * dumpdata as a parameter as well as a string with new text to be
 * appended.
 *
 * Example:
 *
 * @code
 * void output(void *data, const char *string)
 * 
 *   printf("%s", string);
 * 
 *
 * void dump(const char *file)
 * 
 *   FILE *f;
 *   int len;
 *   void *data;
 *
 *   f = fopen(file, "rb");
 *   fseek(f, 0, SEEK_END);
 *   len = ftell(f);
 *   rewind(f);
 *   data = malloc(len);
 *   fread(data, len, 1, f);
 *   fclose(f);
 *   eet_data_text_dump_cipher(data, cipher_key, len, output, NULL);
 * 
 * @endcode
 *
 * @see eet_data_text_dump()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_text_dump_cipher(data_in:pointer; cipher_key:Pchar; size_in:longint; dumpfunc:TEet_Dump_Callback; dumpdata:pointer):longint;cdecl;external;
{*
 * @ingroup Eet_Data_Cipher_Group
 * @brief Takes an ascii encoding from eet_data_text_dump() and re-encode
 * in binary using a cipher.
 * @param text The pointer to the string data to parse and encode.
 * @param cipher_key The key to use as cipher.
 * @param textlen The size of the string in bytes (not including 0
 *        byte terminator).
 * @param size_ret This gets filled in with the encoded data blob
 *        size in bytes.
 * @return The encoded data on success, NULL on failure.
 *
 * This function will parse the string pointed to by @p text and return
 * an encoded data lump the same way eet_data_descriptor_encode() takes an
 * in-memory data struct and encodes into a binary blob. @p text is a normal
 * C string.
 *
 * @see eet_data_text_undump()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_text_undump_cipher(text:Pchar; cipher_key:Pchar; textlen:longint; size_ret:Plongint):pointer;cdecl;external;
{*
 * @ingroup Eet_Data_Cipher_Group
 * @brief Dumps an eet encoded data structure from an eet file into ascii
 * text using a cipher.
 * @param ef A valid eet file handle.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param cipher_key The key to use as cipher.
 * @param dumpfunc The function to call passed a string when new
 *        data is converted to text
 * @param dumpdata The data to pass to the @p dumpfunc callback.
 * @return @c 1 on success, @c 0 on failure
 *
 * This function will take an open and valid eet file from
 * eet_open() request the data encoded by
 * eet_data_descriptor_encode() corresponding to the key @p name
 * and convert it into human readable ascii text. It does this by
 * calling the @p dumpfunc callback for all new text that is
 * generated. This callback should append to any existing text
 * buffer and will be passed the pointer @p dumpdata as a parameter
 * as well as a string with new text to be appended.
 *
 * @see eet_data_dump()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_dump_cipher(ef:PEet_File; name:Pchar; cipher_key:Pchar; dumpfunc:TEet_Dump_Callback; dumpdata:pointer):longint;cdecl;external;
{*
 * @ingroup Eet_Data_Cipher_Group
 * @brief Takes an ascii encoding from eet_data_dump() and re-encode in
 * binary using a cipher.
 * @param ef A valid eet file handle.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param cipher_key The key to use as cipher.
 * @param text The pointer to the string data to parse and encode.
 * @param textlen The size of the string in bytes (not including 0
 *        byte terminator).
 * @param compress Compression flags (1 == compress, 0 = don't compress).
 * @return @c 1 on success, @c 0 on failure
 *
 * This function will parse the string pointed to by @p text,
 * encode it the same way eet_data_descriptor_encode() takes an
 * in-memory data struct and encodes into a binary blob.
 *
 * The data (optionally compressed) will be in ram, pending a flush to
 * disk (it will stay in ram till the eet file handle is closed though).
 *
 * @see eet_data_undump()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_undump_cipher(ef:PEet_File; name:Pchar; cipher_key:Pchar; text:Pchar; textlen:longint; 
           compress:longint):longint;cdecl;external;
{*
 * @ingroup Eet_Data_Cipher_Group
 * @brief Decodes a data structure from an arbitrary location in memory
 * using a cipher.
 * @param edd The data  descriptor to use when decoding.
 * @param data_in The pointer to the data to decode into a struct.
 * @param cipher_key The key to use as cipher.
 * @param size_in The size of the data pointed to in bytes.
 * @return NULL on failure, or a valid decoded struct pointer on success.
 *
 * This function will decode a data structure that has been encoded using
 * eet_data_descriptor_encode(), and return a data structure with all its
 * elements filled out, if successful, or NULL on failure.
 *
 * The data to be decoded is stored at the memory pointed to by @p data_in,
 * and is described by the descriptor pointed to by @p edd. The data size is
 * passed in as the value to @p size_in, and must be greater than 0 to
 * succeed.
 *
 * This function is useful for decoding data structures delivered to the
 * application by means other than an eet file, such as an IPC or socket
 * connection, raw files, shared memory etc.
 *
 * Please see eet_data_read() for more information.
 *
 * @see eet_data_descriptor_decode()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_descriptor_decode_cipher(edd:PEet_Data_Descriptor; data_in:pointer; cipher_key:Pchar; size_in:longint):pointer;cdecl;external;
{*
 * @ingroup Eet_Data_Cipher_Group
 * @brief Encodes a data struct to memory and return that encoded data
 * using a cipher.
 * @param edd The data descriptor to use when encoding.
 * @param data_in The pointer to the struct to encode into data.
 * @param cipher_key The key to use as cipher.
 * @param size_ret pointer to the an int to be filled with the decoded size.
 * @return NULL on failure, or a valid encoded data chunk on success.
 *
 * This function takes a data structure in memory and encodes it into a
 * serialised chunk of data that can be decoded again by
 * eet_data_descriptor_decode(). This is useful for being able to transmit
 * data structures across sockets, pipes, IPC or shared file mechanisms,
 * without having to worry about memory space, machine type, endianness etc.
 *
 * The parameter @p edd must point to a valid data descriptor, and
 * @p data_in must point to the right data structure to encode. If not, the
 * encoding may fail.
 *
 * On success a non NULL valid pointer is returned and what @p size_ret
 * points to is set to the size of this decoded data, in bytes. When the
 * encoded data is no longer needed, call free() on it. On failure NULL is
 * returned and what @p size_ret points to is set to 0.
 *
 * Please see eet_data_write() for more information.
 *
 * @see eet_data_descriptor_encode()
 *
 * @since 1.0.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_descriptor_encode_cipher(edd:PEet_Data_Descriptor; data_in:pointer; cipher_key:Pchar; size_ret:Plongint):pointer;cdecl;external;
{*
 * @defgroup Eet_Node_Group Low-level Serialization Structures.
 * @ingroup Eet
 *
 * Functions that create, destroy and manipulate serialization nodes
 * used by @ref Eet_Data_Group.
 *
 * @
  }
{*
 * @typedef Eet_Node
 * Opaque handle to manage serialization node.
  }
type
{*
 * @typedef Eet_Node_Data
 * Contains an union that can fit any kind of node.
  }
{*
 * @struct _Eet_Node_Data
 * Contains an union that can fit any kind of node.
  }
(* Const before type ignored *)
  PEet_Node_Data = ^TEet_Node_Data;
  TEet_Node_Data = record
      value : record
          case longint of
            0 : ( c : char );
            1 : ( s : smallint );
            2 : ( i : longint );
            3 : ( l : int64 );
            4 : ( f : single );
            5 : ( d : Tdouble );
            6 : ( uc : byte );
            7 : ( us : word );
            8 : ( ui : dword );
            9 : ( ul : qword );
            10 : ( str : Pchar );
          end;cdecl;
    end;

{*
 * @
  }
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new character node.
 * @param name Name of the node.
 * @param c Character value.
 * @return A new character node.
  }
(* Const before type ignored *)

function eet_node_char_new(name:Pchar; c:char):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new short node.
 * @param name Name of the node.
 * @param s Short value.
 * @return A new short node.
  }
(* Const before type ignored *)
function eet_node_short_new(name:Pchar; s:smallint):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new integer node.
 * @param name Name of the node.
 * @param i Integer value.
 * @return A new integer node.
  }
(* Const before type ignored *)
function eet_node_int_new(name:Pchar; i:longint):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new long long integer node.
 * @param name Name of the node.
 * @param l Long long integer value.
 * @return A new long long integer node.
  }
(* Const before type ignored *)
function eet_node_long_long_new(name:Pchar; l:int64):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new float node.
 * @param name Name of the node.
 * @param f Float value.
 * @return A new float node.
  }
(* Const before type ignored *)
function eet_node_float_new(name:Pchar; f:single):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new double node.
 * @param name Name of the node.
 * @param d Double value.
 * @return A new double node.
  }
(* Const before type ignored *)
function eet_node_double_new(name:Pchar; d:Tdouble):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new unsigned character node.
 * @param name Name of the node.
 * @param uc Unsigned char value.
 * @return A new unsigned char node.
  }
(* Const before type ignored *)
function eet_node_unsigned_char_new(name:Pchar; uc:byte):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new unsigned short node.
 * @param name Name of the node.
 * @param us Unsigned short value.
 * @return A new unsigned short node.
  }
(* Const before type ignored *)
function eet_node_unsigned_short_new(name:Pchar; us:word):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new unsigned integer node.
 * @param name Name of the node.
 * @param ui Unsigned integer value.
 * @return A new unsigned integer node.
  }
(* Const before type ignored *)
function eet_node_unsigned_int_new(name:Pchar; ui:dword):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new unsigned long long integer node.
 * @param name Name of the node.
 * @param l Unsigned long long integer value.
 * @return A new unsigned long long integer node.
  }
(* Const before type ignored *)
function eet_node_unsigned_long_long_new(name:Pchar; l:qword):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new string node.
 * @param name Name of the node.
 * @param str String value.
 * @return A new string node.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_node_string_new(name:Pchar; str:Pchar):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new inlined string node.
 * @param name Name of the node.
 * @param str String value.
 * @return A new inlined string node.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_node_inlined_string_new(name:Pchar; str:Pchar):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new empty node.
 * @param name Name of the node.
 * @return A new empty node.
  }
(* Const before type ignored *)
function eet_node_null_new(name:Pchar):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new list node.
 * @param name Name of the node.
 * @param nodes List of nodes.
 * @return A new list node.
  }
(* Const before type ignored *)
function eet_node_list_new(name:Pchar; nodes:PEina_List):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new array node.
 * @param name Name of the node.
 * @param count Number of nodes
 * @param nodes List of nodes.
 * @return A new array node.
  }
(* Const before type ignored *)
function eet_node_array_new(name:Pchar; count:longint; nodes:PEina_List):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new variable array node.
 * @param name Name of the node.
 * @param nodes List of nodes.
 * @return A new variable array node.
  }
(* Const before type ignored *)
function eet_node_var_array_new(name:Pchar; nodes:PEina_List):PEet_Node;cdecl;external;
{*
 * TODO FIX ME
 * @ingroup Eet_Node_Group
  }
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new hash node.
 * @param name Name of the node.
 * @param key Key of the node.
 * @param node The node.
 * @return A new hash node.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_node_hash_new(name:Pchar; key:Pchar; node:PEet_Node):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new struct node.
 * @param name Name of the node.
 * @param nodes List of nodes.
 * @return A new struct node.
  }
(* Const before type ignored *)
function eet_node_struct_new(name:Pchar; nodes:PEina_List):PEet_Node;cdecl;external;
{*
 * TODO FIX ME
 * @ingroup Eet_Node_Group
  }
{*
 * @ingroup Eet_Node_Group
 * @brief Creates a new struct child node.
 * @param parent The name of parent node.
 * @param child The child node.
 * @return A new struct child node.
  }
(* Const before type ignored *)
function eet_node_struct_child_new(parent:Pchar; child:PEet_Node):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Gets a node's child nodes.
 * @param node The node
 * @return The first child node which contains a pointer to the
 * next child node and the parent.
 * @since 1.5
  }
function eet_node_children_get(node:PEet_Node):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Gets the next node in a list of nodes.
 * @param node The node
 * @return A node which contains a pointer to the
 * next child node and the parent.
 * @since 1.5
  }
function eet_node_next_get(node:PEet_Node):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Gets the parent node of a node.
 * @param node The node
 * @return The parent node of @p node
 * @since 1.5
  }
function eet_node_parent_get(node:PEet_Node):PEet_Node;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Appends a "list" node TODO FIX ME.
 * @param parent The parent node.
 * @param name The name of new node.
 * @param child The child node.
  }
(* Const before type ignored *)
procedure eet_node_list_append(parent:PEet_Node; name:Pchar; child:PEet_Node);cdecl;external;
{*
 * TODO FIX ME
 * @ingroup Eet_Node_Group
 * @brief Appends a struct node.
 * @param parent The parent node.
 * @param name The name of new node.
 * @param child The child node.
  }
(* Const before type ignored *)
procedure eet_node_struct_append(parent:PEet_Node; name:Pchar; child:PEet_Node);cdecl;external;
{*
 * TODO FIX ME
 * @ingroup Eet_Node_Group
 * @brief Adds a hash node.
 * @param parent The parent node.
 * @param name Name of the node.
 * @param key Key of the node.
 * @param child The child node.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eet_node_hash_add(parent:PEet_Node; name:Pchar; key:Pchar; child:PEet_Node);cdecl;external;
{*
 * TODO FIX ME
 * @ingroup Eet_Node_Group
 * @brief Dumps a node from an eet encoded data structure into ascii text.
 * @param n The node.
 * @param dumplevel The dump level.
 * @param dumpfunc dumpfunc The function to call passed a string when new
 *        data is converted to text.
 * @param dumpdata The data to pass to the @p dumpfunc callback.
  }
procedure eet_node_dump(n:PEet_Node; dumplevel:longint; dumpfunc:TEet_Dump_Callback; dumpdata:pointer);cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Returns the type of a node.
 * @param node The node
 * @return The node's type (EET_T_$TYPE)
 * @since 1.5
  }
function eet_node_type_get(node:PEet_Node):longint;cdecl;external;
{*
 * @ingroup Eet_Node_Group
 * @brief Returns the node's data.
 * @param node The node
 * @return The data contained in the node
 * @since 1.5
  }
function eet_node_value_get(node:PEet_Node):PEet_Node_Data;cdecl;external;
{*
 * TODO FIX ME
 * @ingroup Eet_Node_Group
 * @brief Deletes the given node.
 * @param n The node.
  }
procedure eet_node_del(n:PEet_Node);cdecl;external;
{*
 * TODO FIX ME
 * @ingroup Eet_Node_Group
 * @brief Encodes node data using a cipher.
 * @param node The node.
 * @param cipher_key The key to use as cipher.
 * @param size_ret Number of bytes read from entry and returned.
  }
(* Const before type ignored *)
function eet_data_node_encode_cipher(node:PEet_Node; cipher_key:Pchar; size_ret:Plongint):pointer;cdecl;external;
{*
 * TODO FIX ME
 * @ingroup Eet_Node_Group
 * @brief Decodes node data using a cipher.
 * @param data_in The pointer to the data to decode into a struct.
 * @param cipher_key The key to use as cipher.
 * @param size_in The size of the data pointed to in bytes.
 * @return The decoded node.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_node_decode_cipher(data_in:pointer; cipher_key:Pchar; size_in:longint):PEet_Node;cdecl;external;
{*
 * TODO FIX ME
 * @ingroup Eet_Node_Group
 * @brief Reads a node data from an eet file and decodes it using a cipher.
 * @param ef The eet file handle to read from.
 * @param name The key the data is stored under in the eet file.
 * @param cipher_key The key to use as cipher.
 * @return A node to the decoded data structure.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_node_read_cipher(ef:PEet_File; name:Pchar; cipher_key:Pchar):PEet_Node;cdecl;external;
{*
 * TODO FIX ME
 * @ingroup Eet_Node_Group
 * @brief Writes node data to the named key in an eet file using a cipher.
 * @param ef The eet file handle to write to.
 * @param name The key to store the data under in the eet file.
 * @param cipher_key The key to use as cipher.
 * @param node The node.
 * @param compress Compression flags for storage.
 * @return bytes written on successful write, 0 on failure.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_data_node_write_cipher(ef:PEet_File; name:Pchar; cipher_key:Pchar; node:PEet_Node; compress:longint):longint;cdecl;external;
{ EXPERIMENTAL: THIS API MAY CHANGE IN THE FUTURE, USE IT ONLY IF YOU KNOW WHAT YOU ARE DOING.  }
{*
 * @typedef Eet_Node_Walk
 * Describes how to walk trees of #Eet_Node.
  }
type
{*
 * @typedef (*Eet_Node_Walk_Struct_Alloc_Callback)
 *
 * Callback prototype for Eet_Node_Walk_Struct_Alloc
 * @param type The allocation type
 * @param user_data The data passed by the user to the callback
  }
(* Const before type ignored *)

  PEet_Node_Walk_Struct_Alloc_Callback = ^TEet_Node_Walk_Struct_Alloc_Callback;
  TEet_Node_Walk_Struct_Alloc_Callback = function (_type:Pchar; user_data:pointer):pointer;cdecl;
{*
 * @typedef (*Eet_Node_Walk_Struct_Add_Callback)
 *
 * Callback prototype for Eet_Node_Walk_Struct_Add
 * @param parent The parent node
 * @param name The name for the new node
 * @param child The child node
 * @param user_data The data passed by the user to the callback
  }
(* Const before type ignored *)

  TEet_Node_Walk_Struct_Add_Callback = procedure (parent:pointer; name:Pchar; child:pointer; user_data:pointer);cdecl;
{*
 * @typedef (*Eet_Node_Walk_Array_Callback)
 *
 * Callback prototype for Eet_Node_Walk_Array
 * @param variable @c EINA_TRUE or @c EINA_FALSE
 * @param name A name
 * @param count A counter
 * @param user_data The data passed by the user to the callback
  }
(* Const before type ignored *)

  PEet_Node_Walk_Array_Callback = ^TEet_Node_Walk_Array_Callback;
  TEet_Node_Walk_Array_Callback = function (variable:TEina_Bool; name:Pchar; count:longint; user_data:pointer):pointer;cdecl;

  TEet_Node_Walk_Insert_Callback = procedure (array:pointer; index:longint; child:pointer; user_data:pointer);cdecl;
(* Const before type ignored *)

  PEet_Node_Walk_List_Callback = ^TEet_Node_Walk_List_Callback;
  TEet_Node_Walk_List_Callback = function (name:Pchar; user_data:pointer):pointer;cdecl;

  TEet_Node_Walk_Append_Callback = procedure (list:pointer; child:pointer; user_data:pointer);cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  PEet_Node_Walk_Hash_Callback = ^TEet_Node_Walk_Hash_Callback;
  TEet_Node_Walk_Hash_Callback = function (parent:pointer; name:Pchar; key:Pchar; value:pointer; user_data:pointer):pointer;cdecl;

  PEet_Node_Walk_Simple_Callback = ^TEet_Node_Walk_Simple_Callback;
  TEet_Node_Walk_Simple_Callback = function (_type:longint; data:PEet_Node_Data; user_data:pointer):pointer;cdecl;
{*
 * @struct _Eet_Node_Walk
 * Describes how to walk trees of #Eet_Node.
  }
  PEet_Node_Walk = ^TEet_Node_Walk;
  TEet_Node_Walk = record
      struct_alloc : TEet_Node_Walk_Struct_Alloc_Callback;cdecl;
      struct_add : TEet_Node_Walk_Struct_Add_Callback;
      array : TEet_Node_Walk_Array_Callback;
      insert : TEet_Node_Walk_Insert_Callback;
      list : TEet_Node_Walk_List_Callback;
      append : TEet_Node_Walk_Append_Callback;
      hash : TEet_Node_Walk_Hash_Callback;
      simple : TEet_Node_Walk_Simple_Callback;
    end;

{*
 * @ingroup Eet_Node_Group
 * Walks trees of #Eet_Node
  }
(* Const before type ignored *)

function eet_node_walk(parent:pointer; name:Pchar; root:PEet_Node; cb:PEet_Node_Walk; user_data:pointer):pointer;cdecl;external;
{***** }
{*
 * @defgroup Eet_Connection_Group Helper function to use eet over a network link
 * @ingroup Eet
 *
 * Function that reconstruct and prepare packet of @ref Eet_Data_Group to be send.
 *
  }
{*
 * @ingroup Eet_Connection_Group
 * @typedef Eet_Connection
 * Opaque handle to track paquet for a specific connection.
 *
  }
type
{*
 * @ingroup Eet_Connection_Group
 * @typedef Eet_Read_Cb
 * Called back when an @ref Eet_Data_Group has been received completely and could be used.
 *
  }
{ xxxxxxxxxxxxxxxxxxxxxx }
(* Const before type ignored *)

  TEet_Read_Cb = function (eet_data:pointer; size:Tsize_t; user_data:pointer):TEina_Bool;cdecl;
(* Const before type ignored *)

  TEet_Write_Cb = function (data:pointer; size:Tsize_t; user_data:pointer):TEina_Bool;cdecl;
{*
 * @ingroup Eet_Connection_Group
 * @brief Instanciates a new connection to track.
 * @param eet_read_cb Function to call when one Eet_Data packet has been fully assemble.
 * @param eet_write_cb Function to call when one Eet_Data packet is ready to be send over the wire.
 * @param user_data Pointer provided to both functions to be used as a context handler.
 * @return @c NULL on failure, or a valid Eet_Connection handler.
 *
 * For every connection to track you will need a separate Eet_Connection provider.
 *
 * @since 1.2.4
  }
(* Const before type ignored *)

function eet_connection_new(eet_read_cb:PEet_Read_Cb; eet_write_cb:PEet_Write_Cb; user_data:pointer):PEet_Connection;cdecl;external;
{*
 * @ingroup Eet_Connection_Group
 * @brief Processes a raw packet received over the link.
 * @param conn Connection handler to track.
 * @param data Raw data packet.
 * @param size The size of that packet.
 * @return @c 0 on complete success, any other value indicate where in the stream it got wrong (It could be before that packet).
 *
 * Every time you receive a packet related to your connection, you should pass
 * it to that function so that it could process and assemble packet has you
 * receive it. It will automatically call Eet_Read_Cb when one is fully received.
 *
 * @since 1.2.4
  }
(* Const before type ignored *)
function eet_connection_received(conn:PEet_Connection; data:pointer; size:Tsize_t):longint;cdecl;external;
{*
 * @ingroup Eet_Connection_Group
 * @brief Tells if the Eet_Connection as received some partial data.
 * @param conn Connection handler to request.
 * @return @c EINA_TRUE if there is some data pending inside, @c EINA_FALSE otherwise.
 *
 * Eet_Connection buffer data until the received data can be unserialized correctly. This
 * function let you know if there is some data inside that buffer waiting for more data to
 * be received before being processed.
 *
 * @since 1.7
  }
function eet_connection_empty(conn:PEet_Connection):TEina_Bool;cdecl;external;
{*
 * @ingroup Eet_Connection_Group
 * @brief Converts a complex structure and prepare it to be send.
 * @param conn Connection handler to track.
 * @param edd The data descriptor to use when encoding.
 * @param data_in The pointer to the struct to encode into data.
 * @param cipher_key The key to use as cipher.
 * @return @c EINA_TRUE if the data where correctly send, @c EINA_FALSE if they don't.
 *
 * This function serialize data_in with edd, assemble the packet and call
 * Eet_Write_Cb when ready. The data passed Eet_Write_Cb are temporary allocated
 * and will vanish just after the return of the callback.
 *
 * @see eet_data_descriptor_encode_cipher
 *
 * @since 1.2.4
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eet_connection_send(conn:PEet_Connection; edd:PEet_Data_Descriptor; data_in:pointer; cipher_key:Pchar):TEina_Bool;cdecl;external;
{*
 * @ingroup Eet_Connection_Group
 * @brief Converts a Eet_Node tree and prepare it to be send.
 * @param conn Connection handler to track.
 * @param node The data tree to use when encoding.
 * @param cipher_key The key to use as cipher.
 * @return @c EINA_TRUE if the data where correctly send, @c EINA_FALSE if they don't.
 *
 * This function serialize node, assemble the packet and call
 * Eet_Write_Cb when ready. The data passed Eet_Write_Cb are temporary allocated
 * and will vanish just after the return of the callback.
 *
 * @see eet_data_node_encode_cipher
 *
 * @since 1.2.4
  }
(* Const before type ignored *)
function eet_connection_node_send(conn:PEet_Connection; node:PEet_Node; cipher_key:Pchar):TEina_Bool;cdecl;external;
{*
 * @ingroup Eet_Connection_Group
 * @brief Closes a connection and lost its track.
 * @param conn Connection handler to close.
 * @param on_going Signal if a partial packet wasn't completed.
 * @return the user_data passed to both callback.
 *
 * @since 1.2.4
  }
function eet_connection_close(conn:PEet_Connection; on_going:PEina_Bool):pointer;cdecl;external;
{************************************************************************* }
{ C++ end of extern C conditionnal removed }
{ ifdef __cplusplus  }
{$endif}
{ ifndef _EET_H  }

implementation


end.
