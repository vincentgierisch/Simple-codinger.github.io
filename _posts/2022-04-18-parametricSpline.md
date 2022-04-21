---
layout: post
title: How to generate a parametric cubic spline.
excerpt_separator: <!--more-->
---

Hey everyone,

in the easter holidays I have challenged myself with a little numerical analysis problem. 
So I tried to write a program that interpolates points in a two dimensional plane.

<!--more-->

## What it is used for
Before we can figure out what interpolation can be used for, we first have to clear out, what interpolation is.

In the world of computers almost everything is discrete. For example, if we have a path a robot should take, such a path 
will probably be described by a set of waypoints. If the path should be 100% defined, we would need an infinite amount of
waypoints. That would be impracticable.

A better way is to search for a function, that takes a finite set of waypoints and returns waypoints that could be in between the original set.

## Polynomial Interpolation

A cubic function can do the trick. Such a function $\textit{f}$ can be described by $ax^3+bx^2+cx+d$, where $a, b, c, d$ are parameters that have to be found by an algorithm. New datapoints (or waypoints) can be interpolated by $y = f(x)$.
Like I said before, there are four parameters that have to be found, therefore we need at least four linear equations to find these parameters. 

To get these linear equations we have to look at the way the given datapoints interact with the cubic function. The set of datapoints $\textit{x_i, y_i} can be described with the function f so that $x_i = f(y_i),\;i \in\{0, 1, ..., n-1\}$.
So to get four of these equations we need at least four datapoints.

We can write that in an matrix equation.

$$
\begin{bmatrix}
 x_1^3  &x_1^2 &x_1 &1 \\
 x_2^3  &x_2^2 &x_2 &1 \\
 \vdots  &\vdots &\vdots &\vdots \\
 x_n^3  &x_n^2 &x_n &1
\end{bmatrix}

\begin{bmatrix}
 a\\
 b\\
 c\\
 d  
\end{bmatrix} 

= 

\begin{bmatrix}
 y_1\\
 y_2\\
 \vdots\\
y_n
\end{bmatrix}
$$

There are a lot of ways and programs that can solve a linear equations like that. 
The left matrix is called a [Vandermonde matrix](https://en.wikipedia.org/wiki/Vandermonde_matrix). There are way better ways for generating a polynomial function but this is the most understandable way in my opinion. 
And just like that we can get the four parameter for the
cubic function.
 
Now we can get a bunch of waypoints/datapoints by generating x coordinates and pass them in the function f.

![Polynomial interpolation function](/images/spline/interpolationPolynom.png)

However there are some major problems with this method. The function starts to oscillate when more than four datapoints are provided.
![Problems with more than four datapoints](/images/spline/interpolationPolynomProblem.png)
Take a look at how the function oscillates at the end of each side.

This problem can be solved by using a cubic spline.

## Spline interpolation
A spline is a piecewise polynomial function. So for each datapoint pair (e.g. $\{(x_0, y_0), (x_1, y_1)\},\:\{(x_1, y_1), (x_2, y_2)\},\:\dots,\{(x_{n-1}, y_{n-1}), (x_n, y_n)\}$)
there is a function which connects these pairs.
So for $n$ datapoints we need $n-1$ functions.

But if we just use the methods from the previous chapter we would end with two equations for each function. That is not enough to get our four coefficients. So we need two more equations for that.





### Man I love LaTeX in Markdown-Files ;)


<!-- For what is it used -->

<!-- polynomial interpolation -->
<!-- vandermoonde matrix -->
<!-- Oscillation -->

<!-- Spline Interpolation -->
<!-- Problems in 2d plane -->

<!-- Parametrized cubic spline -->
<!-- Calculate length -->
<!-- Integral (Riemann) -->