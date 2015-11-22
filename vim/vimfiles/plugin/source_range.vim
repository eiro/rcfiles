command -range Source
    \  <line1>,<line2>w! /tmp/Viml.vim
    \| redir! > /tmp/Viml.out
    \| silent source /tmp/Viml.vim
    \| redir END
    \| <line1>r /tmp/Viml.out

