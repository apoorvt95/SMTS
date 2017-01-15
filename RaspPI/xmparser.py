from xml.dom.minidom import parse
import xml.dom.minidom

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
     
  