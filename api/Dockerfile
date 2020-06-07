FROM covid-demo-basis
#RUN apt-get update

#RUN apt-get -y install zip
#RUN apt-get -y install unzip
#RUN apt-get install -y git

WORKDIR /usr/src/app
RUN git clone https://github.com/Shaul1321/covid-ai2 #redo

# download data
RUN wget https://storage.googleapis.com/ai2i/shauli-covid/demo-data-partial/demo_data.zip
RUN unzip demo_data.zip -d ./covid-ai2
WORKDIR /usr/src/app/covid-ai2

# run streamlit

EXPOSE 8080
COPY . .
#RUN streamlit run demo.py --server.port 8080
CMD ["python", "demo.py", "--server.port 8080"]

