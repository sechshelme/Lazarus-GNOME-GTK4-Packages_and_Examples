unit opencl;

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

  MagickCore OpenCL public methods.
 }
{$ifndef MAGICKCORE_OPENCL_H}
{$define MAGICKCORE_OPENCL_H}
{ OpenCL program modules  }
{ !!! This has to be the last entry !!!  }
type
  PMagickOpenCLProgram = ^TMagickOpenCLProgram;
  TMagickOpenCLProgram =  Longint;
  Const
    MAGICK_OPENCL_ACCELERATE = 0;
    MAGICK_OPENCL_NUM_PROGRAMS = 1;
;
type
  PImageMagickOpenCLMode = ^TImageMagickOpenCLMode;
  TImageMagickOpenCLMode =  Longint;
  Const
    MAGICK_OPENCL_OFF = 0;
    MAGICK_OPENCL_DEVICE_SELECT_AUTO = 1;
    MAGICK_OPENCL_DEVICE_SELECT_USER = 2;
    MAGICK_OPENCL_DEVICE_SELECT_AUTO_CLEAR_CACHE = 3;
;
{ Parameter type accepted by SetMagickOpenCLEnvParm and GetMagickOpenCLEnvParm  }
{ cl_device_id (from OpenCL)  }
{ MagickBooleanType  }
{ MagickBooleanType  }
{ MagickBooleanType  }
{ if true, disable the kernel binary cache  }
{ MagickBooleanType  }
{ if true, rerun microbenchmark in auto device selection  }
{ char*  }
{ char*  }
type
  PMagickOpenCLEnvParam = ^TMagickOpenCLEnvParam;
  TMagickOpenCLEnvParam =  Longint;
  Const
    MAGICK_OPENCL_ENV_PARAM_DEVICE = 0;
    MAGICK_OPENCL_ENV_PARAM_OPENCL_DISABLED = 1;
    MAGICK_OPENCL_ENV_PARAM_OPENCL_INITIALIZED = 2;
    MAGICK_OPENCL_ENV_PARAM_PROGRAM_CACHE_DISABLED = 3;
    MAGICK_OPENCL_ENV_PARAM_REGENERATE_PROFILE = 4;
    MAGICK_OPENCL_ENV_PARAM_PLATFORM_VENDOR = 5;
    MAGICK_OPENCL_ENV_PARAM_DEVICE_NAME = 6;
;
type
  PMagickCLEnv = ^TMagickCLEnv;
  TMagickCLEnv = PMagickCLEnv;

function GetMagickOpenCLEnvParam(para1:TMagickCLEnv; para2:TMagickOpenCLEnvParam; para3:Tsize_t; para4:pointer; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function InitImageMagickOpenCL(para1:TImageMagickOpenCLMode; para2:pointer; para3:pointer; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function InitOpenCLEnv(para1:TMagickCLEnv; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function SetMagickOpenCLEnvParam(para1:TMagickCLEnv; para2:TMagickOpenCLEnvParam; para3:Tsize_t; para4:pointer; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetDefaultOpenCLEnv:TMagickCLEnv;cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:47:39 ===


implementation



end.
