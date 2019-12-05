# SSE

HOW IT WORKS

The master script generates the key and starts the master vm instance, this then calls the master-startup script which clones the Distributed-master-worker repo, installs npm and runs the server with the gerneated key.

The create-clients script takes N as the parameter and has a for loop which iterates N times, on each interation it creates a VM instance and runs the vm-srcript
