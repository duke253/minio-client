## minio-client
This is minio client (mc) on Centos 7/

### Step 0
Adjust parameters in minio-client.yaml regarding your environment (e.g. MINIO_URL, MINIO_BUCKET etc...). See %REPLACE_ME% in parameters.

### Step 1
create template

```
oc create --filename minio-client.yaml
```

### Step 2
deploy minio-client instance from template

```
oc new-app --template=minio-client
```

### Step 3
use below commands to test minio instance (use your own values for $MINIO_URL, $MINIO_KEY, etc)

```
./mc --insecure --config-dir /opt/minio-client config host add minio $MINIO_URL $MINIO_KEY $MINIO_SECRET
./mc --insecure --config-dir /opt/minio-client ls minio/$MINIO_BUCKET
```
