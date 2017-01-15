from socket import *
from xml.dom.minidom import parse
import xml.dom.minidom

# Server connection
host = "10.1.0.46"

print host

port=7777

s=socket(AF_INET, SOCK_STREAM)

print "socket made"

s.connect((host,port))


print "socket connected"

 
# Open XML document using minidom parser
DOMTree = xml.dom.minidom.parse("input.xml")
nodes = DOMTree.documentElement
n_node=nodes.getElementsByTagName("node")
for node in n_node:
   if node.hasAttribute("number"):
      number=node.getAttribute("number")

   cameras = node.getElementsByTagName("camera")

   for camera in cameras:
      if camera.hasAttribute("id"):
         cameraid=camera.getAttribute("id")

      count = camera.getElementsByTagName('count')[0]
   
      timestamp = camera.getElementsByTagName('timestamp')[0]
      message='\nNode number: {0} \n Cameraid: {1} \n Count : {2} \n Timestamp : {3} \n' .format(number,cameraid,count.childNodes[0].data,timestamp.childNodes[0].data);
      s.send(message);
      #s.send("asgasg");

s.send("Exit");
