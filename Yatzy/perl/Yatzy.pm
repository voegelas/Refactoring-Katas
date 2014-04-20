package Yatzy;

use strict;
use warnings;

use List::AllUtils qw(all part sum);

sub chance {
    my (@dice) = @_;
    return sum 0, @dice;
}

sub yatzy {
    my ( $first_die, @other_dice ) = @_;
    return ( all { $_ == $first_die } @other_dice ) ? 50 : 0;
}

sub ones {
    my (@dice) = @_;
    return sum 0, grep { $_ == 1 } @dice;
}

sub twos {
    my (@dice) = @_;
    return sum 0, grep { $_ == 2 } @dice;
}

sub threes {
    my (@dice) = @_;
    return sum 0, grep { $_ == 3 } @dice;
}

sub fours {
    my (@dice) = @_;
    return sum 0, grep { $_ == 4 } @dice;
}

sub fives {
    my (@dice) = @_;
    return sum 0, grep { $_ == 5 } @dice;
}

sub sixes {
    my (@dice) = @_;
    return sum 0, grep { $_ == 6 } @dice;
}

sub _take_n_sets_of_size_m {
    my ( $n, $m, $dice_ref ) = @_;
    my @reversed_numbers = part { 6 - $_ } @{$dice_ref};
    my @sets = grep { defined $_ && @{$_} >= $m } @reversed_numbers;
    if ( @sets < $n ) {
        return ();
    }
    return map { $_->[0] } @sets[ 0 .. $n - 1 ];
}

sub _sum_n_sets_of_size_m {
    my ( $n, $m, $dice_ref ) = @_;
    my @n_sets = _take_n_sets_of_size_m( $n, $m, $dice_ref );
    return $m * sum 0, @n_sets;
}

sub one_pair {
    my (@dice) = @_;
    return _sum_n_sets_of_size_m( 1, 2, \@dice );
}

sub two_pairs {
    my (@dice) = @_;
    return _sum_n_sets_of_size_m( 2, 2, \@dice );
}

sub four_of_a_kind {
    my (@dice) = @_;
    return _sum_n_sets_of_size_m( 1, 4, \@dice );
}

sub three_of_a_kind {
    my (@dice) = @_;
    return _sum_n_sets_of_size_m( 1, 3, \@dice );
}

sub small_straight {
    my (@dice) = @_;
    my @numbers = part { $_ - 1 } @dice;
    return ( all { defined $_ && @{$_} > 0 } @numbers[ 0 .. 4 ] ) ? 15 : 0;
}

sub large_straight {
    my (@dice) = @_;
    my @numbers = part { $_ - 1 } @dice;
    return ( all { defined $_ && @{$_} > 0 } @numbers[ 1 .. 5 ] ) ? 20 : 0;
}

sub full_house {
    my (@dice) = @_;
    my ($three_of_a_kind) = _take_n_sets_of_size_m( 1, 3, \@dice );
    if ( !defined $three_of_a_kind ) {
        return 0;
    }
    my @other_dice = grep { $_ != $three_of_a_kind } @dice;
    my ($pair) = _take_n_sets_of_size_m( 1, 2, \@other_dice );
    if ( !defined $pair ) {
        return 0;
    }
    return 3 * $three_of_a_kind + 2 * $pair;
}

1;
