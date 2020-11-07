f = open("micro.txt","r")
file = f.read().split('\n')
f.close()
f = open("final.txt","w")
for x in range(len(file)):
    f.write("parameter %s = 8'd%s\n" % (file[x],x))
f.close()
