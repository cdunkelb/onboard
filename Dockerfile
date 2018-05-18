FROM python:alpine
RUN apk add --no-cache nmap
COPY python-nmap-0.4.1.tar.gz .
RUN tar xvzf python-nmap-0.4.1.tar.gz
WORKDIR python-nmap-0.4.1
RUN python setup.py install
WORKDIR /usr/src/app
COPY requirements.txt ./
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
ENV FLASK_APP hello.py
CMD [ "flask", "run", "--host=0.0.0.0" ]
EXPOSE 5000
