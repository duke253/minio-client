#!/bin/sh

# Read environment variables or set default values
echo -ne "Read environment variables..."
MINIO_URL=${MINIO_URL:-http://130.193.58.121:9000}
MINIO_BUCKET=${MINIO_BUCKET:-mm-data}
MINIO_KEY=${MINIO_KEY:-AKIAIOSFODNN7EXAMPLE}
MINIO_SECRET=${MINIO_SECRET:-AKIAIOSFODNN7EXAMPLE}

echo $MINIO_URL
echo $MINIO_BUCKET
echo $MINIO_KEY
echo $MINIO_SECRET

exec '/bin/bash -c /home/minio-client/mc config host add minio $MINIO_URL $MINIO_KEY $MINIO_SECRET && /bin/bash -c /home/minio-client/mc ls minio/$MINIO_BUCKET &&/bin/bash -c echo FIN!!!'
