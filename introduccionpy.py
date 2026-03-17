# Introducción Lenguaje Python

## Ejercicio 1: Hidrología del Río Magdalena (Vectores y Matemáticas)

import numpy as np

estaciones = ["Honda", "Puerto Berrío", "Barrancabermeja", "Puerto Wilches", "Calamar"]
caudales_m3s = [1500, 2100, 2800, 3200, 4500]

caudal_maximo = max(caudales_m3s)
caudal_promedio = np.mean(caudales_m3s)

print(f"El caudal máximo es de {caudal_maximo} m3/s, donde el promedio de los caudales es {caudal_promedio} m3/s")

caudales_m3sc = np.array([1500, 2100, 2800, 3200, 4500])
caudales_ls = caudales_m3sc * 1000

print(f"Los caudales en litros por segundo l/s son {caudales_ls}")

##Ejercicio 2: Calidad del Aire en Bogotá (DataFrames y Filtrado)

import pandas as pd

calidad_aire = {
    "estacion" : ["Carvajal", "Kennedy", "Fontibón", "Suba", "Usaquén"],
    "pm25" : [55, 42, 38, 15, 12]
}

df_aire = pd.DataFrame(calidad_aire)

print(df_aire.info())

df_alerta = df_aire[df_aire["pm25"] > 15]
print(df_alerta)

df_alerta["estado"] ="Crítico"
print(df_alerta)

##Grafico

import matplotlib.pyplot as plt

plt.bar(df_aire["estacion"], df_aire["pm25"], color='turquoise', edgecolor='navy')
plt.xlabel("Estación")
plt.ylabel("Niveles de Material Particulado 2.5 (PM 2.5)")
plt.title("Calidad del aire en Bogotá según la estación")
plt.savefig("calidad_aire.png")