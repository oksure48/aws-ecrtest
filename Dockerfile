FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# Install Apache
RUN yum update -y && \
    yum install -y httpd

# Simple HTML page
RUN echo 'Hello World!' > /var/www/html/index.html

# Create startup script
RUN echo '#!/bin/bash' > /root/run_apache.sh && \
    echo 'mkdir -p /var/run/httpd' >> /root/run_apache.sh && \
    echo 'mkdir -p /var/lock/httpd' >> /root/run_apache.sh && \
    echo '/usr/sbin/httpd -D FOREGROUND' >> /root/run_apache.sh && \
    chmod +x /root/run_apache.sh

EXPOSE 80

CMD ["/root/run_apache.sh"]

