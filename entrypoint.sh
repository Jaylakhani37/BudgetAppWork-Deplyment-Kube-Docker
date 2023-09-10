#!/bin/bash
set -e

# If the database exists, migrate. Otherwise setup (create and migrate)
rails db:exists && rails db:migrate || rails db:setup

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
