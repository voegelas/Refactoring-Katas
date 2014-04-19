package Item::AgedBrie;

use Moose;
extends 'ItemDelegator';

sub update {
    my $self = shift;
    if ( $self->quality < 50 ) {
        $self->inc_quality;
    }
    $self->dec_sell_in;
    if ( $self->sell_in < 0 ) {
        if ( $self->quality < 50 ) {
            $self->inc_quality;
        }
    }
    return;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
