module HuffmanCode

using BufferedStreams, FileIO

include("Node.jl")

export ZIP

const DICT = 8

global HuffmanCode = Dict()

function zipFile(src::String, dir::String)
    bis = BufferedInputStream(open(src, "r"))
    b = read(bis, UInt8)
    close(bis)
    # 进行压缩
    byteZip = HuffmanZip(b)
    # 输出文件
    bos = BufferedOutputStream(open(dir, "w"))
    write(bos, byteZip)
    flush(bos)
    close(bos)
end

function huffmanZip(bytes::UInt8)
    # 获取节点
    nodes = getNodes(bytes)
    # 创建树
    tree = createHuffmanTree(nodes)
    # 获取编码表
    huffmanCodes = getCodes(tree)
    # 返回数据和编码表
    return zip(bytes, huffmanCodes)
end

function getCodes(tree::Node)
    if tree === nothing
        error("你搁这整活呐?")
    end
    getCodes(tree.left, "0")
    getCodes(tree.right, "1")
    return huffmanCodes
end

function getCodes(node::Node, code::String)
    str = Array{String, 1}
    push!(str, code)
    if node.data === nothing
        getCodes(node.left, "0")
        getCodes(node.right, "1")
    else
        push!(huffmanCodes, node.data, str)
    end
end

end