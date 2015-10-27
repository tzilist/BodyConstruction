#!/bin/bash

mysqldump -u gregj -p --no-data bodyconstruction > docs/bodyconstruction-db-schema.sql
