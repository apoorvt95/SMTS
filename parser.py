
from xml.dom import minidom

doc = minidom.parse("input.xml")

# doc.getElementsByTagName returns NodeList

datasets = doc.getElementsByTagName("number")

for dataset in datasets:
        l=len(dataset.getElementsByTagName("cameraid"))
	for i in l:
        	cameraid = dataset.getElementsByTagName("cameraid")[i]
        	count = dataset.getElementsByTagName("count")[i]
        	timestamp = dataset.getElementsByTagName("timestamp")[i]
        
  
        print("cameraid:%s, count:%s, timestamp:%s" %
              ( cameraid.firstChild.data,count.firstChild.data, timestamp.firstChild.data))
