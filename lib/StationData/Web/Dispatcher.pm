
package StationData::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;
use Data::Dumper;

use Module::Find;

useall 'StationData::Web::C';
base    'StationData::Web::C';

use StationData::Model::Pref;

my $station = new StationData::Model::Pref();

any '/' => sub {
    my ($c) = @_;
    my $prefname = $c->session->get('pref') || '東京都'; 
    my $lines = $station->get_pref($prefname);
    my @prefs = ("北海道","青森県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県");           
   my $prefecture = '東京都';
    return $c->render('index.tx', {
       lines => $lines,      
      prefecture => $prefecture,
         prefs => \@prefs,
    });
};

get '/line' => "Line#line";

post '/line'=> "Line#postline";

post '/pref' => sub{
 my ($c) = @_;
 my $param =  $c->req->parameters;
 my $pref = $param->{prefecture}; 
 return $c->redirect('/');
};

post '/station' => "Line#poststation";

get '/station' => "Line#station";

1;




