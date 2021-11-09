# Tell latexmk to look for a files with the extension *.gnuplot. Any matching
# files will be passed to the function, "run_gnuplot", defined below. The output
# will be a *.table file, which tikz can read.
add_cus_dep('gnuplot', 'table', 0, 'run_gnuplot');

sub run_gnuplot {
    # When using the gokhlayeh/latex docker image the shell is invoked without
    # locale. This causes the warning:
    #   "line 0: warning: iconv failed to convert degree sign",
    # which latexmk interprets as a failed run. We work around the issue by
    # defining a locale (in this case US) before invoking gnuplot.
    my $ret = system "LC_ALL=en-US gnuplot $_[0].gnuplot";

    my ($base, $path) = fileparse($_[0]);
    if ($path && -e "$base.table") {
        rename "$base.table", "$path$base.table";
    }

    return $ret;
}
