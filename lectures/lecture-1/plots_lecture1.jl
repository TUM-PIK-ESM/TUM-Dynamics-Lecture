using Plots 


begin 
    f(t) = exp(-0.2t)*sin(t) + 0.1

    t = 0:0.1:10


    y = [0.1,0.5,0.8,0.5,0.8,0.5,0.8,0.5,0.8,0.5]

    plot(x,f,xlims=[0,5],xlabel="t",ylabel="x(t)",thickness_scaling = 2, legend=nothing)
    savefig("trajectory-1d.png")

    scatter(1:10,y)
    plot!(y,xlabel="n",ylabel="x_n",thickness_scaling = 2, legend=nothing, color=:blue)
    savefig("trajectory-map.png")
end 

using DynamicalSystems 

ds = Systems.lorenz()

tr=Matrix(trajectory(ds,1))


plot(tr[:,1],tr[:,2],tr[:,3], xlabel="x_1",ylabel="x_2",zlabel="x_3",thickness_scaling = 2,legend=nothing)

savefig("phasespace.png")



