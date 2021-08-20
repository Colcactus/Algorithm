"""
MIT License

Copyright (c) 2021 hattori-emi <a7b8i06c49@outlook.com> and Colcactus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

计数排序是一种对特定范围内的元素进行排序的不基于比较的排序算法，基于比较的时间复杂度存在下界，而不基于比较的排序算法可以突破这一下界
首先我们需要知道 max 和 min 分别对应的元素
然后我们需要用 max - min + 1 个计数器来分别统计 min 到 max 之间每种元素的个数
接下来，我们遍历所有的元素，将每个值为 i 的元素放入到第 i - 2 + 1 个桶中
最后，我们从左往右依次将每个桶里的元素取出，每取出一个元素，对应桶的计数器减1，直到计数器为0

伪代码：
函数 计数排序 输入一个数组叫array
    获取最大值和最小值
    r = 数组长度
    范围 = 最大值 - 最小值 + 1
    初始化计数器
    i 从 1 到 范围
        计数器[array[i] - 最小值 + 1] 自增
    i 循环结束
    i 从 2 到计数器长度
        计数器[i] = 计数器[i] + 计数器[i - 1]
    i 循坏结束

"""

function CountingSort!(array::Vector{T})where T
    println("raw:$array")

    # 获取最大值和最小值
    max = maximum(array)
    min = minimum(array)

    # 从 1 开始的范围，考虑了最小值小于 0 的情况
    range = max - min + 1
    
    # 初始化计数器
    count = Vector{T}(undef, range)
    for i = 1:range
        count[i]=0
    end

    """
    从 min 到 max 的每一个数都作为一个桶，记录 array 中每个元素出现的次数

    为什么是count[array[i] - min + 1] += 1 ？

    首先 min 是整个数组的头部到“0”的距离
    array 中的第任意一个元素（无论正负）减去 min 都是从“0”开始记起这个数应该在的位置
    比如 array[3] = -5, min = -7, max = 1

    我们从 -7（也就是 min）开始列出到 1（也就是 max）的所有数
    -7 -6 -5 -4 -3 -2 -1 0 1

    我们把他们都减去 -7，再全部列出来，也就是“桶”
    0 1 2 3 4 5 6 7 8

    那么 array[3] - min = 2
    那么与 -5 对应的位置刚好是 2

    由于 Julia 的数组是从 1 开始计算的
    所以 array[i] - min 之后还需要 +1

    接下来，因为 count 被定义为“桶”，它现在里面全是“0”，我们的目的是记录 array 中每个元素出现的次数
    所以 +1
    """
    for i = 1:length(array)
        count[array[i] - min + 1] += 1
    end

    """
    将值拷贝到数组

    现在我们有原来的数组 array 和数组中元素出现的频率 count
    那么现在我们就可以通过这两个数组得出一个排序后的数组 output

    过程很简单

    首先开辟一个长度等于 array 长度的数组 output
    接下来遍历频次数组 count
    在遍历 count 的时候根据 count[i] 的值向 output 中加入 array 的值
    """
    output = Vector{T}(undef, length(array))
    index = 1
    # 遍历 count
    for i = 1:length(count)
        while count[i] > 0
            # + min - 1 的目的是还原数值
            output[index] = i + min - 1
            index += 1
            count[i] -= 1
        end
    end

    println("sorted:$output")
end
