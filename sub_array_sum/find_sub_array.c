// i :子数组长度    
 
 #include <stdio.h>


 
 int find_sub_len(int *array, int n,int key)
 {
    int i;//i :子数组长度 
    int m; //m:首元素 平移几次
    int j;//j:子数组首元素～子数组倒数第二元素
    int k;//k:子数组末元素
    int sum=0;
    int flag;

    for(int i=1;i<=9; i++)
    for(m=0;m<n-i;m++)
    for(j=m,k=j+i-1; k<n;k++)
    {
        
        flag=i-1;
        printf("i=%d,m=%d,j=%d, k=%d ,flag=%d\r\n",i,m,j,k,flag);
        while(flag>0)//flag:  控制子数组前n－1个元素求和
        {
            sum+=array[j];
            j++;
            flag--;
            printf("sum:%d \r\n",sum);
        }
        if(key==(sum+array[k]))
        {
            
            printf("test:%d, %d\r\n",i,key);
            return i;
        }
        else{
            sum=0;
            j=m;
        }
    }
    return 0;

 }
 int main()
 {
    int array[]={1,5,2,4,6,3,1,19,50};
    
    int key=26;
    int tag;
    tag=find_sub_len(array, 9, key);
    printf("sub array len: %d \r\n",tag);
    return 0;
}


