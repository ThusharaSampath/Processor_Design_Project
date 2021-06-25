import json

f = open("code.txt", "r")
r = open("result.txt", "w")
dictionary = json.load(open("dictionary.json"))

ToMEM = ""
count = 0
for line in f:
    code = line.strip().split()
    if(line.strip() == ""):
        continue
    ToMEM += "//Comment:- " + line.strip() +"\n"
    for op in code:
        if(op[0] == ":"):
            ToMEM += "//" + op[1:] + "\n"
            continue
        if(op in dictionary):
            op = dictionary[op]
        
        if(op.strip().isnumeric()):
            ToMEM += "MEM[{count}] = 16'd{op};\n".format(count = count,op = op) 
        else:
            ToMEM += "MEM[{count}] = {op};\n".format(count = count,op = op.upper()) 
        count +=1
    ToMEM += "\n"
print(ToMEM)

r.write(ToMEM)
