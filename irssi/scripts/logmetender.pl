use Irssi;
use Eirotic;
our ($VERSION, %IRSSI);
use re '/x';

=head1 SYNOPSIS

logmetender is a minimalistic notification system. 

from your remote machine, you can 

    n/irssi/logmetender () {
        local srv=${1?the server hosting your irssi client}
        local log=${2:-/tmp/irssi.notify}
        ssh $srv tail -fn0 $log | xargs -n1 -d$'\n' notify-send
    }

    n/irssi/logmetender shells.example.com  &

you must clean the log by yourself (daily cron job?) 

    ssh shells.example.com ':>/tmp/irssi.notify'

=cut


sub _log { 

    state $fh = do {
        open my $w, '>>','/tmp/irssi.notify';
        $w->autoflush;
        $w
    }; 

    say $fh @_
} 

Irssi::signal_add "message public"
, sub ( $srv, $msg, $nick, $address, $target ) { 
    _log join "\t"
    , $nick
    , $$srv{chatnet}
    , $target
    , $msg;  
};

Irssi::signal_add "message private"
, sub ( $srv, $msg, $nick, $address ) { 
    _log join "\t"
    , "#"
    , $$srv{chatnet}
    , $nick
    , $msg
}

