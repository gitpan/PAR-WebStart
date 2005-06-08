use strict;
use warnings;

use Module::Build;
my $prereqs = {'LWP' => 0,
               'XML::SAX::ExpatXS' => 0,
               'PAR' => 0,
               'Module::Signature' => 0,
               'File::Which' => 0,
               'Archive::Zip' => 1.02,
              };
my @exe_files = map {"scripts/$_"} qw(perlws.pl make_par.pl);
push @exe_files, 'scripts/pnlp_registry.pl' if ($^O eq 'MSWin32');

my $build = Module::Build->new(
  module_name => 'Par::WebStart',
  license => 'perl',
  requires => $prereqs,
  dist_version_from => 'lib/PAR/WebStart.pm',
  dist_author => ['Randy Kobes <r.kobes@uwinnipeg.ca>'],
  dist_abstract_from => 'lib/PAR/WebStart.pm',
  script_files => \@exe_files,
);

$build->create_build_script;

