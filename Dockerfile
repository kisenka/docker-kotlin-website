FROM kisenka/centos6-jekyll

RUN yum install -y \
    which \
    java-1.7.0-openjdk.x86_64

ADD scripts/ /scripts/
RUN chmod +x /scripts/*.sh

RUN /scripts/install-wkhtml2pdf.sh && \
    mv /scripts/10-wkhtmltopdf.conf /etc/fonts/conf.d/10-wkhtmltopdf.conf

RUN cd /scripts && \
    /scripts/install-kotlin-grammar-generator.sh

RUN yum install -y unzip

CMD rake preview