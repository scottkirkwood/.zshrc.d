.bashrc.d
=========

Scott's Bash files, organized.
------------------------------

Put the following in your ~/.bashrc

    for script in ~/.bashrc.d/*; do
      # skip non-executable snippets
      [ -x "$script" ] || continue

      # execute $script in the context of the current shell
      . $script
    done

All executable scripts in ~/.bashrc.d/ folder will get
executed.  The scripts are execute is lexicographical order so putting 10_, 20_
etc. in front will run them first.

If you have a huge ~/.bashrc file you can start copying
parts into something more organized.
