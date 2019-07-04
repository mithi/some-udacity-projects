#ifndef SIMPLEPIDCONTROLLER_H
#define SIMPLEPIDCONTROLLER_H

#include <iostream>

using namespace std;

class SimplePIDController {

  private:

    double previous_error;

    double p_error;
    double i_error;
    double d_error;
    double r;

    double Kp;
    double Ki;
    double Kd;

    double n;
    double total_square_error;

  public:

    SimplePIDController();
    virtual ~SimplePIDController();

    void set(const double p, const double i, const double d);
    double compute(const double error);
};

#endif /*  SIMPLEPIDCONTROLLER_H */
