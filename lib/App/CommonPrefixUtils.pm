package App::CommonPrefixUtils;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

$SPEC{common_prefix} = {
    v => 1.1,
    summary => 'Calculate common prefix from supplied strings',
    args => {
        strings => {
            schema => ['array*', of=>'str*'],
            cmdline_src => 'stdin_or_args',
            pos => 0,
            slurpy => 1,
        },
    },
};
sub common_prefix {
    require String::CommonPrefix;

    my %args = @_;

    [200, "OK", String::CommonPrefix::common_prefix(@{ $args{strings} // [] })];
}

$SPEC{majority_prefix} = {
    v => 1.1,
    summary => 'Calculate majority prefix from supplied strings',
    args => {
        strings => {
            schema => ['array*', of=>'str*'],
            cmdline_src => 'stdin_or_args',
            pos => 0,
            slurpy => 1,
        },
    },
};
sub majority_prefix {
    require String::CommonPrefix;

    my %args = @_;

    [200, "OK", String::CommonPrefix::majority_prefix(@{ $args{strings} // [] })];
}

1;
# ABSTRACT: Utilities related to common prefix

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

See the included scripts:

# INSERT_EXECS_LIST


=head1 DESCRIPTION

This distribution includes the following CLI scripts related to common prefix.


=head1 SEE ALSO

L<String::CommonPrefix>

L<App::CommonSuffixUtils>

=cut
