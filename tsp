#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<time.h>
void getinfo(int a[300][300],int m,int n){
    int i,j,locations[300][2],fromNode,toNode,count=1;float distanceMatrix[300][300];
    for(i=1;i<=m;i++){
        for(j=1;j<=n;j++){
            if(a[i][j]==1){
                locations[count][0]=i;
                locations[count][1]=j;
                count++;
            }
        }
    }

//cost[i][j]=sqrt(pow((locations[toNode][0]-locations[fromNode][0]),2)+pow((locations[toNode][1]-locations[fromNode][1]),2));
  count=count-1;
    for (int fromNode = 1; fromNode <= count; ++fromNode) {
      for (int toNode = 1; toNode <= count; ++toNode) {
        if (fromNode == toNode) {
          distanceMatrix[fromNode][toNode] = 0;
        } else {
          distanceMatrix[fromNode][toNode] =(float)
              sqrt(pow((locations[toNode][0]-locations[fromNode][0]),2)+pow((locations[toNode][1]-locations[fromNode][1]),2));
        }
      }
    }printf("The cost adjacency matrix being passed to tsp\n");
/*    for(i=1;i<=count;i++){
            printf("%d %d\n",locations[i][0],locations[i][1]);
    }*/
    /*for(i=1;i<=count;i++){
        for(j=1;j<=count;j++){
            printf("%f ",distanceMatrix[i][j]);
        }
        printf("\n");
    }printf("\n");*/
    tsp_nn(distanceMatrix,count);
    for(i=1;i<=count;i++){
        for(j=1;j<=count;j++){
//            printf("%f ",distanceMatrix[i][j]);
        }
        //printf("\n");
    }
}

void tsp_nn(float cost[300][300],int n)
{
    int sum=0;
    int least=0;
    int nextnode;
    int i,j,start=1,source=1,v[1000]={0};

    //Make diagonal elements as infinity (999)
    for(i=1; i<=n; i++)
    {
       for(j=1; j<=n; j++){
	  if(i == j)
		cost[i][j] = 999;
    }}

    printf("TSP Solution using Nearest neighbour:\n\n");
    printf("Path : %5d",source);

   //Find least cost neighbour and visit it.
   //Repeat the process for n-1 times
   for(i=1; i<n; i++)
   {
	v[source] = 1;
	least = 999;
	for(j=1; j<=n; j++)
	{
	    if(cost[source][j] < least && v[j] == 0)
	    {
		least = cost[source][j];
		nextnode = j;
	    }
	}
	sum += least;
	printf(" --> %5d",nextnode);
	source = nextnode;
    }

    //add cost from last node to start node
    sum += cost[nextnode][start];
    printf(" --> %5d\n\n",start);
}
void main(){
    int n,a[300][300],i,j,m,t=1;
    printf("Enter the dimension of the pcb\n");
    scanf("%d %d",&m,&n);
    //printf("The pattern to be drilled\n");
    srand(time(0));
    for(i=1;i<=m;i++)
    for(j=1;j<=n;j++)
    a[i][j]=rand()%2;
    for(i=1;i<=m;i++){
    for(j=1;j<=n;j++){
    printf("%d ",a[i][j]);
    }printf("\n");
    }getinfo(a,m,n);
}
