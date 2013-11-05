#include <stdlib.h>
#include <stdio.h>
#define GROUP_SIZE 40
#define SEED 42
#include <time.h>

/* 1) order randomly */
/* 2) select odd or even depending on timestamp last sign */
/* 3) order randomly again */
/* 4) reject each second index */
/* 5) order random again */
/* 6) get random number */

void print(int* group, int size) {
  int i;
  for(i=0; i < size; i++) {
    printf("%d", group[i]);
    printf(", ");
  }
}

void shuffle(int* group, int size) {
  int temp, i;


  while ( size ) {

    // pick a remaining element
    i = rand() % size--;

    // swap it with the current element.
    temp = group[size];
    group[size] = group[i];
    group[i] = temp;
  }
}

int main() {
  int i, j, r, size, odd;
  int *group, *temp;

  // init random seed
  srand((unsigned int) time(0));

  group = (int*)malloc(GROUP_SIZE* sizeof(int));

  for(i=0; i < GROUP_SIZE; i++) {
    group[i] = i+1;
  }

  printf("Initial group: ");
  print(group, GROUP_SIZE);

  shuffle(group, GROUP_SIZE);

  printf("\nShuffled: ");
  print(group, GROUP_SIZE);

  r = rand();
  if ( r % 2 == 0) {
    odd = 0;
  } else {
    odd = 1;
  }

  temp = (int*)malloc(GROUP_SIZE* sizeof(int));

  for(i=0,size=0; i < GROUP_SIZE; i++) {
    if(group[i] % 2 == odd) {
      temp[size] = group[i];
      size += 1;
    }
  }

  free(group);
  group = temp;

  printf("\nSelected: ");
  print(group, size);

  shuffle(group, size);

  printf("\nShuffled: ");
  print(group, size);

  r = rand();

  if ( r % 2 == 0) {
    odd = 0;
  } else {
    odd = 1;
  }

  temp = (int*)malloc(GROUP_SIZE* sizeof(int));

  for(i=0,j=0; i < size; i++) {
    if(i % 2 == odd) {
      temp[j] = group[i];
      j += 1;
    }
  }

  size = j;

  free(group);
  group = temp;

  printf("\nSelected: ");
  print(group, size);

  shuffle(group, size);

  printf("\nShuffled: ");
  print(group, size);

  r = rand() % size;

  printf("\nWinner: %d", group[r]);

  return 0;
}

