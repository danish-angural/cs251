from itertools import islice
lis=sys.argv
if(len(lis)!=5):
    print("wrong use of script")
    sys.exit(1)
if(lis[1]=="-ca"):
    children_file=lis[4]
    candies_file=lis[2]
else:
    children_file=lis[2]
    candiesfile=lis[4]
file1=open(candies_file)
file2=open(children_file)
candlines=file1.readlines()
chilines=file2.readlines()
num_candies=int(candlines[0])
candies=list( map(int, candlines[1].split()))
num_children=int(chilines[0])
prices=[]
for i in chilines[1:]:
    word=i.split()
    prices.append(tuple((int(word[0]),int(word[1]))))
file1.close()
file2.close()
prices.sort(key=lambda x:x[1])
money=0
for tup in reversed(prices):
    if tup[0] in candies:
        money+=tup[1]
        candies.remove(tup[0])
print(money)

