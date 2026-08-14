# Server Health & Network Diagnostic Tool

A Bash script to check basic server health and network status on a Linux
server (developed and tested on Ubuntu, AWS EC2). Built as a hands-on
learning project — no external dependencies beyond standard Linux tools.

## Usage

    chmod +x healthcheck.sh
    ./healthcheck.sh

## Checks currently implemented

- **Disk usage** — per-mount breakdown via `df -h`
- **Memory usage** — RAM and swap via `free -h`
- **Top CPU-consuming processes** — top 5 via `ps aux`
- **DNS resolution test** — confirms the server can resolve domain names
  (tests `github.com` specifically, to isolate DNS from general connectivity)

## Sample output

    === Disk Usage ===
    Mounted on   Use%  Size  Used Avail
    /            48%   6.7G  3.2G  3.5G

    === DNS Resolution Test ===
    DNS resolution: OK (github.com resolved successfully)

## Planned / not yet implemented

- General internet connectivity test (separate from DNS)
- Open/listening port check
- Timestamped logging to file (currently prints to terminal only)

## Author

Madhav Joshi
