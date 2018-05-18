import subprocess

subprocess.call(["nmap","-oX","scan.xml","172.17.0.0/16"])