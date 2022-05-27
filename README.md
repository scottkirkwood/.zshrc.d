.zshrc.d
=========

Scott's ZSH files, organized.
------------------------------

Put the following in your ~/.zshrc

    for script in ~/.zshrc.d/*; do
      # skip non-executable snippets
      [ -x "$script" ] || continue

      # execute $script in the context of the current shell
      . $script
    done

All executable scripts in ~/.zshrc.d/ folder will get
executed.  The scripts are execute is lexicographical order so putting 10_, 20_
etc. in front will run them first.

If you have a huge ~/.zshrc file you can start copying
parts into something more organized.
