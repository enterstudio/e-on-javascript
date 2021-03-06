#!/usr/bin/env rune -Dfile.encoding=utf-8 -cpa lib-host

# Copyright 2008 Kevin Reid, under the terms of the MIT X license
# found at http://www.opensource.org/licenses/mit-license.html ................

def compileLibraries := <import:org.erights.eojs.compileLibraries>

def libs := <import:org.erights.eojs.commonEmakerList>

def libSources := [
  <file:lib-target/>,
  <resource>,
  <file:lib-target-eocl/>, # this should be created as a symlink to EoCL lib/
]

def failureCount := compileLibraries(libs, libSources, <file:serve/import/>, stdout, <file:lib-report.html>.textWriter(), `E-on-JavaScript library compilation report - ${<unsafe:java.util.makeDate>(timer.now())}`, false)

if (failureCount > 0) {
  println(`*** $failureCount emaker compilations failed.`)
  println(`*** Open lib-report.html for details.`)
}