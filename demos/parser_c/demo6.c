#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "./parser/include/eis_parser.h"

bool success(int parser, EIS_ERROR errcode){
  char txt[10000];
  int actual_chars;
  if (errcode == eis_err_none) return true;
  for (int i=1; i<=eis_parser_get_error_count(parser); ++i){
    actual_chars = eis_parser_get_error_report(parser, i, 10000, txt);
    printf("%s\n", txt);
  }
  eis_parser_flush_errors(parser);
  return false;
}
/*This struct holds my data that I will use in the getter functions*/
typedef struct {EIS_NUM x; EIS_NUM y;} data;

  /*Function to implement the Cauchy distribution
  https://en.wikipedia.org/wiki/Cauchy_distribution */
EIS_NUM cauchy_dist(int nparams, EIS_NUM *params, void *host_params,
    EIS_STATUS *status_code, EIS_ERROR *errcode)
{
    EIS_NUM pi = 3.14159;
    return 1.0/(pi * params[2]) * (pow(params[2],2) 
        / pow(params[0] - params[1], 2) + pow(params[2],2));
}

/*This is the getter function for x position*/
EIS_NUM get_x(int nparams, EIS_NUM *params, void *host_params,
    EIS_STATUS *status_code, EIS_ERROR *errcode)
{
  data *mydata = (data*) host_params;
  if (mydata) return mydata->x;
  return 0.0;
}

/*This is the getter function for y position*/
EIS_NUM get_y(int nparams, EIS_NUM *params, void *host_params,
    EIS_STATUS *status_code, EIS_ERROR *errcode)
{
  data *mydata = (data*) host_params;
  if(mydata) return mydata->y;
  return 0.0;
}


int main(int argc, char** argv)
{
  int parser, stack, ct, i;
  double res;
  char txt[1000];
  data mydata;
  int ix, iy;
  EIS_ERROR errcode;
  EIS_BITMASK bm;
  FILE *f;

  printf("This is a version of demo6 but implements a custom function called ");
  printf("`cauchy` that calculates the cauchy distributiong. It takes 3 ");
  printf("parameters. The first parameter is the location to evaluate the ");
  printf("function at, the second is the x origin of the ray and the third ");
  printf(" is the gamma parameter\n");

  parser = eis_create_parser(&errcode, 1, 0, 0, eis_physics_si, 1);
  if (!success(parser, errcode)) exit(1);
  eis_add_variable(parser, "x", get_x, 0, 0, 0, &errcode);
  if (!success(parser, errcode)) exit(1);
  eis_add_variable(parser, "y", get_y, 0, 0, 0, &errcode);
  if (!success(parser, errcode)) exit(1);
  /*Add the cauchy distribution as a function. Parameters are parser to add to,
  string representing the function in an expression, C function defining the
  result of the function, the capability bits for the function, the number of
  expected parameters to the function (-1 means variadic function), can the 
  function be simplified (here 1 because it the cauchy_dist function doesn't 
  depend on anything other than it's parameters so it can be simplified so 
  long as all parameters are simplifiable), whether to add to the global list
  of functions (here 0 for false) and the returned error code*/
  eis_add_function(parser, "cauchy", cauchy_dist, 0, 3, 1, 0, &errcode);
  if (!success(parser, errcode)) exit(1);
  printf("Please input a mathematical expression :");
  fgets(txt,1000,stdin);
  txt[strcspn(txt,"\n")] = 0;
  bm = 0;
  stack = eis_create_stack(parser, txt, &bm, &errcode);
  f = fopen("fort.10","w");
/* This iterates around on a 100x100 grid over a range [0,1] and evalautes your
function setting x and y as it goes. It writes the results straight out to disk
as a Fortran ordered array in a file called fort.10. Neither the Fortran
nor the filename are necessary or meaningful for a C code but they match the
Fortran example. If you reverse the loops then the array will be written C
ordered and you can obviously select any filename that you want in the 
fopen command */
  for (iy = 0; iy < 100 ; ++iy){
    mydata.y = (float)iy/99.0;
    for (ix = 0; ix < 100; ++ix) {
      mydata.x = (float)ix/99.0;
      ct = eis_evaluate_stack(stack, 1, &res, &errcode, &mydata);
      fprintf(f,"%g ", res);
    }
    fprintf(f,"\n");
  }
  fclose(f);
/* These are not necessary but this is how you release stacks and parsers
when you are done with them.*/
  eis_stack_dec_ref(stack);
  eis_parser_dec_ref(parser);
}
