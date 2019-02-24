#!/usr/bin/perl

package Nipe::Device;

my $operationalSystem = `awk -F= '\$1=="ID_LIKE" { print \$2 ;}' /etc/os-release`;

sub getUsername {
	my $username;

	if ($operationalSystem =~ /[U,u]buntu/) {
		$username = "tor";
	}

	elsif ($operationalSystem =~ /[D,d]ebian/) {
		$username = "debian-tor";
	}

	elsif (($operationalSystem =~ /[F,f]edora/) || ($operationalSystem =~ /[C,c]entos/)) {
		$username = "toranon";
	}

	elsif ($operationalSystem =~ /[A,a]rch/) {
		$username = "tor";
	}

	else {
		$username = "tor";
	}

	return $username;
}

sub getSystem {
	my $distribution;

	if (($operationalSystem =~ /[U,u]buntu/) || ($operationalSystem =~ /[D,d]ebian/)) {
		$distribution = "debian";
	}

	elsif ($operationalSystem =~ /[F,f]edora/) {
		$distribution = "fedora";
	}

	elsif ($operationalSystem =~ /[A,a]rch/) {
		$distribution = "arch";
	}

	elsif ($operationalSystem =~ /[C,c]entos/) {
		$distribution = "centos"
	}

	else {
		$distribution = "debian";
	}

	return $distribution;
}

1;
