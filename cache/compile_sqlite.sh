if [ ! -f sqlite3.o ]; then
    echo 'Compile SQLite to sqlite.o ...'
    gcc -c -std=c99 -O3 -Wall -Werror -pedantic -o sqlite3.o sqlite3.c;
fi
