package StationData::Web::C::Line;

use Data::Dumper;

use StationData::Model::Pref;

my $station = new StationData::Model::Pref;

sub line{
 my($class,$c) = @_;
 my $itr = $c->db->get_linecode_latest();
 my $linecode = '';
 while(my $row = $itr->next){
    $linecode = $row->linecode;
 } 
 my $station = $station->get_line($linecode);
 return $c->render('line.tx',{station_l => $station->{station_l},line_name => $station->{line_name},line_cd => $station->{line_cd}});
}

sub postline{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 $c->db->insert_linecode($param->{linecode});
 return $c->redirect('/line');
}

sub poststation{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 $c->db->insert_stationcode($param->{stationcode});
 return $c->redirect('/station');
}

sub station{
 my($class,$c) = @_;
 my $itr = $c->db->get_stationcode_latest();
 my $stationcode = '';
 while(my $row = $itr->next){
   $stationcode = $row->stationcode;
 }
 my $station_data = $station->get_station($stationcode);
 print Dumper $station_data;
 return $c->render('station.tx',{stations => $station_data->{station}});
}

1;
