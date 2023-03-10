@rem = '--*-Perl-*--
@echo off
if "%OS%" == "Windows_NT" goto WinNT
perl -x -S "%0" %1 %2 %3 %4 %5 %6 %7 %8 %9
goto endofperl
:WinNT
perl -x -S %0 %*
if NOT "%COMSPEC%" == "%SystemRoot%\system32\cmd.exe" goto endofperl
if %errorlevel% == 9009 echo You do not have Perl in your PATH.
if errorlevel 1 goto script_failed_so_exit_with_non_zero_val 2>nul
goto endofperl
@rem ';
#!/usr/bin/env perl
#line 15
use strict;
use warnings;
use Getopt::Long;


# my @set = ('0' .. '9', 'A' .. 'Z', 'a' .. 'z');
# non ambiguous characters
# https://ux.stackexchange.com/questions/21076/are-there-numbers-and-letters-to-avoid-for-activation-codes-via-sms
my @set = split //,'abcdefghkmnoprstwxzABCDEFGHJKLMNPQRTWXY34689';
my $pwLen = 63;
GetOptions('long=i' => \$pwLen);
if ($pwLen < 1) {
    $pwLen = 63;
}
my $passwd = join '' => map $set[rand @set], 1 .. $pwLen;
print "$passwd\n";

exit 0;

__END__
:endofperl
