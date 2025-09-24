unit Keyboard;

interface

uses
  fp_sfml;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{////////////////////////////////////////////////////////// }
{ }
{ SFML - Simple and Fast Multimedia Library }
{ Copyright (C) 2007-2023 Laurent Gomila (laurent@sfml-dev.org) }
{ }
{ This software is provided 'as-is', without any express or implied warranty. }
{ In no event will the authors be held liable for any damages arising from the use of this software. }
{ }
{ Permission is granted to anyone to use this software for any purpose, }
{ including commercial applications, and to alter it and redistribute it freely, }
{ subject to the following restrictions: }
{ }
{ 1. The origin of this software must not be misrepresented; }
{    you must not claim that you wrote the original software. }
{    If you use this software in a product, an acknowledgment }
{    in the product documentation would be appreciated but is not required. }
{ }
{ 2. Altered source versions must be plainly marked as such, }
{    and must not be misrepresented as being the original software. }
{ }
{ 3. This notice may not be removed or altered from any source distribution. }
{ }
{////////////////////////////////////////////////////////// }
{$ifndef SFML_KEYBOARD_H}
{$define SFML_KEYBOARD_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Window/Export.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Key codes }
{/ }
{/ The enumerators refer to the "localized" key; i.e. depending }
{/ on the layout set by the operating system, a key can be mapped }
{/ to `Y` or `Z`. }
{/ }
{////////////////////////////////////////////////////////// }
{/< Unhandled key }
{/< The A key }
{/< The B key }
{/< The C key }
{/< The D key }
{/< The E key }
{/< The F key }
{/< The G key }
{/< The H key }
{/< The I key }
{/< The J key }
{/< The K key }
{/< The L key }
{/< The M key }
{/< The N key }
{/< The O key }
{/< The P key }
{/< The Q key }
{/< The R key }
{/< The S key }
{/< The T key }
{/< The U key }
{/< The V key }
{/< The W key }
{/< The X key }
{/< The Y key }
{/< The Z key }
{/< The 0 key }
{/< The 1 key }
{/< The 2 key }
{/< The 3 key }
{/< The 4 key }
{/< The 5 key }
{/< The 6 key }
{/< The 7 key }
{/< The 8 key }
{/< The 9 key }
{/< The Escape key }
{/< The left Control key }
{/< The left Shift key }
{/< The left Alt key }
{/< The left OS specific key: window (Windows and Linux), apple (macOS), ... }
{/< The right Control key }
{/< The right Shift key }
{/< The right Alt key }
{/< The right OS specific key: window (Windows and Linux), apple (macOS), ... }
{/< The Menu key }
{/< The [ key }
{/< The ] key }
{/< The ; key }
{/< The , key }
{/< The . key }
{/< The ' key }
{/< The / key }
{/< The \ key }
{/< The ` key }
{/< The = key }
{/< The - key (hyphen) }
{/< The Space key }
{/< The Enter/Return key }
{/< The Backspace key }
{/< The Tabulation key }
{/< The Page up key }
{/< The Page down key }
{/< The End key }
{/< The Home key }
{/< The Insert key }
{/< The Delete key }
{/< The + key }
{/< The - key (minus, usually from numpad) }
{/< The * key }
{/< The / key }
{/< Left arrow }
{/< Right arrow }
{/< Up arrow }
{/< Down arrow }
{/< The numpad 0 key }
{/< The numpad 1 key }
{/< The numpad 2 key }
{/< The numpad 3 key }
{/< The numpad 4 key }
{/< The numpad 5 key }
{/< The numpad 6 key }
{/< The numpad 7 key }
{/< The numpad 8 key }
{/< The numpad 9 key }
{/< The F1 key }
{/< The F2 key }
{/< The F3 key }
{/< The F4 key }
{/< The F5 key }
{/< The F6 key }
{/< The F7 key }
{/< The F8 key }
{/< The F8 key }
{/< The F10 key }
{/< The F11 key }
{/< The F12 key }
{/< The F13 key }
{/< The F14 key }
{/< The F15 key }
{/< The Pause key }
{/< Keep last -- the total number of keyboard keys }
{ Deprecated values: }
{/< \deprecated Use Grave instead }
{/< \deprecated Use Hyphen instead }
{/< \deprecated Use Backspace instead }
{/< \deprecated Use Backslash instead }
{/< \deprecated Use Semicolon instead }
{/< \deprecated Use Enter instead }
{/< \deprecated Use Apostrophe instead }
type
  PsfKeyCode = ^TsfKeyCode;
  TsfKeyCode =  Longint;
  Const
    sfKeyUnknown = -(1);
    sfKeyA = (-(1))+1;
    sfKeyB = (-(1))+2;
    sfKeyC = (-(1))+3;
    sfKeyD = (-(1))+4;
    sfKeyE = (-(1))+5;
    sfKeyF = (-(1))+6;
    sfKeyG = (-(1))+7;
    sfKeyH = (-(1))+8;
    sfKeyI = (-(1))+9;
    sfKeyJ = (-(1))+10;
    sfKeyK = (-(1))+11;
    sfKeyL = (-(1))+12;
    sfKeyM = (-(1))+13;
    sfKeyN = (-(1))+14;
    sfKeyO = (-(1))+15;
    sfKeyP = (-(1))+16;
    sfKeyQ = (-(1))+17;
    sfKeyR = (-(1))+18;
    sfKeyS = (-(1))+19;
    sfKeyT = (-(1))+20;
    sfKeyU = (-(1))+21;
    sfKeyV = (-(1))+22;
    sfKeyW = (-(1))+23;
    sfKeyX = (-(1))+24;
    sfKeyY = (-(1))+25;
    sfKeyZ = (-(1))+26;
    sfKeyNum0 = (-(1))+27;
    sfKeyNum1 = (-(1))+28;
    sfKeyNum2 = (-(1))+29;
    sfKeyNum3 = (-(1))+30;
    sfKeyNum4 = (-(1))+31;
    sfKeyNum5 = (-(1))+32;
    sfKeyNum6 = (-(1))+33;
    sfKeyNum7 = (-(1))+34;
    sfKeyNum8 = (-(1))+35;
    sfKeyNum9 = (-(1))+36;
    sfKeyEscape = (-(1))+37;
    sfKeyLControl = (-(1))+38;
    sfKeyLShift = (-(1))+39;
    sfKeyLAlt = (-(1))+40;
    sfKeyLSystem = (-(1))+41;
    sfKeyRControl = (-(1))+42;
    sfKeyRShift = (-(1))+43;
    sfKeyRAlt = (-(1))+44;
    sfKeyRSystem = (-(1))+45;
    sfKeyMenu = (-(1))+46;
    sfKeyLBracket = (-(1))+47;
    sfKeyRBracket = (-(1))+48;
    sfKeySemicolon = (-(1))+49;
    sfKeyComma = (-(1))+50;
    sfKeyPeriod = (-(1))+51;
    sfKeyApostrophe = (-(1))+52;
    sfKeySlash = (-(1))+53;
    sfKeyBackslash = (-(1))+54;
    sfKeyGrave = (-(1))+55;
    sfKeyEqual = (-(1))+56;
    sfKeyHyphen = (-(1))+57;
    sfKeySpace = (-(1))+58;
    sfKeyEnter = (-(1))+59;
    sfKeyBackspace = (-(1))+60;
    sfKeyTab = (-(1))+61;
    sfKeyPageUp = (-(1))+62;
    sfKeyPageDown = (-(1))+63;
    sfKeyEnd = (-(1))+64;
    sfKeyHome = (-(1))+65;
    sfKeyInsert = (-(1))+66;
    sfKeyDelete = (-(1))+67;
    sfKeyAdd = (-(1))+68;
    sfKeySubtract = (-(1))+69;
    sfKeyMultiply = (-(1))+70;
    sfKeyDivide = (-(1))+71;
    sfKeyLeft = (-(1))+72;
    sfKeyRight = (-(1))+73;
    sfKeyUp = (-(1))+74;
    sfKeyDown = (-(1))+75;
    sfKeyNumpad0 = (-(1))+76;
    sfKeyNumpad1 = (-(1))+77;
    sfKeyNumpad2 = (-(1))+78;
    sfKeyNumpad3 = (-(1))+79;
    sfKeyNumpad4 = (-(1))+80;
    sfKeyNumpad5 = (-(1))+81;
    sfKeyNumpad6 = (-(1))+82;
    sfKeyNumpad7 = (-(1))+83;
    sfKeyNumpad8 = (-(1))+84;
    sfKeyNumpad9 = (-(1))+85;
    sfKeyF1 = (-(1))+86;
    sfKeyF2 = (-(1))+87;
    sfKeyF3 = (-(1))+88;
    sfKeyF4 = (-(1))+89;
    sfKeyF5 = (-(1))+90;
    sfKeyF6 = (-(1))+91;
    sfKeyF7 = (-(1))+92;
    sfKeyF8 = (-(1))+93;
    sfKeyF9 = (-(1))+94;
    sfKeyF10 = (-(1))+95;
    sfKeyF11 = (-(1))+96;
    sfKeyF12 = (-(1))+97;
    sfKeyF13 = (-(1))+98;
    sfKeyF14 = (-(1))+99;
    sfKeyF15 = (-(1))+100;
    sfKeyPause = (-(1))+101;
    sfKeyCount = (-(1))+102;
    sfKeyTilde = sfKeyGrave;
    sfKeyDash = sfKeyHyphen;
    sfKeyBack = sfKeyBackspace;
    sfKeyBackSlash = sfKeyBackslash;
    sfKeySemiColon = sfKeySemicolon;
    sfKeyReturn = sfKeyEnter;
    sfKeyQuote = sfKeyApostrophe;
;
{////////////////////////////////////////////////////////// }
{/ \brief Scancodes }
{/ }
{/ The enumerators are bound to a physical key and do not depend on }
{/ the keyboard layout used by the operating system. Usually, the AT-101 }
{/ keyboard can be used as reference for the physical position of the keys. }
{/ }
{////////////////////////////////////////////////////////// }
{!< Represents any scancode not present in this enum }
{!< Keyboard a and A key }
{!< Keyboard b and B key }
{!< Keyboard c and C key }
{!< Keyboard d and D key }
{!< Keyboard e and E key }
{!< Keyboard f and F key }
{!< Keyboard g and G key }
{!< Keyboard h and H key }
{!< Keyboard i and I key }
{!< Keyboard j and J key }
{!< Keyboard k and K key }
{!< Keyboard l and L key }
{!< Keyboard m and M key }
{!< Keyboard n and N key }
{!< Keyboard o and O key }
{!< Keyboard p and P key }
{!< Keyboard q and Q key }
{!< Keyboard r and R key }
{!< Keyboard s and S key }
{!< Keyboard t and T key }
{!< Keyboard u and U key }
{!< Keyboard v and V key }
{!< Keyboard w and W key }
{!< Keyboard x and X key }
{!< Keyboard y and Y key }
{!< Keyboard z and Z key }
{!< Keyboard 1 and ! key }
{!< Keyboard 2 and @ key }
{!< Keyboard 3 and # key }
{!< Keyboard 4 and $ key }
{!< Keyboard 5 and % key }
{!< Keyboard 6 and ^ key }
{!< Keyboard 7 and & key }
{!< Keyboard 8 and * key }
{!< Keyboard 9 and ) key }
{!< Keyboard 0 and ) key }
{!< Keyboard Enter/Return key }
{!< Keyboard Escape key }
{!< Keyboard Backspace key }
{!< Keyboard Tab key }
{!< Keyboard Space key }
{!< Keyboard - and _ key }
{!< Keyboard = and + }
{!< Keyboard [ and  key }
{!< Keyboard ] and  key }
{ For US keyboards mapped to key 29 (Microsoft Keyboard Scan Code Specification) }
{ For Non-US keyboards mapped to key 42 (Microsoft Keyboard Scan Code Specification) }
{ Typical language mappings: Belg:£µ` FrCa:<> Dan:*' Dutch:`´ Fren:µ* Ger:'# Ital:§ù LatAm:[` Nor:*@ Span:ç Swed:*' Swiss:$£ UK:~# Brazil:] }
{!< Keyboard \ and | key OR various keys for Non-US keyboards }
{!< Keyboard ; and : key }
{!< Keyboard ' and " key }
{!< Keyboard ` and ~ key }
{!< Keyboard , and < key }
{!< Keyboard . and > key }
{!< Keyboard / and ? key }
{!< Keyboard F1 key }
{!< Keyboard F2 key }
{!< Keyboard F3 key }
{!< Keyboard F4 key }
{!< Keyboard F5 key }
{!< Keyboard F6 key }
{!< Keyboard F7 key }
{!< Keyboard F8 key }
{!< Keyboard F9 key }
{!< Keyboard F10 key }
{!< Keyboard F11 key }
{!< Keyboard F12 key }
{!< Keyboard F13 key }
{!< Keyboard F14 key }
{!< Keyboard F15 key }
{!< Keyboard F16 key }
{!< Keyboard F17 key }
{!< Keyboard F18 key }
{!< Keyboard F19 key }
{!< Keyboard F20 key }
{!< Keyboard F21 key }
{!< Keyboard F22 key }
{!< Keyboard F23 key }
{!< Keyboard F24 key }
{!< Keyboard Caps %Lock key }
{!< Keyboard Print Screen key }
{!< Keyboard Scroll %Lock key }
{!< Keyboard Pause key }
{!< Keyboard Insert key }
{!< Keyboard Home key }
{!< Keyboard Page Up key }
{!< Keyboard Delete Forward key }
{!< Keyboard End key }
{!< Keyboard Page Down key }
{!< Keyboard Right Arrow key }
{!< Keyboard Left Arrow key }
{!< Keyboard Down Arrow key }
{!< Keyboard Up Arrow key }
{!< Keypad Num %Lock and Clear key }
{!< Keypad / key }
{!< Keypad * key }
{!< Keypad - key }
{!< Keypad + key }
{!< keypad = key }
{!< Keypad Enter/Return key }
{!< Keypad . and Delete key }
{!< Keypad 1 and End key }
{!< Keypad 2 and Down Arrow key }
{!< Keypad 3 and Page Down key }
{!< Keypad 4 and Left Arrow key }
{!< Keypad 5 key }
{!< Keypad 6 and Right Arrow key }
{!< Keypad 7 and Home key }
{!< Keypad 8 and Up Arrow key }
{!< Keypad 9 and Page Up key }
{!< Keypad 0 and Insert key }
{ For US keyboards doesn't exist }
{ For Non-US keyboards mapped to key 45 (Microsoft Keyboard Scan Code Specification) }
{ Typical language mappings: Belg:<\> FrCa:«°» Dan:<\> Dutch:]|[ Fren:<> Ger:<|> Ital:<> LatAm:<> Nor:<> Span:<> Swed:<|> Swiss:<\> UK:\| Brazil: \|. }
{!< Keyboard Non-US \ and | key }
{!< Keyboard Application key }
{!< Keyboard Execute key }
{!< Keyboard Mode Change key }
{!< Keyboard Help key }
{!< Keyboard Menu key }
{!< Keyboard Select key }
{!< Keyboard Redo key }
{!< Keyboard Undo key }
{!< Keyboard Cut key }
{!< Keyboard Copy key }
{!< Keyboard Paste key }
{!< Keyboard Volume Mute key }
{!< Keyboard Volume Up key }
{!< Keyboard Volume Down key }
{!< Keyboard Media Play Pause key }
{!< Keyboard Media Stop key }
{!< Keyboard Media Next Track key }
{!< Keyboard Media Previous Track key }
{!< Keyboard Left Control key }
{!< Keyboard Left Shift key }
{!< Keyboard Left Alt key }
{!< Keyboard Left System key }
{!< Keyboard Right Control key }
{!< Keyboard Right Shift key }
{!< Keyboard Right Alt key }
{!< Keyboard Right System key }
{!< Keyboard Back key }
{!< Keyboard Forward key }
{!< Keyboard Refresh key }
{!< Keyboard Stop key }
{!< Keyboard Search key }
{!< Keyboard Favorites key }
{!< Keyboard Home Page key }
{!< Keyboard Launch Application 1 key }
{!< Keyboard Launch Application 2 key }
{!< Keyboard Launch Mail key }
{!< Keyboard Launch Media Select key }
{!< Keep last -- the total number of scancodes }
type
  PsfScancode = ^TsfScancode;
  TsfScancode =  Longint;
  Const
    sfScanUnknown = -(1);
    sfScanA = 0;
    sfScanB = 1;
    sfScanC = 2;
    sfScanD = 3;
    sfScanE = 4;
    sfScanF = 5;
    sfScanG = 6;
    sfScanH = 7;
    sfScanI = 8;
    sfScanJ = 9;
    sfScanK = 10;
    sfScanL = 11;
    sfScanM = 12;
    sfScanN = 13;
    sfScanO = 14;
    sfScanP = 15;
    sfScanQ = 16;
    sfScanR = 17;
    sfScanS = 18;
    sfScanT = 19;
    sfScanU = 20;
    sfScanV = 21;
    sfScanW = 22;
    sfScanX = 23;
    sfScanY = 24;
    sfScanZ = 25;
    sfScanNum1 = 26;
    sfScanNum2 = 27;
    sfScanNum3 = 28;
    sfScanNum4 = 29;
    sfScanNum5 = 30;
    sfScanNum6 = 31;
    sfScanNum7 = 32;
    sfScanNum8 = 33;
    sfScanNum9 = 34;
    sfScanNum0 = 35;
    sfScanEnter = 36;
    sfScanEscape = 37;
    sfScanBackspace = 38;
    sfScanTab = 39;
    sfScanSpace = 40;
    sfScanHyphen = 41;
    sfScanEqual = 42;
    sfScanLBracket = 43;
    sfScanRBracket = 44;
    sfScanBackslash = 45;
    sfScanSemicolon = 46;
    sfScanApostrophe = 47;
    sfScanGrave = 48;
    sfScanComma = 49;
    sfScanPeriod = 50;
    sfScanSlash = 51;
    sfScanF1 = 52;
    sfScanF2 = 53;
    sfScanF3 = 54;
    sfScanF4 = 55;
    sfScanF5 = 56;
    sfScanF6 = 57;
    sfScanF7 = 58;
    sfScanF8 = 59;
    sfScanF9 = 60;
    sfScanF10 = 61;
    sfScanF11 = 62;
    sfScanF12 = 63;
    sfScanF13 = 64;
    sfScanF14 = 65;
    sfScanF15 = 66;
    sfScanF16 = 67;
    sfScanF17 = 68;
    sfScanF18 = 69;
    sfScanF19 = 70;
    sfScanF20 = 71;
    sfScanF21 = 72;
    sfScanF22 = 73;
    sfScanF23 = 74;
    sfScanF24 = 75;
    sfScanCapsLock = 76;
    sfScanPrintScreen = 77;
    sfScanScrollLock = 78;
    sfScanPause = 79;
    sfScanInsert = 80;
    sfScanHome = 81;
    sfScanPageUp = 82;
    sfScanDelete = 83;
    sfScanEnd = 84;
    sfScanPageDown = 85;
    sfScanRight = 86;
    sfScanLeft = 87;
    sfScanDown = 88;
    sfScanUp = 89;
    sfScanNumLock = 90;
    sfScanNumpadDivide = 91;
    sfScanNumpadMultiply = 92;
    sfScanNumpadMinus = 93;
    sfScanNumpadPlus = 94;
    sfScanNumpadEqual = 95;
    sfScanNumpadEnter = 96;
    sfScanNumpadDecimal = 97;
    sfScanNumpad1 = 98;
    sfScanNumpad2 = 99;
    sfScanNumpad3 = 100;
    sfScanNumpad4 = 101;
    sfScanNumpad5 = 102;
    sfScanNumpad6 = 103;
    sfScanNumpad7 = 104;
    sfScanNumpad8 = 105;
    sfScanNumpad9 = 106;
    sfScanNumpad0 = 107;
    sfScanNonUsBackslash = 108;
    sfScanApplication = 109;
    sfScanExecute = 110;
    sfScanModeChange = 111;
    sfScanHelp = 112;
    sfScanMenu = 113;
    sfScanSelect = 114;
    sfScanRedo = 115;
    sfScanUndo = 116;
    sfScanCut = 117;
    sfScanCopy = 118;
    sfScanPaste = 119;
    sfScanVolumeMute = 120;
    sfScanVolumeUp = 121;
    sfScanVolumeDown = 122;
    sfScanMediaPlayPause = 123;
    sfScanMediaStop = 124;
    sfScanMediaNextTrack = 125;
    sfScanMediaPreviousTrack = 126;
    sfScanLControl = 127;
    sfScanLShift = 128;
    sfScanLAlt = 129;
    sfScanLSystem = 130;
    sfScanRControl = 131;
    sfScanRShift = 132;
    sfScanRAlt = 133;
    sfScanRSystem = 134;
    sfScanBack = 135;
    sfScanForward = 136;
    sfScanRefresh = 137;
    sfScanStop = 138;
    sfScanSearch = 139;
    sfScanFavorites = 140;
    sfScanHomePage = 141;
    sfScanLaunchApplication1 = 142;
    sfScanLaunchApplication2 = 143;
    sfScanLaunchMail = 144;
    sfScanLaunchMediaSelect = 145;
    sfScancodeCount = 146;
;
{////////////////////////////////////////////////////////// }
{/ \brief Check if a key is pressed }
{/ }
{/ \param key Key to check }
{/ }
{/ \return sfTrue if the key is pressed, sfFalse otherwise }
{/ }
{/ \see sfKeyboard_isScancodePressed }
{/ }
{////////////////////////////////////////////////////////// }

function sfKeyboard_isKeyPressed(key:TsfKeyCode):TsfBool;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Check if a key is pressed }
{/ }
{/ \param code Scancode to check }
{/ }
{/ \return sfTrue if the physical key is pressed, sfFalse otherwise }
{/ }
{/ \see sfKeyboard_isKeyPressed }
{/ }
{////////////////////////////////////////////////////////// }
function sfKeyboard_isScancodePressed(code:TsfScancode):TsfBool;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Localize a physical key to a logical one }
{/ }
{/ \param code Scancode to localize }
{/ }
{/ \return The key corresponding to the scancode under the current }
{/         keyboard layout used by the operating system, or }
{/         sfKeyUnknown when the scancode cannot be mapped }
{/         to a Key. }
{/ }
{/ \see sfKeyboard_delocalize }
{/ }
{////////////////////////////////////////////////////////// }
function sfKeyboard_localize(code:TsfScancode):TsfKeyCode;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Identify the physical key corresponding to a logical one }
{/ }
{/ \param key Key to "delocalize" }
{/ }
{/ \return The scancode corresponding to the key under the current }
{/         keyboard layout used by the operating system, or }
{/         sfScanUnknown when the key cannot be mapped }
{/         to a sfScancode. }
{/ }
{/ \see sfKeyboard_localize }
{/ }
{////////////////////////////////////////////////////////// }
function sfKeyboard_delocalize(key:TsfKeyCode):TsfScancode;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Provide a string representation for a given scancode }
{/ }
{/ The returned string is a short, non-technical description of }
{/ the key represented with the given scancode. Most effectively }
{/ used in user interfaces, as the description for the key takes }
{/ the users keyboard layout into consideration. }
{/ }
{/ \warning The result is OS-dependent: for example, sfScanLSystem }
{/          is "Left Meta" on Linux, "Left Windows" on Windows and }
{/          "Left Command" on macOS. }
{/ }
{/ The current keyboard layout set by the operating system is used to }
{/ interpret the scancode: for example, sfKeySemicolon is }
{/ mapped to ";" for layout and to "é" for others. }
{/ }
{/ The returned const char* owns the string and must be freed to }
{/ avoid memory leaks. }
{/ }
{/ \param code Scancode to describe }
{/ }
{/ \return The localized description of the code }
{/ }
{////////////////////////////////////////////////////////// }
function sfKeyboard_getDescription(code:TsfScancode):Pchar;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Show or hide the virtual keyboard. }
{/ }
{/ \warning The virtual keyboard is not supported on all }
{/          systems. It will typically be implemented on mobile OSes }
{/          (Android, iOS) but not on desktop OSes (Windows, Linux, ...). }
{/ }
{/ If the virtual keyboard is not available, this function does nothing. }
{/ }
{/ \param visible True to show, false to hide }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfKeyboard_setVirtualKeyboardVisible(visible:TsfBool);cdecl;external libsfml_window;
{$endif}
{ SFML_KEYBOARD_H }

// === Konventiert am: 24-9-25 16:58:14 ===


implementation



end.
