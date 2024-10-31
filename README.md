# Clinica Dental 🦷🏥

Aplicación web para manejar citas médicas en la clínica dental Palmeras.

## 📂 Estructura de archivos

```
.
├── pom.xml                       # Configuración de Maven
├── src/
│   ├── main/
│   │   ├── java/                  # Código fuente
│   │   │   ├── dao/               # Data access objects
│   │   │   ├── controlador/       # Controladores
│   │   │   ├── modelo/            # Modelos a nivel de base de datos
│   │   │   ├── util/              # Utilidades, como conexión a la BB.DD
│   │   └── webapp/                # Recursos de la aplicación web
│   │   │   └── admin/             # Páginas de administrador
└── target/                        # Archivos generados por Maven
```

## 🚀 Inicializar proyecto

### ✨ Prerequisitos

- **Java**
- **Maven**
- **MySQL** Database

### 🛠️ Installation

1. **Clona el repositorio**

   ```sh
   git clone <repository-url>
   cd ClinicaDental
   ```

2. **Inicia la base de datos**

  - Asegúrate de tener MySQL instalado y en ejecución.
  - Crea una base de datos llamada `dental`.
  - Importa las tablas y procedimientos almacenados necesarios. Puedes encontrar los scripts SQL aquí.

## 📚 Additional Information

- **IDE:** El proyecto está configurado para trabajar con IntelliJ IDEA y NetBeans.
- **Librerías:** MySQL Connector y Bootstrap Icons están incluidos en las dependencias del proyecto.
