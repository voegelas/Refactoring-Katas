#!/usr/bin/env perl

use strict;
use warnings;

use Test::More 0.96;

use_ok 'GildedRose';
use_ok 'AgedBrie';
use_ok 'BackstagePass';
use_ok 'ConjuredItem';
use_ok 'LegendaryItem';
use_ok 'RegularItem';

subtest 'OMGHAI!' => sub {
    my $items = [
        RegularItem->new(
            name    => '+5 Dexterity Vest',
            sell_in => 10,
            quality => 20
        ),
        AgedBrie->new(
            name    => 'Aged Brie',
            sell_in => 2,
            quality => 0
        ),
        RegularItem->new(
            name    => 'Elixir of the Mongoose',
            sell_in => 5,
            quality => 7
        ),
        LegendaryItem->new(
            name    => 'Sulfuras, Hand of Ragnaros',
            sell_in => 0,
            quality => 80
        ),
        LegendaryItem->new(
            name    => 'Sulfuras, Hand of Ragnaros',
            sell_in => -1,
            quality => 80
        ),
        BackstagePass->new(
            name    => 'Backstage passes to a TAFKAL80ETC concert',
            sell_in => 15,
            quality => 20
        ),
        BackstagePass->new(
            name    => 'Backstage passes to a TAFKAL80ETC concert',
            sell_in => 10,
            quality => 49
        ),
        BackstagePass->new(
            name    => 'Backstage passes to a TAFKAL80ETC concert',
            sell_in => 5,
            quality => 9
        ),
        ConjuredItem->new(
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
