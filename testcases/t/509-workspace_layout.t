#!perl
# vim:ts=4:sw=4:expandtab
#
# Please read the following documents before working on tests:
# • http://build.i3wm.org/docs/testsuite.html
#   (or docs/testsuite)
#
# • http://build.i3wm.org/docs/lib-i3test.html
#   (alternatively: perldoc ./testcases/lib/i3test.pm)
#
# • http://build.i3wm.org/docs/ipc.html
#   (or docs/ipc)
#
# • http://onyxneon.com/books/modern_perl/modern_perl_a4.pdf
#   (unless you are already familiar with Perl)
#
# Tests whether workspace_layout is properly set after startup.
#
use List::Util qw(first);
use i3test i3_autostart => 0;

my $config = <<EOT;
# i3 config file (v4)
font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1

fake-outputs 1024x768+0+0
workspace_layout tabbed
EOT
my $pid = launch_with_config($config);

################################################################################
# Test that workspace_layout is properly set
################################################################################


is(focused_ws, '1', 'starting on workspace 1');
my $ws = get_ws(1);
is($ws->{workspace_layout}, 'tabbed', 'workspace layout is "tabbed"');


exit_gracefully($pid);

done_testing;
