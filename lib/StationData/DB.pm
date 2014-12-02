package StationData::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);

__PACKAGE__->load_plugin('Count');
__PACKAGE__->load_plugin('Replace');
__PACKAGE__->load_plugin('Pager');

sub insert_linecode{
 my ($self,$linecode) = @_;
 $self->insert('line',{linecode => $linecode});
}

sub insert_stationcode{
 my($self,$stationcode) = @_;
 $self->insert('station',{stationcode => $stationcode});
}

sub get_linecode_latest{
 my($self) = @_;
 my $itr = $self->search('line',+{},+{limit => 1});
 return $itr;
}

sub get_stationcode_latest{
 my ($self) = @_; 
 my $itr = $self->search('station',+{},+{limit => 1});
 return $itr;
}

1;
