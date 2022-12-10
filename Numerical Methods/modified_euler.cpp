#include <iostream>
#include <math.h>
#include<iomanip>

using namespace std;
double f(double x, double y);
int main()
{
    double x0 = 0;
    double y0 = 1;
    double h = 0.025;
    
    double x_req = 0.1;
    double x_k = x0;
    double y_k = y0;
    double y_k_plus_half = 0;
    double x_k_plus_half = 0;
    double y_k_plus_one = 0;
    while(x_k <= x_req) // stop iteration when x_k+1 becomes greater than the point x_req
                        // at which y has to be calculated.
    {
        if(x_k == x_req)
            break;
        y_k_plus_half = y_k + h/2*f(x_k, y_k); // y_(k+h/2)
        x_k_plus_half = x_k + h/2; // x_(k+h/2)
        y_k_plus_one = y_k + h*( f(x_k_plus_half, y_k_plus_half) ); // modif-euler iteration scheme

        y_k = y_k_plus_one; 
        x_k = x_k + h;  // updating x_k+1 = x_k + h
        cout << "Each step " << x_k << " " << y_k << endl;


    }
    cout << "Ans " << setprecision(10) << y_k << endl;
}

double f(double x, double y)
{
    return x + y + x*y;
}