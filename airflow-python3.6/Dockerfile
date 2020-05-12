
# VERSION 0.1.0
# AUTHOR: Ezhillarasan

FROM tclezhil/centos-python-3.6

## Core OS and dependencies install & configure

## Airflow install
ENV AIRFLOW_VERSION 1.10.0
ENV AIRFLOW_HOME /opt/airflow

RUN useradd --shell /bin/bash --create-home --home $AIRFLOW_HOME airflow \
    && mkdir $AIRFLOW_HOME/logs \
    && mkdir $AIRFLOW_HOME/dags \
    && chown -R airflow: $AIRFLOW_HOME

RUN echo "export PATH=\$PATH:/usr/local/bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:~/bin >> /etc/profile" 

RUN pip3 install  'pycrypto' 'mysqlclient' 'flask_bcrypt'

RUN  python3.6 -m pip install apache-airflow==1.10.10 \
 --constraint https://raw.githubusercontent.com/apache/airflow/1.10.10/requirements/requirements-python3.7.txt

RUN pip3 install 'apache-airflow[celery]' 'apache-airflow[rabbitmq]' 'apache-airflow[mysql]' 'apache-airflow[async]' 'apache-airflow[password]' 'apache-airflow[crypto]' 'apache-airflow[kerberos]' 'apache-airflow[jdbc]' 'apache-airflow[docker]' 'apache-airflow[druid]' 'apache-airflow[ldap]' 'apache-airflow[vertica]'

# Entrypoint
RUN cp /usr/local/bin/airflow /usr/bin/airflow
RUN cp /usr/local/bin/gunicorn /usr/bin/gunicorn
RUN echo "export PATH=\$PATH:/usr/local/bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:~/bin >> $AIRFLOW_HOME/.bashrc"
RUN mkdir $AIRFLOW_HOME/entrypoint.d
ADD entrypoint.d/* ${AIRFLOW_HOME}/entrypoint.d/
ADD entrypoint.sh ${AIRFLOW_HOME}/entrypoint.sh
RUN chmod +x $AIRFLOW_HOME/entrypoint.sh \
    && chmod +x $AIRFLOW_HOME/entrypoint.d/*

RUN yum install net-tools iputils mysql-connector-python telnet -y
RUN pip3 install mysqlclient mysql-connector-python flower wrapper

# Configuration
ADD airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

RUN sed -i "s:#AIRFLOW_HOME#:$AIRFLOW_HOME:" $AIRFLOW_HOME/airflow.cfg \
    && sed -i "s:#AIRFLOW_HOME#:$AIRFLOW_HOME:" $AIRFLOW_HOME/entrypoint.d/*

RUN FERNET_KEY=$(python3.6 -c "from cryptography.fernet import Fernet; fernet_key= Fernet.generate_key(); print(fernet_key.decode()) ") \
    && sed -i "s/#FERNET_KEY#/$FERNET_KEY/" $AIRFLOW_HOME/airflow.cfg \
    && sed -i "s/#FERNET_KEY#/$FERNET_KEY/" $AIRFLOW_HOME/entrypoint.d/*

RUN cp /usr/local/bin/flower /usr/bin/flower


RUN pip3 install tqdm pandas==1.0.3

EXPOSE 8080 5555 8793

USER root
WORKDIR ${AIRFLOW_HOME}
ENTRYPOINT ["./entrypoint.sh" ]
