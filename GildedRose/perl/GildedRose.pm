package GildedRose;

use Moose;

has items => ( is => 'ro', isa => 'ArrayRef[ItemDelegator]' );

sub update_quality {
    my $self = shift;
    for my $item ( @{ $self->items } ) {
        $item->update;
    }
    return;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
