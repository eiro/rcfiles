#! /usr/bin/perl
use Modern::Perl;
use Perlude; 
use YAML; 
use TAP::Parser;
use Path::Tiny; 

my $parser =
    TAP::Parser->new
    ( +{ tap => ''.qx{zsh env_test.zsh} } ); 

now { 
    $_->is_test and
        say sprintf q("%s" is ok) , $_->description;
} sub { $parser->next // () }
