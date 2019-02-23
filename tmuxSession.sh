#!/bin/sh
# Script start tmux session

if(tmux list-session)>/dev/null 2>&1
then
	local -i opens=$(tmux list-session |cut -c1|wc -l)
	echo $opens
	if  tmux list-session |cut -c1|wc -l|grep 1
	then 
		session=$(tmux list-session |cut -c1)
                tmux attach-session -t $session
	else 
	        tmux list-session
                echo "Seleccionar una opcion:"
                read x
                tmux attach-session -t $x
	fi 
else
	tmux
fi
	
