use utf8;
use v5.32;
use Test::Most tests => 3;
use Scalar::Util qw<blessed>;

use Dasshboard;
use Dasshboard::Action;

subtest 'Create DaSSHboard' => sub {
    ok my $dasshboard = Dasshboard->new({}), 'construct new Dasshboard object';
    ok blessed($dasshboard), 'check if returned reference points to a blessed data structure';
};

subtest 'Hosts attribute' => sub {
    ok my $dasshboard = Dasshboard->new({}), 'construct new Dasshboard object';
    eq_or_diff $dasshboard->hosts, {}, "check if hosts is empty";
    eq_or_diff $dasshboard->hosts({
            'host1' => undef,
            'host2' => undef,
        }), {'host1' => undef, 'host2' => undef,}, 'set hosts attr and check if it contains the right data';
    dies_ok { $dasshboard->hosts(['host1']) } 'die if Array is passed as argument';
    dies_ok { $dasshboard->hosts(3) } 'die if Scalar is passed as argument';
    dies_ok { $dasshboard->hosts(bless {}) } 'die if Object is passed as argument';
};

subtest 'Generate info panel' => sub {
    ok my $dasshboard = Dasshboard->new({hi => 'hallo'}), 'construct new Dasshboard object';
    dies_ok { $dasshboard->generate_panel } 'die if no hosts are defined';
    ok $dasshboard->hosts({'host1' => undef, 'host2' => undef}), 'set hosts attr';
    dies_ok { $dasshboard->generate_panel } 'die if no actions are defined';
    my $action1 = Dasshboard::Action->new([]);
    my $action2 = Dasshboard::Action->new([]);
    ok $dasshboard->hosts({'host1' => $action1, 'host2' => $action2}), 'set actions for hosts';
    dies_ok { $dasshboard->generate_panel } 'die if no format is defined';
    #like $panel, qr/
};
