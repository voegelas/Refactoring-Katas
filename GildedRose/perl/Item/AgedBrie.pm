package Item::AgedBrie;

use Moose;
extends 'ItemDelegator';

sub update_quality {
    my $self = shift;
    if ( $self->quality < $self->maximum_quality ) {
        $self->inc_quality;
    }
    $self->dec_sell_in;
    if ( $self->sell_in < 0 ) {
        if ( $self->quality < $self->maximum_quality ) {
            $self->inc_quality;
        }
    }
    return;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
