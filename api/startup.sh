#!/bin/bash
DATASET_NAME="${DATASET_NAME:-data}"
DATASET_URL="${DATASET_URL:-https://storage.googleapis.com/ai2i/shauli-covid/demo-data-partial/demo_data.zip}"
CACHE_URL="${CACHE_URL:-}"
LOCAL_DATASET_DIR=/usr/src/app/covid-ai2
LOCAL_DATASET_PATH=${LOCAL_DATASET_DIR}/${DATASET_NAME}
LOCAL_CACHE_PATH=${LOCAL_DATASET_DIR}/.cache/${DATASET_NAME}

# check if the directory does not exists or is empty
if [[ ! -d ${LOCAL_DATASET_PATH} || -z "$(ls -A ${LOCAL_DATASET_PATH})" ]]
then
    echo "INFO: Downloading dataset from ${DATASET_URL})..."
    wget ${DATASET_URL} || exit 1
    unzip demo_data.zip -d ${LOCAL_DATASET_DIR}/${DATASET_NAME}
else
    echo "INFO: loading existing dataset from ${LOCAL_DATASET_PATH}..."
fi

# if the local cache path dir does not exist and the cache url variable is set
if [[ ! -d ${LOCAL_CACHE_PATH} && ! -z "${CACHE_URL}" ]]
then
    echo "INFO: Downloading cache from ${CACHE_URL})..."
    wget ${DATASET_URL} || exit 1
    unzip demo_data.zip -d ${LOCAL_DATASET_DIR}/${DATASET_NAME}
elif [[ -d ${LOCAL_CACHE_PATH} ]]
then
    # the local cache dir does exist
    echo "INFO: loading the spike cache from ${LOCAL_CACHE_PATH}..."
else
    # the local cache dir doesn't exist but the cache url is undefined.
    echo "INFO: starting without cache, will be created lazily on first use."
fi

ls -lh
pwd
streamlit run demo.py --server.port 8080
