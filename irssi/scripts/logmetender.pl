use Irssi;
use Eirotic;
our ($VERSION, %IRSSI);
use re '/x';

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

