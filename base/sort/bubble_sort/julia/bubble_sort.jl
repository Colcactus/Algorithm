"""
MIT License

Copyright (c) 2021 hattoemi <a7b8i06c49@outlook.com> and Colcactus

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
函数 冒泡排序 输入 一个数组名称为array
    i 从 1 到 length
        j 从 1 到 length - i 
            如果 array[j] > array[j + 1] 
                交换 array[j] 和 array[j + 1] 的值 
            如果结束 
        j循环结束 
    i循环结束 
函数结束

优化思路：
- 不使用三目运算符，因为每次操作几乎没有规律，使用三目运算符将会加大开销
- 检测是否发生交换，若没有交换，则提前跳出外循环

结果:
> 注:@time已运行过一次

``` julia
julia> @time bubble_sort(arr, length)
raw:[1, 4, 2, 6, 7]
sorted:[1, 2, 4, 6, 7]
  0.000497 seconds (42 allocations: 1.625 KiB)
```
 
"""

function bubble_sort(array::AbstractArray)
    println("raw:$array")
    for i = 1:length(array)
    flag = false

        for j = 1:(length(array) - i)
            if array[j] > array[j+1]
                """
                temp = array[j]
                array[j] = array[j+1]
                array[j + 1] = temp
                可以通过下面的代码实现上面三行代码的功能
                """
                array[j], array[j + 1] = array[j + 1], array[j]
            end
        end

    if flag != flag
        break
    end

    end

    println("sorted:$array")
end
