import Pkg
Pkg.activate("lectures/lecture-4")

using DynamicalSystems
using OrdinaryDiffEq
using GLMakie

# 1. Trajectories of the Lorenz system
lorenz = Systems.lorenz()

parameter_sliders = Dict(
    1 => 1:0.1:30,
    2 => 0:0.1:50,
    3 => 1:0.01:10.0,
)
parameter_names = Dict(1 => "σ", 2 => "ρ", 3 => "β")

fig, dsobs = interactive_trajectory(
    lorenz,
    [rand(3), rand(3)];
    add_controls=true,
    parameter_sliders,
    parameter_names,
    lims=((-30, 30), (-30, 30), (0, 50)),
    )
fig

# 2. Orbit diagram of the Henon map
henon = Systems.henon()

i = 1                    # First variable
p_index = 1              # First parameter
p_min, p_max = 0.8, 1.4  # Min, max value of parameter

title = "Orbit Diagram for the Hénon map"
fig, dsobs = interactive_orbitdiagram(henon, p_index, p_min, p_max, i, parname="a", title=title)
fig
