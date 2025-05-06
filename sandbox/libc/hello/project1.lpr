program project1;

// https://en.cppreference.com/w/c/header

// /usr/include/asm-generic/signal.h


// https://www.perplexity.ai/search/was-gibt-es-fur-standard-heade-mgrBB3i0Qra8x6wkP2tawQ

// https://www.perplexity.ai/search/das-ist-echt-komisch-mit-dem-s-DYKAX_A1RT6MgsLLEnUlhA

uses
  signal,
  stdio, clib;



procedure main;
begin
  WriteLn('SIGRTMIN: ', SIGRTMIN, '   SIGRTMAX: ', SIGRTMAX);;

//  signal.signal(sigwi);

  printf('Hello World %d'#10, 123);
end;

begin
  main;
end.
