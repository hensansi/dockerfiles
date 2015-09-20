#!/bin/bash
set -e
nohup tsc -m commonjs -watch -t es5 --emitDecoratorMetadata --experimentalDecorators app.ts 0<&- &>/dev/null &
exec "$@"
