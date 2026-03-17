# Introducción Lenguaje R

## Ejercicio 1: Hidrología del Río Magdalena (Vectores y Matemáticas)

estaciones <- c("Honda", "Puerto Berrío", "Barrancabermeja", "Puerto Wilches", "Calamar")
caudales_m3s <- c(1500, 2100, 2800, 3200, 4500)

caudal_maximo <- max(caudales_m3s)
caudal_promedio <- mean(caudales_m3s)

cat(sprintf(
    "El caudal máximo es de %d m3/s, donde el promedio de los caudales es %d m3/s \n",
    caudal_maximo,
    caudal_promedio
))

caudales_ls = caudales_m3s * 1000

cat(sprintf(
    "Los caudales en litros por segundo l/s son %s \n",
    paste(caudales_ls, collapse = ", ")
    ))

##Ejercicio 2: Calidad del Aire en Bogotá (DataFrames y Filtrado)

calidad_aire <- list(
    estacion = c("Carvajal", "Kennedy", "Fontibón", "Suba", "Usaquén"),
    pm25 = c(55, 42, 38, 15, 12)
)

df_aire <- data.frame(calidad_aire)
str(df_aire)

df_alerta <- df_aire[df_aire$pm25 > 15, ]
print(df_alerta)

df_alerta$estado <- "Crítico"
print(df_alerta)

##Grafico

png("calidadaire_R.png") 

barplot(df_aire$pm25,
    names.arg = df_aire$estacion,
    col= "purple",
    border = "navy",
    xlab = "Estación",
    ylab = "Niveles de Material Particulado 2.5 (PM 2.5)",
    main = "Calidad del aire en Bogotá según la estación"
)
dev.off()


