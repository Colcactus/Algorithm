/*
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
*/
#include <stdio.h>
void main(){
	int lenth,i,temp;
	int n;
	scanf("%d",&lenth);
	int a[lenth];
	for(i=0;i<lenth;i++){
		scanf("%d",&a[i]);
	} 
	for(n=1;lenth>n-1;n++){
		for(i=0;i<lenth-n;i++){
			if(a[i]<a[i+1]){//<号是从大到小，>号从小到大 
				temp=a[i];
				a[i]=a[i+1];
				a[i+1]=temp;
			}
		}
	}
	for(i=0;i<lenth;i++){
		printf("%d ",a[i]);
	}
} 
