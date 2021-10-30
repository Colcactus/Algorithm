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
1 2 3 4 5
共一行
表示排序完毕的数组

数据不超过int范围
*/
#include<stdio.h>
int min(int a[],int lenth){
    int i,min;
    min=0x7fffffff;
    for(i=0;i<lenth;i++){
        if(a[i]<min){
            min=a[i];
        }
    }
    return min;
}
int max(int a[],int lenth){
    int i,max;
    max=0x80000000;
    for(i=0;i<lenth;i++){
        if(a[i]>max){
            max=a[i];
        }
    }
    return max;
}
void main(){
    int lenth,i,min0,max0;
	scanf("%d",&lenth);
	int a[lenth];
	for(i=0;i<lenth;i++){
		scanf("%d",&a[i]);
	}

	min0=min(a,lenth);
	max0=max(a,lenth);
	int b[(max0-min0)+1];
	for(i=0;i<((max0-min0)+1);i++){
        b[i]=0;
	}
	for(i=0;i<lenth;i++){
        b[a[i]-min0]++;
	}
	for(i=0;i<((max0-min0)+1);i++){
        while(b[i]>0){
            printf("%d ",i+min0);
            b[i]--;
        }
	}
}
