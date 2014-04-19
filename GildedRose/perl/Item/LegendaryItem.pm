package Item::LegendaryItem;

use Moose;
extends 'ItemDelegator';

sub update {
    my $self = shift;

    # Do nothing.

    return;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
