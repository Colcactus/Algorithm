"""
伪代码：
函数 冒泡排序 输入 一个数组名称为array 其长度为length 
    i 从 0 到 (length - 1) 
        j 从 0 到 (length - 1 - i) 
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

julia> @time bubble_sort(arr, length)
raw:[1, 2, 4, 6, 7]
sorted:[1, 2, 4, 6, 7]
  0.000497 seconds (42 allocations: 1.625 KiB)
"""

function bubble_sort(array::AbstractArray, length::Int64)
    println("raw:$array")
    for i = 1:length
    flag = false

        for j = 1:(length - i)
            if array[j] > array[j+1]
                temp = array[j]
                array[j] = array[j+1]
                array[j + 1] = temp
            end
        end

    if flag != flag
        break
    end

    end

    println("sorted:$array")
end
