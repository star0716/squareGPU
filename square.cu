#include <stdio.h>

#include <helper_functions.h>
#include <helper_cuda.h>

__global__
void squareKernel(int *data, int N)
{
	int i = blockIdx.x * blockDim.x + threadIdx.x;
	if(i < N)
	{
		data[i] = i * i;
	}
}

int main(int argc, char **argv)
{
	int *h_data;
	int *d_data;
	int n = 1000;
	int sum = 0;

	cudaHostAlloc(&h_data, n * sizeof(int), cudaHostAllocPortable);
	cudaMalloc(&d_data, n * sizeof(int));

	dim3 block(512);
	dim3 grid((n + block.x - 1) / block.x);

	//cudaMemcpy(d_data, h_data, n * sizeof(int), cudaMemcpyHostToDevice);
	squareKernel<<<grid, block>>>(d_data, n);
	cudaMemcpy(h_data, d_data, n * sizeof(int), cudaMemcpyDeviceToHost);

	for(int j=0;j<n;j++)
	{
		sum = sum + h_data[j];
	}
	
	printf("square of %d = %d\n", n-2, h_data[n-2]);
	printf("square of %d = %d\n", n-1, h_data[n-1]);
	printf("sum = %d\n", sum);
	return 0;
}