package GildedRose;

use strict;
use warnings;

use ItemFactory;

sub new {
    my ( $class, %attrs ) = @_;
    return bless \%attrs, $class;
}

sub update_quality {
    my $self = shift;
    for my $item ( @{ $self->{items} } ) {
        my $item_delegator = ItemFactory::create_item($item);
        $item_delegator->update_quality();
    }
    return;
}

1;
