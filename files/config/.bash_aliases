# alias mpidata='sudo mount -t cifs -o username=pi,uid=1000,gid=1000 //192.168.27.33/fileStorage ~/netshare/pi_NAS'
# alias mpibackup='sudo mount -t cifs -o username=pi,uid=1000,gid=1000 //192.168.27.33/backup ~/netshare/backup'

# use zoxide for cd
alias cd="z"

# adds bin dir for arg1, optional arg2 to specify build dir
addbin() { 
    def_dir=${2:-build} 
    if (($# < 1)) 
    then 
	echo "usage: \"addbin dir [build_dir]\"" 
    else
	adding=/home/christopher/workspace/_brlcad/$1/$def_dir/bin
	export PATH=$adding:$PATH
	echo $adding
    fi 
}
