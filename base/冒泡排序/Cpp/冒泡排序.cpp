#include <cstdio>
using namespace std;
int main(){
	int lenth,i,temp;
	int n=1;
	scanf("%d",&lenth);
	int a[lenth];
	for(i=0;i<lenth;i++){
		scanf("%d",&a[i]);
	} 
	while(lenth>n-1){
		for(i=0;i<lenth-n;i++){
			if(a[i]<a[i+1]){//<号是从大到小，>号从小到大 
				temp=a[i];
				a[i]=a[i+1];
				a[i+1]=temp;
			}
		}
		n++;
	}
	for(i=0;i<lenth;i++){
		printf("%d ",a[i]);
	}
	return 0;
} 
