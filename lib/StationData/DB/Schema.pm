package StationData::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'StationData::DB::Row';

table{
 name 'line';
 pk 'id';
 columns qw(id linecode);
};

table{
 name 'station';
 pk 'id';
 columns qw(id stationcode);
};

table{
 name 'group_station';
 pk 'id';
 columns qw(id g_station_code);
};


1;
