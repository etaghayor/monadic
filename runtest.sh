#!/bin/sh

FILENAME=$1

dune runtest &>/dev/null

echo "Selectively run tests for $FILENAME"
./_build/default/exercises/.exercises.inline-tests/inline_test_runner_exercises.exe \
    inline-test-runner                                                              \
    exercises                                                                       \
    -source-tree-root ..                                                            \
    -only-test $1
if [ $? -eq 0 ]; then
    echo "OK"
fi
