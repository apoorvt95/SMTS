from socket import *
#Enter IP Address of node
host = "192.168.1.199"

print host

port = 7777

s = socket(AF_INET, SOCK_STREAM)

print "Socket Made"

s.bind((host,port))

print "Socket Bound"

s.listen(5)

print "Listening for connections..."

q,addr = s.accept()
f=open("dataset.txt","a+")
flag=1
while(flag):
	msg = q.recv(1024)
	for i in msg:
		if(i=='E'):
			flag=0		
		else:
			f.write(msg)
		print " " + msg
print "\n----------------------------------"
 	
f.close()
