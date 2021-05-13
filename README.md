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