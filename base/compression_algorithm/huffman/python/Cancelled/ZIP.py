def quicksort(left,right,huffman_array):
    if(left>right):
        return
    i=left
    j=right
    temp=huffman_array[left][1]
    while(i!=j):
        while(i<j and temp<=huffman_array[j][1]):
            j-=1
        while(i<j and temp>=huffman_array[i][1]):
            i+=1
        if(i<j):
            a=huffman_array[i]
            huffman_array[i]=huffman_array[j]
            huffman_array[j]=a
            del a
    a=huffman_array[left]
    huffman_array[left]=huffman_array[i]
    huffman_array[i]=a
    del a
    quicksort(left,i-1,huffman_array)
    quicksort(i+1,right,huffman_array)

def main():
    #读取十六进制
    file=open("Test.txt","rb")
    original_hex_data=str(file.read().hex("-")).split("-")
    file.close()
    
    #统计出现次数
    frequency={}
    for count in original_hex_data:
        if(not(count in frequency)):
            frequency[count]=0
        frequency[count]+=1
    
    #创建二维数组，并排序好数组，只留下huffman有序序列
    keys=[]
    value=[]
    lenth=0
    keys=list(frequency)
    for i in keys:
        value.append(frequency[i])
    huffman_array=[]
    for i in range(len(keys)):
        huffman_array.append([])
        huffman_array[i].append(keys[i])
        huffman_array[i].append(value[i])
        huffman_array[i].append("Value")
    quicksort(0,len(keys)-1,huffman_array)
    lenth=len(keys)-1
    del keys,value

    #生成huffman树
    huffman_array_origin=huffman_array[:]
    huffman_tree=[]
    index=3
    for i in range(3):
        huffman_tree.append(0)
    while(lenth!=0):
        if(huffman_array[0][2]=="Value" and huffman_array[1][2]=="Value"):
            for i in range(6):
                huffman_tree.append(0)
            huffman_tree[index]=huffman_array[0][0]
            index+=3
            huffman_tree[index]=huffman_array[1][0]
            index+=3
            huffman_array[0]=[[index-6,index-3],huffman_array[0][1]+huffman_array[1][1],"Tree"]
            del huffman_array[1]
            lenth-=1
            quicksort(0,lenth,huffman_array)
            continue

        if(huffman_array[0][2]=="Value" and huffman_array[1][2]=="Tree"):
            for i in range(6):
                huffman_tree.append(0)
            huffman_tree[index]="N"
            huffman_tree[index+1]=huffman_array[1][0][0]
            huffman_tree[index+2]=huffman_array[1][0][1]
            index+=3
            huffman_tree[index]=huffman_array[0][0]
            index+=3
            huffman_array[0]=[[index-6,index-3],huffman_array[0][1]+huffman_array[1][1],"Tree"]
            del huffman_array[1]
            lenth-=1
            quicksort(0,lenth,huffman_array)
            continue

        if(huffman_array[0][2]=="Tree" and huffman_array[1][2]=="Value"):
            for i in range(6):
                huffman_tree.append(0)
            huffman_tree[index]="N"
            huffman_tree[index+1]=huffman_array[0][0][0]
            huffman_tree[index+2]=huffman_array[0][0][1]
            index+=3
            huffman_tree[index]=huffman_array[1][0]
            index+=3
            huffman_array[0]=[[index-6,index-3],huffman_array[0][1]+huffman_array[1][1],"Tree"]
            del huffman_array[1]
            lenth-=1
            quicksort(0,lenth,huffman_array)
            continue

        if(huffman_array[0][2]=="Tree" and huffman_array[1][2]=="Tree"):
            for i in range(6):
                huffman_tree.append(0)
            huffman_tree[index]="N"
            huffman_tree[index+1]=huffman_array[0][0][0]
            huffman_tree[index+2]=huffman_array[0][0][1]
            index+=3
            huffman_tree[index]="N"
            huffman_tree[index+1]=huffman_array[1][0][0]
            huffman_tree[index+2]=huffman_array[1][0][1]
            index+=3
            huffman_array[0]=[[index-6,index-3],huffman_array[0][1]+huffman_array[1][1],"Tree"]
            del huffman_array[1]
            lenth-=1
            quicksort(0,lenth,huffman_array)
            continue

    huffman_tree[0]="N"        
    huffman_tree[1]=huffman_array[0][0][0]
    huffman_tree[2]=huffman_array[0][0][1]
    huffman_array=huffman_array_origin[:]
    del huffman_array_origin,index,lenth

    #整理huffman树
    huffman_tree_origin=huffman_tree[:]
    huffman_tree=[0,0,0]
    def reorganize(index0,index1):
        """
        index0:huffman_tree_origin数组的索引
        index1:huffman_tree数组的索引
        """
        if(huffman_tree_origin[index0]!="N"):#如果不是是N,就代表他是一个单独的值，而不是节点
            huffman_tree[index1]=huffman_tree_origin[index0]
            return
        else:#也就是N,为节点
            huffman_tree[index1]="N"
            for i in range(3):
                huffman_tree.append(0)
            huffman_tree[index1+1]=len(huffman_tree)-3
            reorganize(huffman_tree_origin[index0+1],len(huffman_tree)-3)
            for i in range(3):
                huffman_tree.append(0)
                huffman_tree[index1+2]=len(huffman_tree)-3
            reorganize(huffman_tree_origin[index0+2],len(huffman_tree)-3)
        return
    reorganize(0,0)
    del huffman_tree_origin

    #进行编码
    huffman_list=[[0,None]]
    code_dict={}
    count=0
    i=0

    while(len(huffman_array)!=count):
        if(huffman_list[i][0]==0):
            huffman_list.append([huffman_tree[1],"0"])
            huffman_list.append([huffman_tree[2],"1"])
            count+=1
            i+=1
            continue
        if(huffman_tree[huffman_list[i][0]]=="N"):
            huffman_list.append([huffman_tree[huffman_list[i][0]+1],huffman_list[i][1]+"0"])
            huffman_list.append([huffman_tree[huffman_list[i][0]+2],huffman_list[i][1]+"1"])
        else:
            code_dict[huffman_tree[huffman_list[i][0]]]=huffman_list[i][1]
            count+=1
        i+=1

    #写入文件
    data=""
    data_bin=""
    data_hex=[]
    for i in original_hex_data:
        data+=code_dict[i]
    for i in list(data):
        data_bin+=i
        if(len(data_bin)==8):
            data_hex.append(bytes.fromhex(hex(int(data_bin,2))[2:].zfill(2)))
            data_bin=""
    if(len(data_bin)!=0):
        while(len(data_bin)!=8):
            data_bin+="0"
        data_hex.append(bytes.fromhex(hex(int(data_bin,2))[2:].zfill(2)))

    file=open("huffman.bin","wb")
    for i in data_hex:
        file.write(i)
    file.close()
    
main()