#!/bin/sh

# Read environment variables or set default values
echo -ne "Read environment variables..."
MINIO_URL=${MINIO_URL:-none}
MINIO_BUCKET=${MINIO_BUCKET:-none}
MINIO_KEY=${MINIO_KEY:-none}
MINIO_SECRET=${MINIO_SECRET:-none}

echo $MINIO_URL
echo $MINIO_BUCKET
echo $MINIO_KEY
echo $MINIO_SECRET

exec /bin/bash -c "nginx -c /etc/nginx/nginx.conf -g 'daemon off;'"
