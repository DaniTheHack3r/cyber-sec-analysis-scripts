import socket
import argparse
from concurrent.futures import ThreadPoolExecutor

# I won't use a class for this as it is a little bit tricky to work with a threadpool inside classes
def scan(ip, port):
    try:
        s = socket.create_connection((ip, port), timeout=1)
        result = f"[+] {ip}:{port} is open"
        print(result)
        with open(f"open_ports_{target.replace('.', '_')}.txt", "a") as f:
            f.write(result + "\n")
        s.close()
    except:
        pass

if __name__ == '__main__':
    argparser = argparse.ArgumentParser(
                        prog='fastscan.py',
                        description='This small script will scan for open tcp ports pretty fast in any target if it is reachable inside the network or through a proxy using proxychains.',
                        epilog='Example: python3 fastscan.py -sp 1 -ep 10000 -r 10.129.95.235')

    argparser.add_argument('-sp', '--startport', type=int, required=True, help='Start port in the range')
    argparser.add_argument('-ep', '--endport', type=int, required=True, help='End port in the range')
    argparser.add_argument('-r', '--rhost', type=str, required=True, help='Remote, target host')
    argparser.add_argument('-t', '--maxthreads', type=int, help='Max Threads to use by the ThreadPool, default 200', default=200)

    args = argparser.parse_args()

    target = args.rhost
    ports = range(args.startport, args.endport)
    max_threads = args.maxthreads

    open(f"open_ports_{target.replace('.', '_')}.txt", "w").close()

    print(f"[*] Scanning {target}... Open ports will be saved to open_ports_{target.replace('.', '_')}.txt\n")

    with ThreadPoolExecutor(max_workers=max_threads) as executor:
        for port in ports:
            executor.submit(scan, target, port)