# Denote #417

Repro for https://github.com/protesilaos/denote/issues/417.

Run `make`, open `public/20240831T132406--some-other-note__repro.md`, and verify that it links to the `.org` file instead of the `.md` file:

```
Some other note that links to [the first one](20240831T132345--some-note__repro.org).
```
