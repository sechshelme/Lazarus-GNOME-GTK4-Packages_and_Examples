unit opencl;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMagickOpenCLProgram = ^TMagickOpenCLProgram;
  TMagickOpenCLProgram = longint;

const
  MAGICK_OPENCL_ACCELERATE = 0;
  MAGICK_OPENCL_NUM_PROGRAMS = 1;

type
  PImageMagickOpenCLMode = ^TImageMagickOpenCLMode;
  TImageMagickOpenCLMode = longint;

const
  MAGICK_OPENCL_OFF = 0;
  MAGICK_OPENCL_DEVICE_SELECT_AUTO = 1;
  MAGICK_OPENCL_DEVICE_SELECT_USER = 2;
  MAGICK_OPENCL_DEVICE_SELECT_AUTO_CLEAR_CACHE = 3;

type
  PMagickOpenCLEnvParam = ^TMagickOpenCLEnvParam;
  TMagickOpenCLEnvParam = longint;

const
  MAGICK_OPENCL_ENV_PARAM_DEVICE = 0;
  MAGICK_OPENCL_ENV_PARAM_OPENCL_DISABLED = 1;
  MAGICK_OPENCL_ENV_PARAM_OPENCL_INITIALIZED = 2;
  MAGICK_OPENCL_ENV_PARAM_PROGRAM_CACHE_DISABLED = 3;
  MAGICK_OPENCL_ENV_PARAM_REGENERATE_PROFILE = 4;
  MAGICK_OPENCL_ENV_PARAM_PLATFORM_VENDOR = 5;
  MAGICK_OPENCL_ENV_PARAM_DEVICE_NAME = 6;

type
  PMagickCLEnv = ^TMagickCLEnv;
  TMagickCLEnv = PMagickCLEnv;

function GetMagickOpenCLEnvParam(para1: TMagickCLEnv; para2: TMagickOpenCLEnvParam; para3: Tsize_t; para4: pointer; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function InitImageMagickOpenCL(para1: TImageMagickOpenCLMode; para2: pointer; para3: pointer; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function InitOpenCLEnv(para1: TMagickCLEnv; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetMagickOpenCLEnvParam(para1: TMagickCLEnv; para2: TMagickOpenCLEnvParam; para3: Tsize_t; para4: pointer; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetDefaultOpenCLEnv: TMagickCLEnv; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:47:39 ===


implementation



end.
