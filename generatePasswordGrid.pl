#!/usr/bin/env perl
# generate an 8 x 8 password grid

use String::Random;

use strict;
use warnings;

# some characters are hard to distinguish when written
# or in certain typefaces. I am going to ignore
# 0, o & O
# 1, l, L, i & I
# k & K
# G & 6 (at least the way I write them)
# y & Y

my $sr = new String::Random;
# Lets run the random string some number of times before we use it
# I do not know how good the seed for String::Random is.
# Maybe this is a waste.
for (my $i = 0; $i < (int(rand(1000))+3); $i++) {
    my $attempt =  $sr->randregex("[abcdefghjmnpqrstuvwxzABCDEFHJMNPQRSTUVWXZ2345789]{8}");
}

for (my $i = 0; $i < 8; $i++) {
    my $found = 0;
    while (! $found) {
        my $attempt =  $sr->randregex("[abcdefghjmnpqrstuvwxzABCDEFHJMNPQRSTUVWXZ2345789]{8}");
        # must have two uppper, two lower and two numbers
        if (($attempt =~ /[A-Z].*[A-Z]/) &&
            ($attempt =~ /[a-z].*[a-z]/) &&
            ($attempt =~ /[0-9].*[0-9]/)) {
            my @c = split("", $attempt);
            my $repeatFound = 0; # check for repeated chars
            for (my $j = 0; $j < 8; $j++) {
                my $ch = $c[$j];
                if ($attempt =~ /($ch).*($ch)/) {
                    $repeatFound = 1;
                }
            }
            if (! $repeatFound) {
                print "\n" . $c[0] . $c[1] . " " . $c[2] . $c[3] . " " . $c[4] . $c[5] . " " . $c[6] . $c[7] . "\n";
                $found = 1;
            }
        }
    }
}
print "\n\nDone.\n";

