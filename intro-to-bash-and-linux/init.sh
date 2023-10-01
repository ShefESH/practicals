#!/bin/bash
mkdir /run/sshd
# Make sure script doesn't run twice
if ! grep -q user80 "/etc/passwd"; then
    # Create users
    for num in $(seq 1 80)
    do
        password=$(echo 'SESH_LINUX' | openssl passwd -6 -stdin)
        username=user$num
        useradd -m -s /bin/bash $username --password $password
        # all actions as user/group
        sudo runuser "$username" -g $username
        # Add files and folders for each user
        echo "Good job finding this hidden file!" > /home/$username/.hidden.txt
        echo "Tomatoes" > /home/$username/fruit.txt
        echo "- Grapes\n- Oranges\n- Peaches" > /home/$username/rename.txt
        mkdir /home/$username/tree && echo "Just a leaf" > /home/$username/tree/leaf.txt
        # Use root user/group
        sudo runuser "root" -g root
        # Create a file as root
        echo "high permissions" > /home/$username/perms.txt
    done
fi
