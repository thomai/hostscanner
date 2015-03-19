import os
import socket
import sys

# Get filenames
results_dir = sys.argv[1]
hosts_to_scan = sys.argv[2]
filenames = next(os.walk(results_dir))[2]

# Read files
output_path = hosts_to_scan
with open(output_path, 'w') as output_file:
    for filename in filenames:
        if 'zmap_output_' in filename:
            file_path = results_dir + '/' + filename
            with open(file_path) as input_file:
                port = str(filename).replace('zmap_output_', '')
                for line in input_file:
                    if not 'saddr' in line:
                        host = line.replace('\n', '')
                        #try:
                        #    host = socket.gethostbyaddr(host)[0]
                        #except socket.herror:
                        #    pass
                        host = host + ':' + port
                        output_file.write(host + '\n')
