use strict;
use warnings;
use utf8;

package Dasshboard::Action;

sub new {
    my $class = shift;
    my ( @commands ) = @_; 

    my $self = {
        commands => @commands,
    };

    bless $self, $class;
}

sub add_command {
    my ( $self, @new_commands ) = @_;

    push @{$self->{commands}}, @new_commands;
}

1;
