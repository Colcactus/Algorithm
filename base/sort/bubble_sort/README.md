# 冒泡排序  
## 特征  
---
| 名称 | 类型 | 时间复杂度（平均） | 空间复杂度 |
| :--: | :--: | :--: | :--: |
| 冒泡排序 | 排序算法 | $$O(n^{2})$$ | $$O(n)$$ |
<br></br>
## 概述  
---
冒泡排序（Bubble Sort）又名泡式排序,  
是一种简单的排序算法。  
这个算法会一遍遍的比较相邻的两个元素并交换顺序。  
因为较小（大）的元素会因为交换而慢慢的前往到数组的前列，  
故名冒泡排序。  
<br></br>
## 文字流程（以从小到大为例）  
---
1.遍历数组，比较相邻的元素。如果前者比后者大，就交换他们两个。  
2.对每一对相邻元素作同样的工作,这步做完后，最后的元素会是最大的数。(最后一位归位)  
3.针对所有未归位的元素重复以上的步骤，此时，最后一位又会归位  
4.持续对越来越少的元素重复上面的步骤，直到全部归位。  
<br></br>
## 伪代码  
---
```
函数 冒泡排序 输入 一个数组名称为array
    i 从 1 到 length
        j 从 1 到 length - i 
            如果 array[j] > array[j + 1] 
                交换 array[j] 和 array[j + 1] 的值 
            如果结束 
        j循环结束 
    i循环结束 
函数结束
```  
<br></br>
## 代码实现  
---
[C语言（从大到小）](https://github.com/Colcactus/Algorithm/blob/main/base/sort/bubble_sort/c/bubble_sort.c)  
[C++（从大到小）](https://github.com/Colcactus/Algorithm/blob/main/base/sort/bubble_sort/cpp/bubble_sort.cpp)  
[Julia（从小到大）](https://github.com/Colcactus/Algorithm/blob/main/base/sort/bubble_sort/julia/bubble_sort.jl)  
[Python（从大到小）](https://github.com/Colcactus/Algorithm/blob/main/base/sort/bubble_sort/python/bubble_sort.py)  
  