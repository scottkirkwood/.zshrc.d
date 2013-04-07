#!/bin/bash
#
# $Id$
# Copyright 2009 Google Inc. All Rights Reserved.
# Author: scottkirkwood@google.com (Scott Kirkwood)

_unison_show() {
  local cur

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=($( compgen -W "$(for x in ~/.unison/*.prf; do echo $(basename ${x%.prf}); done)" -- $cur ) )
}
complete -o nospace -F _unison_show unison-gtk unison


_run_show() {
  local cur

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=($( compgen -W "$(for x in ~/.arg_man/*; do echo $(basename ${x}); done)" -- $cur ) )
}
complete -o nospace -F _run_show run

