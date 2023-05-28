# Task Mutt

Uses [task-mutt.sh](task-mutt.sh) script to send a minimal task warrior report to an email address using a configured mutt instance.

```sh
(crontab -l; echo "0 7 * * * /home/h/workstation/scripts/task-mutt.sh recipient@example.com") | crontab -
```

# Misc

- Move flatpak binaries to somewhere on shell path with a useful name

```sh
sudo ln -s /var/lib/flatpak/exports/bin/org.zotero.Zotero /home/h/somewhere/zotero
```

