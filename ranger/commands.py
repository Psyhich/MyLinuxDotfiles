#!/usr/bin/env python3

from ranger.api.commands import Command
import subprocess


class share(Command):
    def execute(self):
        if self.arg(1) == "tg":
            paths = ["telegram-desktop", "-sendpath"] + self.rest(2).split(" ")
            subprocess.run(paths)

    def tab(self, tabnum):
        return self._tab_only_directories()
