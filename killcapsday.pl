use Irssi;
use strict;

use vars qw($VERSION %IRSSI);

$VERSION = "0.3b";
%IRSSI = (
                authors         => 'Iiro Uusitalo',
                contact         => 'woltage@IRCnet',
                name            => 'KILL -9 CAPSLOCKDAY',
                description     => 'Kills CAPS LOCK DAY',
                license         => 'Free',
                url             => 'http://www.woltage.org',
        );

sub eliminateCapsDayPublic {
    my($server, $data, $nick, $mask, $target) = @_;
	my $first_char;
	my $continue_data;
		
	$first_char = substr $data, 0, 1;
	$data = substr $data, 1;
	$continue_data = $first_char.lc($data);
	
	Irssi::signal_continue($server, $continue_data, $nick, $mask, $target);
}

sub eliminateCapsDayTopic {
	my($server, $channel, $topic, $nick, $address) = @_;
	my $first_char;
	my $continue_topic;
	
        $first_char = substr $topic, 0, 1;
        $topic = substr $topic, 1;
        $continue_topic = $first_char.lc($topic);

	Irssi::signal_continue($server, $channel, $continue_topic, $nick, $address);
}


Irssi::signal_add('message public', \&eliminateCapsDayPublic);
Irssi::signal_add('message topic', \&eliminateCapsDayTopic);