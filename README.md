# cyber-sec-analysis-scripts
This is my collection of cyber security analysis scripts

- `checkipv4conn`: Checks for open connections either `LISTEN` or `ESTABLISHED` states. And return a list of names of the programs running in those IPv4 open connections.

- `simple_kernel_firewall_setup`: It setups some standard firewall rules for a linux machine with `iptables` command available. The file must be run directly with root privileges.

# How to use the commands

- Dowload the repository and run `source <file_with_needed_command>`. If the file is a plain script, run the file directly using root (if needed).

# Author Notes

- These commands are meant for scripting practice and personal use. They are crafted to fill my needs and I wouldn't expect open contribution.
- Commands will be added from time to time. As I craft new tools along the way.
- Currently, commands have only been tested on a macos environment.
