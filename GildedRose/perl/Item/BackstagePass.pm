package Item::BackstagePass;

use Moose;
extends 'ItemDelegator';

has periods_of_high_demand => (
    is      => 'ro',
    isa     => 'ArrayRef[Int]',
    builder => '_build_periods_of_high_demand',
);

sub _build_periods_of_high_demand {
    my $self = shift;
    return [ 10, 5 ];
}

sub update_quality {
    my $self = shift;
    if ( $self->quality < $self->maximum_quality ) {
        $self->inc_quality;
        for my $period ( @{ $self->periods_of_high_demand } ) {
            if ( $self->sell_in <= $period ) {
                if ( $self->quality < $self->maximum_quality ) {
                    $self->inc_quality;
                }
            }
        }
    }
    $self->dec_sell_in;
    if ( $self->sell_in < 0 ) {
        $self->set_quality( $self->minimum_quality );
    }
    return;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
