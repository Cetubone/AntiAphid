rawData = open("./KY82YDVE016-Alignment-HitTable.csv", "r").readlines()

humTarget = ""

humTarget_bugTarget_dic = {}
for line in rawData:
	line_split = line.split(",")
	humTarget_tmp = line_split[0]
	if humTarget_tmp != humTarget:
		humTarget = humTarget_tmp
		#print(line_split)
		humTarget_bugTarget_dic[humTarget] = [line_split[1], line_split[10]]
		print([line_split[1], line_split[10]])

outFile = open("./idMap.csv", "a")
for key in humTarget_bugTarget_dic.keys():
	#print(key, " : ", humTarget_bugTarget_dic[key][:-2], "\n")
	outFile.write(key + "," + humTarget_bugTarget_dic[key][0][:-2] + "," + humTarget_bugTarget_dic[key][1] + "\n")
outFile.close()