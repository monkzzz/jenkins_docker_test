FROM python:2.7
WORKDIR /html
COPY index.html .
COPY styles.css .
EXPOSE 3000
CMD python -m SimpleHTTPServer 3000
