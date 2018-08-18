
#!/usr/bin/env bash

JIBJIB_MODEL_PATH=$(pwd)/data/query/model
JIBJIB_PICKLE_PATH=$(pwd)/data/query/pickle

# Create data folders, if necessary
if [ ! -d "${JIBJIB_MODEL_PATH}" ]; then
    mkdir -p ${JIBJIB_MODEL_PATH}
fi
if [ ! -d "${JIBJIB_PICKLE_PATH}" ]; then
    mkdir -p ${JIBJIB_PICKLE_PATH}
fi

echo "Fetching model"
curl https://s3-eu-west-1.amazonaws.com/jibjib/model/jibjib_model_serving_v1.tgz | \
	tar -xvz -C ${JIBJIB_MODEL_PATH}

echo "Fetching pickles"
curl https://s3-eu-west-1.amazonaws.com/jibjib/pickle/mapping_pickles.tgz | \
	tar -xvz -C ${JIBJIB_PICKLE_PATH}
