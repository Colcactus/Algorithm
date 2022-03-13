def main():
    #读取十六进制
    file=open("1.jpg","rb")
    data_origin=str(file.read().hex("-")).split("-")
    file.close()
    #读取出现次数
    value={}
    for hex0 in data_origin:
        if(not(hex0 in value)):
            value[hex0]=0
        value[hex0]+=1
    #排序(从大到小)
    keys=[]
    value_origin=value.copy()#备份value
    while(len(value)):
        temp=["",0]#temp[0]是键，temp[1]是值
        for i in list(value):#遍历字典，寻找最大值
            if(value[i]>temp[1]):
                temp[0]=i
                temp[1]=value[i]
        keys.append(temp[0])
        del value[temp[0]]#删除最大值
    value=value_origin#还原value
    del temp,value_origin
    
    #创建huffman数组(二进制)(字符串)
    huffman=[]
    for i in range(len(keys)):
        huffman.append(bin(i)[2:])

    #将huffman自动补全到3或7或9位
    huffman_origin=huffman[:]
    huffman=[]
    for i in huffman_origin:
        if(len(i)<=3):
            i=i.zfill(3)
        if(len(i)>3 and len(i)<=6):
            i=i.zfill(6)
        if(len(i)>6 and len(i)<=9):
            i=i.zfill(9)
        huffman.append(i)
    del huffman_origin

    #将huffman数组的顺序调回
    huffman_origin=huffman[:]
    huffman=[]
    for i in list(value):
        huffman.append((huffman_origin[keys.index(i)]))
    del keys,huffman_origin

    #根据文件，创建编码完成字符串
    data=[]
    data_bin=""
    for i in data_origin:
        data.append(huffman[list(value).index(i)])#将原十六进制数据替换成Huffman编码完成的数据
    for i in data:
        if(len(i)==3):
            data_bin+=("1"+i)
        if(len(i)==6):
            data_bin+=("1"+i[:3])+("0"+i[3:6])
        if(len(i)==9):
            data_bin+=("1"+i[:3])+("0"+i[3:6])+("0"+i[6:9])
    del data

    #创建编码对照表
    com_table={}
    for i in range(len(huffman)):
        com_table[huffman[i]]=list(value)[i]

    #转换为bytes对象
    data_file_hex=""
    data_file=[]
    mode=0
    for i in list(data_bin):
        data_file_hex+=i
        if(len(data_file_hex)==8):
            data_file.append(bytes.fromhex(hex(int(data_file_hex,2))[2:].zfill(2)))
            data_file_hex=""
    if(len(data_file_hex)==4):
        data_file_hex=data_file_hex+"0000"
        data_file.append(bytes.fromhex(hex(int(data_file_hex,2))[2:]))
        mode=1
    del data_file_hex

    #大量删除，释放内存，只留下编码后文件数据、编码对照表、单双文件区分位
    del data_bin,huffman,value,data_origin

    #写入文件
    file=open("huffman.txt","wb")
    for i in data_file:
        file.write(i)
    file.close()
    

main()