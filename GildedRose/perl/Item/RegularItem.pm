package Item::RegularItem;

use Moose;
extends 'ItemDelegator';

sub update_quality {
    my $self = shift;
    if ( $self->quality > $self->minimum_quality ) {
        $self->dec_quality;
    }
    $self->dec_sell_in;
    if ( $self->sell_in < 0 ) {
        if ( $self->quality > $self->minimum_quality ) {
            $self->dec_quality;
        }
    }
    return;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
