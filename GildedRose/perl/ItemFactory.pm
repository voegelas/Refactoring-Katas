package ItemFactory;

use Item::AgedBrie;
use Item::BackstagePass;
use Item::ConjuredItem;
use Item::LegendaryItem;
use Item::RegularItem;

sub create_item {
    my ($item) = @_;
    my $name = $item->{name};
    if ( $name =~ /Aged Brie/i ) {
        return Item::AgedBrie->new( item => $item );
    }
    if ( $name =~ /Backstage pass/i ) {
        return Item::BackstagePass->new( item => $item );
    }
    if ( $name =~ /Conjured/i ) {
        return Item::ConjuredItem->new( item => $item );
    }
    if ( $name =~ /Sulfuras/i ) {
        return Item::LegendaryItem->new( item => $item );
    }
    return Item::RegularItem->new( item => $item );
}

1;
