# first stage
FROM python3.9 as builder

COPY deployment/requirements.txt .

# install dependencies to the local user directory (eg. /root/.local)
RUN pip install --user -r requirements.txt

# second stage
FROM python3.9
WORKDIR /usr/app

# copy installed dependencies from the first stage
COPY --from=builder /root/.local /root/.local

# update PATH
ENV PATH=/root/.local:$PATH
