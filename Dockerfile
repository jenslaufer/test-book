FROM rocker/tidyverse AS builder

RUN apt update &&\
    apt -y upgrade &&\ 
    apt autoremove -y &&\ 
    wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.40/quarto-1.6.40-linux-amd64.deb -O quarto.deb &&\
    apt install -y ./quarto.deb &&\
    rm ./quarto.deb &&\
    quarto install tinytex


COPY ./book-quarto /book

WORKDIR /book
RUN quarto render --to epub

FROM scratch AS export

COPY --from=builder /book/_book/ /



