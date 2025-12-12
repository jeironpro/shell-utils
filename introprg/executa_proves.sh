#! /bin/bash

javac *.java && java org.junit.platform.console.ConsoleLauncher -c $@
exit "$?"

