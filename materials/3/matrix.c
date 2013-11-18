#include "matrix.h"
#include <stdlib.h>
#include <stdio.h>
#include <time.h>


int main() {
  srand(time(NULL));

  int** matrixA  = createMatrix();
  int** matrixB  = createMatrix();
  int** matrixC  = createMatrix();

  compute(matrixA, matrixB, matrixC);

  freeMatrix(matrixA);
  freeMatrix(matrixB);
  freeMatrix(matrixC);
}

int** createMatrix() {
  int i, j, **matrix;

  matrix = (int**)malloc(HEIGHT * sizeof(int*));

  for(i=0; i<HEIGHT; i++) {
    matrix[i] = (int*)malloc(WIDTH * sizeof(int));
  }
  for(i=0; i<HEIGHT; i++) {
    for(j=0; j<WIDTH; j++) {
      matrix[i][j] = (int) rand() * 100;
    }
  }
  return matrix;
}

void compute(int** matrixA, int** matrixB, int** matrixC) {
  int i, j, k, sum;
  int muls, adds;
  muls = 0;
  adds = 0;

  for(i=0; i<HEIGHT; i++) {
    for(j=0; j<WIDTH; j++) {
      for(sum=0, k=0; k < WIDTH; k++) {
        sum += matrixA[i][k] * matrixB[k][j];
        adds += 1;
        muls += 1;
      }
      matrixC[i][j] = sum;
    }
  }

  printf("Adds: %d\n", adds);
  printf("Muls: %d\n", muls);
}

void freeMatrix(int** matrix) {
  int i;

  for(i=0; i<HEIGHT; i++) {
    free(matrix[i]);
  }
  free(matrix);

}
