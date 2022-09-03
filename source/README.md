# meta
View and set the metadata for audio files

## Installation
First, get [choosenim](https://github.com/dom96/choosenim), then figure out
how to get taglib for your OS. Finally, run `nimble install meta`.

## Examples
Look at the metadata for a song
```
$ meta test.opus
Track num: 1
Title: TempleOS Hymn Risen (Remix)
Artist: David Eddy
Album: Summer
Genre:
Year: 2017
Comment: Visit https://daveeddy.bandcamp.com
```

Read a specific value for a song
```
$ meta example.mp3 --title
TempleOS Hymm Risen (Remix)
```

Modify a value for a song
```
$ meta song.flac --artist="me, lol" --album=portfolio
Track num: 1
Title: TempleOS Hymn Risen (Remix)
Artist: me, lol
Album: portfolio
Genre:
Year: 2017
Comment: Visit https://daveeddy.bandcamp.com
```

Clear out a specific value
```
$ meta from-ytdl.opus --clear comment
Track num: 1
Title: TempleOS Hymn Risen (Remix)
Artist: David Eddy
Album: Summer
Genre:
Year: 2017
Comment:
```

Glob matching
```
$ meta *mp3 --artist --title
Mittsies
Vitality

Mittsies
Apropos

Mittsies
Epitomize

Mittsies
Luminescent

Mittsies
Vitality (VIP Edit)
```

Learn more
```
$ meta --help
```

## Usage
If you just want to view the metadata for a song, you can do `meta {song name}`.

### Commands
There are a few "command" options: `--track`, `--title`, `--artist`, `--album`,
`--genre`, `--year`, and `--comment`. These commands can be given values by
separating the values with an `=` sign.

If you want to view a specific value(s), you can add a "command" without any 
value.
The program will print out the value, in the order that you ask it to, 
separted by newlines (unless the `--newline` option is set). The program will 
print an empty line once it's done.
**Note**: `meta` does not filter or escape newlines
from the `--comment` field, so be wary when writing scripts.

If you want to set a value, you'd add a "command" and append a value to it.
`--track` and `--year` must be unsigned integers (a non-negative whole number).

You can clear a value with the `--clear` option and a command afterward 
(without the `--` prefix), so: `meta --clear title` would clear the title
value.

By default, the program will output all of the metadata a song has. This doesn't
happen if the `--quiet` option is set or a reading "command" is run. That, in
turn, is overridden by the `--confirm` option, which will ensure that the
program always outputs all the metadata.

## Options
**-h**, **--help**

Shows the help text

**-v**, **--version**

Shows the version number

**-c**, **--confirm**

Confirm changes before writing them to the audio file

**-q**, **--quiet**

Prevents the program from printing the metadata overview

**--track=[val]**

Change the track number, or view the current track number, must be a positive
integer

**--title=[val]**

Change the song title, or view the current title.

**--artist=[val]**

Change the song artist, or view the current artist

**--album=[val]**

Change the song album, or view the current album

**--genre=[val]**

Change the song genre, or view the current genre

**--year=[val]**

Change the song year, or view the current year, must be a positive integer.

**--comment=[val]**

Change the song comment, or view the current song comment

**--clear \<attr\>**

Clear the attribue `attr`. Must be one of track, title, artist, album, genre,
year, or comment.

**-n**, **--no-newline**

Remove the newlines that are added in-between files
