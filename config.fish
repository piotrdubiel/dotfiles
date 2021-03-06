set -gx EDITOR mvim -v

function make_completion --argument alias command
    complete -c $alias -xa "(
        set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
        complete -C\"$command \$cmd\";
    )"
end

alias c clear
alias i "ping -c 5 http://www.github.com"

alias g git
make_completion g git

alias m mvim
alias t task
alias tt "tree -hC"
alias ll "ls -al"
alias ip "curl ifconfig\.me/ip"
alias when "ping -i 20 -a (ip)"

alias rcg "curl http://whatthecommit.com/index.txt"

function fish_greeting 
    archey -c
end

set fish_path $HOME/.config/fish
set fish_theme agnoster

. $fish_path/oh-my-fish.fish

#set fish_greeting (set_color red)'                             ___
#              ___======____='(set_color yellow)'---='(set_color red)')
#            /T            \_'(set_color yellow)'--==='(set_color red)')
#            L \ '(set_color yellow)'(@)   '(set_color red)'\~    \_'(set_color yellow)'-=='(set_color red)')
#             \      / )J'(set_color yellow)'~~    '(set_color red)'\\'(set_color yellow)'-='(set_color red)')
#              \\\\___/  )JJ'(set_color yellow)'~~    '(set_color red)'\)
#               \_____/JJJ'(set_color yellow)'~~      '(set_color red)'\
#               / \  , \\'(set_color red)'J'(set_color yellow)'~~~~      \
#              (-\)'(set_color red)'\='(set_color yellow)'|  \~~~        L__
#              ('(set_color red)'\\'(set_color yellow)'\\)  ( -\)_            ==__
#               '(set_color red)'\V    '(set_color yellow)'\-'(set_color red)'\) =='(set_color yellow)'=_____  J\   \\\\
#                      '(set_color red)'\V)     \_)'(set_color yellow)' \   JJ J\)
#                                  /J J'(set_color red)'T'(set_color yellow)'\JJJ'(set_color red)'J)
#                                  (J'(set_color yellow)'JJ| '(set_color red)'\UUU)
#                                   (UU)'
#


#set fish_greeting (set_color yellow)'................................................................................
#................'(set_color blue)'__----____'(set_color yellow)'......................................................
#.......  ....__/          \_................   .................................
#.....      _/            )~~)_..............  ..................................
#.......  _/        )~)~)~~).~~)_...                     ........................
#......../........~).).).).~~)...)_....           ...............................
#......_/........(........).)~~).~~-_           .................................
#...._/...........|........)..)..).)~~)..........................................
#.../..............-_.......(.....)..).).........................................
#~~-..............)~.)_~_....\.....)~~.~)........................................
#./.................)~~)~)....|.......)........................................-~
#-...................)..)......\............................................._/..
#.).......................__....\.........................................../....
#)~.~..................../..-__..-_.............  _/\_...................__-.....
#..).)................._/.......\..\_.......... _/MWMW\_............._--/........
#.).}..............__/..........\_..-_......._/########\.........../............
#\__...........___--...............----______/___######__\___---====.............
#...-____---===..................................------..........................
#'


# Init RVM
rvm > /dev/null

__set_custom_paths
