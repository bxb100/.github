default:
    @just --list

[group('internal')]
fmt:
    @just --fmt --unstable

# https://just.systems/man/en/recipe-parameters.html?highlight=args#recipe-parameters

[doc('feature: Parameters, Conditional, Setting Variables in a Recipe')]
[group('internal')]
parameters *args:
    #!/usr/bin/env bash
    set -euxo pipefail
    flags={{ if args != '' { '--remote' } else { '' } }}
    # @echo not working in shell
    echo "test {{ args }} $flags"

# https://github.com/casey/just/blob/master/justfile

[doc('clean up feature branch BRANCH')]
[group('dev')]
done BRANCH=`git rev-parse --abbrev-ref HEAD`:
    git checkout main
    git diff --no-ext-diff --quiet --exit-code
    git pull --rebase origin main
    git diff --no-ext-diff --quiet --exit-code {{ BRANCH }}
    git branch -d {{ BRANCH }}
