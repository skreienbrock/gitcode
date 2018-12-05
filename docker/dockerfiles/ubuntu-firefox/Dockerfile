FROM 	ubuntu:18.04
RUN 	apt-get update && apt-get install -y firefox torbrowser-launcher

# Replace user 1000 with your user / group id
RUN 	export -p /home/svekre && \
	mkdir -p /home/svekre && \
	echo "svekre:x:1000:1000:Sven Kreienbrock,,,:/home/svekre" >>/etc/passwd && \
	echo "svekre:x:1000:" >> /etc/group && \
	mkdir /etc/sudoers.d && \
	chown root /etc/sudoers.d && \
	echo "svekre ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/svekre && \
	chown 1000:1000 -R /home/svekre

USER	svekre
ENV	HOME /home/svekre
CMD	/usr/bin/firefox
