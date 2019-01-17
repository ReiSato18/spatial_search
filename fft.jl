#oracle
using FFTW
using AbstractFFTs
using DSP
gr()
time = 8000
data = copy(prob3_m_4_2)
function windowdata(time)
    windowdata=Float64[]
    for i in 1:time
        window = data[i]*DSP.Windows.triang(time)[i]
        push!(windowdata,window)
    end
    return windowdata
end
FFT = fft(windowdata(time))
f_abs = abs.(FFT)
half_f_abs = f_abs[1:div(time,2)]
##fs
fs = collect(1:time)
fs /= time
half_fs = Fs[1:div(time,2)]
##
f_abs_max = sortperm(half_f_abs, rev=true)
top1 = f_abs_max[1] 
top2 = f_abs_max[2]
top3 = f_abs_max[3]
top4 = f_abs_max[4]
top5 = f_abs_max[5]
top6 = f_abs_max[6]
println(" fs=",half_fs[top1]," value=",half_f_abs[top1],"\n"," fs=",half_fs[top2]," value=",half_f_abs[top2])
println(" fs=",half_fs[top3]," value=",half_f_abs[top3],"\n"," fs=",half_fs[top4]," value=",half_f_abs[top4])
println(" fs=",half_fs[top5]," value=",half_f_abs[top5],"\n"," fs=",half_fs[top6]," value=",half_f_abs[top6])

#p_max
Q = 727
function p_max(Q,time)
    each_p_max = 0
    for i = 1 : div(time,Q)
        if i == 1
            each_p_max += maximum(prob3_m_4_2[1:Q])
        else
            each_p_max += maximum(prob3_m_4_2[(i-1)*Q:i*Q])
        end
    end
end
println(each_p_max/div(8000,Q))
