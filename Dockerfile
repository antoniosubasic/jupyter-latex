FROM python:3.14-rc-slim

RUN apt-get update
RUN apt-get install -y --no-install-recommends texlive-full pandoc
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir jupyter nbconvert notebook

RUN mkdir -p /root/.jupyter
COPY jupyter_nbconvert_config.py /root/.jupyter/

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
