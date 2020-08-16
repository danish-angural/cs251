#!/bin/bash
mkdir albums
mkdir playlists
for f in ./songs/*
do album_name=$(head -n 1 "$f")
[ -e "./albums/$album_name" ] || mkdir "./albums/$album_name"
t=$(basename "$f")
ln -s "$(realpath "$f")" ./albums/"$album_name/$t"
num_playlists=$(sed "2q;d" "$f")
for ((i=3; i<num_playlists+3; i++))
do playlist_name=$(sed "${i}q;d" "$f")
[ -e "./playlists/$playlist_name" ] || mkdir "./playlists/$playlist_name"
t=$(basename "$f")
ln -s "$(realpath "$f")" ./playlists/"$playlist_name/$t"
done
done

