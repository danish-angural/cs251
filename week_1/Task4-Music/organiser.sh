#!/bin/bash
[ -e "./albums" ] || mkdir albums
[ -e "./playlists" ] || mkdir playlists
for f in ./songs/*
do album_name=$(head -n 1 "$f")
[ -e "./albums/$album_name" ] || mkdir "./albums/$album_name"
t=$(basename "$f")
[ -e "./albums/$album_name/$t" ] || ln -s "$(realpath "$f")" ./albums/"$album_name/$t"
num_playlists=$(cat "$f" | head -n 2 | tail -1)
for ((i=3; i<num_playlists+3; i++))
do playlist_name=$(cat "$f" | head -n "$i" | tail -1)
[ -e "./playlists/$playlist_name" ] || mkdir "./playlists/$playlist_name"
[ -e  ./playlists/"$playlist_name/$t" ] || ln -s "$(realpath "$f")" ./playlists/"$playlist_name/$t"
done
done
