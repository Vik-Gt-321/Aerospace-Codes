#include <iostream>
#include<iomanip>
#include <math.h>
using namespace std;
double fx(double x);

int main()
{
    double e = 10e-5;
    unsigned int n = 10;
    double x0 = 0.7854;
    cout << "Enter tolerance (e): ";
    cin >> e;
    cout << "Enter initial guess x0: ";
    cin >> x0;
    cout << "Enter number of iterations n: ";
    cin >> n;
    double x_i_minus1= x0;
    double x_i = 0;
    for (unsigned int i = 0; i<= n; i++)
    {
        x_i = fx(x_i_minus1);
        if(abs(x_i - x_i_minus1) <= e) 
        {
            // stop iterating when n exceeds maximum iteration specified or
            // difference in u_k and u_k+1 goes smaller than epsilon
            cout << "The number of iterations for tolerance to be reached is: " << i << endl;
            break;
        }
        

        x_i_minus1 = x_i;
    }
    cout << "Ans " << setprecision(10) << x_i << endl;

}

double fx(double x)
{
    return (cos(x) + 1)/3;
}