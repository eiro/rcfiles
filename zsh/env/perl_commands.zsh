yamllint () { perl -MYAML -e 'print Dump YAML::LoadFile("'"$1"'")' }
textile () {
    perl -MText::Textile=textile -0 -we '
	$_ = Text::Textile->new;
	$_->disable_encode_entities("fuck,yeah!");
	print $_->textile( <> );
	# print textile <> 
    '
}
html_prove () { prove -m -Q --formatter=TAP::Formatter::HTML "$@" }
