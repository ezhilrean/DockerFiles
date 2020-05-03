
# VERSION 0.1.0
# AUTHOR: Ezhillarasan

FROM tclezhil/centos-airflow

## Core OS and dependencies install & configure

## Airflow install
ENV AIRFLOW_VERSION 1.10.0.dev0+apache.incubating
ENV AIRFLOW_HOME /opt/airflow

RUN useradd --shell /bin/bash --create-home --home $AIRFLOW_HOME airflow \
    && mkdir $AIRFLOW_HOME/logs \
    && mkdir $AIRFLOW_HOME/dags \
    && chown -R airflow: $AIRFLOW_HOME

RUN echo "export PATH=\$PATH:/usr/local/bin/" 

RUN pip3 install  'pycrypto' 'mysqlclient'

			
# Entrypoint
RUN mv /usr/bin/python /usr/bin/python_backup
RUN cp  /usr/bin/python3.6 /usr/bin/python
RUN cp /usr/local/bin/airflow /usr/bin/airflow
RUN chown -R airflow:airflow /opt/airflow
RUN chmod -R 777 /opt/airflow/logs

RUN mkdir $AIRFLOW_HOME/entrypoint.d
ADD entrypoint.d/* ${AIRFLOW_HOME}/entrypoint.d/
ADD entrypoint.sh ${AIRFLOW_HOME}/entrypoint.sh
RUN chmod +x $AIRFLOW_HOME/entrypoint.sh \
    && chmod +x $AIRFLOW_HOME/entrypoint.d/*

# Configuration
ADD airflow.cfg ${AIRFLOW_HOME}/airflow.cfg

RUN sed -i "s:#AIRFLOW_HOME#:$AIRFLOW_HOME:" $AIRFLOW_HOME/airflow.cfg \
    && sed -i "s:#AIRFLOW_HOME#:$AIRFLOW_HOME:" $AIRFLOW_HOME/entrypoint.d/*

RUN FERNET_KEY=$(python3 -c "from cryptography.fernet import Fernet; fernet_key= Fernet.generate_key(); print(fernet_key.decode()) ") \
    && sed -i "s/#FERNET_KEY#/$FERNET_KEY/" $AIRFLOW_HOME/airflow.cfg \
    && sed -i "s/#FERNET_KEY#/$FERNET_KEY/" $AIRFLOW_HOME/entrypoint.d/*

EXPOSE 8080 5555 8793

USER root
WORKDIR ${AIRFLOW_HOME}
ENTRYPOINT ["./entrypoint.sh" ]
