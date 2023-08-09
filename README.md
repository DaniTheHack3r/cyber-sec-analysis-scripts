# cyber-sec-analysis-scripts
This is my collection of cyber security analysis scripts

- `checkipv4conn`: Checks for open connections either `LISTEN` or `ESTABLISHED` states. And return a list of names of the programs running in those IPv4 open connections.

- `simple_kernel_firewall_setup`: It setups some standard firewall rules for a linux machine with `iptables` command available. The file must be run directly with root privileges.

- `watchdog_example`: This is a simple script with tcpdump to scan a specific port and host. The packet capture is saved in tmp directory and actively wipe and update the file every 10 minutes with a maximum file size of 2 million bytes.

- `capture_ssh_connection_attempts`: It uses tcpdump to scan network interfaces actively to check for ssh connection attempts. The packet capture is saved in tmp directory.

- `check_for_get_operations`: It uses advanced filtering to check for GET requests. It saves the packet capture in the tmp directory.

# How to use the commands

- Dowload the repository and run `source <file_with_needed_command>`. If the file is a plain script, give permissions to run the script to your user or selected group and give it a go.

# Author Notes

- These commands are meant for scripting practice and personal use. They are crafted to fill my needs and I wouldn't expect open contribution.
- Commands will be added from time to time. As I craft new tools along the way.
