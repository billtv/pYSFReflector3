FROM python:3.12-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /opt/pYSFReflector3

COPY requirements.txt .
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt

COPY . .
RUN chmod +x YSFReflector \
    && mkdir -p /opt/pYSFReflector3/log

# pYSFReflector3 uses UDP for both the YSF and JSON/collector sockets.
EXPOSE 42001/udp
EXPOSE 42223/udp

ENTRYPOINT ["python3", "/opt/pYSFReflector3/YSFReflector", "/opt/pYSFReflector3/pysfreflector.ini"]
