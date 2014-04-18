use strict;
use warnings;

package Tennis::Game1;

use Moose;
use List::AllUtils qw(all any firstidx max);
use Locale::Maketext::Simple;
use Tie::IxHash;

# Maps player names to points.  The hash is sorted.
has points_for => ( is => 'ro', isa => 'HashRef[Int]' );

around BUILDARGS => sub {
    my ( $orig, $class, @players ) = @_;
    tie my %points_for, 'Tie::IxHash', map { $_ => 0 } @players;
    return $class->$orig( points_for => \%points_for );
};

sub won_point {
    my ( $self, $player ) = @_;
    ++$self->points_for->{$player};
    return;
}

sub score {
    my $self = shift;

    my @players = keys %{ $self->points_for };
    my @points  = values %{ $self->points_for };
    my $max = max @points;
    if ( all { $_ == $max } @points ) {
        my @tie_scores = qw(Love-All Fifteen-All Thirty-All);
        return loc( $tie_scores[ $points[0] ] // 'Deuce' );
    }
    if ( $max >= 4 ) {
        my $leading_player = $players[ firstidx { $_ == $max } @points ];
        if ( any { $max - $_ == 1 } @points ) {
            return loc( 'Advantage [_1]', $leading_player );
        }
        return loc( 'Win for [_1]', $leading_player );
    }
    my @scores = qw(Love Fifteen Thirty Forty);
    return join '-', map { loc( $scores[$_] ) } @points;
}

1;
