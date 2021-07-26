/*
MIT License

Copyright (c) 2021 Anslate <1959719289@qq.com> and Colcactus

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

输入样式：
例：
5
1 3 2 5 4
共两行
第一行n表示第二行的数据数量
第二行数据是待排序数组，共n个，数据之间加空格
输出样式：
例：
5 4 3 2 1
共一行
表示排序完毕的数组

数据不超过int范围

由于变量作用域的缘故，我稍微用了点指针，无指针的可以看quick_sort_no_pointer.cpp
*/
#include<cstdio>
using namespace std;
void quicksort(int left,int right,int *p){
    if(left>=right){
        return;
    }
    int std=*(left+p);
    int i=left;
    int j=right;
    while(i!=j){
        while((*(j+p)<=std)&&(i<j)){
            j--;
        }
        while((*(i+p)>=std)&&(i<j)){
            i++;
        }
        if(i<j){
            int temp=*(i+p);
            *(i+p)=*(j+p);
            *(j+p)=temp;
        }
    }
    int temp=*(left+p);
    *(left+p)=*(i+p);
    *(i+p)=temp;
    quicksort(left,i-1,p);
    quicksort(i+1,right,p);
}
int main(){
    int i,lenth;
	scanf("%d",&lenth);
	int a[lenth];
	for(i=0;i<lenth;i++){
		scanf("%d",&a[i]);
	}
    quicksort(0,lenth-1,&a[0]);
    for(i=0;i<lenth;i++){
        printf("%d ",a[i]);
    }
    return 0;
}
