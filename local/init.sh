
#!/usr/bin/env bash

JIBJIB_MODEL_PATH="$(pwd)/data/query/model"
JIBJIB_PICKLE_PATH="$(pwd)/data/query/pickle"

MODEL="https://s3-eu-west-1.amazonaws.com/jibjib/model/jibjib_model_serving_145.tgz"

BIRD_ID_URL="https://s3-eu-west-1.amazonaws.com/jibjib/pickle/bird_id_map_1.0.0.pickle"
BIRD_ID_DEST="${JIBJIB_PICKLE_PATH}/bird_id_map_1.0.0.pickle"

TRAIN_ID_URL="https://s3-eu-west-1.amazonaws.com/jibjib/pickle/train_id_list_1.1.0.pickle"
TRAIN_ID_DEST="${JIBJIB_PICKLE_PATH}/train_id_list_1.1.0.pickle"

# Create data folders, if necessary
if [ ! -d "${JIBJIB_MODEL_PATH}" ]; then
    mkdir -p ${JIBJIB_MODEL_PATH}
fi
if [ ! -d "${JIBJIB_PICKLE_PATH}" ]; then
    mkdir -p ${JIBJIB_PICKLE_PATH}
fi

echo "Fetching model"
wget ${MODEL} -O - | tar -xvz -C ${JIBJIB_MODEL_PATH}

echo "Fetching pickles"
wget ${BIRD_ID_URL} -O ${BIRD_ID_DEST}

wget ${TRAIN_ID_URL} -O ${TRAIN_ID_DEST}
