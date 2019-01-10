C = [-1/2 1/2 1/2 1/2;
    1/2 -1/2 1/2 1/2;
    1/2 1/2 -1/2 1/2;
    1/2 1/2 1/2 -1/2]

#flip_flop
right_f = zeros(Float64,4,4)
right_f[2,:] = C[1,:]
left_f = zeros(Float64,4,4) 
left_f[1,:] = C[2,:]
up_f = zeros(Float64,4,4)
up_f[4,:]  = C[3,:]
down_f = zeros(Float64,4,4)
down_f[3,:]  = C[4,:]
###move shift
right_m = zeros(Float64,4,4)
right_m[1,:] = C[1,:]
left_m = zeros(Float64,4,4) 
left_m[2,:] = C[2,:]
up_m = zeros(Float64,4,4)
up_m[3,:]  = C[3,:]
down_m = zeros(Float64,4,4)
down_m[4,:]  = C[4,:]
##########################

using ProgressMeter
using LinearAlgebra
using Plots
gr()
function qwalk(loop)
    fractal= 6
    one_side = 3^(fractal)
    mark = 3^(fractal-1) 
    mark_prob =Float64[]
    #mark_prob =Float64[]
    node = 8^(fractal)
    
    psi = zeros(Float64,one_side,one_side,4)
    for x=1:one_side, y=1:one_side
        if stage[x,y] == 1
            psi[x,y,:] = [1/sqrt(4node),1/sqrt(4node),1/sqrt(4node),1/sqrt(4node)]
        else
            continue
        end
    end
    
    progress = Progress(loop)
    anim=@animate for t in 0:loop
    #for t in 0:loop
        if t == 0
            continue
        else
            next_psi = zeros(Float64,one_side,one_side,4)
            psi[mark,mark,:] *= -1
            for x in 1:one_side, y in 1:one_side
                x0 = ((x-1 + (one_side-1)) %one_side) + 1
                x1 = ((x+1 + (one_side-1)) %one_side) + 1
                y0 = ((y-1 + (one_side-1)) %one_side) + 1
                y1 = ((y+1 + (one_side-1)) %one_side) + 1
                if stage[x,y] == 0
                    continue
                elseif stage[x0,y]==0 && stage[x,y1]==1 && stage[x1,y] == 1 && stage[x,y0]==1
                    next_psi[x,y,:] = copy(up_f*psi[x,y0,:] + left_f*psi[x1,y,:] + down_f*psi[x,y1,:] +left_m*psi[x,y,:])
              
                elseif stage[x0,y]==1 && stage[x,y1]==1 && stage[x1,y] == 1 && stage[x,y0]==0
                    next_psi[x,y,:] = copy(right_f*psi[x0,y,:] + left_f*psi[x1,y,:] +down_f*psi[x,y1,:] +down_m*psi[x,y,:])
     
                elseif stage[x0,y]==1 && stage[x,y1]==0 && stage[x1,y] ==1 && stage[x,y0]==1
                    next_psi[x,y,:] = copy(right_f*psi[x0,y,:] + up_f*psi[x,y0,:] + left_f*psi[x1,y,:]+ up_m*psi[x,y,:])
     
                elseif stage[x0,y]==1 && stage[x,y1]==1 && stage[x1,y] ==0 && stage[x,y0]==1
                    next_psi[x,y,:] = copy(right_f*psi[x0,y,:] + up_f*psi[x,y0,:] + down_f*psi[x,y1,:] +right_m*psi[x,y,:])
                    
                elseif stage[x0,y]==0 && stage[x,y1]==1 && stage[x1,y] ==0 && stage[x,y0]==1
                    next_psi[x,y,:] = copy(up_f*psi[x,y0,:] + down_f*psi[x,y1,:] + right_m*psi[x,y,:] +left_m*psi[x,y,:])
                    
                elseif stage[x0,y]==1 && stage[x,y1]==0 && stage[x1,y] ==1 && stage[x,y0]==0
                    next_psi[x,y,:] = copy(right_f*psi[x0,y,:] +left_f*psi[x1,y,:] + down_m*psi[x,y,:] +up_m*psi[x,y,:])
                else
                    next_psi[x,y,:] = copy(right_f*psi[x0,y,:] + up_f*psi[x,y0,:] + left_f*psi[x1,y,:] + down_f*psi[x,y1,:])
                end
            end
            #psi = copy(next_psi)
            
        end
        psi = copy(next_psi)
        next!(progress)
    push!(mark_prob,dot(psi[mark,mark,:],psi[mark,mark,:]))
        
    #hist = zeros(Float64,one_side,one_side)
    #for x in 1:one_side, y in 1:one_side
    #    hist[x,y] = copy(dot(psi[x,y,:],psi[x,y,:]))
    #    if hist[x,y]==0
    #        hist[x,y]= -0.05
    #    else
    #        continue
    #    end
    #end
    #heatmap(hist,aspect_ratio=1,cbar=false,cbar_lims=(-0.05,0.17))
        
    end
    #gif(anim,fps=10)
    
    #return psi #2Dplot
    return mark_prob

end
#qwalk(150000)
################################
prob5 = copy(qwalk(150000))
##################
#p_max
Q = 1170
each_p_max = 0
for i = 2 : div(150000,Q)
    each_p_max += maximum(prob5[(i-1)*Q:i*Q])
end
println(each_p_max/div(150000,Q))
################
#Q
function oracle_call(time)
    Q = 1170#大きめにとっとく
    oracle = Float64[]
    q = 0
    for i = 2:div(time,Q)
        push!(oracle,(i-1)Q + argmin(prob5[(i-1)Q:i*Q]))
    end
    #println(oracle)
    for i = 2:div(time,Q)
        q += oracle[i]-oracle[i-1]
    end
    println(q/div(time,Q))
end
oracle_call(150000)
###################real time plot
using Reactive, Interact, Plots
gr()
prob3 = copy(qwalk(1200))
time = Int64[]
prob = Float64[]
anim = @animate for i in 1:1200
    push!(time,i);push!(prob,prob3[i])
    plot(time,prob,xlim=(1,1200),ylim=(0,0.12),c=:deeppink,linewidth=0.7,label="stage4",xlabel="t",ylabel="P")
end
gif(anim,fps=50)
