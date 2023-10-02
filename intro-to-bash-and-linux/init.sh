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
        echo "Good job finding this hidden file!" > /home/$username/.hidden.txt
        echo "Tomatoes" > /home/$username/fruit.txt
        echo "- Grapes\n- Oranges\n- Peaches" > /home/$username/rename.txt
        sudo chown $username:$username /home/$username/rename.txt
        sudo chown $username:$username /home/$username/.hidden.txt
        sudo chown $username:$username /home/$username/fruit.txt
        mkdir /home/$username/tree
        echo "Just a leaf" > /home/$username/tree/leaf.txt
        sudo chown $username:$username /home/$username/tree
        sudo chown $username:$username /home/$username/tree/leaf.txt
        echo "high permissions" > /home/$username/perms.txt
    done
fi
