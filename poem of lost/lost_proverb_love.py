import urllib2
import xmltodict
import random




stuff = list()

file = urllib2.urlopen('http://advisory.mtanyct.info/LPUWebServices/CurrentLostProperty.aspx')
data = file.read()
doc = xmltodict.parse(data)
    
for item in doc['LostProperty']['Category']:
    for k in item.items():
        for v in k:
            if type(v)==list:
                m = v[0:]
                for n in m:
                    for a,b in n.items():
                        c = b.encode('utf8', 'replace')
                        stuff.append(c)

                       
   
s = stuff[0::2]
#print s





lines1 = list()

for line in open("love.txt"):
    line = line.strip()
    if len(line)>0:
        lines1.append(line)



lines2 = list()
for line in open("proverbs.txt"):
    line = line.strip()
    if len(line)>0:
       lines2.append(line)
       

for i in range(len(lines1)):
   
    
    
    random_s = "I lost my " + random.choice(s)
    random_mylove = random.choice(lines1)
    random_proverb = random.choice(lines2)
    print random_s[:len(random_s)] + random_mylove[len(random_mylove)/2:]
    print random_proverb[:-2] + " " + random.choice(s)
    print('')

    
    