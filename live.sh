#!/usr/bin/env bash

PORT=${1:-8000}
$(npm bin)/elm reactor --port $PORT
