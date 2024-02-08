FROM ubuntu:latest

# Install all term info to improve experience.
RUN apt-get update
#  && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y $(apt-cache search terminfo | awk '{print $1}')

# Group for dummy users
RUN groupadd dummies

# Create some dummy users.
RUN useradd --create-home --groups dummies --shell /bin/bash -p "$(openssl passwd -1 password)" bob
RUN useradd --create-home --groups dummies --shell /bin/bash -p "$(openssl passwd -1 kfpLDJKfFs2D)" john
RUN useradd --create-home --groups dummies --shell /bin/bash -p "$(openssl passwd -1 kfp123dius)" alice
RUN useradd --create-home --groups dummies --shell /bin/bash -p "$(openssl passwd -1 kfp1298fOFjoiu3)" amy

# Create the presenter user.
RUN useradd --create-home --groups dummies --shell /bin/bash -p "$(openssl passwd -1 kfpLDJtijs2D)" presenter

# expose port 22 for ssh
EXPOSE 22

# Run the presenter related script
COPY init.sh /home/presenter
COPY instructions.md /home/presenter
COPY earliest_computer.png /home/presenter
COPY instructions.md /home/presenter
COPY message.txt /home/presenter
COPY public_map_light.png /home/presenter/public_map.png
COPY public_map_dark.png /home/presenter/public_map_dark.png
COPY problem_map_light.png /home/presenter/problem_map.png
COPY problem_map_dark.png /home/presenter/problem_map_dark.png

WORKDIR /home/presenter
ENTRYPOINT ["/bin/bash", "/home/presenter/init.sh"]