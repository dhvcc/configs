#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import pathlib
import time


def main():
    timestamp = None
    with open(pathlib.Path.home() / ".bash_history", "rt") as bash_history:
        with open(pathlib.Path.home() / ".zsh_history", "wt") as zsh_history:
            for line in bash_history.readlines():
                line = line.rstrip('\n')
                if line.startswith('#') and timestamp is None:
                    t = line[1:]
                    if t.isdigit():
                        timestamp = t
                        continue
                else:
                    zsh_history.write(': %s:0;%s\n' % (timestamp or time.time(), line))
                    timestamp = None


if __name__ == '__main__':
    main()

