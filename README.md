# anaerobic-bioreactor

Anaerobic Bioreactor Matlab Toolbox

## Description

This Matlab Toolbox provides routines for *simulation*, *identification*, *estimation* and *control* of anaerobic bioreactors.

#### Simulation

Folder *solver* presents numeric solvers:

* Euler method;
* Runge-kutta 4th order.

#### Models
Folder *model* presents 2 non-linear models:

* Simple two bacteria - *bio_f_simple* and *bio_g_simple*;
* Two bacteria plus CO2 model - *bio_f* and *bio_g*.

#### Identification

Folder *ident* presents identification routines.

#### Estimation

Folder *estimation* presents three estimation techniques:

* Kalman Filter;
* Extended Kalman Filter;
* Particle filter.

#### Control

Folder *control* presents three control algorithms:

* Static state feedback;
* Dynamic state feedback (Proportion Integral)
* Dynamic output feedback (Proportional Integral)

## Install

Just add the main folder to the Matlab Path.

## Contributors

Diego Eckhard - diegoeck@ufrgs.br - @diegoeck

Roger Willian Pinto da Silva - roger.willian@ufrgs.br - @roger-william
