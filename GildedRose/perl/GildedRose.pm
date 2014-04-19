package GildedRose;

use strict;
use warnings;

sub new {
    my ( $class, %attrs ) = @_;
    return bless \%attrs, $class;
}

sub update_quality {
    my $self = shift;
    for my $item ( @{ $self->{items} } ) {
        $item->update_quality;
    }
    return;
}

1;
