@echo off
setlocal enabledelayedexpansion

:: Lista de parques
set "parques=Aiguestortes SierraNevada Teide"

:: Lista de etiquetas
set "etiquetas=Airactivities Animals Clouds Heritageandculture Knowledge Landscapes Otherabioticfeatures Plants Spiritual Terrestrialactivities Wateractivities Winteractivities"

:: Ruta del ejecutable Rscript y scripts
set "rutaR=C:/Program Files/R/R-4.4.1/bin/x64/"
set "script=C:/Users/Marta/Documents/GEOFOREST/TFM/1_Trabajo/1_Scripts/Biomod_modelling_tgb_one_model_by_park.R"
set "output=C:/Users/Marta/Documents/GEOFOREST/TFM/1_Trabajo/SDM_outputs_tgb"

:: Iterar por cada parque y etiqueta
for %%p in (%parques%) do (
    for %%e in (%etiquetas%) do (
        :: Mostrar el comando que se ejecutará (para depuración)
        echo Ejecutando: cd /d "%rutaR%" & Rscript.exe "%script%" "%%p" "%%e" > "%output%/%%p_%%e.log" 2>&1

        :: Ejecutar el comando en un nuevo proceso
        start "" cmd /c "cd /d "%rutaR%" & Rscript.exe "%script%" "%%p" "%%e" > "%output%/%%p_%%e.log" 2>&1"
        
        :: Esperar 480 segundos
        timeout /t 480
    )
)

:: Finalizar
pause