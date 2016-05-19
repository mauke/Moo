use Moo::_strictures;
use Test::More;
use Test::Fatal;

{
  package ParentClass;
  use Moose;

  has attr1 => (is => 'ro');
}

is exception {
  package ChildClass;
  use Moo;
  extends 'ParentClass';

  has '+attr1' => (default => 5);
}, undef,
  'modifying inherited Moose attributes works';

is +ChildClass->new->attr1, 5,
  'modification takes effect';

done_testing;
