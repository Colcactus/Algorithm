# 桶排序  
目前研究时发现桶排序严格意义上并不是一个排序算法，而是一种分治思维

需要别的排序算法来支撑

如果硬要排序的话就和[归并](https://github.com/Colcactus/Algorithm/tree/main/base/sort/merge_sort)差不多了

只是把[归并](https://github.com/Colcactus/Algorithm/tree/main/base/sort/merge_sort)的二分变成了三分或者更多（可能不叫二分，三分，但意思应该都懂，分成两份或者三份）

所以桶排序我会暂时放在一旁，优先实现别的算法

---

好！那么接下来是洛诗旅的时间！事实上桶排序有对应的实现，不过“别的用来支撑的算法”是插入排序，那么接下来是桶排序的详细内容

桶排序是一种分而治之的排序算法，同时，它并不是比较排序，它将元素分配到桶中，并在合并所有桶之前对每个桶进行排序，桶是数组，每个数组存储不同范围的元素，而插入排序用于对存储桶进行排序，因为它在小型数组中速度很快

---
<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="知识共享许可协议" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />本作品采用<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">知识共享署名-非商业性使用-禁止演绎 4.0 国际许可协议</a>进行许可。

作品所有权归属于：
Anslate <1959719289@qq.com>

mieotoha <a7b8i06c49@gmail.com>

Colcactus