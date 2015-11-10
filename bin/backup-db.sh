#!/bin/bash

mysqldump -u gregj -p -e -c bodyconstruction > docs/bodyconstruction-db-schema.sql
