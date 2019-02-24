#!/usr/bin/perl

# This Perl script enables you to directly route all your traffic from your
# computer to the Tor network

# Original code: https://github.com/GouveaHeitor/nipe
# Editted by NuclearFallout
use Switch;
use lib "./lib/";
use Nipe::Stop;
use Nipe::Start;
use Nipe::CheckIp;
use Nipe::Functions;

sub main {
	my $command = $ARGV[0];

	switch ($command) {
		case "stop" {
			Nipe::Stop -> new();
		}

		case "start" {
			Nipe::Start -> new();
		}

		case "status" {
			Nipe::CheckIp -> new();
		}

		case "restart" {
			Nipe::Stop -> new();
			Nipe::Start -> new();
		}

		case "install" {
			Nipe::Functions -> install();
		}

		Nipe::Functions -> help();
	}
}

main();
exit;


