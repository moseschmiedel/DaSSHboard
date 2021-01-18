use strict;
use warnings;
use utf8;

package Dasshboard;

use Scalar::Util qw<reftype blessed>;

# ABSTRACT: Main Module for DaSSHboard

=method new
Constructs a new DaSSHboard and returns a reference to it.
=cut

sub new {
    my $class = shift;
    my ( %hosts ) = @_;

    my $self = {
        hosts => %hosts,
    };

    bless $self, $class;
}

=method hosts
Accessor for the C<hosts> attribute.
=cut


sub hosts {
    my $self = shift;

    if (@_) {
        my %hosts = shift;
        die 'hosts should be a HashRef' unless defined reftype(\%hosts) 
                                    && reftype(\%hosts) eq 'HASH'
                                    && not blessed \%hosts;
        $self->{hosts} = %hosts;
    }

    return %{$self->{hosts}};
}


1;
