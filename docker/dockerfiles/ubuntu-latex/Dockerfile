FROM 	ubuntu:18.04
RUN 	apt-get update && apt-get install -y texstudio texlive-latex-base \
	texlive-latex-extra texlive-latex-recommended texlive-lang-german
##	This will lead to a interactive configuration of tzdata

# Replace user 1000 with your user / group id
RUN 	export -p /home/svekre && \
	mkdir -p /home/svekre && \
	echo "svekre:x:${uid}:${gid}:Sven Kreienbrock,,,:/home/svekre" >>/etc/passwd && \
	echo "svekre:x:${uid}:" >> /etc/group && \
	mkdir /etc/sudoers.d && \
	chown root /etc/sudoers.d && \
	echo "svekre ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/svekre && \
	chmod ${uid}:${gid} -R /home/svekre

USER	svekre
ENV	HOME /home/svekre
CMD	/usr/bin/texstudio	
