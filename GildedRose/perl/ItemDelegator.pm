package ItemDelegator;

use Moose;
use Item;

has item => ( is => 'ro', isa => 'Item' );

around BUILDARGS => sub {
    my ( $orig, $class, %attrs ) = @_;
    return $class->$orig( item => Item->new(%attrs) );
};

sub name {
    my $self = shift;
    return $self->item->{name};
}

sub sell_in {
    my $self = shift;
    return $self->item->{sell_in};
}

sub dec_sell_in {
    my $self = shift;
    return --$self->item->{sell_in};
}

sub quality {
    my $self = shift;
    return $self->item->{quality};
}

sub set_quality {
    my $self    = shift;
    my $quality = shift;
    return $self->item->{quality} = $quality;
}

sub inc_quality {
    my $self = shift;
    return ++$self->item->{quality};
}

sub dec_quality {
    my $self = shift;
    return --$self->item->{quality};
}

no Moose;
__PACKAGE__->meta->make_immutable;
