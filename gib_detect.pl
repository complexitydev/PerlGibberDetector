#!/usr/bin/perl

use strict;
use warnings;

use Storable qw(retrieve);
require('gib_detect_train.pl');

my $model_data = retrieve('gib_model.dat');

while (1) {
    my $l         = <STDIN>;
    my $model_mat = $model_data->{mat};
    my $threshold = $model_data->{thresh};
    my $debugOutput = avg_transition_prob($l, $model_mat);
    if (avg_transition_prob($l, $model_mat) > $threshold) {
	    print "debug $debugOutput";
        print "=> true\n";
    }
    else {
	    print "debug $debugOutput";
        print "=> false\n";
    }
}
