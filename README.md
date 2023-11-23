# Caso práctico de análisis de datos de Bellabeat

![visualización de los datos analizados](https://github.com/LizStM/CasoPractico_DispositivoInteligente/assets/86332249/be2dfb90-8b0b-4bd9-9980-a5c0756a2940)

Puedes explorar mejor la visualización de los datos analizados en [mi cuenta de Tableau](https://public.tableau.com/app/profile/lizbeth.santiago/viz/Hbitosdeactividadpordiayhoras/Dashboard1)

***

## Acerca del caso practico:
Bellabeat es un fabricante de productos de alta tecnología orientados a la salud de la mujer. Pretende tener un análisis sobre los datos de actividad física en usuarios de dispositivos inteligentes para analizar la posibilidad de desplegar nuevas oportunidades de negocio para la empresa. 

Productos Bellabeat de enfoque en este análisis:
* __Aplicación Bellabeat:__ La aplicación Bellabeat proporciona a los usuarios datos de salud relacionados con su actividad física, sueño, estrés, ciclo menstrual y hábitos de conciencia plena. Estos datos pueden ayudar a los usuarios a comprender sus hábitos actuales y adoptar decisiones saludables. La aplicación Bellabeat se conecta a su línea de productos de bienestar inteligentes.
* __Time:__ Este reloj de bienestar combina el aspecto intemporal de un reloj clásico con la tecnología inteligente para hacer el seguimiento de la actividad física, el sueño y el estrés del usuario. El reloj Time se conecta a la aplicación Bellabeat para proporcionar información sobre el bienestar diario.

## Tarea empresarial.
Explorar los hábitos de los usuarios e identificar las tendencias de uso de dispositivos inteligentes a través de la información sobre el uso de dispositivos Fitbit. Con la finalidad de mejorar las estrategias de marketing y el servicio brindado por Bellabeat.

## Descripción de la fuente de datos.	
Datos de tercera fuente adquiridos a través de la cuenta Mobius en Kaggle, con licencia CCO: dominio público. Contienen los registros de 33 usuarios de Fitbit que han brindado su consentimiento para el envío de datos de seguimiento personal. Incluyen el rendimiento de la actividad física en registros por día y hora. Además de incluir los minutos de sueño diario. Registros comprendidos en un periodo del 12 de abril al 12 de mayo del 2016.

## Registro de cambios en el procesamiento de los datos.

| Numero de cambio (descendente) |   Tipo de cambio   |                                             Cambio realizado                                                 |                                                               Razón del cambio                                                                   |
| ------------------------------ | ------------------ | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ |
|              3	               |    MODIFICADO	    |Formato ancho a formato largo después de guardar la consulta de actividades agrupado en días.	               |  De esta forma se facilita el trabajo con la tabla final en Tableau, para mostrar las categorías de intensidad dentro de la misma gráfica.       |
|              2                 |	  ELIMINADO	      |Registros con valor=0 en columnas: TotalSteps, VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes.	 |  Al no realizar ningún tipo de actividad el dispositivo estuvo encendido, pero no fue ocupado.                                                   |
|              1	               |    MODIFICADO	    |Cambio de formato "fecha-hora" a "fecha" en columna Sleep.SleepDay, con el nuevo nombre Sleep.SleepDayOnly. 	 |  El formato de fecha en la tabla Sleep no es coincidente con la tabla Activities para un procesamiento basado en días.                           |


## Resumen del análisis realizado.
El análisis se realizó usando SQL y los registros de los 33 usuarios para los datos de intensidad de actividad y cantidad de pasos. En el caso de minutos de sueño se usaron los datos disponibles para 24 usuarios. Se han explorado los datos por día y por hora. Primero, se obtuvieron las medidas de actividad para cada individuo, con el objetivo de suavizar un posible día inusual de algún usuario. Las medidas calculadas fueron:

* Promedio de minutos de actividad para cada intensidad.
*	Mínimo de minutos de actividad para cada intensidad.
*	Máximo de minutos de actividad para cada intensidad.

Los datos fueron agrupados y ordenados por día de la semana, comenzando en lunes y finalizando en domingo.

Posteriormente se realizó el procedimiento una vez más, ahora ocupando los resultados individuales previos, para así, obtener las medidas de toda la población de datos.

Se cambió el formato ancho en las tablas resultantes por un formato largo, con la finalidad de facilitar su uso dentro de la herramienta Tableau, generando la visualización final, se graficó día y hora de la semana contra los minutos dedicados a la actividad en cada intensidad.

## Hallazgos clave.
*	En orden descendiente, el día más activo es el sábado, seguido del martes. Posteriormente hay una disminución de actividad los lunes, viernes, jueves y miércoles. Y finalmente el día menos activo es el domingo.
* En general, los usuarios pasan mayor parte de su día realizando actividades sedentarias (68.46%), en menor escala realizan actividades de intensidad ligera (26.58%), con una menor presencia actividades de intensidad activa (2.93%) y finalmente de intensidad moderada (2.04%).
* Usualmente, el día de los usuarios comienza a las 5:00 am y finaliza entre las 22:00 pm, de acuerdo a la gráfica de minutos activos por hora, su día podría dividirse en 4 periodos:
  1.	5:00 – 8:00 hrs.
  2.	8:00 – 15:00 hrs.
  3.	15:00 – 20:00 hrs.
  4.	20:00 – 22:00 hrs.
     
  El segundo periodo tiene su punto más activo alrededor de las 13 hrs los sábados y domingos. Lo días restantes alrededor de las 12 hrs.
  
  El tercer periodo tiene su punto más activo alrededor de las 17 hrs. 
  
  De domingo a viernes es más activo el tercer periodo (por la tarde). Los sábados se tiene mayor actividad durante el segundo, es decir, por la mañana.

*	La mayor cantidad de calorías ocupadas se encuentra por la tarde, en el tercer periodo, de 15:00 a 20:00 hrs. Correspondiente a las horas donde se tiene mayor registro de pasos. Posiblemente se realiza alguna actividad de mayor intensidad en ese periodo de tiempo.
*	Los patrones de actividad en los usuarios siguen un horario laboral.
*	Los usuarios duermen más la noche previa a iniciar la semana, es decir, de domingo al lunes. Mientras que se duerme menos los jueves y sábados.

## Conclusiones y recomendaciones del caso.
Los usuarios de los que se tiene registro en este conjunto de datos, tienen días sedentarios, donde siguen un horario laboral y realizan actividades de mayor intensidad por las tardes, posiblemente al salir del trabajo. Los usuarios tienen actividades de mayor intensidad los sábados por la mañana, pero teniendo un gran contraste al domingo, siendo el día menos activo. Además de no tener una cantidad de sueño constante durante la semana.

Bellabeat podría incluir y promocionar nuevas acciones en su producto:
*	Notificaciones personalizadas para los usuarios.
Teniendo los datos de actividad que el usuario lleva en su día, enviar notificaciones, por medio de la aplicación y/o reloj, para motivar la actividad física justo en los momentos que el usuario usualmente no tiene registros de actividad.  Además de recomendar actividades que mejoren su estilo de vida recompensado el tiempo en actividades sedentarias.

*	Ruta de objetivos semanales.
Relacionado al punto anterior, para conseguir que la actividad física se vuelva un hábito, brindar a los usuarios un plan de ruta que permita lograrlo a partir de pequeños pasos incrementales hasta lograr el objetivo.

*	Control de horario de sueño.
Permitir al usuario establecer un horario y notificarle por medio del reloj y aplicación cuando el horario está próximo y cuando éste comienza.

