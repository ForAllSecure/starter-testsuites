# Mayhem starting test suites

The following is a collection of starting test suites (aka "corpus" or "seeds") for 
Mayhem or fuzzing analysis. 


Each directory contains a test suite, and may contain subdirectories. Some fuzzers do not
support nested subdirectories, so we've created a helper script to merge everything together:

```bash
make_testsuite_tgz.sh <directory>
```

will create `testsuite/<format>-testsuite.tgz` with no nested directories.  The script
will process every directory if you leave off <directory>

## Credits:

This list was culled from:
  * https://github.com/strongcourage/fuzzing-corpus
  * https://github.com/dvyukov/go-fuzz-corpus

