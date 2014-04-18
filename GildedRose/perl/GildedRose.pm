package GildedRose;

use Moose;

has items => ( is => 'ro', isa => 'ArrayRef[ItemDelegator]' );

sub _update_item {
    my ( $self, $item ) = @_;
    if (   $item->name ne 'Aged Brie'
        && $item->name ne 'Backstage passes to a TAFKAL80ETC concert' )
    {
        if ( $item->quality > 0 ) {
            if ( $item->name ne 'Sulfuras, Hand of Ragnaros' ) {
                $item->dec_quality;
            }
        }
    }
    else {
        if ( $item->quality < 50 ) {
            $item->inc_quality;

            if ( $item->name eq 'Backstage passes to a TAFKAL80ETC concert' )
            {
                if ( $item->sell_in < 11 ) {
                    if ( $item->quality < 50 ) {
                        $item->inc_quality;
                    }
                }

                if ( $item->sell_in < 6 ) {
                    if ( $item->quality < 50 ) {
                        $item->inc_quality;
                    }
                }
            }
        }
    }

    if ( $item->name ne 'Sulfuras, Hand of Ragnaros' ) {
        $item->dec_sell_in;
    }

    if ( $item->sell_in < 0 ) {
        if ( $item->name ne 'Aged Brie' ) {
            if ( $item->name ne 'Backstage passes to a TAFKAL80ETC concert' )
            {
                if ( $item->quality > 0 ) {
                    if ( $item->name ne 'Sulfuras, Hand of Ragnaros' ) {
                        $item->dec_quality;
                    }
                }
            }
            else {
                $item->set_quality(0);
            }
        }
        else {
            if ( $item->quality < 50 ) {
                $item->inc_quality;
            }
        }
    }
}

sub update_quality {
    my $self = shift;
    for my $item ( @{ $self->items } ) {
        $self->_update_item($item);
    }
    return;
}

no Moose;
__PACKAGE__->meta->make_immutable;
