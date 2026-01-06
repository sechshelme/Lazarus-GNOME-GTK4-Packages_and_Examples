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

  MagickCore private application programming interface declarations.
*/


// xxxxxxxxxxxxxxxxx testen
ssize_t pread(int,void *,size_t,off_t);
ssize_t pwrite(int,const void *,size_t,off_t);
extern size_t strlcpy(char *,const char *,size_t);
extern int vsnprintf(char *,size_t,const char *,va_list);


# define DirectorySeparator  "/"
# define DirectoryListSeparator  ':'
//xxxxxxx # define EditorOptions  " -title \"Edit Image Comment\" -e vi"
# define Exit  exit
# define IsBasenameSeparator(c)  ((c) == '/' ? MagickTrue : MagickFalse)
# define X11_PREFERENCES_PATH  "~/."

#endif
