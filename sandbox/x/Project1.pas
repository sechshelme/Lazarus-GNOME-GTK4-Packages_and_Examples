program Project1;

uses
  unixtype,
//  xutil,
  keysym,
//    xlib,
//  x,
  fp_xlib,
  fp_x,
  fp_xutil,
//  fp_x11,
ctypes;

var
  dis: PDisplay;
  win: TWindow;
  Event: TXEvent;
  scr: cint;
  gc: TGC;
  quit:Boolean=False;

const
  hello='Hello World';

begin
  dis := XOpenDisplay(nil);
  if dis = nil then begin
    WriteLn('Kann nicht das Display öffnen');
    Halt(1);
  end;
  scr := XDefaultScreen(dis);

  win := XCreateSimpleWindow(dis, RootWindow(dis, scr), 10, 10, 320, 240, 1, XBlackPixel(dis, scr), XWhitePixel(dis, scr));

  gc := XCreateGC(dis, win, 0, nil);

  XSelectInput(dis, win, KeyPressMask or ExposureMask);

  XStoreName(dis, win, 'Mein Fenster');

  XMapWindow(dis, win);

  repeat
    XNextEvent(dis, @Event);
    case Event._type of
      KeyPress: begin
        case XLookupKeysym(@Event.xkey, 0) of
          XK_Escape: begin
            quit:=True;
          end;
        end;
      end;
      Expose: begin
        XDrawString(dis,win,gc,20, 20, hello,Length(hello));
      end;
    end;
  until quit;

  XDestroyWindow(dis, win);
  XCloseDisplay(dis);
end.

