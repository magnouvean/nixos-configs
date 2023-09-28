# Container directory
This is the container directory. This is intended for data used by containers,
such as containers' home directory. Home-directories should be place under
`./home/{{name-of-container}}`. To create a (arch with paru) container with this
home-directory, simply run:
```{bash}
mkdir -p ~/Containers/home/{{name-of-container}}
distrobox create --name {{name-of-container}} --home {{$HOME/Containers/ in absolute path}}/home/{{name-of-container}} --image docker.io/greyltc/archlinux-aur:paru
```