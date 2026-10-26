FROM docker.io/texlive/texlive:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends pandoc python3-venv \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Debian's system Python rejects global pip installs (PEP 668), so jupyter lives in a venv
RUN python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir jupyter nbconvert notebook
ENV PATH="/opt/venv/bin:$PATH"

RUN mkdir -p /root/.jupyter
COPY jupyter_nbconvert_config.py /root/.jupyter/

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
