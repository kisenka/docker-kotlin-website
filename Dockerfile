FROM kisenka/centos6-jekyll

RUN npm install -g grunt-cli

ADD scripts/ /
RUN chmod +x /*.sh

RUN /install-wkhtml2pdf.sh
ADD stuff/10-wkhtmltopdf.conf /etc/fonts/conf.d/10-wkhtmltopdf.conf

RUN yum install -y java-1.7.0-openjdk.x86_64
RUN cd / && wget https://github.com/JetBrains/kotlin-grammar-generator/releases/download/v0.2/kotlin-grammar-generator.tar.gz
RUN cd / && tar -xzf ./kotlin-grammar-generator.tar.gz && rm ./kotlin-grammar-generator.tar.gz

CMD rake preview