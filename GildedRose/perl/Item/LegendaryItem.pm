package Item::LegendaryItem;

use Moose;
extends 'ItemDelegator';

sub update_quality {
    my $self = shift;

    # Do nothing.

    return;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
