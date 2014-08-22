#! /usr/bin/perl
use Modern::Perl;
use YAML;
use Template;
use autodie;

sub qxc { map {chomp;$_} qx(@_) }
my $SUMSFILE = 'process/sums';
my %INDEX = map {reverse split ' ', $_, 2} qxc "test -e $SUMSFILE && cat $SUMSFILE"; 

my $CONF = YAML::LoadFile 'process/conf';

sub checksum { qx( md5sum -c $SUMSFILE) }
sub help { say "try one of those subcommands: ls run"; }
sub ls   { say "$_|$INDEX{$_}{to}" for keys %INDEX }
sub run  {
    checksum;
    my $source = shift;
    my %conf = (%{$INDEX{$source}}, @_);
    my $template = Template->new;
    open my $destfh
    , '>'
    , $conf{to};
    $template->process( $source, $conf{with} )
        or die $template->error;
}

caller or do {
    my $cmd = shift or exit help;
    no strict 'refs';
    *{$cmd}->(@ARGV);
};
