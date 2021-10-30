"""
MIT License

Copyright (c) 2021 mieotoha <a7b8i06c49@gmail.com> and Colcactus

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

首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置
然后，再从剩余未排序元素中继续寻找最小（大）元素
然后放到已排序序列的末尾
以此类推，直到所有元素均排序完毕

伪代码：
函数 选择排序 输入 一个数组名称为array
    获取数组长度
    i 从 1 到 数组长度 - 1
        最小值 = i
        j 从 i + 1 到 数组长度
            如果 array[j] < array[最小值]
                最小值 = j
            结束
            交换 array[min] 和 array[i] 的值
        结束
    结束
结束

结果：
julia> @time selection_sort(a)
raw:[1, 4, 2, 6, 7]
sorted:[1, 2, 4, 6, 7]
  0.000164 seconds (43 allocations: 1.953 KiB)

"""

function selection_sort(array::AbstractArray)
    println("raw:$array")
    len = length(array)
    for i = 1:len - 1
         min = i
         for j = i + 1:len
            if array[j] < array[min]
                min = j
            end 
            array[min], array[i] = array[i], array[min]
         end
    end
    println("sorted:$array")
end
