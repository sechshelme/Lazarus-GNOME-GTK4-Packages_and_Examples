
unit apriltag_pose;
interface

{
  Automatically converted by H2Pas 1.0.0 from apriltag_pose.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apriltag_pose.h
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
Papriltag_detection_info_t  = ^apriltag_detection_info_t;
Papriltag_detection_t  = ^apriltag_detection_t;
Papriltag_pose_t  = ^apriltag_pose_t;
Pdouble  = ^double;
Pmatd_t  = ^matd_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(** unsupported pragma#pragma once*)
{ C++ extern C conditionnal removed }
{$include "apriltag.h"}
{$include "common/matd.h"}
{ In meters. }
{ In pixels. }
{ In pixels. }
{ In pixels. }
{ In pixels. }
type
  Papriltag_detection_info_t = ^Tapriltag_detection_info_t;
  Tapriltag_detection_info_t = record
      det : Papriltag_detection_t;
      tagsize : Tdouble;
      fx : Tdouble;
      fy : Tdouble;
      cx : Tdouble;
      cy : Tdouble;
    end;

  Papriltag_pose_t = ^Tapriltag_pose_t;
  Tapriltag_pose_t = record
      R : Pmatd_t;
      t : Pmatd_t;
    end;
{*
 * Estimate pose of the tag using the homography method described in [1].
 * @outparam pose
  }

procedure estimate_pose_for_tag_homography(info:Papriltag_detection_info_t; pose:Papriltag_pose_t);cdecl;external;
{*
 * Estimate pose of the tag. This returns one or two possible poses for the
 * tag, along with the object-space error of each.
 *
 * This uses the homography method described in [1] for the initial estimate.
 * Then Orthogonal Iteration [2] is used to refine this estimate. Then [3] is
 * used to find a potential second local minima and Orthogonal Iteration is
 * used to refine this second estimate.
 *
 * [1]: E. Olson, “Apriltag: A robust and flexible visual fiducial system,” in
 *      2011 IEEE International Conference on Robotics and Automation,
 *      May 2011, pp. 3400–3407.
 * [2]: Lu, G. D. Hager and E. Mjolsness, "Fast and globally convergent pose
 *      estimation from video images," in IEEE Transactions on Pattern Analysis
 *      and Machine Intelligence, vol. 22, no. 6, pp. 610-622, June 2000.
 *      doi: 10.1109/34.862199
 * [3]: Schweighofer and A. Pinz, "Robust Pose Estimation from a Planar Target,"
 *      in IEEE Transactions on Pattern Analysis and Machine Intelligence,
 *      vol. 28, no. 12, pp. 2024-2030, Dec. 2006.  doi: 10.1109/TPAMI.2006.252
 *
 * @outparam err1, pose1, err2, pose2
  }
procedure estimate_tag_pose_orthogonal_iteration(info:Papriltag_detection_info_t; err1:Pdouble; pose1:Papriltag_pose_t; err2:Pdouble; pose2:Papriltag_pose_t; 
            nIters:longint);cdecl;external;
{*
 * Estimate tag pose.
 * This method is an easier to use interface to estimate_tag_pose_orthogonal_iteration.
 *
 * @outparam pose 
 * @return Object-space error of returned pose.
  }
function estimate_tag_pose(info:Papriltag_detection_info_t; pose:Papriltag_pose_t):Tdouble;cdecl;external;
{ C++ end of extern C conditionnal removed }

implementation


end.
