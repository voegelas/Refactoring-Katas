package Item::BackstagePass;

use Moose;
extends 'ItemDelegator';

sub update_quality {
    my $self = shift;
    if ( $self->quality < 50 ) {
        $self->inc_quality;
        if ( $self->sell_in < 11 ) {
            if ( $self->quality < 50 ) {
                $self->inc_quality;
            }
        }
        if ( $self->sell_in < 6 ) {
            if ( $self->quality < 50 ) {
                $self->inc_quality;
            }
        }
    }
    $self->dec_sell_in;
    if ( $self->sell_in < 0 ) {
        $self->set_quality(0);
    }
    return;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
