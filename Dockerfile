FROM python:3.11-slim as base

RUN mkdir /srv/app
VOLUME [ "/srv/app" ]
RUN apt update && apt install -y libpq-dev && python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY web.py /srv/app/web.py

FROM python:3.11-slim

COPY --from=base /opt/venv /opt/venv
COPY --from=base /srv/app /srv/app
ENV PATH="/opt/venv/bin:$PATH"
CMD python /srv/app/web.py