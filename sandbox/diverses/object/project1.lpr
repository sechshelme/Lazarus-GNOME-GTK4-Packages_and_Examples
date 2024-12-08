program project1;

uses
  heaptrc,
  Person;


var
  per: PPerson;
begin
  per := Person_new(123);
  WriteLn(Person_get_age(per));
  Person_dispose(per);
end.
