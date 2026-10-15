# SOC Home Lab (Apple Silicon)

A hybrid Security Operations Center detection lab built on an ARM MacBook, running
two SIEMs plus a live Linux victim for writing and testing detections.

## Architecture
- **Elastic (ELK)** — SIEM #1, native ARM in Docker. Log analysis + detections.
- **Splunk** — SIEM #2, local (x86 via Rosetta). Loaded with the **BOTS v3** attack dataset.
- **Linux victim** — native ARM Ubuntu VM (Multipass) with auditd, used to generate
  and capture attacker activity mapped to MITRE ATT&CK.

## Why hybrid
Splunk has no native ARM build, so it runs emulated locally while Elastic runs native.
This keeps both employer-relevant SIEMs on one laptop.

## Usage
    scripts/lab.sh up       # start Elastic + Splunk + victim
    scripts/lab.sh down     # stop everything
    scripts/lab.sh status   # what's running

## Contents
- scripts/    — lab control tooling
- detections/ — detection rules (SPL, KQL/EQL, Sigma) (in progress)
- docs/       — notes and write-ups
