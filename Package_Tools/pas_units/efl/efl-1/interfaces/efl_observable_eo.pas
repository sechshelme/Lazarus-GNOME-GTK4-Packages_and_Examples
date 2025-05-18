unit efl_observable_eo;

interface

uses
  efl, fp_eo, fp_eina;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  TEfl_Observer=TEo;
  PEfl_Observer=^TEfl_Observer;

  PEfl_Observable = ^TEfl_Observable;
  TEfl_Observable = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Observable_Tuple = ^TEfl_Observable_Tuple;
  TEfl_Observable_Tuple = record
      key : Pchar;
      data : PEina_Iterator;
    end;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_OBSERVABLE_CLASS : PEfl_Class;

function efl_observable_class_get:PEfl_Class;cdecl;external libefl;
procedure efl_observable_observer_add(obj:PEo; key:Pchar; obs:PEfl_Observer);cdecl;external libefl;
procedure efl_observable_observer_del(obj:PEo; key:Pchar; obs:PEfl_Observer);cdecl;external libefl;
procedure efl_observable_observer_clean(obj:PEo; obs:PEfl_Observer);cdecl;external libefl;
function efl_observable_observers_iterator_new(obj:PEo; key:Pchar):PEina_Iterator;cdecl;external libefl;
procedure efl_observable_observers_update(obj:PEo; key:Pchar; data:pointer);cdecl;external libefl;
function efl_observable_iterator_tuple_new(obj:PEo):PEina_Iterator;cdecl;external libefl;
{$endif}

// === Konventiert am: 18-5-25 18:05:21 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_OBSERVABLE_CLASS: PEfl_Class;
  begin
    EFL_OBSERVABLE_CLASS:=efl_observable_class_get;
  end;
{$endif}


end.
