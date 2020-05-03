
# VERSION 0.1.0
# AUTHOR: Ezhillarasan

FROM tclezhil/centos-python-2.7

## Core OS and dependencies install & configure

## Airflow install
ENV AIRFLOW_VERSION 1.10.0
ENV AIRFLOW_HOME /opt/airflow

RUN useradd --shell /bin/bash --create-home --home $AIRFLOW_HOME airflow \
    && mkdir $AIRFLOW_HOME/logs \
    && mkdir $AIRFLOW_HOME/dags \
    && chown -R airflow: $AIRFLOW_HOME

RUN echo "export PATH=\$PATH:/usr/local/bin/" 

RUN  python -m pip install apache-airflow==1.10.10 \
 --constraint https://raw.githubusercontent.com/apache/airflow/1.10.10/requirements/requirements-python2.7.txt

RUN pip install 'apache-airflow[celery,rabbitmq,mysql,async,password,hive,druid,ldap,vertica]'
RUN pip install 'apache-airflow[crypto,kerberos,jdbc,docker]'

RUN pip install  'pycrypto' 'flask_bcrypt' 
# Entrypoint
RUN chown -R airflow:airflow /opt/airflow

RUN mkdir $AIRFLOW_HOME/entrypoint.d
ADD entrypoint.d/* ${AIRFLOW_HOME}/entrypoint.d/
ADD entrypoint.sh ${AIRFLOW_HOME}/entrypoint.sh
RUN chmod +x $AIRFLOW_HOME/entrypoint.sh \
    && chmod +x $AIRFLOW_HOME/entrypoint.d/*

RUN yum install net-tools iputils  telnet -y
# Configuration
ADD airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

RUN sed -i "s:#AIRFLOW_HOME#:$AIRFLOW_HOME:" $AIRFLOW_HOME/airflow.cfg \
    && sed -i "s:#AIRFLOW_HOME#:$AIRFLOW_HOME:" $AIRFLOW_HOME/entrypoint.d/*

RUN FERNET_KEY=$(python -c "from cryptography.fernet import Fernet; fernet_key= Fernet.generate_key(); print(fernet_key.decode()) ") \
    && sed -i "s/#FERNET_KEY#/$FERNET_KEY/" $AIRFLOW_HOME/airflow.cfg \
    && sed -i "s/#FERNET_KEY#/$FERNET_KEY/" $AIRFLOW_HOME/entrypoint.d/*

EXPOSE 8080 5555 8793

USER root
WORKDIR ${AIRFLOW_HOME}
ENTRYPOINT ["./entrypoint.sh" ]
