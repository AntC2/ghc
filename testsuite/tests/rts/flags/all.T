#We ignore ways which depend on passing RTS arguments for simplicity. 

#Standard handling of RTS arguments
test('T12870a',
    [extra_run_opts('+RTS -G2 -RTS arg1 --RTS +RTS arg2'), extra_files(['T12870.hs']),
        omit_ways(['ghci','threaded2','profasm','profthreaded'])],
    multimod_compile_and_run,
    ['T12870', '-rtsopts'])

test('T12870b',
    [extra_run_opts('+RTS -G2 -RTS arg1 --RTS +RTS arg2'), extra_files(['T12870.hs']),
        exit_code(1), ignore_stderr, omit_ways(['ghci','threaded2','profasm','profthreaded'])],
    multimod_compile_and_run,
    ['T12870', '-rtsopts=none'])

test('T12870c',
    [extra_run_opts('+RTS -G2 -RTS arg1 --RTS +RTS arg2'), extra_files(['T12870.hs']),
        exit_code(1), omit_ways(['ghci','threaded2','profasm','profthreaded'])],
    multimod_compile_and_run,
    ['T12870', '-rtsopts=some'])

test('T12870d',
    [extra_run_opts('+RTS -G2 -RTS arg1 --RTS +RTS arg2'), extra_files(['T12870.hs']),
        omit_ways(['ghci','threaded2','profasm','profthreaded'])],
    multimod_compile_and_run,
    ['T12870', ''])

#RTS options should be passed along to the program
test('T12870e',
    [extra_run_opts('+RTS -G2 -RTS arg1 --RTS +RTS arg2'), extra_files(['T12870.hs']),
        omit_ways(['ghci','threaded2','profasm','profthreaded'])],
    multimod_compile_and_run,
    ['T12870', '-rtsopts=ignore'])

test('T12870f',
    [extra_run_opts('+RTS -G2 -RTS arg1 --RTS +RTS arg2'), extra_files(['T12870.hs']),
        omit_ways(['ghci','threaded2','profasm','profthreaded'])],
    multimod_compile_and_run,
    ['T12870', '-rtsopts=ignoreAll'])

#Check handling of env variables
test('T12870g',
    [extra_files(['T12870g.hs']), cmd_prefix('GHCRTS=-G7 '), extra_files(['T12870g.hs']),
        omit_ways(['ghci','threaded2','profasm','profthreaded'])],
    multimod_compile_and_run,
    ['T12870g', '-rtsopts -with-rtsopts="-G3"'])

test('T12870h',
    [extra_files(['T12870g.hs']), cmd_prefix('GHCRTS=-G7 '), extra_files(['T12870g.hs']),
        omit_ways(['ghci','threaded2','profasm','profthreaded'])],
    multimod_compile_and_run,
    ['T12870g', '-rtsopts=ignoreAll -with-rtsopts="-G3"'])

