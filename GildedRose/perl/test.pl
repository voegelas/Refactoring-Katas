#!/usr/bin/env perl

use strict;
use warnings;

use Test::More 0.96;

use_ok 'GildedRose';
use_ok 'Item::AgedBrie';
use_ok 'Item::BackstagePass';
use_ok 'Item::ConjuredItem';
use_ok 'Item::LegendaryItem';
use_ok 'Item::RegularItem';

subtest 'OMGHAI!' => sub {
    my $items = [
        Item::RegularItem->new(
            name    => '+5 Dexterity Vest',
            sell_in => 10,
            quality => 20
        ),
        Item::AgedBrie->new(
            name    => 'Aged Brie',
            sell_in => 2,
            quality => 0
        ),
        Item::RegularItem->new(
            name    => 'Elixir of the Mongoose',
            sell_in => 5,
            quality => 7
        ),
        Item::LegendaryItem->new(
            name    => 'Sulfuras, Hand of Ragnaros',
            sell_in => 0,
            quality => 80
        ),
        Item::LegendaryItem->new(
            name    => 'Sulfuras, Hand of Ragnaros',
            sell_in => -1,
            quality => 80
        ),
        Item::BackstagePass->new(
            name    => 'Backstage passes to a TAFKAL80ETC concert',
            sell_in => 15,
            quality => 20
        ),
        Item::BackstagePass->new(
            name    => 'Backstage passes to a TAFKAL80ETC concert',
            sell_in => 10,
            quality => 49
        ),
        Item::BackstagePass->new(
            name    => 'Backstage passes to a TAFKAL80ETC concert',
            sell_in => 5,
            quality => 9
        ),
        Item::ConjuredItem->new(
            name    => 'Conjured Mana Cake',
            sell_in => 3,
            quality => 6
        ),
    ];
    my $app = GildedRose->new( items => $items );
    $app->update_quality();
    is( $app->items->[0]->name, '+5 Dexterity Vest' );
};

done_testing();
