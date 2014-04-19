package ItemDelegator;

use Moose;
use Item;
use Carp 'croak';

has _item => ( is => 'ro', isa => 'Item', handles => [qw(_data_printer)] );

around BUILDARGS => sub {
    my ( $orig, $class, %attrs ) = @_;
    return $class->$orig( _item => Item->new(%attrs) );
};

sub name {
    my $self = shift;
    return $self->_item->{name};
}

sub sell_in {
    my $self = shift;
    return $self->_item->{sell_in};
}

sub dec_sell_in {
    my $self = shift;
    return --$self->_item->{sell_in};
}

sub quality {
    my $self = shift;
    return $self->_item->{quality};
}

sub set_quality {
    my $self    = shift;
    my $quality = shift;
    return $self->_item->{quality} = $quality;
}

sub inc_quality {
    my $self = shift;
    return ++$self->_item->{quality};
}

sub dec_quality {
    my $self = shift;
    return --$self->_item->{quality};
}

sub update_quality {
    croak 'Method "update_quality" not implemented by subclass';
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
