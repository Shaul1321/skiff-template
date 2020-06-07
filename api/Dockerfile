#FROM covid-demo-basis

# installation

FROM ubuntu

RUN apt-get update
RUN apt-get -y install zip
RUN apt-get -y install unzip
RUN apt-get install -y git
RUN apt-get install python3.7
COPY . .

# INTALL CONDA

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update

RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
    
RUN sh ./install.sh


# get python files

WORKDIR /usr/src/app
RUN git clone https://github.com/Shaul1321/covid-ai2 #redo

# download data
RUN wget https://storage.googleapis.com/ai2i/shauli-covid/demo-data-partial/demo_data.zip
RUN unzip demo_data.zip -d ./covid-ai2
WORKDIR /usr/src/app/covid-ai2

# run streamlit

EXPOSE 8080
COPY . .
RUN streamlit run demo.py --server.port 8080
#CMD ["streamlit, "run", "demo.py", "--server.port", "8080"]
