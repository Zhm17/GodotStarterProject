Requerimientos Técnicos

1. Controlador de Personaje y Cámara

Movimiento: Implementar un sistema con lógica de movimiento (W, A, S, D).
Estados:
Caminar: Velocidad base.
Correr: Aumento de velocidad al mantener presionada la tecla Shift.
Animaciones: El personaje debe contar con una máquina de estados o lógica que cambie entre las animaciones de Idle, Caminar y Correr.
Cámara en Tercera Persona:
Control mediante el movimiento del ratón.
Rotación horizontal (Eje Y) ilimitada.
Rotación vertical (Eje X) con límites (clamping) para evitar giros de 360°.

2. Equipamiento y Jerarquía de Esqueleto (BoneAttachment3D)

Implementación de Accesorios: El personaje debe portar una espada en la mano derecha y un escudo en la mano izquierda.
Vínculo con la Animación: Es obligatorio utilizar nodos de tipo BoneAttachment3D vinculados a los huesos correspondientes del Skeleton3D del personaje.

3. Sistema de Interacción (Puertas y Plataformas)

Activación: Crear un sistema donde el jugador deba pisar una plataforma de un color específico para abrir la puerta del mismo color.
Lógica: Es obligatorio el uso de Area3D y el sistema de Señales (Signals) para comunicar la plataforma con la puerta.
Animación de puerta: El movimiento de apertura de la puerta debe realizarse mediante código utilizando la clase Tween.
Audio: Reproducir un efecto de sonido al activarse la apertura.

4. Interfaz de Usuario (HUD)

Implementar una UI que muestre una cuenta regresiva constante.
El tiempo debe disminuir en tiempo real y ser visible en todo momento.

5. Flujo de Juego y Condiciones

Condición de Victoria: * El jugador debe abrir todas las puertas del nivel.
Recoger un objeto final (Corona).
Al cumplir ambos, mostrar una pantalla de "Victoria" con opción de reiniciar.
Condición de Derrota: * Si la cuenta regresiva llega a 0, el juego debe detenerse.
Mostrar una pantalla de "Derrota" con opción de reintentar.
