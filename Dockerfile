FROM apache/airflow:2.3.0
USER root

# Install OpenJDK-11
RUN apt update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Set JAVA_HOME
# For AMD archtecture :
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
# ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-arm64
RUN export JAVA_HOME

# Change permissions for Airflow directories
RUN mkdir -p /opt/airflow/logs && \
    chown -R airflow: /opt/airflow

USER airflow

COPY ./requirements.txt /
RUN pip install -r /requirements.txt
