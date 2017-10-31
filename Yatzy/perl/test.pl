#!/usr/bin/env perl

use strict;
use warnings;
use lib '.';

use Test::More 0.96;

use_ok 'Yatzy';

subtest 'chance_scores_sum_of_all_dice' => sub {
    is( Yatzy::chance( 2, 3, 4, 5, 1 ), 15 );
    is( Yatzy::chance( 3, 3, 4, 5, 1 ), 16 );
};

subtest 'yatzy_scores_50' => sub {
    is( Yatzy::yatzy( 4, 4, 4, 4, 4 ), 50 );
    is( Yatzy::yatzy( 6, 6, 6, 6, 6 ), 50 );
    is( Yatzy::yatzy( 6, 6, 6, 6, 3 ), 0 );
};

subtest 'sum_of_ones' => sub {
    is( Yatzy::ones( 1, 2, 3, 4, 5 ), 1 );
    is( Yatzy::ones( 1, 2, 1, 4, 5 ), 2 );
    is( Yatzy::ones( 6, 2, 2, 4, 5 ), 0 );
    is( Yatzy::ones( 1, 2, 1, 1, 1 ), 4 );
};

subtest 'sum_of_twos' => sub {
    is( Yatzy::twos( 1, 2, 3, 2, 6 ), 4 );
    is( Yatzy::twos( 2, 2, 2, 2, 2 ), 10 );
};

subtest 'sum_of_threes' => sub {
    is( Yatzy::threes( 1, 2, 3, 2, 3 ), 6 );
    is( Yatzy::threes( 2, 3, 3, 3, 3 ), 12 );
};

subtest 'sum_of_fours' => sub {
    is( Yatzy::fours( 4, 4, 4, 5, 5 ), 12 );
    is( Yatzy::fours( 4, 4, 5, 5, 5 ), 8 );
    is( Yatzy::fours( 4, 5, 5, 5, 5 ), 4 );
};

subtest 'sum_of_fives' => sub {
    is( Yatzy::fives( 4, 4, 4, 5, 5 ), 10 );
    is( Yatzy::fives( 4, 4, 5, 5, 5 ), 15 );
    is( Yatzy::fives( 4, 5, 5, 5, 5 ), 20 );
};

subtest 'sum_of_sixes' => sub {
    is( Yatzy::sixes( 4, 4, 4, 5, 5 ), 0 );
    is( Yatzy::sixes( 4, 4, 6, 5, 5 ), 6 );
    is( Yatzy::sixes( 6, 5, 6, 6, 5 ), 18 );
};

subtest 'one_pair' => sub {
    is( Yatzy::one_pair( 1, 2, 3, 4, 5 ), 0 );
    is( Yatzy::one_pair( 3, 4, 3, 5, 6 ), 6 );
    is( Yatzy::one_pair( 5, 3, 3, 3, 5 ), 10 );
    is( Yatzy::one_pair( 5, 3, 6, 6, 5 ), 12 );
};

subtest 'two_pairs' => sub {
    is( Yatzy::two_pairs( 3, 3, 5, 4, 5 ), 16 );
    is( Yatzy::two_pairs( 3, 3, 5, 5, 5 ), 16 );
    is( Yatzy::two_pairs( 1, 1, 1, 1, 1 ), 0 );
};

subtest 'three_of_a_kind' => sub {
    is( Yatzy::three_of_a_kind( 3, 3, 3, 4, 5 ), 9 );
    is( Yatzy::three_of_a_kind( 5, 3, 5, 4, 5 ), 15 );
    is( Yatzy::three_of_a_kind( 3, 3, 3, 3, 5 ), 9 );
};

subtest 'four_of_a_kind' => sub {
    is( Yatzy::four_of_a_kind( 3, 3, 3, 3, 5 ), 12 );
    is( Yatzy::four_of_a_kind( 5, 5, 5, 4, 5 ), 20 );
    is( Yatzy::four_of_a_kind( 3, 3, 3, 3, 3 ), 12 );
};

subtest 'small_straight' => sub {
    is( Yatzy::small_straight( 1, 2, 3, 4, 5 ), 15 );
    is( Yatzy::small_straight( 2, 3, 4, 5, 1 ), 15 );
    is( Yatzy::small_straight( 1, 2, 2, 4, 5 ), 0 );
};

subtest 'large_straight' => sub {
    is( Yatzy::large_straight( 6, 2, 3, 4, 5 ), 20 );
    is( Yatzy::large_straight( 2, 3, 4, 5, 6 ), 20 );
    is( Yatzy::large_straight( 1, 2, 2, 4, 5 ), 0 );
};

subtest 'full_house' => sub {
    is( Yatzy::full_house( 6, 2, 2, 2, 6 ), 18 );
    is( Yatzy::full_house( 2, 3, 4, 5, 6 ), 0 );
    is( Yatzy::full_house( 1, 1, 2, 2, 2 ), 8 );
    is( Yatzy::full_house( 1, 1, 2, 3, 3 ), 0 );
    is( Yatzy::full_house( 4, 4, 4, 4, 4 ), 0 );
};

done_testing();
