#ifndef PIDCONTROLLER_H
#define PIDCONTROLLER_H

#include <iostream>

using namespace std;

class PIDController {

  private:

    double previous_error;

    double p_error;
    double i_error;
    double d_error;

    double r;

    double Kp;
    double Ki;
    double Kd;

    double dp;
    double di;
    double dd;

    const int  N;       // number of runs before
    const int start_n;  // number of iterations before starting to collect errors for tuning
    int n;              // count how many times compute has been called
    double total_squared_error;
    double best_error;
    bool tune;
    bool should_reset;
    bool rolled_back;
    int tune_state;

    void evaluate();

  public:

    PIDController();
    virtual ~PIDController();

    void set(const double p, const double i, const double d);
    double compute(const double error);

    void do_tune();
    bool should_reset_now() const;
    double get_Kp() const;
    double get_Ki() const;
    double get_Kd() const;

    void set_Kp(const double p);
    void set_Ki(const double i);
    void set_Kd(const double d);
};

#endif /* PIDCONTROLLER_H */
