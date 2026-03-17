# Introducción Lenguaje Julia

## Ejercicio 1: Hidrología del Río Magdalena (Vectores y Matemáticas)

estaciones = ["Honda", "Puerto Berrío", "Barrancabermeja", "Puerto Wilches", "Calamar"]
caudales_m3s = [1500, 2100, 2800, 3200, 4500]

using Statistics
caudal_maximo = maximum(caudales_m3s)
caudal_promedio = mean(caudales_m3s)

println("El caudal máximo es de $caudal_maximo m3/s, donde el promedio de los caudales es $caudal_promedio m3/s")

caudales_ls = caudales_m3s * 1000

println("Los caudales en litros por segundo l/s son $caudales_ls")

##Ejercicio 2: Calidad del Aire en Bogotá (DataFrames y Filtrado)


using DataFrames

calidad_aire = Dict(
    "estacion" => ["Carvajal", "Kennedy", "Fontibón", "Suba", "Usaquén"],
    "pm25" =>  [55, 42, 38, 15, 12]
)

df_aire = DataFrame(calidad_aire)
describe(df_aire)

df_alerta =  filter(row -> row.pm25 > 15, df_aire)
println(df_alerta)

df_alerta[!, :estado] .= "Crítico"
println(df_alerta)

##Gráfico

using Plots

bar(df_aire.estacion, df_aire.pm25, 
    color= :lightgreen, 
    xlabel = "Estación", 
    ylabel = "Niveles de Material Particulado 2.5 (PM 2.5)", 
    title = "Calidad del aire en Bogotá según la estación",
    legend=false)

savefig("calidadaire_Julia.png")