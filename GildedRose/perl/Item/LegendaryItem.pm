package Item::LegendaryItem;

use Moose;
extends 'ItemDelegator';

sub _build_minimum_quality {
    my $self = shift;
    return 80;
}

sub _build_maximum_quality {
    my $self = shift;
    return 80;
}

sub update_quality {
    my $self = shift;

    # Do nothing.

    return;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
