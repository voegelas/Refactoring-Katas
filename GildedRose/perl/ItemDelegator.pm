package ItemDelegator;

use Moose;
use MooseX::NonMoose;
extends 'Item';

use Carp 'croak';

sub name {
    my $self = shift;
    return $self->{name};
}

sub sell_in {
    my $self = shift;
    return $self->{sell_in};
}

sub dec_sell_in {
    my $self = shift;
    return --$self->{sell_in};
}

sub quality {
    my $self = shift;
    return $self->{quality};
}

sub set_quality {
    my $self    = shift;
    my $quality = shift;
    return $self->{quality} = $quality;
}

sub inc_quality {
    my $self = shift;
    return ++$self->{quality};
}

sub dec_quality {
    my $self = shift;
    return --$self->{quality};
}

sub update_quality {
    croak 'Method "update_quality" not implemented by subclass';
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
