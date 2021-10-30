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

伪代码：
函数 快速排序 输入 一个数组名称为array 数组的开头位置且默认为1 数组的结尾位置且默认为array的长度
    较小的基准元素 = 数组的开头位置
    较大的基准元素 = 数组的结尾位置
    中间数 = array[(数组的开头位置 + 数组的结尾位置) 右移一位(相当于除以2且无视小数)]
    当 较小的基准元素 小于且等于 较大的基准元素
        当 array[较小的基准元素] < 中间数
            较小的基准元素自增
        结束
        当  array[较大的基准元素] > 中间数
            较大的基准元素自减
        结束
        如果 较小的基准元素 <= 较大的基准元素
            交换 array[较小的基准元素] 与 array[较大的基准元素] 的值
            较小的基准元素自增
            较大的基准元素自减
        结束
    结束
    如果 数组的开头位置 < 较大的基准元素
        快速排序(array, 数组的开头位置, 较大的基准元素)
    结束
    如果 较小的基准元素 < 数组的结尾位置
        快速排序(array, 较小的基准元素, 数组的结尾位置)
    结束
结束

如果看不懂这些代码的话请善用`println`函数哦

结果:
> 注:@time已运行过一次
julia> @time quick_sort(a)
raw:[1, 4, 2, 6, 7]
raw:[1, 2, 4, 6, 7]
sorted:[1, 2, 4, 6, 7]
raw:[1, 2, 4, 6, 7]
sorted:[1, 2, 4, 6, 7]
sorted:[1, 2, 4, 6, 7]
  0.001962 seconds (126 allocations: 4.875 KiB)

"""

function quick_sort(array::AbstractArray, arraybegin::Int64 = 1, arrayend::Int64 = length(array))
    println("raw:$array")
    low = arraybegin
    high = arrayend
    middle = array[(arraybegin + arrayend) >> 1]

    while low <= high
        while array[low] < middle low += 1 end
        while array[high] > middle high -= 1 end
        if low <= high
            array[low], array[high] = array[high], array[low]
            low += 1
            high -= 1
        end
    end
    if arraybegin < high quick_sort(array,arraybegin,high) end
    if low < arrayend quick_sort(array,low,arrayend) end
    println("sorted:$array")
end
