#!/bin/sh

rm -rf /tmp/*

export PGPASSWORD=${DB_PASS}

DATE=`date +%Y-%m-%d_%H-%M`

BKPNAME=${DB_NAME}-${DATE}

echo $(date) "Backup iniciado"
pg_dump -h ${DB_HOST} -p ${DB_PORT} -U${DB_USER} -Fp -c -C -O ${DB_NAME} -f /tmp/${BKPNAME}.sql

echo $(date) "Compactando backup"
tar -zcvf /tmp/${BKPNAME}.tar.gz /tmp/${BKPNAME}.sql

echo $(date) "Copiando arquivo para o bucket s3"
aws s3 cp /tmp/${BKPNAME}.tar.gz s3://${BUCKET_NAME}/${BKP_PREFIX}${DB_NAME}/${BKPNAME}.tar.gz --region ${AWS_REGION}