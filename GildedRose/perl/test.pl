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

subtest 'aged_brie' => sub {
    my $items = [
        Item::AgedBrie->new(
            name    => 'Aged Brie',
            sell_in => 1,
            quality => 0
        ),
        Item::AgedBrie->new(
            name    => 'Aged Brie',
            sell_in => 0,
            quality => 48,
        ),
    ];
    my $app = GildedRose->new( items => $items );
    $app->update_quality();
    is( $items->[0]->{sell_in}, 0 );
    is( $items->[0]->{quality}, 1 );
    is( $items->[1]->{sell_in}, -1 );
    is( $items->[1]->{quality}, 50 );
    $app->update_quality();
    is( $items->[0]->{sell_in}, -1 );
    is( $items->[0]->{quality}, 3 );
    is( $items->[1]->{sell_in}, -2 );
    is( $items->[1]->{quality}, 50 );
};

subtest 'backstage_pass' => sub {
    my $items = [
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
    ];
    my $app = GildedRose->new( items => $items );
    $app->update_quality();
    is( $items->[0]->{sell_in}, 14 );
    is( $items->[0]->{quality}, 21 );
    is( $items->[1]->{sell_in}, 9 );
    is( $items->[1]->{quality}, 50 );
    is( $items->[2]->{sell_in}, 4 );
    is( $items->[2]->{quality}, 12 );
};

subtest 'conjured_item' => sub {
    my $items = [
        Item::ConjuredItem->new(
            name    => 'Conjured Mana Cake',
            sell_in => 2,
            quality => 8
        ),
    ];
    my $app = GildedRose->new( items => $items );
    $app->update_quality();
    is( $items->[0]->{sell_in}, 1 );
    is( $items->[0]->{quality}, 6 );
    $app->update_quality();
    is( $items->[0]->{sell_in}, 0 );
    is( $items->[0]->{quality}, 4 );
    $app->update_quality();
    is( $items->[0]->{sell_in}, -1 );
    is( $items->[0]->{quality}, 0 );
    $app->update_quality();
    is( $items->[0]->{sell_in}, -2 );
    is( $items->[0]->{quality}, 0 );
};

subtest 'legendary_item' => sub {
    my $items = [
        Item::LegendaryItem->new(
            name    => 'Sulfuras, Hand of Ragnaros',
            sell_in => 1,
            quality => 80
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
    ];
    my $app = GildedRose->new( items => $items );
    $app->update_quality();
    is( $items->[0]->{sell_in}, 1 );
    is( $items->[0]->{quality}, 80 );
    is( $items->[1]->{sell_in}, 0 );
    is( $items->[1]->{quality}, 80 );
    is( $items->[2]->{sell_in}, -1 );
    is( $items->[2]->{quality}, 80 );
    $app->update_quality();
    is( $items->[0]->{sell_in}, 1 );
    is( $items->[0]->{quality}, 80 );
    is( $items->[1]->{sell_in}, 0 );
    is( $items->[1]->{quality}, 80 );
    is( $items->[2]->{sell_in}, -1 );
    is( $items->[2]->{quality}, 80 );
};

subtest 'regular_item' => sub {
    my $items = [
        Item::RegularItem->new(
            name    => '+5 Dexterity Vest',
            sell_in => 10,
            quality => 20
        ),
        Item::RegularItem->new(
            name    => 'Elixir of the Mongoose',
            sell_in => 0,
            quality => 7
        ),
        Item::RegularItem->new(
            name    => 'Elixir of Brute Force',
            sell_in => 5,
            quality => 0
        ),
        Item::RegularItem->new(
            name    => 'Major Healing Potion',
            sell_in => -1,
            quality => 0
        ),
    ];
    my $app = GildedRose->new( items => $items );
    $app->update_quality();
    is( $items->[0]->{name},    '+5 Dexterity Vest' );
    is( $items->[0]->{sell_in}, 9 );
    is( $items->[0]->{quality}, 19 );
    is( $items->[1]->{name},    'Elixir of the Mongoose' );
    is( $items->[1]->{sell_in}, -1 );
    is( $items->[1]->{quality}, 5 );
    is( $items->[2]->{name},    'Elixir of Brute Force' );
    is( $items->[2]->{sell_in}, 4 );
    is( $items->[2]->{quality}, 0 );
    is( $items->[3]->{name},    'Major Healing Potion' );
    is( $items->[3]->{sell_in}, -2 );
    is( $items->[3]->{quality}, 0 );
};

done_testing();
